function s = mfileparse(mfile, mdirs, names, options)
%MFILEPARSE Parsing of an M-file to obtain synopsis, help and references
%  S = MFILEPARSE(MFILE, MDIRS, NAMES, OPTIONS) parses the M-file MFILE looking
%  for synopsis (function), H1 line, subroutines and todo tags (if any).
%  It also fills in a boolean array indicating whether MFILE calls M-files 
%  defined by MDIRS (M-files directories) AND NAMES (M-file names).
%  The input OPTIONS comes from M2HTML: fields used are 'verbose', 'global'
%  and 'todo'.
%  Output S is a structure whose fields are:
%     o synopsis: char array (empty if MFILE is a script)
%     o h1line: short one-line description into the first help line
%     o subroutine: cell array of char containing subroutines synopsis
%     o hrefs: boolean array with hrefs(i) = 1 if MFILE calls mdirs{i}/names{i}
%     o todo: structure containing information about potential todo tags
%
%  See also M2HTML

%  Copyright (C) 2003 Guillaume Flandin <Guillaume@artefact.tk>
%  $Revision: 1.0 $Date: 2003/29/04 17:33:43 $
%
%  Modified to search for our local ex-coder's unique commenting style 2017
%  also: stripped leading % characters from resulting strings 
%  stripped return values and arguments from function link text for readability
%  Peter Shanks, 2017-Jan-20

narginchk(3,4);
if nargin == 3,
	options = struct('verbose',1, 'globalHypertextLinks',0, 'todo',0);
end

%- Delimiters used in strtok: some of them may be useless (% " .), removed '.'
strtok_delim = sprintf(' \t\n\r(){}[]<>+-*~!|\\@&/,:;="''%%');

%- Open for reading the M-file
fid = openfile(mfile,'r');
[pathstr,name,ext] = fileparts(mfile);
it = 0; % line number

%- Initialize Output
s = struct('synopsis',   '', ...
		   'h1line',     '', ...
		   'subroutine', {{}}, ...
		   'subroutineH1', {{}}, ...
		   'hrefs',      sparse(1,length(names)), ...
		   'todo',       struct('line',[],'comment',{{}}), ...
		   'ismex',      zeros(size(mexexts)));

%- Initialize flag for synopsis cont ('...')
flagsynopcont = 0;
%- Look for synopsis and H1 line
%  Help is the first set of contiguous comment lines in an m-file
%  The H1 line is a short one-line description into the first help line
while 1
	tline = fgetl(fid);
	if ~ischar(tline), break, end
	it = it + 1;
	tline = strtrim(tline);
	%- Synopsis line
	if ~isempty(strmatch('function',tline))
		s.synopsis = tline;
		if ~isempty(strmatch('...',fliplr(tline)))
			flagsynopcont = 1;
			s.synopsis = deblank(s.synopsis(1:end-3));
		end
	%- H1 Line
	elseif ~isempty(strmatch('%',tline))
		% allow for the help lines to be before the synopsis
		if isempty(s.h1line)
			if isempty(strmatch('%%',tline))
				%s.h1line = fliplr(deblank(tline(end:-1:2)));
				s.h1line = strrep(s.h1line, '%', ' ');
			else
	            % Lindsay uses %% to reiterate the class or function name
	            % and the next line for describing the function
	            % so get the next line...
	            s.h1line = fgetl(fid);
	            s.h1line = strrep(s.h1line, '%', ' ');
	            %s.h1line = strrep(s.h1line, ' Class ', ' ');
	        end
		end
		if ~isempty(s.synopsis), break, end
	%- Go through empty lines
	elseif isempty(tline)
		break;
	%- Code found. Stop.
	else
		if flagsynopcont
			if isempty(strmatch('...',fliplr(tline)))
				s.synopsis = [s.synopsis tline];
				flagsynopcont = 0;
			else
				s.synopsis = [s.synopsis deblank(tline(1:end-3))];
			end
		else
			break;
		end
	end
end

%- Global Hypertext Links option
%  If false, hypertext links are done only among functions in the same
%  directory.
if options.globalHypertextLinks
	hrefnames = names;
else
	indhref = find(strcmp(fileparts(mfile),mdirs));
	hrefnames = {names{indhref}};
end

%- Compute cross-references and extract subroutines
%  hrefs(i) is 1 if mfile calls mfiles{i} and 0 otherwise
prefetched = false;
candidate = '';
while ischar(tline)
	% Remove blanks at both ends
	tline = strtrim(tline);	
	% Split code into meaningful chunks
	splitc = splitcode(tline);
	for j=1:length(splitc)
		if isempty(splitc{j}) | ...
			splitc{j}(1) == '''' | ...
			~isempty(strmatch('...',splitc{j}))
			% Forget about empty lines, char strings or conts
		elseif splitc{j}(1) == '%'
			% Cross-references are not taken into account in comments
			% Just look for potential TODO or FIXME line
			if options.todo
				if ~isempty(strmatch('% TODO',splitc{j})) | ...
				   ~isempty(strmatch('% FIXME',splitc{j}))
					s.todo.line   = [s.todo.line it];
					s.todo.comment{end+1} = splitc{j}(9:end);
				end
			end
			% look for function headers
			if ~isempty(strmatch('% Function',splitc{j})) | ...
				~isempty(strmatch('% Construct',splitc{j})) | ...
				~isempty(strmatch('% The constructor',splitc{j}))
				if isempty(strmatch('%%',splitc{j})) & ...
				   isempty(strmatch('% Constructing',splitc{j}))	
					s.subroutineH1{end+1} = splitc{j}(2:end);
				else					
					% skip lines beginning with %% and use the next line instead
					tline = fgetl(fid);
					prefetched = true; % so that we don't read another line at the end of the loop
					funcH1 = strtrim(tline);
					if isempty(strmatch('%',funcH1))
						funcH1 = ''; % it wasn't a comment
					else
						% remove the leading %
						funcH1 = funcH1(2:end);
						s.subroutineH1{end+1} = funcH1;
					end
				end
			elseif ~isempty(strmatch('%%',splitc{j}))
				% see if this has a Lindsay type function name after it
				candidate = strtrim(splitc{j}(3:end));
				tline = fgetl(fid);
				prefetched = true; % so that we don't read another line at the end of the loop
				funcH1 = strtrim(tline);
				if isempty(strmatch('%',funcH1))
					funcH1 = ''; % it wasn't a comment
				else
					% remove the leading %
					funcH1 = funcH1(2:end);
				end
			end
		else
			% detect if this line is a declaration of a subroutine
			if ~isempty(strmatch('function',splitc{j}))	
				if ~isempty(strmatch('...',splitc{j}))
					% the function declaration is longer than one line, get the next bit
					tline = fgetl(fid);
					splitc{j} = strcat(splitc{j},strtrim(tline));
				end			
				strstart = findstr(splitc{j},'=') + 1;
				strfin = findstr(splitc{j},'(') - 1;
				if (strstart < strfin)
					funcname = strtrim(splitc{j}(strstart:strfin));
				else
					funcname = splitc{j};
				end
				s.subroutine{end+1} = funcname;
				if length(s.subroutineH1) < length(s.subroutine)
					% if we picked one up earlier funcH1 is already set
					if ~strcmp(funcname,candidate)
						% try for a comment on the next line
						candidate = strtrim(splitc{j}(3:end));
						tline = fgetl(fid);
						prefetched = true; % so that we don't read another line at the end of the loop
						funcH1 = strtrim(tline);
						if isempty(strmatch('%',funcH1))
							funcH1 = ''; % it wasn't a comment
						else
							% remove the leading %
							funcH1 = funcH1(2:end);
						end
					end
					% insert a blank h1 for this subroutine if one hasn't been found yet 
					% (or perhaps the found comment if funcH1 has been set above)
					while length(s.subroutineH1) < length(s.subroutine)
						if isempty(funcH1) & ...
							~strcmp(name,funcname) % don't warn if it's the class name
							warning('No H1 found for subroutine %s', funcname);
						end					
						s.subroutineH1{end+1} = funcH1;
					end
				end
				% or get rid of any cruft that's crept in from bogus methods
				if length(s.subroutine) < length(s.subroutineH1)
					warning('Too many subroutine H1s');
				end

			else
				% get list of variables and functions
				symbol = {};
				while 1
					[t,splitc{j}] = strtok(splitc{j},strtok_delim);
					if isempty(t), break, end;
					symbol{end+1} = t;
				end
				if options.globalHypertextLinks
					s.hrefs = s.hrefs + ismember(hrefnames,symbol);
				else
					if ~isempty(indhref)
						s.hrefs(indhref) = s.hrefs(1,indhref) + ...
										   ismember(hrefnames,symbol);
					end
				end
			end
		end
	end
	if prefetched == true
		% we already got the next line while hunting for H1s
		prefetched = false;
	else
		tline = fgetl(fid);
	end
	it = it + 1;
end	

fclose(fid);

%- Look for Mex files
[pathstr,name] = fileparts(mfile);
samename = dir(fullfile(pathstr,[name	'.*']));
samename = {samename.name};
ext = {};
for i=1:length(samename)
	[dummy, dummy, ext{i}] = fileparts(samename{i});
end
s.ismex = ismember(mexexts,ext);

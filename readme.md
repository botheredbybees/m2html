# M2HTML: Documentation System for MATLAB in HTML

m2html builds on the matlab code written by Guillaume Flandin in 2005 and available
under a V2 GNU General Public License from [artefact.tk](http://www.artefact.tk/software/matlab/m2html/) (where you'll find some good documentation and examples of its use)

## Background
I scored a job which entailed documenting and maintaining some matlab code written by a (now retired) scientist. It was all pretty well commented, but in his own unique style, and I needed something that I could tweak to quickly generate a map of the program flow.

I also wanted it to look attractive enough to make sitting down and reading it less of a chore.

And I wanted to be able to get to it from the shore and from onboard the reasearch vessel where I work, and where most of the code gets run and occasionally updated (hence this github repository)

Guillaume's code was a really good starting point

## Quick Start
After cloning/downloading and unzipping (say to C:\matlab\m2html)
Start MATLAB and add m2html in your MATLAB path:
```
>> addpath C:\matlab\m2html
```
Change directory into the directory just above your source code. 
Let's say you have source code in C:\matlab\yoursource
```
>> cd  C:\matlab
```
Run the m2html script
```
>> m2html('mfiles','yoursource', 'htmldir','doc', 'recursive','on', 'global','on')
```
Where 'yoursource' is the directory under your current dir where the source code 
can be found and 'doc' is a directory under 'yoursource' where the html documentation will be created.

recursive and global are both set to allow m2html to trace calls between files and directories

There are a bunch of other switches too
See m2html.m for the full list or run >> help m2html
My favorites are 'graph', 'project' and 'version' 

## Tarting up the output
One of the best things about m2html is that it uses a templating system
These are in the /templates directory and can be copied and edited. 
By default the script uses the 'peter' template
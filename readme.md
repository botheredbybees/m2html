# M2HTML: Documentation System for MATLAB in HTML

m2html builds on the matlab code written by Guillaume Flandin in 2005 and available
under a V2 GNU General Public License from [artefact.tk](http://www.artefact.tk/software/matlab/m2html/) (where you'll find some good documentation and examples of its use)

## Background
I needed to document some matlab code written by a (now retired) scientist. It was all pretty well commented, but in his own unique style, and I needed something that I could tweak to quickly understand the program flow.

Guillaume's code was a really good starting point

## Changes in a nutshell
** The differences between this code and the original artefact.tk package **

I've added a bit of functionality and fixed a couple of minor bugs in m2html.m that:
- allow the project name and version number to be passed in the function call (ready to use in a template)
- fixed a bug with internal links in the file page
- added code to use the 'global' switch alluded to in the existing documentation
- allowed templates to use css, js and img directories

Added code to private/mfileparse.m to accomodate the comment style quirks of my code base. Hopefully this will still work fine on a normally commented matlab project but if you have issues you may find the original version of mfileparse.m will help to solve them (it's saved as private/mfileparse.original.m)

Updated all calls to the soon to be retired nargchk functions to use narginchk instead

I've also created a bootstrap 3 based html5 template (bbb), and made it the default

## Quick Start
After cloning/downloading and unzipping (say to C:\matlab\m2html)
Start MATLAB and add m2html in your MATLAB path:
```
>> addpath C:\matlab\m2html
```
Change directory into the directory just above your source code.
Let's say you have source code in C:\matlab\yoursource...
```
>> cd  C:\matlab
```
Run the m2html script
```
>> m2html('mfiles','yoursource', 'htmldir','doc', 'recursive','on', 'global','on')
```
Where 'yoursource' is the directory under your current dir where the source code 
can be found and 'doc' is a directory under 'yoursource' where the html documentation will be created.

'recursive' and 'global' are both set to allow m2html to trace calls between files and directories

If you want the project name and version to appear on the documentation pages you can add these switches. e.g.
```
>> m2html('mfiles','yoursource', 'htmldir','doc', 'recursive','on', 'global','on'', 'project', 'CapPro', 'version', '1.11')
```

There are a bunch of other switches too.
See m2html.m for the full list or run >> help m2html
My favorites are 'graph', 'project' and 'version'

## Tarting up the output
One of the best things about m2html is that it uses a templating system
Template files are in the /templates directory and can be copied and edited to create a thing of beauty.
By default the m2html.m script uses the 'bbb' template

You can also get m2html to create class dependancies that link to each class. To get this working you will need to install [Graphviz](http://www.graphviz.org/) and add it to your path
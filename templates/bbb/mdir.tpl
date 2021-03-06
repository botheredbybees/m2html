<!doctype html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Index for Directory {MDIR}</title>
		<meta name="keywords" content="{MDIR}">
		<meta name="description" content="Index for Directory {MDIR}">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="generator" content="m2html v1.5 &copy; 2003-2005 Guillaume Flandin">
		<meta name="robots" content="index, follow">
		<link href="{MASTERPATH}css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<link type="text/css" rel="stylesheet" href="{MASTERPATH}css/m2html.css">
	</head>
	<body>
		<div class="container">
			<a name="_top"></a>
			<ol class="breadcrumb">
				<li><a href="{MASTERPATH}{INDEX}">{PROJECT} sourcecode home</a></li>
				<li class="active">{MDIR}</li>
			</ol>
			<h1>Index of {MDIR}</h1>
			<!-- BEGIN subfolder -->
			<h2>Directories</h2>
			<ul class="nav nav-pills">
				<!-- BEGIN subdir -->
				<li>{SUBDIRECTORY}</li>
				<!-- END subdir -->
			</ul>
			<!-- END subfolder -->
			<!-- BEGIN graph -->
			<a href="{LGRAPH}"><h2>Dependency Graph <img alt=">" border="0" src="{MASTERPATH}img/right.png"></h2></a><br>
			<!-- END graph -->
			<div class="jumbotron">
				<h2>Matlab files:</h2><br>
				<!-- BEGIN row-m -->
				<div class="row">
					<div class="col-md-3">
						<a href="{L_NAME}">{NAME}</a>
					</div>
					<div class="col-md-9">
						{H1LINE}
					</div>
					<!-- BEGIN mexfile --> <img src="{MASTERPATH}img/mex.png" alt="MEX" border="0"> <!-- END mexfile -->
				</div>
				<!-- END row-m -->
			</div>
			<!-- BEGIN othermatlab -->
			<h2>Other Matlab-specific files in this directory:</h2>
			<ul>
				<!-- BEGIN row-other -->
				<li>{OTHERFILE}</li>
				<!-- END row-other -->
			</ul>
			<!-- END othermatlab -->
			
			
			<!-- BEGIN todolist -->
			<h2>TODO List</h2>
			<ul>
				<li>View the <a href="{LTODOLIST}">TODO list</a>.</li>
			</ul>
			<!-- END todolist -->
			<hr>
		<address>Generated on {DATE} for {PROJECT} Version {VERSION} </address>
	</div>
	<script src="{MASTERPATH}js/jquery.min.js"></script>
	<script src="{MASTERPATH}js/bootstrap.min.js"></script>
</body>
</html>
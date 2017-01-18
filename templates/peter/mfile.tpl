<!doctype html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Description of {NAME}</title>
		<meta name="keywords" content="{NAME}">
		<meta name="description" content="{H1LINE}">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="generator" content="m2html v1.5 &copy; 2003-2005 Guillaume Flandin">
		<meta name="robots" content="index, follow">
		<link href="{MASTERPATH}bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<link type="text/css" rel="stylesheet" href="{MASTERPATH}m2html.css">
	</head>
	<body>
		<div class="container">
			<a name="_top"></a>
			<ol class="breadcrumb">
				<li><a href="{MASTERPATH}{INDEX}">Home</a></li>
				<!-- BEGIN pathline --> <li><a href="{LPATHDIR}">{PATHDIR}</a></li> <!-- END pathline -->
				<li class="active">{NAME}.m</li>
			</ol>
			<h1>{NAME}
			<!-- BEGIN mexfile --> &nbsp;&nbsp;<img src="{MASTERPATH}{MEXTYPE}.png" alt="{PLATFORMS}" border="0" title="{PLATFORMS}"> <!-- END mexfile -->
			</h1>
			<h2><a name="_name"></a>Purpose <a href="#_top"></a></h2>
			<div class="box"><strong>{H1LINE}</strong></div>
			<h2><a name="_synopsis"></a>Synopsis <a href="#_top"></a></h2>
			<h2><a name="_description"></a>Description <a href="#_top"></a></h2>
			<div class="fragment"><pre class="comment">{DESCRIPTION}</pre></div>
			<!-- crossreference -->
			<h2><a name="_cross"></a>Cross-references <a href="#_top"></a></h2>
			This function calls:
			<!-- BEGIN crossrefcall -->
			<div class="row">
				<div class="col-md-3"><a href="{L_NAME_CALL}" class="code" title="{SYNOP_CALL}">{NAME_CALL}</a></div>
				<div class="col-md-9">{H1LINE_CALL}</div>
			</div>
			<!-- END crossrefcall -->
			<br>
			This function is called by:
			<!-- BEGIN crossrefcalled -->
			<div class="row">
				<div class="col-md-3">
					<a href="{L_NAME_CALLED}" class="code" title="{SYNOP_CALLED}">{NAME_CALLED}</a>
				</div>
				<div class="col-md-9">
					{H1LINE_CALLED}
				</div>
			</div>
			<!-- END crossrefcalled -->
			<!-- crossreference -->
			<!-- BEGIN subfunction -->
			<h2><a name="_subfunctions"></a>Subfunctions <a href="#_top"></a></h2>
			<!-- BEGIN onesubfunction -->
			<div class="row">
				<div class="col-md-3"><a href="{L_SUB}" class="code">{SUB}</a></div>
				<div class="col-md-9">{SUBH1}</div>
			</div>
			<!-- END onesubfunction -->
			<!-- END subfunction -->
			<!-- BEGIN download -->
			<h2><a name="_download"></a>Download <a href="#_top"></a></h2>
			<p><a href="{NAME}.m">{NAME}.m</a></p>
			<!-- END download -->
			<!-- BEGIN source -->
			<h2><a name="_source"></a>Source Code <a href="#_top"></a></h2>
			<div class="fragment"><pre>{SOURCECODE}</pre></div>
			<!-- END source -->
			<hr>
		<address>Documentation generated on {DATE} for {PROJECT} Version {VERSION} </address>
	</div>
	<script src="{MASTERPATH}jquery.min.js"></script>
	<script src="{MASTERPATH}bootstrap.min.js"></script>
</body>
</html>
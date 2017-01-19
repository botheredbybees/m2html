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
		<link href="{MASTERPATH}css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<link type="text/css" rel="stylesheet" href="{MASTERPATH}css/m2html.css">
	</head>
	<body>
		<div class="container">
			<a name="_top"></a>
			<ol class="breadcrumb">
				<li><a href="{MASTERPATH}{INDEX}">{PROJECT} sourcecode Home</a></li>
				<!-- BEGIN pathline --> <li><a href="{LPATHDIR}">{PATHDIR}</a></li> <!-- END pathline -->
				<li class="active">{NAME}.m</li>
			</ol>
			<h1>{NAME}
			<!-- BEGIN mexfile --> &nbsp;&nbsp;<img src="{MASTERPATH}img/{MEXTYPE}.png" alt="{PLATFORMS}" border="0" title="{PLATFORMS}"> <!-- END mexfile -->
			</h1>
			<h2><a name="_name"></a>Purpose <a href="#_top"></a></h2>
			<div class="box"><strong>{H1LINE}</strong></div>

			<!-- <h2><a name="_synopsis"></a>Synopsis <a href="#_top"></a></h2>
			<div class="fragment"><pre class="comment">{SYNOPSIS}</pre></div> -->

			<h2><a name="_description"></a>Description <a href="#_top"></a></h2>
			<div class="fragment"><pre class="comment">{DESCRIPTION}</pre></div>

			<!-- crossreference -->
			<h2><a name="_cross"></a>Cross-references <a href="#_top"></a></h2>
			<strong>This function calls:</strong>
			<table class="table table-hover">
			<!-- BEGIN crossrefcall -->
			<tr>
				<td><a href="{L_NAME_CALL}" class="code" title="{SYNOP_CALL}">{NAME_CALL}</a></td>
				<td>{H1LINE_CALL}</td>
			</tr>
			<!-- END crossrefcall -->
			</table>
			<br>
			<strong>This function is called by:</strong>
			<table class="table table-hover">
			<!-- BEGIN crossrefcalled -->
			<tr>
				<td>
					<a href="{L_NAME_CALLED}" class="code" title="{SYNOP_CALLED}">{NAME_CALLED}</a>
				</td>
				<td>
					{H1LINE_CALLED}
				</td>
			</tr>
			<!-- END crossrefcalled -->
			</table>
			<!-- crossreference -->
			
			<!-- BEGIN subfunction -->
			<h2><a name="_subfunctions"></a>Subfunctions <a href="#_top"></a></h2>
			<table class="table table-hover">
			<!-- BEGIN onesubfunction -->
			<tr>
				<td><a href="{L_SUB}" class="code">{SUB}</a></td>
				<td>{SUBH1}</td>
			</tr>
			<!-- END onesubfunction -->
			</table>
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
		<address>Generated on {DATE} for {PROJECT} Version {VERSION} </address>
	</div>
	<script src="{MASTERPATH}js/jquery.min.js"></script>
	<script src="{MASTERPATH}js/bootstrap.min.js"></script>
</body>
</html>
<!doctype html>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Matlab Search Engine</title>
  <meta name="keywords" content="search, engine, matlab, documentation">
  <meta name="description" content="Matlab documentation search engine with M2HTML">
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <meta name="generator" content="m2html v1.5 &copy; 2003-2005 Guillaume Flandin">
  <meta name="robots" content="index, follow">
    <link href="{MASTERPATH}bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link type="text/css" rel="stylesheet" href="{MASTERPATH}m2html.css">
</head>
<body>
    <div class="container">
<a name="_top"></a>
<h1>Search Engine</h1>

<form class="search" action="{PHPFILE}" method="get">
Search for <input class="search" type="text" name="query" value="<?php echo $query; ?>" size="20" accesskey="s"/>
<input type="submit" name="submit" value="Search">
</form>

<?php
	include('doxysearch.php');
	main('{IDXFILE}');
?>

<hr>
    <address>Documentation generated on {DATE} for {PROJECT} Version {VERSION} </address>
  </div>
  <script src="{MASTERPATH}jquery.min.js"></script>
  <script src="{MASTERPATH}bootstrap.min.js"></script>
</body>
</html>

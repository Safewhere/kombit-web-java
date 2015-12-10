<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/main.css">
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
      
  	<div id="wrapper">
            <div id="maincontent" class="container">
                <jsp:include page="../head.jsp" />

                <div class="content">
                        <h1 class="page-header">OIOSAML.java</h1>

                        <ul>
                        <li><a href="intro.html">Introduction and requirements</a></li>
                        <li><a href="installation.html">Installation guide</a></li>
                        <li><a href="configuration.html">Configuration</a></li>
                        <li><a href="maintenance.html">Maintenance</a></li>
                        <li><a href="features.html">Features</a></li>
                        <li><a href="logging.html">Logging</a></li>
                        <li><a href="developers.html">Developer information</a></li>
                        <li><a href="attributequery.html">Attribute Query</a></li>
                        <li><a href="patches.html">Multiple IdPs (patch)</a></li>
                        </ul>

                        Please notice the changes in documentation caused by the<br>
                        Multiple IdP patch are not yet integrated into existing<br>
                        documentation.<br>
                </div>
                <jsp:include page="../foot.jsp" />			
            </div>		
        </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>

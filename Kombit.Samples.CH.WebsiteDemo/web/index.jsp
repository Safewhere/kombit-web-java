<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
	
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
                <jsp:include page="head.jsp" />

                <div class="content">
                        <h1 class="page-header">Frontpage - OIOSAML.java document Service Provider Demo</h1>
                        <a class="btn btn-primary" href="sp/priv1.jsp">Page requiring login</a>
                        <a class="btn btn-primary" href="configure.jsp">Runtime configuration</a>
                        <br><br>
                        <p>Test from POST</p>
                        <form class="form-inline" action="sp/post.jsp">
                          <div class="form-group">
                                <input type="text" name="testing" value="testingvalue" class="form-control" placeholder="Testing value">
                          </div>
                          <button type="submit" class="btn btn-default">Submit</button>
                        </form>			
                        <br><br>
                </div>
                <jsp:include page="foot.jsp" />			
            </div>		
        </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
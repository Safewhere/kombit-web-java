<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
	
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
                    <h1 class="page-header">Default login page for HTTP Post method.</h1>

                    <form class="form-inline" name="loginform" action="<%= (String)request.getAttribute("action") %>" method="post">
                        <input type="hidden" name="SAMLRequest" value="<%=(String) request.getAttribute("SAMLRequest") %>" />
                        <input type="hidden" name="RelayState" value="<%= (String)request.getAttribute("RelayState") %>" />
                        <button type="submit" class="btn btn-default">Click here to submit form to IdP server</button>
                    </form>			

                    <p>This page is the default OIOSaml.java HTTP POST method login page.</p>
                    <p>Submitting the form will send the following values to the IdP:</p>
                    <table>
                        <tr><td>action</td><td><code><%= (String)request.getAttribute("action") %></code></td></tr>
                        <tr><td>SAMLRequest</td><td><code><%= (String)request.getAttribute("SAMLRequest") %></code></td></tr>
                        <tr><td>RelayState</td><td><code><%= (String)request.getAttribute("RelayState") %></code></td></tr>
                    </table> 
                </div>
                <jsp:include page="foot.jsp" />			
            </div>		
        </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
  </body>
</html>
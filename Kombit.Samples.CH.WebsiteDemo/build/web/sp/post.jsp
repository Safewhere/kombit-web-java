

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Received request</title>

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
        <!-- "$Id: priv1.jsp 3040 2008-06-23 15:34:36Z jre $"; -->
        <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <%@page import="dk.itst.oiosaml.sp.UserAssertionHolder"%>
        <%@page import="dk.itst.oiosaml.sp.service.util.Utils"%>
        <%@page import="dk.itst.oiosaml.sp.util.AttributeUtil"%>
        <%@page import="dk.itst.oiosaml.sp.UserAssertion"%>
        <%@page import="dk.itst.oiosaml.sp.UserAttribute"%>
        <%@page import="java.util.Map"%>
        <%@page import="java.util.Iterator"%>
        <%@page import="dk.itst.oiosaml.sp.UserAssertion"%>
        <%@page import="dk.itst.oiosaml.sp.service.util.Constants"%>
        
  	<div id="wrapper">
            <div id="maincontent" class="container">
                <jsp:include page="../head.jsp" />

                <div class="content">
                        <h1 class="page-header">Received request</h1>

                        <table>
                            <tr>
                                <td>Method:</td><td><%= request.getMethod() %></td>
                            </tr>
                            <tr>
                                <td colspan="2">Parameters:</td>
                            </tr>
                            <%

                            for (Iterator<?> i = request.getParameterMap().entrySet().iterator(); i.hasNext(); ) {
                                    Map.Entry<String, String[]> e = (Map.Entry<String, String[]>)i.next();

                                    for (String val : e.getValue()) {
                                            %>
                                            <tr><td><%= e.getKey() %>:</td><td><%= val %></td></tr>
                                    <%
                                    }
                            }
                            %>

                        </table>
                </div>
                <jsp:include page="../foot.jsp" />			
            </div>		
        </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-2.1.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>


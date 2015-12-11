

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Perform attribute query</title>

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
        <!-- "$Id: priv1.jsp 2952 2008-05-28 13:18:37Z jre $"; -->
        <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <%@page import="dk.itst.oiosaml.sp.service.util.Utils"%>
        <%@page import="dk.itst.oiosaml.sp.util.AttributeUtil"%>
        <%@page import="dk.itst.oiosaml.sp.UserAttributeQuery"%>
        <%@page import="dk.itst.oiosaml.sp.UserAttribute"%>
        <%@page import="java.util.*"%>

        <%@page import="dk.itst.oiosaml.sp.UserAssertion"%>
        <%@page import="dk.itst.oiosaml.sp.service.util.Constants"%>

  	<div id="wrapper">
            <div id="maincontent" class="container">
                <jsp:include page="../head.jsp" />

                <div class="content">
                        <h1 class="page-header">Perform attribute query</h1>

                        <br><br>
                        <form class="form-horizontal" method="get">
                            <!-- Text input-->
                            <div class="form-group">
                              <div class="col-md-6">
                                    <label class="control-label" for="nameId">NameID</label>  
                                    <input type="text" name="nameId" class="form-control input-md">
                              </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                              <div class="col-md-6">
                                    <label class="control-label" for="attribute">Attribute</label>  
                                    <input type="text" name="attribute" class="form-control input-md">
                              </div>
                              <div class="col-md-6">
                                    <label class="control-label" for="format">Format</label>  
                                    <input type="text" name="format" class="form-control input-md">
                              </div>
                            </div>

                            <div class="form-group">
                              <div class="col-md-6">
                                    <label class="control-label" for="attribute">Attribute</label>  
                                    <input type="text" name="attribute" class="form-control input-md">
                              </div>
                              <div class="col-md-6">
                                    <label class="control-label" for="format">Format</label>  
                                    <input type="text" name="format" class="form-control input-md">
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-md-6">
                                    <label class="control-label" for="attribute">Attribute</label>  
                                    <input type="text" name="attribute" class="form-control input-md">
                              </div>
                              <div class="col-md-6">
                                    <label class="control-label" for="format">Format</label>  
                                    <input type="text" name="format" class="form-control input-md">
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-md-6">
                                    <label class="control-label" for="attribute">Attribute</label>  
                                    <input type="text" name="attribute" class="form-control input-md">
                              </div>
                              <div class="col-md-6">
                                    <label class="control-label" for="format">Format</label>  
                                    <input type="text" name="format" class="form-control input-md">
                              </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Perfomr Attribute Query</button>

                    </form>
                        
                        
                    <%

                    if (request.getParameter("nameId") != null) {
                            %>
                            <h3>Attributes</h3>
                            <table border="0">
                            <tr><td><strong>Attribute</strong></td><td><strong>Value</strong></td></tr><%
                            UserAttributeQuery aq = new UserAttributeQuery();

                            List<UserAttribute> names = new ArrayList<UserAttribute>();
                            String[] reqnames = request.getParameterValues("attribute");
                            for (int i = 0; i < reqnames.length; i++) {
                                    if (reqnames[i] != null && !"".equals(reqnames[i])) {
                                            names.add(UserAttribute.create(reqnames[i], request.getParameterValues("format")[i]));
                                    }
                            }
                            UserAssertion ua = (UserAssertion)session.getAttribute(Constants.SESSION_USER_ASSERTION);

                            Collection<UserAttribute> attrs = aq.query(request.getParameter("nameId"), ua.getNameIDFormat(), names.toArray(new UserAttribute[0]));

                            for (UserAttribute attr: attrs) {
                                    %><tr><td><%= attr.getName() %></td><td><%= attr.getValue() %></td></tr><%
                            }
                            %></table><%
                    }

                    %>
                </div>
                <jsp:include page="../foot.jsp" />			
            </div>		
        </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-2.1.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>


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
        
      <!-- "$Id: index.jsp 2978 2008-06-10 07:39:19Z jre $"; -->
<%@page import="dk.itst.oiosaml.configuration.SAMLConfigurationFactory"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.configuration.Configuration"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.configuration.CompositeConfiguration"%>
<%@page import="org.apache.commons.configuration.PropertiesConfiguration"%>
<%@page import="java.io.StringWriter"%>
<%@page import="dk.itst.oiosaml.sp.service.util.Constants"%>

<%

CompositeConfiguration conf = (CompositeConfiguration) SAMLConfigurationFactory.getConfiguration().getSystemConfiguration();
StringWriter sw = new StringWriter();
PropertiesConfiguration c = null;

for (int i = 0; i < conf.getNumberOfConfigurations(); i++){
	if (conf.getConfiguration(i) instanceof PropertiesConfiguration) {
		c = (PropertiesConfiguration)conf.getConfiguration(i);
		break;
	}
}

if (request.getMethod().equals("POST") && c != null) {
	c.setProperty(Constants.PROP_PASSIVE, Boolean.valueOf(request.getParameter("isPassive")));
	c.setProperty(Constants.PROP_PASSIVE_USER_ID, request.getParameter("passiveUsername"));
	c.setProperty(Constants.PROP_FORCE_AUTHN_URLS, request.getParameter("forceAuthn") != null ? "/.*" : null);
	c.setProperty(Constants.PROP_NAMEID_POLICY_ALLOW_CREATE, Boolean.valueOf(request.getParameter("allowCreate")));
	c.setProperty(Constants.PROP_NAMEID_POLICY, request.getParameter("nameIdPolicy"));
	
	if (request.getParameter("property") != null && !request.getParameter("property").trim().equals("")) {
		c.setProperty(request.getParameter("property"), request.getParameter("propertyValue"));
	}
}


c.save(sw);
%>

  	<div id="wrapper">
            <div id="maincontent" class="container">
                <jsp:include page="head.jsp" />

                <div class="content">
                        <h1 class="page-header">Runtime configuration - OIOSAML.java Service Provider Demo</h1>
                        <p>Use this to change the OIOSAML.java runtime configuration. Changes here are lost when the server is restarted. See <a href="docs/configuration.html">the documentation</a> for configuration help.</p>

                        <form class="form-horizontal" method="post">
                            
                            <!-- Multiple Checkboxes -->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="checkboxes">IsPassive</label>
                              <div class="col-md-4">
                              <div class="checkbox">
                                    <label for="checkboxes-0">                                      
                                      <input type="checkbox" name="isPassive" value="true" <%=  conf.getBoolean(Constants.PROP_PASSIVE, false) ? "checked='checked'" : "" %>/>
                                    </label>
                                    </div>
                              </div>
                            </div>
                            
                            <!-- Text input-->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="textinput">Passive username</label>  
                              <div class="col-md-4">                            
                                    <input type="text" name="passiveUsername" class="form-control input-md" value="<%=  conf.getString(Constants.PROP_PASSIVE_USER_ID, "") %>" />
                              </div>
                            </div>

                              <!-- Multiple Checkboxes -->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="checkboxes">Force authn</label>
                              <div class="col-md-4">
                              <div class="checkbox">
                                    <label for="checkboxes-0">                                      
                                      <input type="checkbox" name="forceAuthn" value="true" <%=  conf.getString(Constants.PROP_FORCE_AUTHN_URLS, null) == null ? "" : "checked='checked'" %> />
                                    </label>
                                    </div>
                              </div>
                            </div>
                                    <!-- Multiple Checkboxes -->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="checkboxes">Allow create</label>
                              <div class="col-md-4">
                              <div class="checkbox">
                                    <label for="checkboxes-0">                                      
                                      <input type="checkbox" name="allowCreate" value="true" <%=  conf.getBoolean(Constants.PROP_NAMEID_POLICY_ALLOW_CREATE, false) ? "checked='checked'" : "" %> />
                                    </label>
                                    </div>
                              </div>
                            </div>
                                    
                            <!-- Text input-->
                            <div class="form-group">
                              <label class="col-md-4 control-label" for="textinput">NameID Policy (blank, persistent or transient)</label>  
                              <div class="col-md-4">
                                  <input class="form-control input-md" type="text" name="nameIdPolicy" value="<%=  conf.getString(Constants.PROP_NAMEID_POLICY, "") %>" />
                                  <input class="form-control input-md" type="text" name="property" />
                                  <input class="form-control input-md" type="text" name="propertyValue" />
                                  
                              </div>
                            </div>
                            <div class="form-group">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-4">
                                            <button type="submit" class="btn btn-primary">Set configuration</button>
                                    </div>
                            </div>
                    </form>
                    
                    </br>
                                  
                    <h3 class="page-header">Current configuration - from <%= c.getFile() %></h3>
                    <pre>
                    <%= sw %>
                    </pre>
                    
                </div>
                <jsp:include page="foot.jsp" />			
            </div>		
        </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
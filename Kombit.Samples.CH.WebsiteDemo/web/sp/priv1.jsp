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
        <%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <%@page import="dk.itst.oiosaml.sp.UserAssertionHolder"%>
        <%@page import="dk.itst.oiosaml.sp.service.util.Utils"%>
        <%@page import="dk.itst.oiosaml.sp.util.AttributeUtil"%>
        <%@page import="dk.itst.oiosaml.sp.UserAssertion"%>
        <%@page import="dk.itst.oiosaml.sp.UserAttribute"%>
        <%@page import="dk.itst.oiosaml.sp.service.util.Constants"%>
        <%@page import="BasicPrivilegeProfileParser.PrivilegeGroupParser"%>
        <%@page import="BasicPrivilegeProfileParser.PrivilegeGroup"%>
        <%@page import="java.util.ArrayList"%>
        <% UserAssertion ua = UserAssertionHolder.get(); %>
        
  	<div id="wrapper">
		<div id="maincontent" class="container">
                        <jsp:include page="../head.jsp" />
						
			<div class="content">
				<h1 class="page-header">User NameID</h1>
                                <%= ua.getSubject() %>

                                <h1 class="page-header">Attributes on UserAssertion</h1>
                                <ul>
                               <!-- loop through each attribute if name is Bpp claim then parse and get Bpp string value -->
                                <% 
                                boolean hasAssuranceLevel = false;
                                boolean hasSpecVer = false;
                                boolean hasKombitSpecVer = false;
                                boolean hasCvrNumberIdentifier = false;
                                boolean hasPrivilegesIntermediate = false;

                                for (UserAttribute a : ua.getAllAttributes()) {
                                    String name = a.getName();
                                    String value = a.getValue();
                                    if(name.equals("dk:gov:saml:attribute:Privileges_intermediate"))
                                    {
                                        hasPrivilegesIntermediate = true;

                                        try
                                        {
                                        ArrayList<PrivilegeGroup> bppGroupsList = 
                                            (ArrayList<PrivilegeGroup>)PrivilegeGroupParser.Parse(value); 
                                            value = PrivilegeGroupParser.ConvertToJsonString(bppGroupsList);
                                        }catch (Exception ex)
                                        {
                                            value = a.getValue();
                                        }
                                    }
                                    if(name.equals("dk:gov:saml:attribute:AssuranceLevel"))
                                    {
                                        hasAssuranceLevel = true;
                                    }
                                    if(name.equals("dk:gov:saml:attribute:SpecVer"))
                                    {
                                        hasSpecVer = true;
                                    }
                                    if(name.equals("dk:gov:saml:attribute:KombitSpecVer"))
                                    {
                                        hasKombitSpecVer = true;
                                    }
                                    if(name.equals("dk:gov:saml:attribute:CvrNumberIdentifier"))
                                    {
                                        hasCvrNumberIdentifier = true;
                                    }
                                %> 
                                <!-- display each name - value in screen -->
                                <li><%= name %> - <%= value %> </li>
                                <%
                                }

                                if(!hasAssuranceLevel)
                                {
                                    throw new Exception("Missing Assurance Level Attribute");
                                }
                                if(!hasSpecVer)
                                {
                                    throw new Exception("Missing SpecVer Attribute");
                                }
                                if(!hasKombitSpecVer)
                                {
                                    throw new Exception("Missing KombitSpecVer Attribute");
                                }
                                if(!hasCvrNumberIdentifier)
                                {
                                    throw new Exception("Missing CvrNumberIdentifier Attribute");
                                }    

                                %>
                                </ul>   
                                <p>
                                Authenticated: <%= ua.isAuthenticated() %><br />
                                Assertion signed: <%= ua.isSigned() %><br />
                                SAML Profile: <%= ua.isOIOSAMLCompliant() %><br />
                                OCES Attribute Profile: <%= ua.isOCESProfileCompliant() %><br />
                                Persistent Pseudonym Profile: <%= ua.isPersistentPseudonymProfileCompliant() %><br />

                                </p>
                                <h1 class="page-header">Assertion:</h1><span style="font-size:80%; font-family:Monospace;">
                                <span class="wordwrap"><%= Utils.beautifyAndHtmlXML(UserAssertionHolder.get().getXML(), "&nbsp;&nbsp;&nbsp;&nbsp;") %></span>                                
                                </br>
                                <a class="btn btn-primary"  href="query.jsp">Perform attribute query</a> 
                                &nbsp; 
                                <a class="btn btn-primary"  href="logout.jsp">Local logout</a> 
                                &nbsp; 
                                <a class="btn btn-primary"  href="<%= request.getRequestURL() %>?<%= Constants.QUERY_STRING_FORCE_AUTHN %>=True">Force login</a>
			</div>
                        
			<jsp:include page="../foot.jsp" />
		</div>
		
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-2.1.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>
<%@page import="dk.itst.oiosaml.configuration.SAMLConfigurationFactory"%>
<%@page import="org.apache.commons.configuration.Configuration"%>
<%@page import="dk.itst.oiosaml.sp.service.util.Constants"%>
<%@page import="dk.itst.oiosaml.sp.UserAssertion"%>

<div id="logo" class="header-left">
        <img src="<%=request.getContextPath()%>/images/logo.png"></img>
</div>
<ul class="nav navbar-nav navbar-right header-right">
        <li class="">
            <%
                    try {
                        SAMLConfigurationFactory.getConfiguration().getSystemConfiguration(); 
                        UserAssertion ua = (UserAssertion)session.getAttribute(Constants.SESSION_USER_ASSERTION);
            %>
            <%=ua != null && ua.isAuthenticated() ? "<a href=\"" + request.getContextPath() + "/saml/Logout\">Log out</a>" : "<a href=\"" + request.getContextPath() + "/saml/login\">Login</a>"%>
                     <% } catch (RuntimeException e) { %>
            <h2>System is not configured</h2>
            <a href="saml/configure">Configure the system here</a>.
            <% } %>
        </li>
</ul>
        
<div class="menutop">
        <ul class="nav navbar-nav">
                <li class="active"><a href="<%=request.getContextPath()%>">Home</a></li>
                <li class=""><a href="<%= request.getContextPath() %>/saml/metadata">Metadata</a></li>
                <li class=""><a href="<%= request.getContextPath() %>/docs/index.jsp">OIOSAML.java document</a></li>
        </ul>		
</div>
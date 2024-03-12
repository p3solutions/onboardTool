<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="org.owasp.encoder.Encode" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%
    Properties prop = new Properties();
    String workingDir = System.getProperty("catalina.base") + File.separator + "D3Sixty_conf";
    File configFile = new File(workingDir, "Configuration.properties");
    File versionFile = new File(workingDir, "VersionInfo.properties");
    String authType="";
    String ssoLoginUrl="";
    String versionInfo="";
    try {
        // Load Configuration.properties
        if (configFile.exists()) {
            prop.load(new FileReader(configFile));
        } else {
            // Load from resources folder using class loader
            InputStream resourceStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("Configuration.properties");
            if (resourceStream != null) {
                prop.load(new InputStreamReader(resourceStream));
            } else {
                throw new IOException("Configuration.properties file not found.");
            }
        }

        authType = prop.getProperty("AUTHTYPE");
        ssoLoginUrl=prop.getProperty("SSOLOGINURL");
        System.out.println("AUTHTYPE :: " + authType);
        System.out.println("SSO LOGIN URL :: " + ssoLoginUrl);
        // Load VersionInfo.properties
        prop.clear(); // Clear the properties for reuse
        if (versionFile.exists()) {
            prop.load(new FileReader(versionFile));
        } else {
            // Load from resources folder using class loader
            InputStream resourceStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("VersionInfo.properties");
            if (resourceStream != null) {
                prop.load(new InputStreamReader(resourceStream));
            } else {
                throw new IOException("VersionInfo.properties file not found.");
            }
        }
        versionInfo = prop.getProperty("VERSION");
        System.out.println("Version Info :: " + versionInfo);
    } catch (IOException e) {
        System.out.println(e.getMessage());
    }    
%>
<jsp:include page="db_creation.jsp"/>
<jsp:include page="tablecreation.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;
                                            charset=UTF-8">
        <title>D3Sixty Tool</title>
    </head>
    <body>
    
        <%String user_email = request.getParameter("user_email");%>
        <% String user_fname = request.getParameter("user_fname");%>
        <% String user_lname = request.getParameter("user_lname"); %>
        <%String username = request.getParameter("username");%>
        <% String user_group = request.getParameter("user_group"); %>
    </body>
     <%
    %>
       <form class=" vldauth" 
action="Login_1" method="POST" name="loginForm">
			   <input type="hidden" id="user_email" class="fadeIn second" name="user_email" placeholder="User Email" value="<%=Encode.forHtmlAttribute(user_email)%>">
			   <input type="hidden" id="user_fname" class="fadeIn second" name="user_fname" placeholder="User FirstName" value="<%=Encode.forHtmlAttribute(user_fname)%>">
			   <input type="hidden" id="user_lname" class="fadeIn second" name="user_lname" placeholder="User LastName" value="<%=Encode.forHtmlAttribute(user_lname)%>">
           	   <input type="hidden" id="username" class="fadeIn third" name="username" placeholder="Username" value="<%=Encode.forHtmlAttribute(username)%>">
               <input type="hidden" id="user_group" class="fadeIn third" name="user_group" placeholder="User Email" value="<%=Encode.forHtmlAttribute(user_group)%>">
    			
        <!-- <input type="submit" name="submitInput"> -->
<script>
    window.onload = function(){
    document.forms['loginForm'].submit();
    }
    </script>
    </form>
    <%-- Here we use the JSP expression tag to display value
        stored in a variable
    --%>
    <%-- <h2>SAML Logged User is</h2>
    <h3>E-Mail : <%=user_email%></h3>
    <h3>Username : <%=username%></h3>
    <h3>Firstname : <%=user_fname%></h3>
    <h3>Lastname : <%=user_lname%></h3>
    <h3>Group : <%=user_group%></h3> --%>
</html>
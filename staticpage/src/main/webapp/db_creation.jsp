<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed DB_Creation JSP PAGE-----[INFO]");  %>
<%
try{
	
Statement stmt;
Connection con;
String url = "jdbc:mysql://localhost:3306/";


Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url, "root", "password123"); 

stmt = con.createStatement();
stmt.executeUpdate("CREATE DATABASE decom3sixtytool");
con.close();
}
catch(Exception e)
{
	System.err.println("[ERROR]-----Got an exception!-----Tables Already Created----[ERROR]");
}
%>
</body>
</html>
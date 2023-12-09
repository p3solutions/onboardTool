<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>
<%@page import="onboard.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>D3Sixty Tool</title>
</head>
<body>
<%@ page import="java.text.SimpleDateFormat"%>
        <%@ page import="java.util.Date"%>
        <%
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
        Date date = new Date();  
        System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed DB_Creation JSP PAGE-----[INFO]");  %>
<%
PreparedStatement s=null;

	try
	{		
			DBconnection  d = new DBconnection(true);
	    	Connection dbconnection = (Connection) d.getConnection();
	        s = dbconnection.prepareStatement("CREATE DATABASE  IF NOT EXISTS decom3sixtytool");
	       	s.executeUpdate();
	       
	       	dbconnection.close();
	}

	catch(Exception e)
	{
    System.err.println("[ERROR]-----Got an exception!-----Tables Already Created----[ERROR]");
	}
	finally
	{
		s.close();
	}
%>
</body>
</html>
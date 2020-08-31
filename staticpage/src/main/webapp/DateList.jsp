<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Date</title>
<style>
#state{color:black}
</style>
</head>
<body>
 <%@page import="java.sql.*"%>
<%
String Date=request.getParameter("dataView");  

 String buffer="<select name='slct1'> <option disabled selected>Please Select any Option</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool","root","password123");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select DISTINCT(substring(DATED,1,10)) from logs where USER_ID='"+Date+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#state{color:black}
</style>
</head>
<body>
 <%@page import="java.sql.*"%>
 <%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed table JSP PAGE-----[INFO]");  %>
<%
HttpSession details=request.getSession();
String uname=(String)details.getAttribute("username");
String fromdate=request.getParameter("fdate");  
String todate=request.getParameter("tdate");  

System.out.println("fromDate:" + fromdate +" toDate :" + todate);

 String buffer="<tbody>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool","root","password123");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("select * from logs where substring(DATED,1,10) >= '"+fromdate+"' and substring(DATED,1,10) <= '"+todate+"' and USER_ID='"+uname+"'");  
   while(rs.next()){
   buffer=buffer+"<tr><td class='text-center'>"+rs.getString(1)+"</td>"+"<td class='text-center'>"+rs.getString(6)+"</td>"+"<td class='text-center'>"+rs.getString(2)+"</td>"+"<td class='text-center'>"+rs.getString(5)+"</td></tr>";  
   }  
 buffer=buffer+"</tbody>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
</body>

</html>
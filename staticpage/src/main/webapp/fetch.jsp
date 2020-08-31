<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
#state{color:black}
</style>
</head>
<body>
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Fetch JSP PAGE-----[INFO]");  %>
 <%@page import="java.sql.*"%>
<%
String myDriver = "org.gjt.mm.mysql.Driver";
String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
Class.forName(myDriver);
Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
String data1=request.getParameter("s2");  
String data2=request.getParameter("input"); 

System.out.println("ROle : " + data1 + "userid :" +data2);


String query = "select * from Admin_UserDetails where roles='ArchivalAdmin' and uname='bala'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);


while(rs.next())
{
 
String query1 = "select * from ArchiveExecution_Details where projects='"+rs.getString("projects")+"' and level=1";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);

while(rs1.next())
{
if(rs1.getString("progressbar")=="100")
continue;
else
break;
}



String status=rs1.getString("name");


String query2 = "select seq_num from ArchiveExecution_Details where projects='"+rs.getString("projects")+"' and name='"+rs.getString("application")+"'";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
String seqnum="";
if(rs2.next())
seqnum=rs2.getString(1);

System.out.println(seqnum);
String query3="select * from ArchiveExecution_Details where projects='"+rs.getString("projects")+"' and seq_num>"+seqnum+" and seq_num<="+(Integer.parseInt(seqnum)+70)+" and level=3 order by seq_num";
System.out.println(query3);
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);

String Stats="";
while(rs3.next())
{
if(rs3.getString("name").equals("Requirements") && Integer.parseInt(rs3.getString("progressbar"))<100 ){
Stats="Requirements";
break;
}
if(rs3.getString("name").equals("Build and Test") && Integer.parseInt(rs3.getString("progressbar"))<100){
Stats="Development";
break;
}
if(rs3.getString("name").equals("Implement") && Integer.parseInt(rs3.getString("progressbar"))<100 ){
Stats="Implement";
break;
}
}

}%>
<br/><br/>
<%
String query4 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
while(rs4.next())
{
%>
<div class="row">
    <div class="col-sm-2"><%=rs4.getString(1) %></div>
    <div class="col-sm-2"><%=rs4.getString(2) %></div>
    <div class="col-sm-2"><%=rs4.getString(3) %></div>
    <div class="col-sm-2"><%=rs4.getString(4) %></div>
    <div class="col-sm-2"><%=rs4.getString(5) %></div>
</div>
<%
}


 %>
</body>

</html>
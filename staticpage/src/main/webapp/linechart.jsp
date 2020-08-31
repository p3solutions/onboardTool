<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
        
</head>
<style>
.chartarea{

border : 1px solid lightblue ;
}

</style>
<body>

<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Linechart JSP PAGE-----[INFO]");  %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>

<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.jsp");
}
%>
<%

HttpSession details=request.getSession();
String roles=(String)details.getAttribute("role");
String info=(String)details.getAttribute("app_emp");
try {
String det=(String)session.getAttribute("theName");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");
String query = "select * from AppEmphazize_ProjectDetails";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query3 = "select * from AppEmphazize_ProjectDetails where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query2 = "select * from logs";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
String query1 = "SELECT role FROM Role_Details";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
String query4 = "select count(uname) from Admin_UserDetails";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query5 = "select count(role) from Role_Details";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
String query6 = "select count(roles) from logs";
Statement st6 = conn.createStatement();
ResultSet rs6 = st6.executeQuery(query6);
String query7 = "select sum(count) from visits";
Statement st7 = conn.createStatement();
ResultSet rs7 = st6.executeQuery(query7);

if(rs.next()){
%>

<div class="container-fluid">
      
      <div class="row">
                    <!-- Column -->
                    <div class="col-lg-7 col-md-7">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                  <div class="col-lg-8 col-md-5">
                                    <h3 class="title">&nbsp;&nbsp;Overview of Visits</h3>
                                      </div>
                                     <!-- dropdown -->
                                    
                                      <div class="col-lg-4 col-md-5">
 
										 <span>
										      <select id="linedrop" onchange="linechartvalues()"> 
										      <option disabled selected> Select any option </option>
										      <option id="weekly" value="weekly"> Weekly &nbsp;&nbsp; </option>
										       <option id="monthly" value="monthly"> Monthly</option>
										        <option id="yearly" value="yearly"> Yearly</option>
										      </select>  
										    </span>  
										
										    </div><br>
                                    <div id="curve_chart" style="width:1250px; height:400px"></div>
                                 
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    <%
String query10 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 10 DAY) AND NOW()";
Statement st10 = conn.createStatement();
ResultSet rs10 = st10.executeQuery(query10);
String query12 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 20 DAY) AND NOW()";
Statement st12 = conn.createStatement();
ResultSet rs12 = st12.executeQuery(query12);
String query13 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()";
Statement st13 = conn.createStatement();
ResultSet rs13 = st13.executeQuery(query13);
String query11 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 50 DAY) AND NOW()";
Statement st11 = conn.createStatement();
ResultSet rs11 = st11.executeQuery(query11);
String query14 = "select SUBSTR(date,1,4), (SUBSTR(date,6,2)-1),SUBSTR(date,9,2),count from  visits";
Statement st14 = conn.createStatement();
ResultSet rs14 = st14.executeQuery(query14);
String query15 = "select SUBSTR(date,1,4), (SUBSTR(date,6,2)-1),SUBSTR(date,9,2),count from  visits";
Statement st15 = conn.createStatement();
ResultSet rs15 = st15.executeQuery(query15);
String query16 = "select SUBSTR(date,1,4), MONTHNAME(date),SUBSTR(date,9,2),count from  visits";
Statement st16 = conn.createStatement();
ResultSet rs16 = st16.executeQuery(query16);

int last_10=0,last_30=0,last_50=0,last_20=0;

while(rs10.next())
	last_10+=Integer.parseInt(rs10.getString(4));
while(rs11.next())
	last_50+=Integer.parseInt(rs11.getString(4));
while(rs12.next())
	last_20+=Integer.parseInt(rs12.getString(4));
while(rs13.next())
	last_30+=Integer.parseInt(rs13.getString(4));

%>
 <script type="text/javascript">
 function linechartvalues(){
 var lineweekly =document.getElementById("linedrop").value;
 console.log("line : "+lineweekly);
 if (lineweekly == 'weekly') {
	 google.charts.load('current', {'packages':['corechart','line']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
   	
       var data = google.visualization.arrayToDataTable([
       	
         ['Date', 'No.of.Visits'],
        
        <%
        while(rs15.next())
        {
        %>
       	 
       
         [ new Date(<%=rs15.getString(1)%>,<%=rs15.getString(2)%>,<%=rs15.getString(3)%>), <%= rs15.getString(4)%>],
        
        <%}%>
      
       ]);

       var options = {
         title: '',
         curveType: 'function',
         pointSize: 5,
         colors: ['rgb(21, 160, 200)'],
         hAxis: {
             title: 'Date',
            	 titleTextStyle: {
            		          		    fontSize: '16',
            		  }
         },
         vAxis: {
           title: 'No of visits',
           minValue: 0,
         },
         backgroundColor: '#f6f8fa'
       };

       var chart = new google.visualization.AreaChart(document.getElementById('curve_chart'));

       chart.draw(data, options);
     }   
	}
 else if(lineweekly == 'yearly')
	 {
	 google.charts.load('current', {'packages':['corechart','line']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
   	
       var data = google.visualization.arrayToDataTable([
       	
         ['Year', 'Visits'],
        
        <%
        while(rs14.next())
        {
        %>
       	 
         
         [new Date(<%=rs14.getString(1)%>,<%=rs14.getString(2)%>), <%= rs14.getString(4)%>],
        
        <%}%>
      
       ]);

       var options = {
         title: '',
         hAxis: {
             title: 'Date',
            	 titleTextStyle: {
            		          		    fontSize: '16',
            		  }
         },
         curveType: 'function',
         legend: { position: 'bottom'
        	 }
        
       };

       var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

       chart.draw(data, options);
     }   
	 
	 }
 else if(lineweekly=='monthly')
 
 {
	 
	 google.charts.load('current', {'packages':['corechart','line']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
   	
       var data = google.visualization.arrayToDataTable([
       	
         ['Monthly', 'Visits'],
        
        <%
        while(rs16.next())
        {
        %>
       	 
         
         [ 'April', <%= rs16.getString(4)%>],
        
        <%}%>
      
       ]);

       var options = {
    	         title: '',
    	         curveType: 'function',
    	         pointSize: 5,
    	         
    	         colors: ['#fb8532'],
    	        
    	         vAxis: {
    	           title: 'No of visits',
    	           minValue: 0,
    	         },
    	         backgroundColor: '#f6f8fa'
    	       };

       var chart = new google.visualization.AreaChart(document.getElementById('curve_chart'));

       chart.draw(data, options);
     } 
 }
 
     
 }
    </script> 




 <%
}

}
catch(Exception e){}
%>    
   
</body>
</html>
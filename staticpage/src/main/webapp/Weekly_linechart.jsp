
<html lang="en">
    <head>
        <title>SO question 4112686</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       
    </head>
    <body>
<%@ page import="onboard.DBconnection" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Weekly_linechart JSP PAGE-----[INFO]");  %>
<% HttpSession details=request.getSession(); %>
  <%
            DBconnection d=new DBconnection();
            Connection con = (Connection)d.getConnection();
            Statement st_distinct= con.createStatement(); %>
 <script>
            
            function ajx_call()
            {
            	var str_array=[];
            	var form = $('#id');
            	var month=document.getElementById("month").value;
            	var year=document.getElementById("year").value;
            	var select_val=document.getElementById("myList").value;
            	var uid;
            	 if(select_val=="none")
        		 {
        		 uid="<%= details.getAttribute("username") %>";
        		 }
        	 else
        		 {
        		 uid=select_val;
        		 }
            	alert(month)
            	alert(uid);
            	
            	$.ajax({
            	      url: "Weekly_linechart",
            	      type: "Post",
            	      data: { field1: month, field2 : year,userid:uid},
            	      dataType: "text",
            	      
            	    
            	      success : function(data) {
            	    	var str = data;
            	    	alert(data)
            	    	str_array="";
            	        str_array = str.split(',');

            	        for(var i = 0; i < str_array.length; i++) {
            	   
            	        str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
            	     
            	        //alert(str_array[i]);
            	}
            	    	  
            	         
            	          
            	      }   
            });
            	
            	google.charts.load('current', {'packages':['corechart','line']});
            	google.charts.setOnLoadCallback(drawChart);

            	function drawChart() {
            		var name;
            		
            	    
            	  var data = new google.visualization.DataTable();
            	  data.addColumn('string','name');
            	  data.addColumn('number','value');
            	
            	  for(var i=0;i<str_array.length;i=i+2)
            		  {
            		  alert(str_array[i]+","+str_array[i+1])
            		  data.addRow([str_array[i],Number(str_array[i+1])]);
            		  }
            		
            	
            	  var options = {
            	        title: '',
            	        curveType: 'function',
            	        pointSize: 5,
            	        
            	        colors: ['#fb8532'],
            	       
            	        vAxis: {
            	          title: 'No of visits',
            	          minValue: 0,
            	          ticks: [{v:0, f:'0'},{v:10, f:'10'},{v:20, f:'20'},{v:30, f:'30'}],
            	        },
            	        
            	        hAxis: {
            	            title: 'No of weeks',
            	            minValue: 0,
            	           
            	          },
            	        backgroundColor: '#f6f8fa'
            	      };

            	  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
            	  

            	  

            	  chart.draw(data, options);
            	 
            	}
           
            }
        </script>
     <div id="curve_chart" style="width:1250px; height:400px"></div>
   <input type="text" id="month" name="month"/>
   <input type="text" id="year" name="year"/>
   
  <select id = "myList">
<option value="none">select</option>

 <% ResultSet rs_name=st_distinct.executeQuery("select uname from Admin_UserDetails ");
 while (rs_name.next())
 {
 
 %>
 
               <option value="<%=rs_name.getString(1) %>"> <%=rs_name.getString(1) %></option>
              
           
             <%} %>
               </select>
        <button id="somebutton" onclick="ajx_call()">press here</button>
        
  
    </body>
</html>
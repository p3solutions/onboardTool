<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection"%>
<%@page import="org.owasp.encoder.Encode" %>

 <html>
      <head>  
      <script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function showState(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="state.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("state").innerHTML=xmlHttp.responseText   
      }   
      }
      </script>  
    
      </head>  
      <body>  
      <select name='country' onchange="showState(this.value)">  
       <option value="none">Select</option>  
    <%
    PreparedStatement stmt=null;
    ResultSet rs=null;
    DBconnection dBconnection = new DBconnection();

 Connection con = dBconnection.getConnection();  
 stmt = con.prepareStatement("Select * from country");
 rs = stmt.executeQuery();
 while(rs.next()){
     %>
      <option value="<%=Encode.forHtmlAttribute(rs.getString(1))%>"><%=Encode.forHtmlAttribute(rs.getString(2))%></option>  
      <%
 }
     stmt.close();
     rs.close();
     %>
      </select>  
      <br>  
      <div id='state'>  
      <select name='state'>  
      <option value='-1'></option>  
      </select>  
      </div>  
      </body> 
      </html>
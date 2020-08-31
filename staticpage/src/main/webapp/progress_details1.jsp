
<%
String initiate=request.getParameter("Initiate");
String plan=request.getParameter("Plan");
String execute=request.getParameter("Execute");
String hypercare=request.getParameter("Hypercare");
String Requirements=request.getParameter("Requirements");
String Development=request.getParameter("Development");
String Testing=request.getParameter("Testing");
String Deployment=request.getParameter("Deployment");

%>

<%if(Integer.parseInt(initiate)<35){
%>
<script>document.getElementById('prog_bar').className='progress-bar progress-bar-danger progress-bar-striped'</script>
<%} 
else if(Integer.parseInt(initiate)<65){
%>
<script>document.getElementById('prog_bar').className='progress-bar progress-bar-warning progress-bar-striped'</script>
<%} %>
<%if(Integer.parseInt(plan)<35){
%>
<script>document.getElementById('prog_bar1').className='progress-bar progress-bar-danger progress-bar-striped'</script>
<%} 
else if(Integer.parseInt(plan)<65){
%>
<script>document.getElementById('prog_bar1').className='progress-bar progress-bar-warning progress-bar-striped'</script>
<%} %>
<%if(Integer.parseInt(execute)<35){
%>
<script>document.getElementById('prog_bar2').className='progress-bar progress-bar-danger progress-bar-striped'</script>
<%} 
else if(Integer.parseInt(execute)<65){
%>
<script>document.getElementById('prog_bar2').className='progress-bar progress-bar-warning progress-bar-striped'</script>
<%} %>
<%if(Integer.parseInt(hypercare)<35){
%>
<script>document.getElementById('prog_bar3').className='progress-bar progress-bar-danger progress-bar-striped'</script>
<%} 
else if(Integer.parseInt(hypercare)<65){
%>
<script>document.getElementById('prog_bar3').className='progress-bar progress-bar-warning progress-bar-striped'</script>
<%} %>

<%if(Integer.parseInt(Requirements)<35){
%>
<script>document.getElementById('prog_bar4').className='progress-bar progress-bar-danger progress-bar-striped'</script>
<%} 
else if(Integer.parseInt(Requirements)<65){
%>
<script>document.getElementById('prog_bar4').className='progress-bar progress-bar-warning progress-bar-striped'</script>
<%} %>

<%if(Integer.parseInt(Development)<35){
%>
<script>document.getElementById('prog_bar5').className='progress-bar progress-bar-danger progress-bar-striped'</script>
<%} 
else if(Integer.parseInt(Development)<65){
%>
<script>document.getElementById('prog_bar5').className='progress-bar progress-bar-warning progress-bar-striped'</script>
<%} %>

<%if(Integer.parseInt(Testing)<35){
%>
<script>document.getElementById('prog_bar6').className='progress-bar progress-bar-danger progress-bar-striped'</script>
<%} 
else if(Integer.parseInt(Testing)<65){
%>
<script>document.getElementById('prog_bar6').className='progress-bar progress-bar-warning progress-bar-striped'</script>
<%} %>

<%if(Integer.parseInt(Deployment)<35){
%>
<script>document.getElementById('prog_bar7').className='progress-bar progress-bar-danger progress-bar-striped'</script>
<%} 
else if(Integer.parseInt(Deployment)<65){
%>
<script>document.getElementById('prog_bar7').className='progress-bar progress-bar-warning progress-bar-striped'</script>
<%} %>


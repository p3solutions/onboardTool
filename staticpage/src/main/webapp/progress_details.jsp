
<%
String initiate=request.getParameter("Initiate");
String plan=request.getParameter("Plan");
String execute=request.getParameter("Execute");
String hypercare=request.getParameter("Hypercare");

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


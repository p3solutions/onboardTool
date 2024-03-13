var Sections=['dataReq','legalReq','securityReq','usabilityReq','auditReq'];
var SectionId =['DataReqId','LegalReqId','SecurityReqId','UsabilityReqId','AuditReqId'];
$(document).ready(function(){
	archiveFunctionalDataRetrieve();
	
	
});


	
function archiveFunctionalDataRetrieve(){
	
	$.ajax({
        url: "archiveDataReqDataRetrieve",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Functional Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 for(var i = 0;i<data.length;i++)
            {				
            
            if (data[i][0]){ 
        	var checkDataReq = data[i][0].checkExistance;
        	if(checkDataReq){
        	 var rowCount=0;
             $.each(data[i], function(key, value){
            	 rowCount++;
            	 var dataReqCheckYesRadio = (value.reqInScope=='Yes')?'checked':'';
            	 var dataReqCheckNoRadio = (value.reqInScope=='No')?'checked':'';
                 var Row="<tr class = '"+Sections[i]+"RowClass' >"+
            	 "<td class = '"+Sections[i]+"ReqId'>"+value.reqId+
            	 "</td>" +
            	 "<td>"+
					 " <div class=\"form-check form-check-inline\">" +
					 "<input type=\"radio\"" +
					 " name='"+Sections[i]+(rowCount)+"' class='"+Sections[i]+"InScope "+Sections[i]+"Yes form-check-input' value='Yes' "+dataReqCheckYesRadio+">" +
					 "<label class=\"form-check-label\">Yes</label>" +
					 "</div>" +
					 "<div class=\"form-check form-check-inline\">" +
					 "<input type=\"radio\"" +
					 " name='"+Sections[i]+(rowCount)+"' class='"+Sections[i]+"InScope "+Sections[i]+"No form-check-input' value='No' "+dataReqCheckNoRadio+">" +
					 "<label class=\"form-check-label\">No</label>" +
					 "</div>"+
            	 "</td>"+
            	 "<td><input type='text' class='"+Sections[i]+"ReqType reqType form-control' value='"+value.reqType+"'/></td>" +
            	 "<td>" +
            	 "<textarea rows='2' cols='30'  class='req "+Sections[i]+"Requirements form-control'>"+value.req+"</textarea>"+
            	 "</td>"+
            	 "<td>"+
            	 "<textarea class='additional "+Sections[i]+"Additional form-control'>"+value.additionInfo+"</textarea>"+
            	 "</td>" +
            	 "<td>"+
            	"<div class=\"dropdown dropend\">" +
					 "<button class=\"btn btn-outline-light\" id=\"Drop-option\"" +
					 " data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> " +
					 " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
					 "</button>" +
					 "<ul class=\"dropdown-menu p-0\" aria-labelledby=\"Drop-option\">" +
					 "<li><a class=\"dropdown-item dropdown-styles 	\" ><i" +
					 " class=\"fa-solid fa-pencil iconColor\"></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
					 " <li>" +
					 "<hr class=\"dropdown-divider m-0\">" +
					 "</li>" +
					 "<li><a class='dropdown-item dropdown-styles DeleteRow "+Sections[i]+"Delete' ><i" +
					 " class=\"fa-solid fa-trash-can text-danger \"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
					 "</li>" +
					 "</ul>" +
					 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#"+SectionId[i]).append(Row);
             });
        	}
        	
        	
            }
            else
        	{
			 var Row="<tr class = 'screenReqRowClass'id='"+SectionId[i]+"NoDataScrRow'>"+
            	 "<td colspan='6'>"+"<b>No records found</b>"+
            	 "</td>" +
            	 "</tr>";
			  $("#"+SectionId[i]).append(Row);
			}
            }
             var script="<script>$('.datepicker1').datepicker({\n" +
             "format: \"mm/dd/yyyy\",\n"+
             "clearBtn:true,"+
             "autoclose: true,\n"+
             "orientation: 'bottom',"+
             "});";
         
         $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
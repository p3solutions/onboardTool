
var addTableName;
var className;
var tableNameAdd;
var section;
var sectionid;
$(document).ready(function(){
	
	$(document).on('click','.addClass', function(){
		var ClassIndex = $(this).index('.addClass');
		addTableName = "";
		className = "";
		tableNameAdd ="";
		section = "";
        sectionid="";
		getAddProperty(ClassIndex);
		var seqNum = $('.'+section+"RowClass").length;
		archiveFunctionalReqAddAjaxCall(seqNum);
		
	});
});
function getAddProperty(index)
{
	section = Sections[index];
	sectionid=SectionId[index];
	switch(index)
	{
	case 0:
		addTableName="archive_datareq_info";
	    className = "dataReqRowClass";
	    tableNameAdd = "Data Requirements";
	    break;
	case 1:
		addTableName="Archive_RetentionLegalReq_Info";
	    className = "legalReqRowClass";
	    tableNameAdd = "Retention and Legal Requirements";
		break;
	case 2:
		addTableName="Archive_SecurityReq_Info";
	    className = "securityReqRowClass";
	    tableNameAdd = "Security Requirements";
		break;
	case 3:
		addTableName="Archive_UsabilityReq_Info";
	    className = "usabilityReqRowClass";
	    tableNameAdd = "Usability Requirements";
	    
		break;
	case 4:
		addTableName="Archive_AuditReq_Info";
	    className = "auditReqRowClass";
	    tableNameAdd = "Audit Requirements";
		break;
	}
}
function archiveFunctionalReqAddAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveFunctionalDataReqAddServlet",
        type: 'POST',
        data: {seqNum:seqNum,tableName:addTableName},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Data Add Row Retrieve--->",data);
        	if(data.AddStatus){
        		
        		 var Row="<tr class = '"+section+"RowClass' >"+
            	 "<td class = '"+section+"ReqId'>"+data.ReqId+
            	 "</td>" +
            	 "<td>"+
					 " <div class=\"form-check form-check-inline\">" +
					 "<input type=\"radio\"" +
            	 " name='"+section+(seqNum+1)+"' id='"+section+(seqNum+1)+"' class='"+section+"InScope "+section+"Yes form-check-input' value='Yes'/><label class=\"form-check-label\">Yes</label>"+
					 "</div>" +
					 "<div class=\"form-check form-check-inline\">" +
					 "<input type=\"radio\"" +
					 " name='"+section+(seqNum+1)+"' id='"+section+(seqNum+1)+"' class='"+section+"InScope "+section+"No form-check-input' value='No'/> <label class=\"form-check-label\">No</label>"+
            	 "</td>"+
            	 "<td><input type='text' class='dataReq "+section+"ReqType form-control' value='' /></td>" +
            	 "<td>" +
            	 "<textarea rows='2' cols='30' class='req "+section+"Requirements form-control' ></textarea>"+
            	 "</td>"+
            	 "<td>"+
            	 "<textarea rows='2' cols='30' class='additional "+section+"Additional form-control' value='N/A' >N/A</textarea>"+
            	 "</td>" +
            	 "<td>"+
					 "<div class=\"dropdown dropend\">" +
					 "<button class=\"btn btn-outline-light\" id=\"Drop-option\"" +
					 " data-bs-toggle=\"dropdown\" aria-expanded=\"false\">" +
					 " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
					 "</button>" +
                 "<ul class='dropdown-menu p-0' aria-labelledby=\"Drop-option\">"+
					 "<li><a class=\"dropdown-item dropdown-styles disabled	\" ><i" +
					 " class=\"fa-solid fa-pencil iconColor\"></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
					 " <li>" +
					 "<hr class=\"dropdown-divider m-0\">" +
					 "</li>" +
                 "<li><a class='dropdown-item dropdown-styles DeleteRow "+section+"Delete' ><i class='fa-solid fa-trash-can text-danger'></i>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#"+sectionid).append(Row);
            	 $("#"+sectionid+"NoDataScrRow").hide();	
      
           	 	notification("success","Row added Successfully in "+tableNameAdd+".","Note:");
        	}
        	else
        		notification("error","Error occurred while adding the row in "+tableNameAdd+".","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
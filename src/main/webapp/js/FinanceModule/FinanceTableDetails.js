$(document).ready(function()
{	
    $.ajax({
        url: "FinanceTableDetailsServlet",
        type: 'POST',
        dataType: "json",
        beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();
        
            console.log("FinanceDetails",data);
            AddAndEdit()
            if (!$.isArray(data)) {
                data = [data];
            }
            /*var parentRow = ""*/
            appendRowFunction(data);
            },
    });
    
});
function appendRowFunction(data){
    $.each(data, function(key, value){
	    var Project_Number = value.Project_Number;
        var Phase = value.Phase;
        var Application_Name = value.Application_Name;
        var Software_and_Licensing = value.Software_and_Licensing;
        var Contract_Date = value.Contract_Date;
           var scope_of_infrastructure = value.scope_of_infrastructure;
              var infrastructure_Cost_Savings = value.infrastructure_Cost_Savings;
                 var Cost_Avoidance = value.Cost_Avoidance;   
                 var Cost_of_Archive = value.Cost_of_Archive;
           var CBA = value.CBA;
            var Funding_approval = value.Funding_approval;
             var Funding_type = value.Funding_type;
              var Status = value.Status;
        var Id = value.Id;
     
        var row = "<tr>"+
                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Project_Number+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Phase+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Application_Name+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Software_and_Licensing+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Contract_Date+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+scope_of_infrastructure+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+infrastructure_Cost_Savings+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Cost_Avoidance+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Cost_of_Archive+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+CBA+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Funding_approval+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Funding_type+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Status+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;display:none;'><label class='control-label ' for=''>"+Id+"</label>" +
                 "</td>"+
                  "<td class='useraction' style='text-align:center;vertical-align: middle;display:none;'><span class='glyphicon glyphicon-pencil editpopup'id='editpopup"+ Id +"'style='display:block;margin-left:-22px;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;margin-top:-13px;'></span>"+
                  "</td>"+
                  "</tr>";
                 
                  $("#FinanceDetails").append(row);
                
                
                getPagination1('#FinanceDetails');
    });
}
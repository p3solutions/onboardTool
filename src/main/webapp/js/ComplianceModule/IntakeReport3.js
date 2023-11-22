$(document).ready(function()
{	
    $.ajax({
        url: "IntakeReport3Servlet",
        type: 'POST',
        dataType: "json",
        beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();

            console.log("Legacy Application Info : ",data);
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
	   var Legacy_Application_Name=value.Legacy_Application_Name;
	   var SourcePlatform_Databases=value.SourcePlatform_Databases;
	   var Legacy_Application_Description=value.Legacy_Application_Description;
	   var What_is_the_read_only_date =value.What_is_the_read_only_date;
	   var Is_this_application_the_only_source_of_truth_for_the_data=value.Is_this_application_the_only_source_of_truth_for_the_data;
	   var Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor=value.Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor;
	   var What_is_the_total_data_size=value.What_is_the_total_data_size;
	   var Retention_Period=value.Retention_Period;
        

        if(typeof Legacy_Application_Name  !== "undefined"&& typeof SourcePlatform_Databases !== "undefine" && typeof Legacy_Application_Description  !== "undefined" && typeof What_is_the_read_only_date !== "undefined" && typeof Is_this_application_the_only_source_of_truth_for_the_data!== "undefined" && typeof Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor  !== "undefined"&& typeof What_is_the_total_data_size  !== "undefine"&& typeof Retention_Period !== "undefined")
        {
        var row = "<tr>"+
                
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Legacy_Application_Name+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+SourcePlatform_Databases+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Legacy_Application_Description+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+What_is_the_read_only_date+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Is_this_application_the_only_source_of_truth_for_the_data+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+What_is_the_total_data_size+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Retention_Period+"</label>" +
                 "</td>"+

                  "</tr>";

                  $("#IntakeReport3").append(row);
                  }
                 usertablehide();
                 getPagination('#admin_userslist');
    });
}
$(document).ready(function()
{	
    $.ajax({
        url: "Retrieve_Abbreviations_Servlet",
        type: 'POST',
        dataType: "json",
        beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();
        
            console.log("Retrieved Abbreviation List : ",data);
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
	    var seq_no = value.seq_no;
        var app_id = value.app_id;
        var abbreviation_acronym = value.abbreviation_acronym;
        var description = value.description;
        if (data[0].checkData){
        var row = "<tr>"+
        		  "<td>"+seq_no+"" +
                  "</td>"+
                  "<td>"+abbreviation_acronym +
                  "</td>"+
                  "<td>"+description+
                  "</td>"+
                  "<td class='useraction mx-5 p-0'><span class='fa-solid fa-pencil iconColor editpopup mx-2' id='editpopupabb"+seq_no+"'></span><span class='fa-solid fa-trash-can text-danger deletepopup mx-2'></span>"+
                  "</td>"+                  
                  "</tr>";
                 
                  $("#abbreviationlist").append(row);
         }else{
					var row ="<tr><td colspan='4'> <b>No Abbreviations found.</b></td></tr>";
					$("#abbreviationlist").append(row);
				  }
    });
}
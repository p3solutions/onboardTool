$(document).ready(function () {
    // Define the function to make the AJAX request and update the tables
    function loadData(category) {
        $.ajax({
            url: "IntakeReportServlet",
            type: 'POST',
            data: { category: category },
            dataType: "json",
            beforeSend: function () {
                $('#overlay').show();
            },
            success: function (data) {
                $('#overlay').hide();
                console.log("Data retrieved:", data);

                if (data.error) {
                    $("#dynamicHeader").html("Error: " + data.error);
                } else {
                    var tableHtml = null;

                    if (category === "IntakeReport1") {
                        tableHtml = constructTable1(data);
                    } else if (category === "IntakeReport2") {
                        tableHtml = constructTable2(data);
                    } else if (category === "IntakeReport3") {
                        tableHtml = constructTable3(data);
                    } else {
                        console.log("Unknown option is selected");
                    }

                    $("#dynamicHeader").html(tableHtml);
                }
            },
        });
    }

    // Initialize with intakereport1
    var defaultCategory = "IntakeReport1";
    $("#category").val(defaultCategory);

   
    loadData(defaultCategory);

    //  for report change
    $("#category").change(function () {
        var selectedCategory = $(this).val();
        loadData(selectedCategory);
    });

});


function constructTable1(data) {

    var tableHtml = "<thead>" +

        "<tr>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Application_Id</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Application_Name</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Creation_Date</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Status</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Request_Type</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Requester</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Application_Owner</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Business_Segment</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Business_Unit</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Preliminary_CBA</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Funding_Available</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Program_Funder</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Project_Portfolio_Information</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Project_Decomission_Date</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Infrastructure_Impact</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Number_of_Infrastructure_Components</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Archival_Solution</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Status_Notes</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">EDR_Analyst</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Big_Rock</th>"+

        "</tr>" +

        "</thead><tbody>";

 

 

    $.each(data, function(key, value){

        var Application_Id = value.Application_Id;

        var Application_Name = value.Application_Name;

        var Creation_Date = value.Creation_Date;

        var Status = value.Status;

        var Request_Type = value.Request_Type;

        var Requester = value.Requester;

        var Application_Owner = value.Application_Owner;

        var Business_Segment = value.Business_Segment;

        var Business_Unit = value.Business_Unit;

        var Preliminary_CBA = value.Preliminary_CBA;

        var Funding_Available = value.Funding_Available;

        var Program_Funder = value.Program_Funder;

        var Project_Portfolio_Information = value.Project_Portfolio_Information;

        var Project_Decomission_Date = value.Project_Decomission_Date;

        var Infrastructure_Impact = value.Infrastructure_Impact;

        var Number_of_Infrastructure_Components = value.Number_of_Infrastructure_Components;

        var Archival_Solution = value.Archival_Solution;

        var Status_Notes = value.Status_Notes;

        var EDR_Analyst = value.EDR_Analyst;

        var Big_Rock = value.Big_Rock;

 

        var row = "<tr>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Application_Id+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Application_Name+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Creation_Date+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Status+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Request_Type+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Requester+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Application_Owner+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Business_Segment+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Business_Unit+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Preliminary_CBA+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Funding_Available+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Program_Funder+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Project_Portfolio_Information+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Project_Decomission_Date+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Infrastructure_Impact+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Number_of_Infrastructure_Components+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Archival_Solution+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Status_Notes+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+EDR_Analyst+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Big_Rock+"</label>" +

            "</td>"+"</tr>"

        tableHtml+=row;

    });

 

    tableHtml += "</tbody>";

 

    return tableHtml;

}

 

 

function constructTable2(data) {

    var tableHtml = "<thead>" +

        "<tr>" +


        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Application_Name</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Application_Owner</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">status</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Project_Portfolio_Information</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Funding_Available</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Application_Details</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Target_Date</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Readonly_Date</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Database type</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Structured Data In GB</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Structured Data Number of Tables</th>" +

 

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Unstructured Data In GB</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Unstructured Data files</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Database Server Name</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Database Name</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Table Names</th>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">DBA Contact</th>" +

        "</tr>" +

        "</thead><tbody>";

 

 

    $.each(data, function(key, value){


        var Application_Name = value.Application_Name || " ";

        var Application_Owner = value.Application_Owner || " ";

        var status = value.status || " ";

        var Project_Portfolio_Information = value.Project_Portfolio_Information || " ";

        var Funding_Available = value.Funding_Available || " ";

        var Application_Details = value.Application_Details || " ";

        var Target_Date = value.Target_Date || " ";

        var Readonly_Date = value.Readonly_Date || " ";

        var Database_type = value.Database_type || " ";

        var Database_Type_Characteristics= value.Database_Type_Characteristics || " ";

        var Structured_Data_In_GB = value.Structured_Data_In_GB || " ";

        var Structured_Data_Number_of_tables=value.Structured_Data_Number_of_tables||"";

        var Unstructured_Data_In_GB = value.Unstructured_Data_In_GB || " ";

        var Unstructured_Data_files = value.Unstructured_Data_files || " ";

        var Database_Server_Name = value.Database_Server_Name || " ";

        var Database_Name = value.Database_Name || " ";

        var Table_Names = value.Table_Names || " ";

        var DBA_Contact = value.DBA_Contact || " ";

 

            var row = "<tr>"+

                

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Application_Name+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Application_Owner+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+status+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Project_Portfolio_Information+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Funding_Available+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Application_Details+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Target_Date+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Readonly_Date+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Database_type+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Database_Type_Characteristics+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Structured_Data_In_GB+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Structured_Data_Number_of_tables+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Unstructured_Data_In_GB+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Unstructured_Data_files+"</label>" +

                "</td>"+

                "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Database_Server_Name+"</label>" +

                "</td>"+ "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Database_Name+"</label>" +

                "</td>"+ "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Table_Names+"</label>" +

                "</td>"+ "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+DBA_Contact+"</label>" +

                "</td>"+

                "</tr>";

            tableHtml+=row;

    });

 

    tableHtml += "</tbody>";

 

    return tableHtml;

}

 

 

function constructTable3(data) {

    var tableHtml = "<thead>" +

        "<tr>" +

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\"> LegacyApplicationName  </th>"+

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">SourcePlatformDatabases</th>"+

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">LegacyApplicationDescription</th>"+

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">ReadOnlyDate</th>"+

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Isthisapplicationtheonlysourceoftruthforthedata</th>"+

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor</th>"+

        "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">totaldatasize</th>"+

       "<th style='text-align: center; vertical-align: middle; width: 10%;' scope=\"col\">RetentionPeriod</th>"+

        "</tr>" +

        "</thead><tbody>";

 

 

    $.each(data, function(key, value){

        var Legacy_Application_Name=value.Legacy_Application_Name;

        var SourcePlatform_Databases=value.SourcePlatform_Databases;

        var Legacy_Application_Description=value.Legacy_Application_Description;

        var What_is_the_read_only_date =value.What_is_the_read_only_date;

        var Is_this_application_the_only_source_of_truth_for_the_data=value.Is_this_application_the_only_source_of_truth_for_the_data;

        var third_party_vendor=value.Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor;

        var What_is_the_total_data_size=value.What_is_the_total_data_size;

        var Retention_Period=value.Retention_Period;

 

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

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+third_party_vendor+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+What_is_the_total_data_size+"</label>" +

            "</td>"+

            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Retention_Period+"</label>" +

            "</td>"+

            "</tr>";

        tableHtml+=row;

    });

 

    tableHtml += "</tbody>";

 

    return tableHtml;

}
 
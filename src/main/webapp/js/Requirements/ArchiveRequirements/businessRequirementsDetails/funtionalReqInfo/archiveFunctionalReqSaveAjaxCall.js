var classSaveName  = "";
var Table_Name_Save = "";
var tableSaveName = "";
$(document).on('click','.dataSaveClass', function(e)
{
var index = $(this).index('.dataSaveClass');
classSaveName  = "";
tableSaveName = "";
Table_Name_Save = "";
getTableInfo(index);
getJsonArray(e);
});
function getTableInfo(index){
    section = Sections[index];
    sectionid=SectionId[index];
    switch(index)
    {
    case 0:
        tableSaveName="Archive_DataReq_Info";
        classSaveName = "dataReqRowClass";
        Table_Name_Save = "Data Requirements";
        break;
    case 1:
        tableSaveName="Archive_RetentionLegalReq_Info";
        classSaveName = "legalReqRowClass";
        Table_Name_Save = "Retention and Legal Requirements";
        break;
    case 2:
        tableSaveName="Archive_SecurityReq_Info";
        classSaveName = "securityReqRowClass";
        Table_Name_Save = "Security Requirements";
        break;
    case 3:
        tableSaveName="Archive_UsabilityReq_Info";
        classSaveName = "usabilityReqRowClass";
        Table_Name_Save = "Usability Requirements";
        break;
    case 4:
        tableSaveName="Archive_AuditReq_Info";
        classSaveName = "auditReqRowClass";
        Table_Name_Save = "Audit Requirements";
        break;
    }
}
function getJsonArray(e){
    var validation = true;
    var JsonArray = [];
    console.log("input :",$('input[name="legalReq2"]:checked').eq(i).val());
    for(var i = 0; i<$('.'+section+'RowClass').length; i++){
        var inputs = {};
        var ReqId = $('.'+section+'ReqId').eq(i).html();
        var InScopeNameAttr = $('.'+section+'Yes').eq(i).attr('name');
        var InScope = $('input[name='+InScopeNameAttr+']:checked').val();
        var ReqType = $('.'+section+'ReqType').eq(i).val();
        var Requirements = $('.'+section+'Requirements').eq(i).val();
        var Additional = $('.'+section+'Additional').eq(i).val();
        if(!checkFieldValues(InScope, ReqType, Requirements))
            validation = false;
        inputs['seq_no'] = i+1;
        inputs['ReqId'] = ReqId;
        inputs['InScope'] = InScope;
        inputs['ReqType'] = ReqType;
        inputs['Requirements'] = Requirements;
        inputs['Additional'] = Additional;
        JsonArray.push(inputs);
    }
    if(validation){
	 if(JsonArray.length === 0 && tableSaveName=="Archive_RetentionLegalReq_Info") {
        notification("error","Retention and Legal Requirements requires Atleast One Row","Error");
    }
    else
    {
	archiveFunctionalReqSaveAjaxcall(JsonArray);
	}
        
        }
    else
        notification("warning","Please fill the all fields in "+Table_Name_Save+".","Warning");
    e.preventDefault(); 
}
function checkFieldValues(InScope, ReqType, Requirements){
    var validationFlag = false;
    if((InScope != '' && InScope != undefined && InScope != null) && (ReqType != '' && ReqType != undefined && ReqType != null) && 
            (Requirements != '' && Requirements != undefined && Requirements != null))
            validationFlag = true;
    return validationFlag;
}
function archiveFunctionalReqSaveAjaxcall(JsonArray){
    var checkAjax =false;
        $.ajax({
            url: "archiveFunctionalReqSaveServlet",
            type: 'POST',
            data : {JsonArray:JSON.stringify(JsonArray), tableName:tableSaveName},
            async: false,
            dataType: "json",
            success: function (data) {
                console.log("SAVE DATA:",data);
                JsonObject = data;
                if(data.SaveStatus){
                notification("success",Table_Name_Save+" details Saved successfully.","Note:");
                   if(tableSaveName=="Archive_DataReq_Info"){
                    document.getElementById("legalReqSaveReq").disabled = false;
                    }
                   if(tableSaveName=="Archive_RetentionLegalReq_Info"){
                    document.getElementById("securityReqSaveReq").disabled = false;
                    }
                   if(tableSaveName=="Archive_SecurityReq_Info"){
                    document.getElementById("UsabilityReqSaveReq").disabled = false;
                    }
                   if(tableSaveName=="Archive_UsabilityReq_Info"){
                    document.getElementById("auditReqSaveReq").disabled = false;
                    }
                   if(tableSaveName=="Archive_AuditReq_Info"){
                    document.getElementById("complete").disabled = false;
                    }
                }   
                else
                    notification("error","Error occurred while saving "+Table_Name_Save+" details.","Error:");
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
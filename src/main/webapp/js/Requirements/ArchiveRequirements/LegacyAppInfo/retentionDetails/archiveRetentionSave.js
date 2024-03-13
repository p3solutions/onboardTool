$(document).ready(function() {
    enableSaveButtonFunction()
        });
var JsonArray = [];
$("#saveRetentionId").click( function(e){       
    getJsonArray(e);
    });
function getJsonArray(e){
    JsonArray = [];
    var validation = true;
    var checkRow = 0;
    var validateContentInfo = getContentInfo();
    for(var i = 0; i<$('.rowClass').length; i++){
        var inputs = {};
        var retentionCheck = $('.retentionCheck').eq(i).is(':checked');
        if(retentionCheck)
        {
          var retentionLevel = $('.retentionLevel').eq(i).html();
          var conditions = $('.conditions').eq(i).val();
          var dateUsedName = $('.ColumnValue').eq(i).attr('name');
          var dateUsedType = $("input:radio[name='"+dateUsedName+"']:checked").val();
          var dateUsedClass =(dateUsedType=="column")?'dateUsedColumn':(dateUsedType=="date")?'dateUsedDate':'';
          var dateUsed = (dateUsedClass!='')?$('.'+dateUsedClass).eq(i).val():'';
          var descp = $('.descp').eq(i).val();
          if(!checkFieldValues(conditions, dateUsedType, dateUsed))
            validation = false;
          inputs['seq_no'] = i+1;
          inputs['retentionCheck'] = retentionCheck;
          inputs['retentionLevel'] = (retentionLevel==undefined||retentionLevel==null)?'':retentionLevel;
          inputs['conditions'] = (conditions==undefined||conditions==null)?'':conditions;
          inputs['dateUsedType'] = (dateUsedType==undefined||dateUsedType==null)?'':dateUsedType;
          inputs[dateUsedType] = (dateUsed==undefined||dateUsed==null)?'':dateUsed;
          inputs['descp'] = (descp==undefined||descp==null)?'':descp;
          JsonArray.push(inputs);
         checkRow++;
        }
    }
    console.log("Save json Array",JsonArray);
    if(validation&&validateContentInfo&&checkRow!=0)
        archiveRetentionSaveAjaxcall(JsonArray);
    else
        {
        if(checkRow==0)
            notification("warning","Please select atleast one retention type.","Warning");
        if(!validation)
            notification("warning","Please fill the all fields.","Warning");
      if(!validateContentInfo)
          notification("warning","Please fill the Content Info more than 100 characters.","Warning");
        }
    e.preventDefault(); 
}
function getContentInfo()
{
    var ContentInfo = "";
    var length=$("#contentInfoList").find("li").length;
    for(var i=0; i<length; i++){
        ContentInfo+=$("#contentInfoList").find("li").eq(i).html()+"::";
                }
    ContentInfo=ContentInfo.substring(0,ContentInfo.length-2);
    var input={};
 input["contentInfo"] = ContentInfo;
 JsonArray.push(input);
 if(ContentInfo.length>=100)
     return true;
 else
     return false;
}
    function checkFieldValues(condition, dateUsedType, dateUsed){
        var validationFlag = false;
        if((condition != '' && condition != undefined && condition != null) && (dateUsedType != '' && dateUsedType != undefined && dateUsedType != null) && 
                (dateUsed != '' && dateUsed != undefined && dateUsed != null))
                validationFlag = true;
        return validationFlag;
    }
function archiveRetentionSaveAjaxcall(JsonArray){
        var checkAjax =false;
            $.ajax({
                url: "archiveRetentionSaveServlet",
                type: 'POST',
                data : {JsonArray:JSON.stringify(JsonArray)},
                async: false,
                dataType: "json",
                success: function (data) {
                    console.log("SAVE DATA:",data);
                    JsonObject = data;
                    if(data.SaveStatus){
                        $('#next').prop('disabled',false);
                        notification("success","Saved successfully.","Note:");
                        document.getElementById("complete").disabled = false;
                    }
                    else
                        notification("error","Error occurred while saving.","Error:");
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }
        $(document).on('click', '#complete', function(e) {
                $.ajax({
        url: "ArchiveLegacyCompleteServlet",
        type: 'POST',
        async: false,
        data : {completeType : "RetentionApplication"},
        dataType: "json",
        success: function(data) {
            console.log("Completed DATA:", data);
            JsonObject = data;
            if (data.iscompleted==true) {
                notification("success", "Completed successfully.", "Note:");
            }else if (data.iscompleted==false) {
                notification("error","Please fill all the fields.","Error:");
            }
        }
    });
    e.preventDefault();
            });
            $(document).on('click', '#edit', function(e) {
                        document.getElementById("saveRetentionId").disabled = false;
                        notification("success", "Current Page is editable", "Note:");
            e.preventDefault();
            });
        function enableSaveButtonFunction(){
            $.ajax({
        url: "ArchiveReqCompleteStatusServlet",
        type: 'POST',
        async: false,
        data : {completeType : "RetentionApplication"},
        dataType: "json",
        success: function(data) {
            console.log("Completed DATA:", data);
            JsonObject = data;
            if (data.iscompleted==true) {
            document.getElementById("saveRetentionId").disabled = true;
            }else{
            document.getElementById("saveRetentionId").disabled = false;
                            }
        }
    });
        }
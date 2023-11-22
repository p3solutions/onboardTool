    $('#LegacyEditSubmit').click(function(){
    	var Label=$("#LegacyLabelModify").val();
    	var Seq_Num=$('#LegacySeqNum').val();
    	if (Label !='')
    	{
    		
    	$.ajax({
            url: "FinanceAppInfoEditServlet",
            type: 'POST',
            data : {seq_num:Seq_Num,label:Label},
            dataType: "json",
            success: function (data) {
            	
            	//alert("success");
            	if(data.checkEditStatus && data.checkDuplicate){  	
            	console.log("Modify data : "+data.seq_no);
            	var index = data.seq_no - 1;
            	var updated_label_name = data.label_name;
            	var previous_label_name =data.previous_label_name;
            	var html = $(".InputField").eq(index).find("label[for =archiveLegacy]").eq(0).html();
            	var html1 =html.replace(previous_label_name,updated_label_name);
            	console.log("HTML "+html1);
            	$(".InputField").eq(index).find("label[for =archiveLegacy]").eq(0).html(html1);
            	$("#LegacyLabelModify").val("");
            	$("#LegacyEditClose").click();
            	$('.hidepencil').hide();
            	notification("success","Selected field is edited successfully in Archive Application Info.","Note : ");
            	//$('#Record_No').val(data.RandomNumber);
            	}
            	else{
            		if(!data.checkDuplicate)
            			notification("warning","Label name already exist in Archive Application Info.","Warning : ");
            		else if(!data.checkEditStatus)
            			notification("error","Problem occured while editing in Archive Application Info.","Error : ");
            	}
            },
            error: function (e) {
                console.log(e);
            }
        });
    	}
    	else {
    		notification("warning","Please fill the value in field.","Warning");
    		//alert("Please fill the value in field");
    	}
    });
    $('#LegacyDeleteSubmit').click(function(){
    	
    	var Seq_Num=$('#LegacyDeleteSeq').val();
    	var check = ArchiveLegacyDeleteAjax(Seq_Num);
    	
    });
    
    function ArchiveLegacyDeleteAjax(Seq_Num)
    {
    	$.ajax({
            url: "FinanceAppInfoDeleteServlet",
            type: 'POST',
            async: false,
            data : {seq_num:Seq_Num},
            dataType: "json",
            success: function (data) {
            	console.log("Delete Data : "+ data);
            	if(data.statusFlag){
            		var index = data.index;
                	$(".InputField").eq(index).remove();
                	var column = data.columnName;
            	if(column == "locationcenter" || column == "listcountry")
            		$(".InputField").eq(index).remove();
            	for(var i = index; i<$(".InputField").length;i++)
            	{
            	  var exist = $(".InputField").eq(i).find("input").length;
            	  if($(".InputField").eq(i).find("input").length)
            	 {
            		var name = $(".InputField").eq(i).find("input").attr("name");
            		 if(name.startsWith("LegacyAddInfo"))
            		 {
            			 $(".InputField").eq(i).find("input").attr("name","LegacyAddInfo"+(i+1));
            		 }
                 } 
            	else if($(".InputField").eq(i).find("select").length)
                 {
            		var name = $(".InputField").eq(i).find("select").attr("name");
           		   if(name.startsWith("LegacyAddInfo"))
           		   {
           			 $(".InputField").eq(i).find("select").attr("name","LegacyAddInfo"+(i+1));
           		   }
            	 }
            		
            	}
            	notification("success","Selected field is deleted successfully in Finance Application Info.","Note : ");
            	
            	}
            	else
            		notification("error","Problem occured while deleting in Finance Application Info.","Error : ");
            	$("#LegacyDeleteClose").click();
            	$('.hidedelete').hide();
            	
            	//$("#OpportunityListbtn").click();
            },
            error: function (e) {
                console.log(e);
            }
        });
    	return true;
    }
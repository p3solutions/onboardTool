    $('#AssessEditSubmit').click(function(){
    	var Label=$("#AssessLabelModify").val();
    	var Seq_Num=$('#AssessSeqNum').val();
    	var EditSection = $('#EditSection').val();
    	if (Label !='')
    	{
    		
    	$.ajax({
            url: "IntakeAssessmentEditFeature",
            type: 'POST',
            data : {seq_num:Seq_Num,label:Label,EditSection:EditSection},
            dataType: "json",
            success: function (data) {
            	
            	//alert("success");
            	console.log("Modify data : "+data.seq_no);
            	var index = data.seq_no - 1;
            	var updated_label_name = data.label_name;
            	var previous_label_name =data.previous_label_name;
            	var html = $("."+EditSection).eq(index).find("label[for = Assessment]").eq(0).html();
            	var html1 =html.replace(previous_label_name,updated_label_name);
            	console.log("HTML "+html1);
            	$("."+EditSection).eq(index).find("label[for =Assessment]").eq(0).html(html1);
            	$("#AssessLabelModify").val("");
            	$("#AssessEditClose").click();
            	$('.hidepencilAssessment').hide();
            	//$('#Record_No').val(data.RandomNumber);
            },
            error: function (e) {
                console.log(e);
            }
        });
    	}
    	else {
    		
    		alert("Please fill the value in field");
    	}
    });
    $('#AssessDeleteSubmit').click(function(){
    	
    	var Seq_Num=$('#AssessSequence').val();
    	var DeleteSection = $('#DeleteSection').val();
    	var check = AssessmentDeleteAjax(Seq_Num,DeleteSection);
    	
    	
    });
    
    function AssessmentDeleteAjax(Seq_Num,DeleteSection)
    {
    	$.ajax({
            url: "IntakeAssessmentDeleteFeature",
            type: 'POST',
            async: false,
            data : {seq_num:Seq_Num,DeleteSection:DeleteSection},
            dataType: "json",
            success: function (data) {
            	var CheckDelete = data.CheckDelete;
            	if(CheckDelete==false)
            	{
            	console.log("index"+data.index);
            	var index = data.index;
            	$("."+DeleteSection).eq(index).remove();
            	}
            	else
            	{
            	  var DeleteCount = data.DeleteCount;
            	  for(var i = 0;i<DeleteCount;i++)
            	  {
            	   console.log("index"+data.index);
              	   var index = data.index;
              	   $("."+DeleteSection).eq(index).remove();
            	  }
            	}
            	$("#AssessDeleteClose").click();
            	$('.hidedeleteAssessment').hide();
            	//$("#OpportunityListbtn").click();
            },
            error: function (e) {
                console.log(e);
            }
        });
    	return true;
    }
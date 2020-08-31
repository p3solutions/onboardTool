    $('#TriSummEditSubmit').click(function(){
    	var Label=$("#TriSummLabelModify").val();
    	var Seq_Num=$('#TriSummSeqNum').val();
    	if (Label !='')
    	{
    		
    	$.ajax({
            url: "IntakeTriageSummaryEditFeature",
            type: 'POST',
            data : {seq_num:Seq_Num,label:Label},
            dataType: "json",
            success: function (data) {
            	
            	//alert("success");
            	console.log("Modify data : "+data.seq_no);
            	var index = data.seq_no - 1;
            	var updated_label_name = data.label_name;
            	var previous_label_name =data.previous_label_name;
            	var html = $(".InputFieldSummary").eq(index).find("label[for =TriageSummary]").eq(0).html();
            	var html1 =html.replace(previous_label_name,updated_label_name);
            	console.log("HTML "+html1);
            	$(".InputFieldSummary").eq(index).find("label[for =TriageSummary]").eq(0).html(html1);
            	$("#TriSummLabelModify").val("");
            	$("#TriSummEditClose").click();
            	$('.hidepencilSummary').hide();
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
    $('#TriSummDeleteSubmit').click(function(){
    	
    	var Seq_Num=$('#TriSummSequence').val();
    	var check = TriageSummaryDeleteAjax(Seq_Num);
    	
    });
    
    function TriageSummaryDeleteAjax(Seq_Num)
    {
    	$.ajax({
            url: "IntakeTriageSummaryDeleteFeature",
            type: 'POST',
            async: false,
            data : {seq_num:Seq_Num},
            dataType: "json",
            success: function (data) {
            	console.log("index"+data.index);
            	var index = data.index;
            	$(".InputFieldSummary").eq(index).remove();
            	$("#TriSummDeleteClose").click();
            	$('.hidedeleteSummary').hide();
            	//$("#OpportunityListbtn").click();
            },
            error: function (e) {
                console.log(e);
            }
        });
    	return true;
    }
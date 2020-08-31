    $('#submit1').click(function(){
    	var Label=$("#Label_modify").val();
    	var Seq_Num=$('#seq_num').val();
    	if (Label !='')
    	{
    		
    	$.ajax({
            url: "IntakeOpportunityEditServlet",
            type: 'POST',
            data : {seq_num:Seq_Num,label:Label},
            dataType: "json",
            success: function (data) {
            	
            	//alert("success");
            	console.log("Modify data : "+data.seq_no);
            	var index = data.seq_no - 1;
            	var updated_label_name = data.label_name;
            	var previous_label_name =data.previous_label_name;
            	var html = $(".InputField").eq(index).find("label[for =opportunity]").html();
            	var html1 =html.replace(previous_label_name,updated_label_name);
            	console.log("HTML "+html1);
            	$(".InputField").eq(index).find("label[for =opportunity]").html(html1);
            	$("#Label_modify").val("");
            	$("#edit_close").click();
            	$('.hidepencil').hide();
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
    $('#submit2').click(function(){
    	
    	var Seq_Num=$('#sequence1').val();
    	var check = DeleteAjax(Seq_Num);
    	if(check)
    	{
    		$("#OpportunityListbtn").click();
    	}
    	
    });
    
    function DeleteAjax(Seq_Num)
    {
    	$.ajax({
            url: "IntakeOpportunityDeleteServlet",
            type: 'POST',
            async: false,
            data : {seq_num:Seq_Num},
            dataType: "json",
            success: function (data) {
            	console.log("index"+data.index);
            	var index = data.index;
            	$(".InputField").eq(index).remove();
            	$("#delete_close").click();
            	$('.hidedelete').hide();
            	//$("#OpportunityListbtn").click();
            },
            error: function (e) {
                console.log(e);
            }
        });
    	return true;
    }
    
    $('#submit1').click(function(){
    	var Label=$("#Label_modify").val();
    	var Seq_Num=$('#seq_num').val();
    	if (Label !='')
    	{
    		
    	$.ajax({
            url: "FinanceFieldEditServlet",
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
            	notification("success","Selected field is edited successfully.","Note");
            	//$('#Record_No').val(data.RandomNumber);
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
    $('#submit2').click(function(){
    	
    	var Seq_Num=$('#sequence1').val();
    	$.ajax({
            url: "FinanceLabelDeleteServlet",
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
            	
            	for(var i = index; i<$(".InputField").length;i++)
            	{
            	  var exist = $(".InputField").eq(i).find("input").length;
            	  if($(".InputField").eq(i).find("input").length)
            	 {
            		var name = $(".InputField").eq(i).find("input").attr("name");
            		 if(name.startsWith("OpportunityAddInfo"))
            		 {
            			 $(".InputField").eq(i).find("input").attr("name","OpportunityAddInfo"+(i+1));
            		 }
                 } 
            	else if($(".InputField").eq(i).find("select").length)
                 {
            		var name = $(".InputField").eq(i).find("select").attr("name");
           		   if(name.startsWith("OpportunityAddInfo"))
           		   {
           			 $(".InputField").eq(i).find("select").attr("name","OpportunityAddInfo"+(i+1));
           		   }
            	 }
            		
            	}
            	notification("success","Selected field is deleted successfully.","Note");
            },
            error: function (e) {
                console.log(e);
            }
        });
      	
    });
    
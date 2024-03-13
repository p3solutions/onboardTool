$(document).ready(function(){
	archiveRetentionDataRetrieve();
	$(document).on('change','.dateUsedType',function(){
       	var nameAttr = $(this).attr('name');	
       	var classAttr = $(this).attr('class');
       	var classArr = classAttr.split(" ");
       	var className = classArr[1];
       	var Index= $(this).index('.'+className);
       	var value= $("input:radio[name='"+nameAttr+"']:checked").val();
	    $(".dateUsedColumn").eq(Index).hide();
	    $(".dateUsedDate").eq(Index).hide();
       	if(value=="column")
       	$(".dateUsedColumn").eq(Index).show();
	    else if(value=="date")
		$(".dateUsedDate").eq(Index).show();
  });
});

$(document).on('change','.retentionCheck', function(){
	
	var seqNum = $(this).index(".retentionCheck");
	var nameReadOnly = $(".conditions").eq(seqNum).attr("readonly");
	if(nameReadOnly)
	{
		$(".conditions").eq(seqNum).removeAttr("readonly");
		$(".ColumnValue").eq(seqNum).removeAttr("disabled");
		$(".ColumnDate").eq(seqNum).removeAttr("disabled");
		$(".dateUsedColumn").eq(seqNum).removeAttr("readonly");
		$(".dateUsedDate").eq(seqNum).removeAttr("disabled");
		$(".descp").eq(seqNum).removeAttr("readonly");
		notification("info","Selected row is editable.","Info:");
	}
	else
	{
		$(".conditions").eq(seqNum).prop("readonly", true);
		$(".ColumnValue").eq(seqNum).prop("disabled", true);
		$(".ColumnDate").eq(seqNum).prop("disabled", true);
		$(".dateUsedColumn").eq(seqNum).prop("readonly", true);
		$(".dateUsedDate").eq(seqNum).prop("disabled", true);
		$(".descp").eq(seqNum).prop("readonly", true);
		notification("info","Selected row is non-editable.","Info:");
	}	

});

$(document).on('mouseenter','input:readonly',function()
		{
			notification("info","Select the check box to make the current row as editable.","Info:");
		});	
		$(document).on('mouseenter','input:disabled',function()
				{
					notification("info","Select the check box to make the current row as editable.","Info:");
				});	
		$(document).on('mouseenter','textarea:readonly',function()
				{
					notification("info","Select the check box to make the current row as editable.","Info:");
				});	


function archiveRetentionDataRetrieve(){
	
	$.ajax({
        url: "archiveRetentionDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $("#contentInfoList").html("");
        	 var contentInfo = data[0].ContentInfo;
        	 var contentInfoListArray = contentInfo.split("::");
        	 for( var i = 0;i<contentInfoListArray.length;i++ )
        		 $("#contentInfoList").append("<li>"+contentInfoListArray[i]+"</li>");
        	 $("#RetentionTable").html("");
        	 var rowCount=0;
             $.each(data[1], function(key, value){
            	 rowCount++;
            	 var checkBox =(value.retentionCheck=="true")?'checked':'';
            	 var dateUsedCol =((value.dateUsedType == 'column') ? value.dateUsed:'');
            	 var readonly =(value.retentionCheck=="true")?'':'readonly';
            	 var disabled =(value.retentionCheck=="true")?'':'disabled';
            	 var dateUsedDat =((value.dateUsedType == 'date') ? value.dateUsed:'');
            	 var columnOption =((value.dateUsedType == 'column' || value.dateUsedType == '') ? 'checked':'');
            	 var dateOption = ((value.dateUsedType == 'date') ? 'checked':'');
            	 var columnStyle  = ((value.dateUsedType == 'column' || value.dateUsedType == '') ? '':'display:none;');
            	 var dateStyle = ((value.dateUsedType == 'date') ? '':'display:none;');
            	 var Row="<tr class = 'rowClass'>"+
            	 "<td ><input type ='checkbox' class='retentionCheck form-check-input' value='"+value.retentionCheck+"' "+checkBox+"></td>" +
            	 "<td class='retentionLevel'>"+value.retentionLevel+"</td>" +
            	 "<td ><textarea rows='3' cols='40' class='conditions form-control' "+readonly+">"+value.condition+"</textarea></td>" +
					 "<td><div class=\"form-check form-check-inline\">" +
					 "<input type ='radio' name='dateUsedType"+(rowCount)+"' class='dateUsedType ColumnValue form-check-input' value='column' "+columnOption+" "+disabled+" /><label class=\"form-check-label\" for=\"inlineRadio1\">Field</label></div>"+
					 "<div class=\"form-check form-check-inline\"><input type ='radio' name='dateUsedType"+(rowCount)+"' class='dateUsedType ColumnDate form-check-input' value='date' "+dateOption+" "+disabled+" /> <label class=\"form-check-label\" for=\"inlineRadio1\">Date</label></div>"+

					 "<input type = 'text' class = 'dateUsedColumn hideField form-control' style='"+columnStyle+"' value='"+dateUsedCol+"' "+readonly+">"+
					 "<input type = 'text' class = 'dateUsedDate datepicker1 hideField form-control' style ='"+dateStyle+"' value='"+dateUsedDat+"' readonly "+disabled+">"+
					 "</td>"+
            	 "<td><textarea rows='3' class='descp form-control' "+readonly+">"+value.descp+"</textarea></td>" +
            	 "</td>" +
            	 "</tr>";
            	 $("#RetentionTable").append(Row);
             });
             var script="<script>$('.datepicker1').datepicker({\n" +
             "format: \"mm/dd/yyyy\",\n"+
             "clearBtn:true,"+
             "autoclose: true,\n"+
             "orientation: 'bottom',"+
             "});";
         
         $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
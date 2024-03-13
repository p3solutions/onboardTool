$(document).ready(function(){

$(document).on('click','.DeleteRow', function(){
	
	var editRowIndex = $(this).index('.DeleteRow');
	var seqNum = parseInt(editRowIndex)+1;
	$('#ArchiveDeleteSeq').val(seqNum);
	
	$('#ArchExecDeleteId').click();
	console.log("delete");

	
});

$(document).on('click','#ArchiveDeleteSubmit',function(){
	
	$('.submitDisableDelete').attr('disabled',true);
	var seqNum = $('#ArchiveDeleteSeq').val();
	archiveExecutionDelete(seqNum);
	
	$('.submitDisableDelete').attr('disabled',false);
	$('#closeIdDelete').click();
});

});

function archiveExecutionDelete(seqNum){
	
	$.ajax({
        url: "ArchiveExecutionDeleteServlet",
        type: 'POST',
        async:false,
        data: {seqNum:seqNum},
        dataType: "json",
        success: function (data) {
        	console.log("Delete Details : ",data);
        	
        	$('#ArchiveExecutionList').html('');
        	
        	$('#closeIdDelete').click();
        	$('#spinner').show();
        	appendRowFunction(data);
        	$('.assignedToDrop').selectpicker();
        	var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});"+
            "$('.datepicker2').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});<\/script>";
        $(".visibleBtn").hide(); 
        $('#scripttag').append(script);
        
        for(var i = 0; i<$('.datepicker1').length; i++){
        	var className = $('.datepicker1').eq(i).attr('class');
            $('.datepicker1').eq(i).attr('class', className+" taskChange");
        }
        	$('#spinner').hide();
        	notification("success","Field deleted successfully.","Note : ");
        	
        },
        
        error: function (e) {
            console.log(e);
        }
	});
	
	
}
$('.datepicker1').datepicker({
        format: "mm/dd/yyyy",
            autoclose: true
            });
            //$('.editpopup').click(function() {
	$(document).on('click', '.editpopup', function () {
	            	$('#editpopup_btn').click();
	            var seqnum=$(this).index('.editpopup');
	            //alert('seq_num in js file '+seqnum);
	            $('#seq_num').val(seqnum);
	            //alert('seq num field in js file'+$('#seq_num').val());
	            $('#EditPopUp').on('shown.bs.modal', function () {
	            });
	            });
	        //$('.deletepopup').click(function() {
	$(document).on('click', '.deletepopup', function () {
	             $('#deletepopup_btn').click();
	            var seqnum=$(this).index('.deletepopup');
	            $('#sequence1').val(seqnum);
	            $('#DeletePopUp').on('shown.bs.modal', function () {
	            });
	            });
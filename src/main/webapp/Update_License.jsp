<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<title>D3Sixty Update License</title>
<link rel="stylesheet" href="./Bootstrap/BootstrapMain.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- ========== Toastr ========== -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<!-- ========== JQuery FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



<style>
	body {
		background: url("/assets/images/Background.png"), linear-gradient(155.85deg, #237DCA 9.56%, #E5F3FE 26.98%, #E7F4FF 38.08%, #A9C9E4 48.54%, #237DCA 65.16%);
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center center;
		background-attachment: fixed;
		height: 93vh;
		justify-content: center;
		display: flex;
		align-items: center;
	}
</style>
</head>

<body>
<script type="text/javascript">
	$(window).on('load', function() {
		<%session.invalidate();%>
		$('#addModal').modal('show');


	});
</script>
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header modal-font-label">
				<h5 class="modal-title" id="exampleModalLabel">License Information</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
						onclick="location.href='Login.jsp'"></button>
			</div>
			<div class="modal-body">
				<form name="PopUpform">
					<div class="row">
						<div class="form-group">
							<label class="control-label" for="formInput526" style="color:red;"
								   id="ErrorMessage"></label>
							<textarea class="form-control" id="license_info" name="license_info" rows="4"
									  required></textarea>
						</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn buttonFrame tertiaryButton text-center" data-bs-dismiss="modal"
						onclick="location.href='Login.jsp'">Close</button>
				<button type="button" class="btn primaryButton text-center" id="license_update_submit"
						style="padding-top: 2px;">Update License</button>
			</div>
		</div>
	</div>
</div>




<!-- ========== PAGE JS  ========== -->
	<script>
		if(document.getElementById('role_conf').value=="R")
			checkk();
	</script>

	<script>
		$(document).on('mouseenter','.active1', function(){

			$('.activeIcon').css('color','#1565c0');

		});

		$(document).on('mouseleave','.active1', function(){

			$('.activeIcon').css('color','#fff');

		});
	</script>
	<script>
		var url_string=window.location.href;
		var url = new URL(url_string);
		var ErrorMessage = url.searchParams.get("ErrorMessage");
		$(document).ready(function()
		{
			$('#ErrorMessage').html(ErrorMessage);
		});
	</script>
	<script type="text/javascript">
		$('.datepicker').datepicker({
			format: 'mm/dd/yyyy',
			startDate: '-3d'
		});
	</script>
	<script>
		$(function($) {

			// 1st  datepicker
			$('#basicExample .time').timepicker({
				'showDuration': true,
				'timeFormat': 'g:ia'
			});

			$('#basicExample .date').datepicker({
				'format': 'm/d/yyyy',
				'autoclose': true
			});

			var basicExampleEl = document.getElementById('basicExample');
			var datepair = new Datepair(basicExampleEl);

			// 2nd  datepicker
			$('#datetimepicker1').datetimepicker({
				debug: true
			});

			// 3rd  datepicker
			$('#datetimepicker9').datetimepicker({
				viewMode: 'years'
			});

			// 4th  datepicker
			$('#datetimepicker10').datetimepicker({
				viewMode: 'years',
				format: 'MM/YYYY'
			});

			// 5th  datepicker
			$('#datetimepicker11').datetimepicker({
				daysOfWeekDisabled: [0, 6]
			});

			// 6th  datepicker
			$('#datetimepicker12').datetimepicker({
				inline: true,
				sideBySide: true
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$('#datatable').DataTable( {
				"pagingType": "full_numbers"
			} );
		} );
	</script>



	<!-- ========== Data JS File ========== -->
<script src="js/license/add_license.js"></script>


	<script src="js/navigation/navigation.js"></script>
</body>
</html>



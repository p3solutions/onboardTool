<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen"> -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/Responsive/responsive.css"
          media="screen">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">


    <title>D3Sixty Update License</title>

    <meta
            content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
            name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link rel="stylesheet" href="styles/styles.css" type="text/css" />
    <script src="js/jquery/jquery-2.2.4.min.js"></script>

    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css"
          media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
          media="screen">

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <!-- <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen"> -->
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
    <link
            href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
            rel="stylesheet">

    <!-- =========== Header Icon ========= -->
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="css/headerIcon/headerIcon.css"
          media="screen">


    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">
    <link rel="stylesheet" href="css/UserInfo/userinfo.css">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <style type="text/css">
        body {
            background: #f1f1f1;
        }

        .active-1 {
            background: #1565c0;
        }

        .page-title-div {
            background: #1565c0;
            padding: 15px;
        }

        .fixed-top {
            width: 100%;
            padding-left: 0px;
            padding-right: 0px;
        }

        #nav_userid {
            color: green;
        }

        #nav_role {
            color: blue;
        }

        .btn {
            margin-left: 50px;
        }

        .card .card-body {
            padding: 1.88rem 1.81rem;
        }

        .grid-margin {
            margin-bottom: 1.875rem;
        }

        .col-12 {
            flex: 0 0 100%;
            max-width: 100%;
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(0, 0, 0, 0.125);
            border-radius: 0.3125rem;
        }

        .card-body {
            flex: 1 1 auto;
            padding: 1.25rem;
        }

        .card-title {
            margin-bottom: 0.75rem;
        }

        .navbar-nav-1 #nav-link {
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 4px solid transparent;
        }

        .navbar-nav-1 #nav-link.active-1 {
            /* border-top: none; */
            border-left: none;
            border-right: none;
            border-bottom: 4px solid rgba(255, 255, 255, .5) !important;
        }

        .navbar-nav #nav-link {
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 4px solid transparent;
        }

        .link:hover {
            background: #1565c0 important;
        }

        .active1 {
            background: #1565c0;
        }

        .page-title-div {
            background: #1565c0;
            padding: 15px;
        }
    </style>

</head>
<body class="top-navbar-fixed">
<script type="text/javascript">
    $(window).on('load', function() {
        <%session.invalidate();%>
        $('#addModal').modal('show');


    });
</script>

<div class="main-wrapper">


    <div class="modal" id="addModal" tabindex="-1"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color:#1565c0;">
                    <h5 class="modal-title" id="exampleModalLabel" style="color:white;">License Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close" onclick="location.href='Login.jsp'"></button>
                </div>
                <div class="modal-body">
                    <form name="PopUpform">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526" style="color:red;" id="ErrorMessage"></label>
                                    <textarea class="form-control" id="license_info" name="license_info" rows="4"  required></textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-primary" id="license_update_submit" >Update License</button>
                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal" onclick="location.href='Login.jsp'">Close</button>
                </div>
            </div>
        </div>
    </div>




</div>


</div>
</div>
</div>


</div>
</div>
</div>


<script>
    if(document.getElementById('role_conf').value=="R")
        checkk();
</script>




<!-- /.col-md-6 -->

</div>
<!-- /.row -->

</section>
<!-- /.section -->

</div>
<!-- /.main-page -->

<!-- Project List End -->

</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->

<script>
    $(document).on('mouseenter','.active1', function(){

        $('.activeIcon').css('color','#1565c0');

    });

    $(document).on('mouseleave','.active1', function(){

        $('.activeIcon').css('color','#fff');

    });
</script>

<!-- ========== COMMON JS FILES ========== -->
<script src="js/license/add_license.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<script type="text/javascript">
    $(document).ready(function() {
        $(".lis").click(function() {
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
        });
        $(".gr").click(function() {
            $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
        });
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

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css"
      type="text/css" media="all" />
<script src="js/amcharts/themes/light.js"></script>
<!-- 	<script src="js/toastr/toastr.min.js"></script> -->
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>


<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>

<script type="text/javascript"
        src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
        src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>

<script type="text/javascript"
        src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen"> -->
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="js/notification/notification.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->
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
<script src="js/navigation/navigation.js"></script>
</body>
</html>



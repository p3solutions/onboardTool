<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <title>Role Configuration</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>


    <link rel="stylesheet" href="styles/styles.css" type="text/css"/>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>

    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/archive_add/archive_add.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">
   <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <style type="text/css">
      
        .glyphicon.glyphicon-asterisk {
            color: red;
            font-size: 6px;
        }

        .row {
            margin-right: -15px;
            margin-left: -15px;
        }
        .card {
            border-radius: 6px;
            box-shadow: 0 2px 2px rgba(204, 197, 185, 0.5);
            background-color: #FFFFFF;
            color: #252422;
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }
        .card .header {
            padding: 20px 20px 0;
        }
        .card .title {
            margin: 0;
            color: #252422;
            font-weight: 300;
        }
       

        .card .content {
            padding: 15px 15px 10px 15px;
        }
        @media (min-width: 992px)
            .table-responsive {
                overflow: visible;
            }
            @media (min-width: 992px)
                .table-full-width {
                    margin-left: -15px;
                    margin-right: -15px;
                }
                input[type=text] {
                    background-color: transparent;
                    border: 0px solid;
                    height: 20px;
                    width: 35%;
                    color: black;

                }
                input.break {
                    word-wrap: break-word;
                    word-break: break-all;
                    height: 80px;
                }

                .table-striped tbody > tr:nth-of-type(n) .slider {

                }
                .table-striped tbody > tr:nth-of-type(2n) .slider  .slider.round  {
                    background-color: #f2f2f2;
                }
                .switch {
                    position: relative;
                    display: inline-block;
                    width: 30px;
                    height: 16px;
                }

                .switch input {
                    display: none;
                }

                .slider {
                    position: absolute;
                    cursor: pointer;
                    top: 0;
                    left: -8px;
                    right: -3px;
                    bottom: 0;
                    background-color: #FA8383;
                    -webkit-transition: .4s;
                    transition: .4s;
                }

                .slider:before {
                    position: absolute;
                    content: "";
                    height: 9px;
                    width: 9px;
                    left: 4px;
                    bottom: 4px;
                    background-color: #f2f2f2;
                    -webkit-transition: .4s;
                    transition: .4s;
                }

                input:checked + .slider {
                    background-color: #00b33c;
                }

                input:focus + .slider {
                    box-shadow: 0 0 1px #2196F3;
                }

                input:checked + .slider:before {
                    -webkit-transform: translateX(26px);
                    -ms-transform: translateX(26px);
                    transform: translateX(26px);
                }

                /* Rounded sliders */
                .slider.round {
                    border-radius: 30px;
                }

                .slider.round:before {
                    border-radius: 50%;
                }


                input[type="checkbox"] {
                    opacity: 0;
                }
                input.act:focus {
                    outline-width: 0;
                }
                
                  body{
            background:#f1f1f1;
        }
body{
            background:#f1f1f1;
        }

        .active{
        background:#1565c0;
         }
      .page-title-div {
	 background:#1565c0;
	  padding: 15px;
	  
	  
	}
	.fixed-top{
	width:100%;
	padding-left: 0px;
    padding-right: 0px;
	}

 .btn {

        margin-left: 50px;

    }
  
    .card .card-body {
        padding: 1.88rem 1.81rem;
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
        margin-top:50px;
    }
    .card-body {
        flex: 1 1 auto;
        padding: 1.25rem;
    }

    .card-title {
        margin-bottom: 0.75rem;
    }

    form {
        display: inner-block;
        margin-top: 0em;
    }


  .navbar-nav .nav-link {
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: 4px solid transparent;
}        

 .navbar-nav .nav-link.active {
    /* border-top: none; */
    border-left: none;
    border-right: none;
    border-bottom: 4px solid rgba(255,255,255,.5)!important;
}

.navbar-nav .nav-link {
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: 4px solid transparent;
}

.link:hover{

background:#1565c0 important;

}
         

    </style>

    <script>
        function calls() {
            var x = document.getElementById('myDiv1');
            if (x.style.display === 'none') {
                x.style.display = 'block';
            } else {
                x.style.display = 'none';
            }

        }
    </script>
    <script>
        function edit_serv() {
            var f = document.loginForm;
            f.method = "post";
            f.action = 'Authorization_Role_details';
            f.submit();
        }

    </script>
    <script>
        function checkk() {
            document.getElementById('sub_btn').disabled = true;
        }
    </script>

</head>

<body class="top-navbar-fixed">


<%
    HttpSession details = request.getSession();
    String info = (String) details.getAttribute("admin");
    String prjname = (String) details.getAttribute("nameofproject");

%>

<div class="main-wrapper">


 <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                    </a>

                   


                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
                  <ul class="nav navbar-nav">
		      <li ><a href="OpportunityList.jsp" >Applications</a></li>
		      <li class="active"><a href="Admin_Module_Send_Invites.jsp" style="color:#fff">Administration</a></li>
		      <li><a href="Archive_Execution.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		    </ul>
		         <ul class="nav navbar-nav navbar-right">
                       

                        <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin</span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
                
                
                
            </div>
            <!-- /.row -->
            <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-12">
                             <!--  <h4 class="title" style="color:#fff">User Configuration</h4>
                               <p class="sub-title">Create and manage your Opportunities here</p>-->
                               <ul class="nav navbar-nav " >
						      <li class=" nav-link "><a class="link" href="Admin_Module_Send_Invites.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Send Invites</a></li>
						      <li class="nav-link" ><a class="link" href="Modify_Admin_Users_list.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Modify User</a></li>
						      <li class="nav-link"><a class="link" href="Admin_Userslist.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">UserList</a></li>
						        <li class="nav-link active"><a class="link" href="Admin_Role_Details.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Permissions</a></li>
		    </ul>
                          
                        </div>
                       
                         <div class="container-fluid ">
                         <ul class="nav navbar-nav" >
						      <li ></li>
						        <li ></li>
		                   </ul>
                         </div>
                    </div>

                </div>
			</nav>
        </div>
        <!-- /.container-fluid -->
    </nav >
 
      

    <form class="form-signin" name="loginForm" method="post" action="Authorization_Role_details">

        <div class="content-wrapper">
            <div class="content-container">


               
                <!-- Projects List Start -->

                <div class="main-page">
                    <div class="container-fluid">
                        
                        
                    </div>
                    <section class="section">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">

                                        <div class="header">
                                            <h4 class="title">Permissions</h4>

                                            <p class="category">If the Module is restricted to a particular role, it is accessible by that role only.</p>


                                        </div>

                                        <div class="content table-responsive table-full-width">
                                            <table class="table table-striped">
                                                <thead>
                                                <th>Role</th>
                                                <th>Admin</th>
                                                <th>Plan and Pirority</th>
                                                <th>Intake</th>
                                                <th>Archival Execution</th>
                                                <th>Decommision</th>
                                                <th>Program governance</th>
                                                <th>Reporting</th>
                                                <th>Finance</th>

                                                </thead>
                                                <tbody id="authorization_details">


                                                </tbody>

                                            </table>
                                            <p>Note : (x = full access ; R = readonly ; N = no access)</p>
                                            <input type="hidden" id="rolecheck" value="<%= info %>" hidden>
                                            &nbsp;&nbsp;&nbsp;
                                            <button type="button" id="sub_btn" class="btn btn-primary pull-right"
                                                    onclick="edit_serv()">Submit
                                            </button>
                                        </div>
                                    </div>
                                </div>




                            </div>
                        </div>

                        <script>
                            if (document.getElementById('rolecheck').value == "R")
                                checkk();

                            function chk(textbox_id, slider_id) {

                                var boolean_val = document.getElementById(slider_id).checked;
                                /*  var boolean_val=$('#'+slider_id).prop('checked');*/
                                if (boolean_val == false) {
                                    /*$('#'+textbox_id).css({"background-color:":"lightgrey"});*/
                                    document.getElementById(textbox_id).style.backgroundColor = "white";
                                    //$('#'+textbox_id).attr('readonly', true);
                                    document.getElementById(textbox_id).readOnly = true;
                                } else {
                                    //$('#'+textbox_id).css({"background-color:":"white"});
                                    document.getElementById(textbox_id).style.backgroundColor = "white";
                                    document.getElementById(textbox_id).removeAttribute('readonly');
                                    //$('#'+textbox_id).removeAttr('readonly');
                                }

                            }
                        </script>

    </form>

</div>
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


<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: 'Role_Details_Servlet',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                console.log("data=----->", data);
                for (var i = 0; i < data.length; i++) {
                    console.log("id----->", data[i].id);
                    /*var row_data='<tr>\n' +
                        '<td><input class="act" style="width:170px;" type="text" name="role'+ data[i].role +'" value="'+ data[i].role +'"></td>\n' +
                        '<td><label class="switch"><input type="checkbox" id="slideradmin'+ i +'" onclick=chk("admin'+ i +'","slideradmin'+i+'") ><span class="slider round"></span></label><input class="act" type="text" id="admin'+i+'" name="admin'+i+'" value="'+ data[i].admin +'" style="background-color:lightgrey; " readonly="readonly"/></td>\n' +
                        '<td><label class="switch"><input type="checkbox" id="sliderapp_emp'+ i +'" onclick=chk("app_emp'+ i +'","sliderapp_emp'+ i +'") ><span class="slider round"></span></label><input class="act" type="text" id="app_emp '+ i +'" name="app_emp'+i+'" value="'+ data[i].app_emp +'" style="background-color:lightgrey;"/></td>\n' +
                        '</tr>'*/
                    var row_data = ' <tr>' +
                        '<td>' +
                        '<input class="act" style="width:200px;" type="text"  tabindex="1" name="role'  + i + '" value="' + data[i].role + '" readonly="readonly">' +
                        '</td>' +
                        '<td >' +
                        '<label class="switch"><input type="checkbox"   id="slideradmin' + i + '"onclick=chk("admin' + i + '","slideradmin' + i + '") >' + '<span class="slider round" ></span>' +
                        '</label>' +
                        '<input class="act" type="text"  id="admin' + i + '" name="admin' + i + '"value="' + data[i].admin + '"' +
                        ' " readonly="readonly"/>' +
                        '</td>' +
                        '<td>' +
                        '<label class="switch">' +
                        '<input type="checkbox" id="sliderapp_emp' + i + '" onclick=chk("app_emp' + i + '","sliderapp_emp' + i + '")>' +
                        '<span class="slider round"  ></span>' +
                        '</label>' +
                        '<input class="act" type="text" id="app_emp' + i + '" name="app_emp' + i + '" value="' + data[i].app_emp +
                        '"  " readonly="readonly"/>' +
                        '</td>' +
                        '<td><label class="switch">' +
                        '<input type="checkbox" id="sliderintake' + i + '" onclick=chk("intake' + i + '","sliderintake' + i + '")>' +
                        '<span class="slider round" ></span>' +
                        '</label>' +
                        '<input class="act" type="text" id="intake' + i + '" name="intake' + i + '" value="' + data[i].intake + '"  " readonly="readonly"/>' +
                        '</td>' +
                        '<td><label class="switch">' +
                        '<input type="checkbox" id="sliderarch_exe' + i + '"onclick=chk("arch_exe' + i + '","sliderarch_exe' + i + '")>' +
                        '<span class="slider round" ></span>' +
                        '</label>' +
                        '<input class="act" type="text" id="arch_exe' + i + '" name="arch_exe' + i + '" value="' + data[i].arch_exe + '" " readonly="readonly"/>' +
                        '</td>' +
                        '<td>' +
                        '<label class="switch">' +
                        '<input type="checkbox" id="sliderdecomm' + i + '" onclick=chk("decomm' + i + '","sliderdecomm' + i + '") >' +
                        '<span class="slider round" ></span>' +
                        '</label><input class="act" type="text" id="decomm' + i + '" name="decomm' + i + '" value="' + data[i].decomm + '"' + '" readonly="readonly"/>' +
                        '</td>' +
                        '<td>' +
                        '<label class="switch">' +
                        '<input type="checkbox" id="sliderprgm_gov' + i + '" onclick=chk("prgm_gov' + i + '","sliderprgm_gov' + i + '")>' +
                        '<span class="slider round" ></span>' +
                        '</label>' +
                        '<input class="act" type="text" id="prgm_gov' + i + '" name="prgm_gov' + i + '"value="' + data[i].prgm_governance +
                        '"  " readonly="readonly" />' +
                        '</td>' +
                        '<td>' +
                        '<label class="switch">' +
                        '<input type="checkbox" id="sliderreport' + i + '" onclick=chk("report' + i + '","sliderreport' + i + '") >' +
                        '<span class="slider round"  ></span>' +
                        '</label><input class="act" type="text" id="report' + i + '" name="report' + i + '" value="' + data[i].reporting + '"  " readonly="readonly"/>' +
                        '</td>' +
                        '<td>' +
                        '<label class="switch">' +
                        '<input type="checkbox" id="sliderfinance' + i + '" onclick=chk("finance' + i + '","sliderfinance' + i + '") >' +
                        '<span class="slider round" > </span>' +
                        '</label><input class="act" type="text" id="finance' + i + '" name="finance' + i + '" value="' + data[i].finance + '"  " readonly="readonly"/>' +
                        '</td>'  +'<td>' +

                        '</td>'+
                        '</tr>';
                    $('#authorization_details').append(row_data);
                }

            }
        });
    });
</script>

<script>
    $(document).ready(function(){
        $("#enable").click(function(){
            $("input[type='hidden']").show();;
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".lis").click(function () {
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
        });
        $(".gr").click(function () {
            $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
        });
    });
</script>


<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all"/>
<script src="js/amcharts/themes/light.js"></script>
<script src="js/toastr/toastr.min.js"></script>
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
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->
<script>
    $(function ($) {

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">

    function enableSlider(){

        document.getElementById("slider_one").style.display = 'block'
        document.getElementById("slider_two").style.display = 'block'
        document.getElementById("slider_three").style.display = 'block'
        document.getElementById("slider_four").style.display = 'block'
        document.getElementById("slider_five").style.display = 'block'
        document.getElementById("slider_six").style.display = 'block'
        document.getElementById("slider_seven").style.display = 'block'
        document.getElementById("slider_eight").style.display = 'block'


    }

    function disableSlider(){

        document.getElementById("slider_one").style.display = 'none'
        document.getElementById("slider_two").style.display = 'none'
        document.getElementById("slider_three").style.display = 'none'
        document.getElementById("slider_four").style.display = 'none'
        document.getElementById("slider_five").style.display = 'none'
        document.getElementById("slider_six").style.display = 'none'
        document.getElementById("slider_seven").style.display = 'none'
        document.getElementById("slider_eight").style.display = 'none'


    }


</script>

</body>
</html>



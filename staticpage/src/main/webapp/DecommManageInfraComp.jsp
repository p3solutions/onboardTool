<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App-DecommRequirements</title>
    <meta name="description" content="Blueprint: View Mode Switch" />


    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
    <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css" />

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>



</head>
<style type="text/css">
    #myModaldelete {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    #modal-contentdelete1 {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
        height: 50%;
        overflow: scroll;
    }
    #ScrollBar
    {
        overflow-x: scroll;
    }
    .breadcrumb-div {
        background-color: #e7e7e7;
        color: #010101; }
    #button1{
        padding:20px;
    }
    #return-to-top {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: rgb(0, 0, 0);
        background: rgba(0, 0, 0, 0.7);
        width: 50px;
        height: 50px;
        display: block;
        text-decoration: none;
        -webkit-border-radius: 35px;
        -moz-border-radius: 35px;
        border-radius: 35px;
        display: none;
        -webkit-transition: all 0.3s linear;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    #return-to-top i {
        color: #fff;
        margin: 0;
        position: relative;
        left: 16px;
        top: 13px;
        font-size: 19px;
        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    #return-to-top:hover {
        background: rgba(0, 0, 0, 0.9);
    }
    #return-to-top:hover i {
        color: #fff;
        top: 5px;
    }
    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
    .floatclass
    {
        float:left;
    }
</style>

<body class="top-navbar-fixed">



<div class="main-wrapper">

    <!-- ========== TOP NAVBAR ========== -->
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">

                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                    </a>
                    <span class="small-nav-handle hidden-sm hidden-xs"><i class="fa fa-outdent"></i></span>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-ellipsis-v"></i>
                    </button>
                    <button type="button" class="navbar-toggle mobile-nav-toggle" >
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <!-- /.navbar-header -->
                <a class="navbar-brand" href="Project_List" id="sitetitle"></a>

                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="#"><span id="nav_userid">&nbsp;</span>logged in as &nbsp;<span id='nav_role'></span></a></li>
                        <li><a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
                    </ul>

                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </nav>



    <div class="content-wrapper">
        <div class="content-container">


            <!-- ========== LEFT SIDEBAR ========== -->
            <div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
                <div class="sidebar-content" id='jqxWidget'>


                    <div class="sidebar-nav">
                        <ul class="side-nav color-gray">
                            <li class="nav-header">
                                <span class="">Main Category</span>
                            </li>
                            <li id='home' item-selected='true'>
                                <a href="Project_List.jsp"><i class="fa fa-home"></i> <span>Home</span> </a>
                            </li>

                            <li class="nav-header">
                                <a href="AppEmphasize_EditProject.jsp"><span class="">App Emphasize Module</span></a>
                            </li>
                            <li class="has-children">
                                <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                    <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                </ul>
                            </li>

                            <li class="has-children">
                                <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity</span></a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                            </li>

                            <li class="nav-header">
                                <a href='Applications.jsp'><span class="">Intake Module</span></a>
                            </li>

                            <li class="has-children">
                                <a href="Applications.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="Applications.jsp"> <span>Application Information</span></a></li>
                                    <li><a href="Applications.jsp"> <span>Legacy Retention Information</span></a></li>
                                    <li><a href="Applications.jsp"> <span>Archive Data Management</span></a></li>
                                    <li><a href="Applications.jsp"> <span>System Requirements</span></a></li>
                                </ul>
                            </li>

                            <li class="has-children">
                                <a href="Applications.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="Applications.jsp"> <span>Application Data Information</span></a></li>
                                    <li><a href="Applications.jsp"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                    <li><a href="Applications.jsp"> <span>Technical Information</span></a></li>
                                </ul>
                            </li>
                            <li class="has-children">
                                <a href="Applications.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="Applications.jsp"> <span>Screen/Report Requirements</span></a></li>
                                    <li><a href="Applications.jsp"> <span>Archive Requirements</span></a></li>
                                </ul>
                            </li>
                            <li ><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
                            </li>
                        </ul>

                    </div>
                    <!-- /.sidebar-nav -->
                </div>
                <!-- /.sidebar-content -->
            </div>
            <!-- /.left-sidebar -->

            <div class="main-page">
                <div class="container-fluid">

                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">Infrastructure Component CheckList</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i>Home</a></li>

                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>
                <section>
                    <a href="javascript:" id="return-to-top"><i class="icon-chevron-up"></i></a>
                    <br>
                    <div class="row">

                        <div class="container-fluid">

                            <div class="panel-group" id="panels1">

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > Infrastructure   </a> </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse">
                                        <div class="panel-body text-left">
                                            <form name="InfraComp">
                                                <div id="ScrollBar">
                                                    <table class="table table-bordered hidetable" id="mytable_infra" style="width:2000px">
                                                        <tr style="color:white;background-color:DodgerBlue;">
                                                            <th scope="col" style="color:white;">Infrastructure Component Type </th>
                                                            <th scope="col" style="color:white;">Component Name </th>
                                                            <th scope="col" style="color:white;">Managed/Legacy </th>
                                                            <th scope="col"  style="color:white;"> Is the Server Shared with other applications </th>
                                                            <td style="width:1000px">
                                                                <table class="table table-bordered hidetable">
                                                                  <%--  <col width = "1000%">
                                                                    <col width = "2000%">--%>
                                                                    <tr style="color:white;background-color:DodgerBlue;">
                                                                        <td scope="col" style="width:20px; float:center;" colspan="5">ENVIRONMENTS</td>
                                                                    </tr>

                                                                    <tr>

                                                                        <td scope="col" style="color:black;width:22%;">Dev</td>
                                                                        <td scope="col" style="color:black;width:22%;">Test</td>
                                                                        <td scope="col" style="color:black;width:22%;">Stage</td>
                                                                        <td scope="col" style="color:black;width:22%;">Prod</td>
                                                                        <td scope="col" style="color:black;width:20%;">Retired?</td>

                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td scope="col" style="color:white;"> Additional Comments</td>
                                                        </tr>

                                                    </table>
                                                </div>
                                            </form>
                                        </div>

                                        <!-- <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="addothers();">Add</button> -->
                                        <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="">Add</button>
                                        <button type="button" style="margin:5px;" class="btn btn-warning pull-left" id="modify_id" onclick="">Edit</button>
                                        <input type = "hidden" value = "false" id = "sam_id"/>

                                        <button type="button" style="margin:5px;" class="btn btn-danger  pull-left" id="visible_del">Delete
                                        </button>

                                        <button type="button" class="btn btn-primary pull-right" id = "save">Save & Continue</button>
                                    </div>

                                    <!--End of Table Info -->

                                </div>

                            </div>







                        </div>

                    </div>

            </div>
        </div>
    </div>





    </section>


</div>


</div>

</div>
</div>


</form>
</div>

</div>
<div id="myModaldelete" class="modal">

    <!-- Modal content -->
    <div class="modal-dialog" style="width:2000px">
        <div id="modal-contentdelete1">
            <%--<span class="close" style="color:white;">&times;</span>--%>
            <form name="DeleteForm">
                <div class="modal-header" style="background-color:rgb(52, 152, 219);">
                    <h1 style="color:white;">Delete Task</h1>
                </div>
                <div class="modal-body">
                    <p style="font-size:24px;">Are you sure, you want to delete this <span id="taskdelete"
                                                                                           style="font-size:24px;"></span>
                    <p style="font-size:24px;">input field permanently?</p>
                    <input type="hidden" id="sequence1"/>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" id="submit2" class="btn btn-primary" >Yes</button>
                <button type="button" onclick="window.location.href=''" class="btn btn-default">No</button>
            </div>
        </div>
    </div>

</div>
<script>
    var url_string=window.location.href;
    var url = new URL(url_string);
    var appname = url.searchParams.get("appname");
    var projname=url.searchParams.get("projectname");
    console.log("Application:",appname,"Project:",projname);
    $(document).ready(function(){
        $.ajax({
            url: "DecommManageInfraCompDataRetrieveServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data Retrieve json array----->",data);
                    if(data[0].CheckExistance==true){
                            for(var i=1; i<data.length; i++){
                                var yes_server_app="";
                                var no_server_app="";
                                var yes_retired="";
                                var no_retired="";
                                var manage_drop="";
                                var legacy_drop="";
                                var style = "";
                                if(data[i].Server_App=="Yes")
                                {
                                    yes_server_app="checked";
                                }
                                else {
                                      no_server_app="checked";
                                }
                                if(data[i].Retired=="retired_yes")
                                {
                                   yes_retired="checked";
                                }
                                else{
                                   no_retired="checked";
                                }
                                if(data[i].Managed_Legacy=="Managed"){
                                    manage_drop ="selected";
                                    style = "style = 'display:none;'";
                                }
                                else{
                                    legacy_drop ="selected";
                                    style = "style = 'display:block;'";
                                }

                                var tr ="<tr>\n" +
                                    "<td> <input type='text' value='"+data[i].Infra_Comp_Type+"' name = 'infra_comp"+data[i].Seq_Num+"' placeholder='Infrastructure Component'> </td>\n" +
                                    "<td> <input type='text' value='"+data[i].Comp_Name+"' name = 'comp_name"+data[i].Seq_Num+"' placeholder=' Component Name'> </td>\n" +
                                    "<td>\n" +
                                    "<select style='width:200px; height:34px;' name = 'manage_legacy"+data[i].Seq_Num+"' onchange='manage_legacy(this.name,this.value);'>\n" +
                                    "<option value='Managed' "+manage_drop+">Managed</option>\n" +
                                    "<option value='Legacy' "+legacy_drop+">Legacy</option>\n" +
                                    "</select>\n" +
                                    "</td>\n" +
                                    "<td>\n" +
                                    "<input type='radio'  class = 'floatclass serverapp"+data[i].Seq_Num+"' value='Yes' "+style+" name = 'server_app"+data[i].Seq_Num+"'"+yes_server_app+"><div  for='Yes' class = 'floatclass serverapp"+data[i].Seq_Num+"' "+style+">Yes&nbsp;</div>\n" +
                                    "<input type='radio'  class = 'floatclass serverapp"+data[i].Seq_Num+"' value='No' "+style+" name = 'server_app"+data[i].Seq_Num+"'"+no_server_app+"><div  for='No' class = 'floatclass serverapp"+data[i].Seq_Num+"' "+style+">No&nbsp;</div>\n" +
                                    "</td>\n" +
                                    "<td>\n" +
                                    "<table>\n" +
                                    "<tr colspan='5'>\n" +
                                    "<td> <input type='text' class = 'class_access' style='width:77%;' value='"+data[i].Dev+"' name='dev"+data[i].Seq_Num+"' readonly> </td>\n" +
                                    "<td> <input type='text' class = 'class_access' style='width:77%;' value='"+data[i].Test+"' name='test"+data[i].Seq_Num+"' readonly> </td>\n" +
                                    "<td> <input type='text' class = 'class_access' style='width:77%;' value='"+data[i].Stage+"' name='stage"+data[i].Seq_Num+"' readonly> </td>\n" +
                                    "<td> <input type='text' class = 'class_access' style='width:77%;' value='"+data[i].Prod+"' name='prod"+data[i].Seq_Num+"' readonly> </td>\n" +
                                    "<td>\n" +
                                    "<input type='radio' class = 'class_access1' name='retired"+data[i].Seq_Num+"' value='retired_yes' "+yes_retired+" disabled>Yes\n" +
                                    "<input type='radio' class = 'class_access1' name='retired"+data[i].Seq_Num+"' value='retired_no'"+no_retired+" disabled>No\n" +
                                    "</td>\n" +
                                    "\n" +
                                    "</tr>\n" +
                                    "</table>\n" +
                                    "</td>\n" +
                                    "<td><textarea maxlength='120' name ='textarea"+data[i].Seq_Num+"' >"+data[i].Comments+"</textarea><span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'></span></td>\n" +
                                    "</tr>";
                                $('#mytable_infra').append(tr);
                            }
                    }
                    else{
                        var tr ="<tr>\n" +
                            "<td> <input type='text' value='' name = 'infra_comp1' placeholder='Infrastructure Component'> </td>\n" +
                            "<td> <input type='text' value='' name = 'comp_name1' placeholder=' Component Name'> </td>\n" +
                            "<td>\n" +
                            "<select style='width:200px; height:34px;' name = 'manage_legacy1' value = '' onchange='manage_legacy(this.name,this.value);'>\n" +
                            "<option value='Managed'>Managed</option>\n" +
                            "<option value='Legacy'>Legacy</option>\n" +
                            "</select>\n" +
                            "</td>\n" +
                            "<td>\n" +
                            "<input type='radio' class = 'serverapp1' value='Yes' "+style+" name = 'server_app1'><div class = 'serverapp1' "+style+">Yes</div>\n" +
                            "<input type='radio' class = 'serverapp1' value='No' "+style+" name = 'server_app1'><div class = 'serverapp1' "+style+">No</div>\n" +
                            "</td>\n" +
                            "<td>\n" +
                            "<table>\n" +
                            "<tr colspan='5'>\n" +
                            "<td> <input type='text' class = 'class_access' style='width:77%;' value='' name='dev1' readonly> </td>\n" +
                            "<td> <input type='text' class = 'class_access' style='width:77%;' value='' name='test1' readonly> </td>\n" +
                        "<td> <input type='text' class = 'class_access' style='width:77%;' value='' name='stage1' readonly> </td>\n" +
                        "<td> <input type='text' class = 'class_access' style='width:77%;' value='' name='prod1' readonly> </td>\n" +
                        "<td>\n" +
                        "<input type='radio' class = 'class_access1' name='retired1' value='retired_yes' disabled>Yes\n" +
                        "<input type='radio' class = 'class_access1' name='retired1' value='retired_no' disabled>No\n" +
                        "</td>\n" +
                        "\n" +
                        "</tr>\n" +
                        "</table>\n" +
                        "</td>\n" +
                        "<td><textarea maxlength='120' name ='textarea1' value=''></textarea><span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'></span></td>\n" +
                        "</tr>";
                        $('#mytable_infra').append(tr);
                    }

                    var script ="<script> $('.deletepopup').click(function() {\n" +
                    "var seqnum=$(this).index('.deletepopup');"+
                    //   "alert('sequence number '+seqnum);"+
                    "$('#sequence1').val(seqnum);"+
                    "modal2.style.display = \"block\";\n" +
                    "});<\/script>";
                $('#scripttag').append(script);
            },
            error: function (e) {
                console.log(e);
            }
        });
    });

    var modal2 = document.getElementById("myModaldelete");

    // Get the button that opens the modal
    var btn2 = document.getElementsByClassName("deletepopup");

    // Get the <span> element that closes the modal
    var span2= document.getElementsByClassName("close")[2];

    // When the user clicks the button, open the modal
    $('.deletepopup').click(function() {
        alert("Testing index"+$(this).index('.deletepopup'));
        modal2.style.display = "block";
    });
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal2) {
            modal2.style.display = "none";
        }
    }
    $('#visible_del').click(function()
    {
        $('.hidedelete').toggle();
    });
    </script>
<div id="scripttag"></div>
<script>
    /*$.ajax({
        url : "DecommManageInfraCompAddServlet",
        type : "post",
        data : {ProjectName:projname,ApplicationName:appname},
        datatype : "json",
        success:function(data)
        {
            console.log("Data------>>>",data);
        },
        error:function(e)
        {
           console.log(e);
        }
    })*/

    $('#myBtn').click(function (){
    var f = document.InfraComp;
    f.method = "post";
    f.action = "DecommManageInfraCompAddServlet?ProjectName="+projname+"&ApplicationName="+appname;
    f.submit();
    })

    $('#submit2').click(function(){
        var deleteseq=parseInt($('#sequence1').val())+1;
        var f=document.DeleteForm;
        f.method = "post";
        f.action = "DecommManageInfraCompDeleteServlet?ApplicationName="+appname+"&ProjectName="+projname+"&DeleteNumber="+deleteseq;
        f.submit();
    });

    $('#save').click(function(){
        $('.class_access').attr('disabled',false);
        var rowlength = $('.deletepopup').length;
        var f = document.InfraComp;
        f.method = "post";
        f.action ="DecommManageInfraCompSaveServlet?ApplicationName="+appname+"&ProjectName="+projname+"&RowLength="+rowlength;
        f.submit();
    });

    $('#modify_id').click(function() {
        var readonly_value = $('#sam_id').val();
        if(readonly_value=="false"){
            $('.class_access').attr('readonly',false);
            $('.class_access1').attr('disabled',false);
            $('#sam_id').val("true");
        }
        else{
            $('.class_access').attr('readonly',true);
            $('.class_access1').attr('disabled',true);
            $('#sam_id').val("false");
        }
    });

    function manage_legacy(o,v){
        var id = parseInt(o.substring(o.lastIndexOf('y')+1,o.length));
        if (v=="Managed"){
            $('.serverapp'+id).hide();
        }
        else{
            $('.serverapp'+id).show();
        }
    }


</script>

<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->









</body>

</html>
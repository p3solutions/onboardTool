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
    <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css"/>

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
    #myModal1 {
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
    #modal-content1 {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
        height: 50%;
        overflow: scroll;
    }
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
    /* The Modal (background) */
    #myModal {
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
    #modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
        height: 70%;
        overflow: scroll;

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
</style>

<div class="top-navbar-fixed">



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
                <a class="navbar-brand" href="Project_List" id=""></a>

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
                            <h2 class="title">Decomm Requirements</h2>
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

                        <div class="container">

                            <div class="panel-group" id="panels1">

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > Legacy Retention Information  </a> </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse">
                                        <div class="panel-body text-left">
                                         <form name="LegacyForm">
                                             <div id="inputFields">
                                             </div>
                                            <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="addothers();">Add</button>
                                            <button type="button" style="margin:5px;" class="btn btn-warning pull-left" id="Modifybtn">Modify</button>
                                         </form>
                                            <button type="button" style="margin:5px;" class="btn btn-danger pull-left" id="Deletebtn" >Delete</button>
                                            <button type="button" class="btn btn-primary pull-right" onclick="Submit();">Save & Continue</button>
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
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div id="modal-content">
        <span class="close">&times;</span>
        <form name="PopUpform">
            <div id="scrollbar">
            <div class="row">
                <div class="form-group">
                    <div class="col-lg-8">
                        <label class="control-label" for="formInput526">Label:</label>
                        <input type="text" class="form-control" id="label"  name="label" required>
                    </div>
                </div>
            </div><br/>
            <input type="hidden" id="project_name" name="project_name" value="">

            <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
            <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">


            <div class="row">
                <div class="form-group">
                    <div class="col-lg-8">
                        <label class="control-label" for="formInput526">Column name:</label>
                        <input type="text" class="form-control" id="idname"  name="idname" required>
                    </div>
                </div>
            </div><br/>
            <div class="row">
                <div class="form-group">
                    <div class="col-lg-8">
                        <label class="control-label" for="formInput526">Type:</label>
                        <select id="types" class="form-control" name="types" required >
                            <option value="Text box">Text box</option>
                            <option value="Check box">Check box</option>
                            <option value="Radio box">Radio box</option>
                            <option value="Dropdown">Dropdown</option>
                            <option value="Datepicker">Datepicker</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row hidefield" id="check" style="display:none;">
                <div class="form-group">
                    <div class="col-sm-4">
                        <label class="control-label" for="formInput526">Number of check boxes:</label>
                        <input type="text" class="form-control" id="number"  name="number1">
                    </div>
                </div>
                <br/>
            </div>
            <div class="row hidefield" id="rdo" style="display:none;">
                <div class="form-group">
                    <div class="col-sm-4">
                        <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                        <input type="text" class="form-control" id="radio_number"  name="radio_number">
                    </div>
                </div>
                <br/>
            </div>
            <div class="row hidefield" id="drop" style="display:none;">
                <div class="form-group">
                    <div class="col-sm-4">
                        <label class="control-label" for="formInput526">Number of Options:</label>
                        <input type="text" class="form-control" id="drop_number"  name="drop_number" onChange="drp_dwn()">
                    </div>
                </div>
                <br/>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-4">
                        <div id="demo"></div>
                    </div>
                </div>
            </div>
             <div id="options">
             </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-sm-4">
                        <div id="demo1"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group">
                    <div class="col-sm-4">
                        <div id="demo2"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-lg-8">
                        <label class="control-label" for="formInput526">Mandatory:</label>
                        <select id="mandatory" class="form-control" name="mandatory" required >
                            <option>Yes</option>
                            <option>No</option>
                        </select>
                    </div>
                </div>
            </div>
            <br/><br/>
    </div>
</form>
        <button type="button" id="submit" class="btn btn-primary" >Submit</button>
        <button type="button" onclick="window.location.href=''" class="btn btn-default">Cancel</button>
</div>
</div>
    <div id="myModal1" class="modal">

        <!-- Modal content -->
        <div id="modal-content1">

            <span class="close">&times;</span>
            <form name="ModifyPopupForm">
                <div id="scrollbar1">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-8">
                                <label class="control-label" for="formInput526">Label:</label>
                                <input type="text" class="form-control" id="Label_modify"  name="label" required>
                            </div>
                        </div>
                    </div><br/>
                    <input type="text" id="seq_num" name="" value="" style="display:none;">
              <%--      &lt;%&ndash;<input type="hidden" id="project_name1" name="project_name" value="">

                    <input type="text" id="appln_name1" name="appln_name" value="" style="display:none;">
                    <input type="text" id="servlet_name1" name="servlet_name" value="" style="display:none;">&ndash;%&gt;
                    <input type="text" id="seq_num" name="" value="" style="display:none;">


                    <br/>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-8">
                                <label class="control-label" for="formInput526">Type:</label>
                                <select id="types_modify" class="form-control" name="types" required >
                                    <option value="Text box">Text box</option>
                                    <option value="Check box">Check box</option>
                                    <option value="Radio box">Radio box</option>
                                    <option value="Dropdown">Dropdown</option>
                                    <option value="Datepicker">Datepicker</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row hidefield" id="check1" style="display:none;">
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="formInput526">Number of check boxes:</label>
                                <input type="text" class="form-control" id="CheckboxNumberModify"  name="number1">
                            </div>
                        </div>
                        <br/>
                    </div>
                    <div class="row hidefield" id="rdo1" style="display:none;">
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                                <input type="text" class="form-control" id="RadioNumberModify"  name="radio_number">
                            </div>
                        </div>
                        <br/>
                    </div>
                    <div class="row hidefield" id="drop1" style="display:none;">
                        <div class="form-group">
                            <div class="col-sm-4">
                                <label class="control-label" for="formInput526">Number of Options:</label>
                                <input type="text" class="form-control" id="OptionsNumberModify"  name="drop_number" onChange="drp_dwn()">
                            </div>
                        </div>
                        <br/>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-4">
                                <div id="checklabel"></div>
                            </div>
                        </div>
                    </div>
                    <div id="options1">
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-4">
                                <div id="demo11"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-4">
                                <div id="demo21"></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-8">
                                <label class="control-label" for="formInput526">Mandatory:</label>
                                <select id="Mandatory_modify" class="form-control" name="mandatory" required >
                                    <option>Yes</option>
                                    <option>No</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <br/><br/>--%>
                </div>
            </form>
            <button type="button" id="submit1" class="btn btn-primary" >Submit</button>
            <button type="button" onclick="window.location.href=''" class="btn btn-default">Cancel</button>

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
    $('#types_modify').change(function(){
       var inputvalue=$('#types_modify').val();
       $('.hidefield').hide();
       if(inputvalue=="Check box")
       {
           $('#check1').show();
       }
       else if(inputvalue=="Radio box")
       {
           $('#rdo1').show();
       }
       else if(inputvalue=="Dropdown")
       {
           $('#drop1').show();
       }
    });
    $('#CheckboxNumberModify').change(function()
    {
        var count=$('#CheckboxNumberModify').val();
        var s="";
        for(var i = 1; i <=count; i++) {
            s+= '<label class="hidefield">Checkbox Label'+i+':</label><input type="text" class="form-control hidefield checkclass1" id="LabelModify'+i+'" name="LabelModify'+i+'"><br/>'; //Create one textbox as HTML
        }
        $('#options1').html(s);
    });
    $('#RadioNumberModify').change(function()
    {
        var count=$('#RadioNumberModify').val();
        var s="";
        for(var i=1;i<=count;i++) {
            s += '<label class="hidefield">Radiobox Label' + i + ':</label><input type="text" class="form-control hidefield radioclass1" id="RlabelModify'+i+'" name="RlabelModify' + i + '"><br/>'; //Create one textbox as HTML
        }
        $('#options1').html(s);
    });
    $('#OptionsNumberModify').change(function()
    {
        var drop=$('#OptionsNumberModify').val();
        /*console.log('drop---> '+drop);
        alert('drop---> '+drop);*/
        var s="";
        for(var i=1;i<=drop;i++)
        {
            s+='<label class="hidefield">Options Label'+i +':</label><input type="text" class="form-control hidefield dropclass1" id="drp_labelModify'+i+'" name="drp_labelModify'+i+'"><br/>';
        }
        $('#options1').html(s);
    });
    </script>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
<script>
        if(document.getElementById('Role_info').value=="R")
            checkk();
    </script>
<script>
    var url_string=window.location.href;
    var url = new URL(url_string);
    var appname = url.searchParams.get("appname");
    var projname=url.searchParams.get("prjname");
    console.log("Application:",appname,"Project:",projname);
    $(document).ready(function(){
        $('#trigger_date_field').datepicker({});
        $.ajax({
            url: "LegacyRetentionDataRetrieveServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data Retrieve json array----->",data);
                if (!$.isArray(data)) {
                    data = [data];
                }

                $.each(data, function(key, value){
                    /*console.log("FULL NAME " + value.Type);*/
                    var manadatory="class='required_fie'";
                    var Type=value.Type;
                    var ColumnName=value.ColumnName;
                    var LabelName=value.LabelName;
                    var Value=value.Value;
                    //var options=data[i].options.split(',');
                    if(value.Mandatory=="No")
                    {
                         manadatory="";
                    }
                    if(Type=="Text box")
                    {
                        var inputtext="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                            "</div>";
                        $('#inputFields').append(inputtext);
                    }
                    else if(Type=="Datepicker")
                    {
                        var inputdate="<div class='form-group'>" +
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                        $('#inputFields').append(inputdate);

                    }
                    else if(Type=="Dropdown")
                    {
                        var inputdrop= "<div class='form-group'><label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                            "<select style = 'width:100%;' name='"+ColumnName+"'>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for(var i=0;i<option.length;i++) {
                            inputdrop += "<option label=" + option[i] + " class='control-label' for= 'formInput198' >" + option[i] + "</option>";
                        }
                        inputdrop +="</select></div>";
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="Check box")
                    {
                        var inputcheck= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for (var i=0; i<option.length; i++) {

                            inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' name='"+ColumnName+"'/>" +
                                option[i]+"</label>";
                        }
                        inputcheck +="</div>";
                        $('#inputFields').append(inputcheck);

                    }
                    else if(Type=="Radio box")
                    {
                        var inputdrop= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for (var i=0; i<option.length; i++){
                            inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' name='"+ColumnName+"'/>"+
                                option[i]+"</label>";
                        }
                        inputdrop +="</div>";
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="file")
                    {
                        inputfile="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div class='required_fie'>"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                            "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                            "</div>";
                        $('#inputFields').append(inputfile);

                    }
                });
                var script="<script>$('.datepicker1').datepicker({\n" +
                    "format: \"mm/dd/yyyy\",\n"+
                    "autoclose: true\n"+
                    "});<\/script>";
                script+="<script>\n" +
                    "$('.editpopup').click(function() {\n" +
                    "var seqnum=$(this).index('.editpopup');"+
                    "$('#seq_num').val(seqnum);"+
                    "modal1.style.display = \"block\";\n" +
                    "});"+
                    "<\/script>";
                script+="<script> $('.deletepopup').click(function() {\n" +
                    "var seqnum=$(this).index('.deletepopup');"+
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
    $('#submit1').click(function() {
        var labelmodify = $('#Label_modify').val();
        /*var Type = $('#types_modify').val();
        var number = 0;
        var options=[];
        if (Type == "Check box") {
            number = $('#CheckboxNumberModify').val();
            var length=$('.checkclass1').length;
            for(var i=0;i<length;i++)
            {
                options[i]=$('#LabelModify'+(i+1)).val();
            }

        } else if (Type == "Radio box") {
            number = $('#RadioNumberModify').val();
            var length=$('.radioclass1').length;
            for(var i=0;i<length;i++)
            {
                options[i]=$('#RlabelModify'+(i+1)).val();
            }
        } else if (Type == "Dropdown") {
            number = $('#OptionsNumberModify').val();
            var length=$('.dropclass1').length;
            for(var i=0;i<length;i++)
            {
                options[i]=$('#drp_labelModify'+(i+1)).val();
            }
        }
        var mandatory = $('#Mandatory_modify').val();*/
        var seqnum = parseInt($('#seq_num').val())+1;

        var f=document.ModifyPopupForm;
        f.method="post";
        f.action="DecommIntakeEditOperationServlet?ProjectName="+projname+"&ApplicationName="+appname+"&Seq_num="+seqnum+"&Label="+labelmodify;
        f.submit();
        /*$.ajax({
            url: "DecommIntakeEditOperationServlet",
            type: 'POST',
            data: {ApplicationName: appname, ProjectName: projname,Seq_num:seqnum,Mandatory:mandatory,Type:Type,Label:labelmodify},
            dataType: "json",
            success: function (data) {
            },
            error: function (e) {
                console.log(e);
            }
        });*/
    });
    </script>
    <script>
        // Get the modal
        var modal1 = document.getElementById("myModal1");

        // Get the button that opens the modal
        var btn1 = document.getElementsByClassName("editpopup");

        // Get the <span> element that closes the modal
        var span1= document.getElementsByClassName("close")[1];

        // When the user clicks the button, open the modal
        $('.editpopup').click(function() {
            alert("Testing index"+$(this).index('.editpopup'));
            modal1.style.display = "block";
        });

        // When the user clicks on <span> (x), close the modal
        span1.onclick = function() {
            modal1.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal1) {
                modal1.style.display = "none";
            }
        }
        // Get the modal
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
        $('#Deletebtn').click(function()
        {
            $(".hidepencil").hide();
            $(".hidedelete").toggle();
        });
        $('#Modifybtn').click(function()
        {
            $(".hidedelete").hide();
            $(".hidepencil").toggle();
        });

        $('#submit').click(function()
        {
            var labelname=$('#label').val();
            var columnname=$('#idname').val();
            var type=$('#types').val();
            var mandatory=$('#mandatory').val();
            var num=1;
            var options="";
            if(type=="Check box")
            {
                 num=$('#number').val();
                 var length=$('.checkclass').length;
                 for(var i=1;i<=length;i++)
                 {
                     var checklabel=$('#label'+i).val();
                     options+=checklabel+",";
                 }
            }
            else if(type=="Radio box")
            {
             num=$('#radio_number').val();
                var length=$('.radioclass').length;
                for(var i=1;i<=length;i++)
                {
                    var radiolabel=$('#Rlabel'+i).val();
                    options+=radiolabel+",";
                }

            }
            else if(type=="Dropdown")
            {
              num=$('#drop_number').val();
                var length=$('.dropclass').length;
                for(var i=1;i<=length;i++)
                {
                    var drplabel=$('#drp_label'+i).val();
                    options+=drplabel+",";
                }

            }
            /*var number=$('#number1').val();
            alert('number--->'+number);*/
            $.ajax({
                url: "DecommLegacyRetentionAddServlet",
                type: 'POST',
                data: {ApplicationName:appname,ProjectName: projname,LabelName:labelname,ColumnName:columnname,Type:type,Mandatory:mandatory,Number:num,Options:options},
                dataType: "json",
                success: function (data) {
                    var required = "";
                    console.log("data add---->",data);
                    var num=parseInt($('.editpopup').length)+1;
                    var required_field = "";
                    if (data.Mandatory == "Yes"){
                        required_field = "class = 'required_fie'";
                    }
                    if (data.CheckExistance == true)
                    {
                        alert("Alredey Label or Column name Existed ");
                    }
                    else if(data.Type=="Text box")
                    {
                        var inputtext="<div class='form-group'>"+
                        "<label class='control-label' for='formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                    "<input type='text' class='form-control' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
                    "</div>";
                    $('#inputFields').append(inputtext);
                    }
                    else if(data.Type=="Datepicker")
                    {
                     var inputdate="<div class='form-group'>"+
                         "<label class='control-label' for= 'formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                         "<input type='text' class='form-control datepicker1' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
                        "</div>";
                        $('#inputFields').append(inputdate);
                        var script="<script>$('.datepicker1').datepicker({\n" +
                            "format: \"mm/dd/yyyy\",\n" +
                            "autoclose: true\n" +
                            "});<\/script>";
                        $('#scripttag').append(script);
                    }
                    else if(data.Type=="Radio box")
                    {
                        var input="";
                        input+= "<div class='form-group'>"+
                                    "<label class='control-label' for= 'formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
                        var Options=data.Options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for (var i=0; i<option.length; i++){

                            input+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' name='"+data.ColumnName+num+"'/>"+
                            option[i]+"</label>";

                        }
                        input +="</div>";
                        $('#inputFields').append(input);
                    }
                    else if(data.Type=="Check box")
                    {
                        var input="";
                        input+= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
                        var Options=data.Options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for (var i=0; i<option.length; i++) {

                            input += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' name='" + data.ColumnName+num+"'/>" +
                                option[i] + "</label>";
                        }
                        input +="</div>";
                        $('#inputFields').append(input);
                    }
                    else if(data.Type=="Dropdown")
                    {
                        var select="";
                        select+= "<div class='form-group'><label class='control-label' for= 'formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                            "<select style = 'width:100%;' name = "+data.ColumnName+num+">";
                        var Options=data.Options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for(var i=0;i<option.length;i++) {
                            select += "<option label=" + option[i] + " class='control-label' for= 'formInput198' >" + option[i] + "</option>";
                        }
                        select +="</select></div>";
                        $('#inputFields').append(select);
                    }
                },
                error: function (e) {
                    console.log(e);
                }
            });
           /* var f=document.PopUpform;
            f.method="post";
            f.action="DecommLegacyRetentionAddServlet?ProjectName"+projname+"&ApplicationName="+appname+"&LabelName="+labelname+"&ColumnName="+columnname+"&type="+type+"&mandatory="+mandatory;
            f.submit();*/
            //alert("values---> label name"+labelname+" column name"+columnname+" type"+type+" manadatory"+mandatory);
        });
    </script>
<script>
    function Submit(){
        //alert("Hello");
        var classlength = $('.editpopup').length;
        var f = document.LegacyForm;
        f.method = "post";
        f.action = "LegacyRetentionDbUpdataServlet?appname="+appname+"&prjname="+projname+"&classlength="+classlength;
        f.submit();
    }
    </script>

    <script>
        $('#submit2').click(function(){
            var deleteseq=parseInt($('#sequence1').val())+1;
            var f=document.DeleteForm;
            f.method = "post";
            f.action = "DecommIntakeDeleteOperationServlet?ApplicationName="+appname+"&ProjectName="+projname+"&DeleteNumber="+deleteseq;
            f.submit();
        });
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
    </script>
    <script>
        var url_string=window.location.href;
        var url = new URL(url_string);
        var appname = url.searchParams.get("appname"); $('#app_name').val(appname);
    </script>
    <div id="scripttag">
    </div>
    <script>
        $(window).scroll(function() {
            if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
                $('#return-to-top').fadeIn(200);    // Fade in the arrow
            } else {
                $('#return-to-top').fadeOut(200);   // Else fade out the arrow
            }
        });
        $('#return-to-top').click(function() {      // When arrow is clicked
            $('body,html').animate({
                scrollTop : 0                       // Scroll to top of body
            }, 500);
        });
    </script>
<script>
    $('#types').change(function()
    {
       var type=$('#types').val();
       //alert('Type--> '+type);
       $(".hidefield").hide();
       if(type=="Check box")
       {
           $('#check').show();


       }
       else if(type=="Radio box")
       {
           $('#rdo').show();

           }
       else if(type=="Dropdown")
       {
           $('#drop').show();
       }
       //alert('types--->'+type);
    });
    $('#radio_number').change(function(){
        var count=$('#radio_number').val();
        var s="";
        for(var i=1;i<=count;i++) {
            s += '<label class="hidefield">Radiobox Label' + i + ':</label><input type="text" class="form-control hidefield radioclass" id="Rlabel'+i+'" name="Rlabel' + i + '"><br/>'; //Create one textbox as HTML
        }
        $('#options').html(s);
    });
    $('#number').change(function()
    {
        var count=$('#number').val();
        var s="";
        for(var i = 1; i <=count; i++) {
            s+= '<label class="hidefield">Checkbox Label'+i +':</label><input type="text" class="form-control hidefield checkclass" id="label'+i+'" name="label'+i+'"><br/>'; //Create one textbox as HTML
        }
        $('#options').html(s);
    });
    $('#drop_number').change(function()
    {
        var drop=$('#drop_number').val();
        /*console.log('drop---> '+drop);
        alert('drop---> '+drop);*/
        var s="";
        for(var i=1;i<=drop;i++)
        {
           s+='<label class="hidefield">Options Label'+i +':</label><input type="text" class="form-control hidefield dropclass" id="drp_label'+i+'" name="drp_label'+i+'"><br/>';
        }
        $('#options').html(s);
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
    /* function addrow_country()
    {

          var rowlength=$('.country').length;
            //alert("hi"+rowlength);
          var i=rowlength+1;
        var element='<tr class="country">'+
       '<td><input type="text" id ="country'+i+'"></td>'+
    '<td><input type="text" id ="city'+i+'"></td>'+
    '<td><input type="text" id ="state'+i+'"></td>'+
    '<td><input type="text" id ="office_designation'+i+'"></td>'+
    '<td> <img src="images/delete.png" style="height:30px; width:30px;" id="delete'+i+'" onclick="SomeDeleteRowFunction()">'+
         '</tr>';
    $('#tablecountry').append(element);

    } */
    </script>



    </body>

    </html>
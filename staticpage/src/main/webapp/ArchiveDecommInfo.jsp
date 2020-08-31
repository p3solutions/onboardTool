<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Archive-Decomm Requirements</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css"
          media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
          media="screen">

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script type="text/javascript" src="js_in_pages/project.js"></script>
    <script src="js/modernizr/modernizr.min.js"></script>
    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        @
        mixin transition ($x, $y, $z ){
            transition: $x$y$z;
            -moz-transition: $x$y$z;
            -ms-transition: $x$y$z;
            -webkit-transition: $x$y$z;
            -o-transition: $x$y$z;
        }

        @
        mixin rotate ($x){
            -ms-transform: rotate($ x); /* IE 9 */
            -webkit-transform: rotate($ x); /* Chrome, Safari, Opera */
            transform: rotate($ x);
        }

        @
        mixin scale ($x){
            transform: scale($ x);
            -moz-transform: scale($ x);
            -webkit-transform: scale($ x);
            -o-transform: scale($ x);
            -ms-transform: scale($ x);
        }

        .flex-row {
            display: flex;
            justify-content: center;
            position: relative;
            width: 100%;
            flex-flow: row wrap; //
        overflow: hidden;
        }

        //
        Use this class as wrapper to keep content INSIDE the card
        .flex-wrapper {
            overflow: hidden;
            width: 100%;
            height: 100%;
        }

        .card {
            position: relative;
            background-color: #fff;
            display: inline-block;
            max-width: 300px;
            min-width: 150px;
            min-height: 200px;
            content: "";
            margin: 10rem 10rem 0 0;
            box-shadow: 0 1px 3px 0 rgba(58, 62, 75, 0.25);
            flex: 0 0 25%;
            align-items: flex-start;
            align-content: flex-start;
            border-radius: .2rem; @ include transition(all, 250ms, ease-in-out); &:
                                                                                  hover { @include scale(1.1);
                                                                                      filter: saturate(50%);
                                                                                      @
                                                                                      include
                                                                                              rotate(3deg);
                                                                                  }

        &
        :active {
            filter: blur(.05rem);
            @
            include
                    rotate(-3deg);
        }

        &
        :last-child {
            margin-right: none;
            background-color: purple;
            background-image: url("https://goo.gl/LURaLH");
            background-size: cover;
            background-position: center center;
        }

        &
        :first-child {
            margin-left: none;
            background-color: orange;
        }

        }
        #img2 {
            padding: 10px;
            width: 300px;
            height: 270px;
        }

        #img3 {
            width: 250px;
            height: 250px;
        }

        .card:hover {
            box-shadow: 0px 0px 40px 0px rgba(0, 0, 0, 0.5);
        }

        .center {
            display: block;
            margin-left: 20px;
            margin-bottom: 20px;
        }

        #para {
            text-align: center;
            padding-top: 30px;
            font-size: 20px;
            font-family: Arial, Helvetica, sans-serif;
            font-style: italic;
            font-size: 25px;
        }
    </style>
</head>
<body class="top-navbar-fixed">

<div class="main-wrapper">
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="index.php"> <img
                            src="images/logo1.png" alt="Options - Admin Template" class="logo">
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-collapse-1">


                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="#"><span id="nav_userid">&nbsp;</span>logged
                            in as &nbsp;<span id='nav_role'></span></a></li>
                        <li><a href="Logout" class=" text-center"><i
                                class="fa fa-sign-out"></i> Logout</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </nav>

    <div class="content-wrapper">
        <div class="content-container">
            <div class="main-page">
                <div class="flex-row">
                    <div class="card">
                        <label id="para">Archive Requirements</label> <a
                            href="Intake_Business.jsp"><img id="img2"
                                                         src="images/arhive_intake.png" width="200px" class="center"></a>
                    </div>
                    <div class="card">
                        <label id="para">Decomm Requirements </label> <a
                            href="Decomm_Requirements_Applications.jsp"><img id="img3"
                                                                       src="images/decomm_intake.png" width="200px" class="center"></a>
                    </div>

                </div>

            </div>

        </div>


    </div>
</div>


</div>
</body>
</html>

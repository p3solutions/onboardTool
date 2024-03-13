<head>
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <script type="text/javascript" src="js_in_pages/project.js"></script>

    <link rel="stylesheet" href="css/headerIconnectCon/headerIcon.css"
          media="screen">

    <link rel="stylesheet" href="css/threeDots/threeDots.css" media="screen">
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous" />

    <!-- ========== BootstrapV5 ========== -->
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
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
            rel="stylesheet">
    <style>
        .icon:hover
        {
            cursor:pointer;

        }
        #new_pwd_togglePassword
        {
            position: absolute;
            margin-top: 22px;
            margin-left: 308px;
        }
        #conf_new_pwd_togglePassword
        {
            position: absolute;
            margin-top: 22px;
            margin-left: 249px;
        }
        #prev_pwd_togglePassword{
            position: absolute;
            margin-top: 22px;
            margin-left: 247px;
        }
    </style>
</head>

<body>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date newDate1 = new Date();
    System.out.println("[INFO]-----" + formatter1.format(newDate1) + "-----Accessed OpportunityList JSP PAGE-----[INFO]");
%>
<%@page language="java"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection"%>
<%@page import="org.owasp.encoder.Encode"%>
<%@ page import="java.util.ResourceBundle"%>
<%
    ResourceBundle resource1 = ResourceBundle.getBundle("VersionInfo");
    String versioninfo1 = resource1.getString("VERSION");
    ResourceBundle resource8 = ResourceBundle.getBundle("Configuration");
    String authtype8 = resource8.getString("AUTHTYPE");
    System.out.println("Version" + versioninfo1);
%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<%
    HttpSession role_session = request.getSession();
    String frole1 = (String) role_session.getAttribute("role");
    //int sumcount1=0;
    Statement sDate, sTime;
    try {
        //String query;
        PreparedStatement visit_start = null;
        ResultSet visit_reset = null;
        HttpSession sessionDetails = request.getSession();
        String Projects = (String) sessionDetails.getAttribute("projects");
        System.out.println("projects-------------" + Projects);
        String rolesList = (String) sessionDetails.getAttribute("role");
        DBconnection db = new DBconnection();
        Connection connectCon = (Connection) db.getConnection();
        String visit_query1 = "select * from visits";
        visit_start = connectCon.prepareStatement(visit_query1);
        visit_reset = visit_start.executeQuery();
        int flag1 = 1, knt1 = 0;
        Date newDate = new Date();
        SimpleDateFormat fDate, fTime;
        String userName = (String) sessionDetails.getAttribute("username");

        fDate = new SimpleDateFormat("yyyy-MM-dd");
        fTime = new SimpleDateFormat("hh:mm:ss");
        String startDate = fDate.format(newDate);
        String startTime = fTime.format(newDate);
        while (visit_reset.next()) {
            if (visit_reset.getString(6) != null) {
                if (visit_reset.getString(1).equals(userName) && visit_reset.getString(2).equals(startDate)
                        && visit_reset.getString(3).equals("Logged in")) {
                    String queryy = "update visits set count=count+1,time=? where uname=? and module='Logged in'  and date =?";
                    PreparedStatement stmtt = connectCon.prepareStatement(queryy);
                    stmtt.setString(1, startTime);
                    stmtt.setString(2, userName);
                    stmtt.setString(3, startDate);
                    int count = stmtt.executeUpdate();
                    flag1 = 0;
                    break;
                }
            }

        }
        //System.out.println("the flag value is "+flag);
        if (flag1 == 1) {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = connectCon.prepareStatement(ins_query);
            preparedStmt.setString(1, userName);
            preparedStmt.setString(2, startDate);
            preparedStmt.setString(3, "Logged in");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, startTime);
            preparedStmt.setString(6, "None");
            preparedStmt.setString(7, "");

            // execute the preparedstatement
            preparedStmt.execute();
        }
%>

<nav
        class="navbar navbar-expand-lg navbar-expand-lg navbar-light bg-white nav-height nav-font">
    <div class="container-fluid col-sm-12 col-md-12 col-lg-12">
        <div class="col-sm-2 col-md-2 col-lg-2">
            <a class="navbar-brand" href="OpportunityList.jsp"> <img
                    src="images/D3Sixty-logo.png" class="d3s-logo" alt="D3Sixty">
            </a>
        </div>
        <div class="col-md-8 col-lg-8 col-sm-8">
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto d3s-ml-80" id="nav-res-align" >
                    <li class="nav-item moduleIcon"><a class="nav-link active"
                                                       aria-current="page" href="OpportunityList.jsp"><i
                            class="fas fa-folders fa-2x iconAlign iconColor"></i>Applications</a>
                    </li>
                    <li class="nav-item moduleIcon"><a class="nav-link active"
                                                       aria-current="page" href="Admin_Userslist.jsp"><i
                            class="fas fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a>
                    </li>
                    <li class="nav-item moduleIcon"><a class="nav-link active"
                                                       aria-current="page" href="Governance_Home.jsp"><i
                            class="fas fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
                    <li class="nav-item moduleIcon"><a class="nav-link active"

                                                       aria-current="page" href="FinanceList.jsp"><i
                            class="fas fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
                    <li class="nav-item moduleIcon"><a class="nav-link active"
                                                       aria-current="page" href="DashBoard.jsp"><i
                            class="fas fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a>
                    </li>
                    <li class="nav-item moduleIcon"
                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                        title="For Future Enhancement"><a class="nav-link active" aria-current="page" href="#">
                        <i class="fas fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>


                </ul>

            </div>
        </div>

        <div class="col-sm-2 col-md-2 col-lg-2">
            <div class="dropdown d3s-ml-70" align="end" id="user-icon-lign">
                <a class="dropdown-toggle" href="#" role="button"
                   id="dropdownMenuLink" data-bs-toggle="dropdown"
                   aria-expanded="false"><i
                        class="fas fa-user-circle iconAlign iconColor fa-3x"></i> </a>
                <ul class="dropdown-menu" id="dropDownMenu"
                    aria-labelledby="dropdownMenuLink"
                    style="width: 165px; margin-left: -15px;">
                    <li><a class="dropdown-item" href="#" id="textAlign"><i
                            class="fas fa-user-circle iconAlign iconColor fa-3x"></i><br />Signed
                        in as <br /> <b class="user-ellipsis"><%=Encode.forHtml(userName)%></b></a></li>

                    <li class="mt-5">
                        <a class="dropdown-item li-align"
                           href="#" id="textAlign"onclick="location.href='viewprofile.jsp';"
                           data-target="#viewprofile" data-toggle="modal"
                           style="border-top: 1px solid #d3d7e2; padding: 11px 0px 11px;">View Profile</a><a class="dropdown-item li-align changepwd"
                                                                                                             href="" id="textAlign" data-target="#changepwd"
                                                                                                             data-toggle="modal"
                                                                                                             style="border-top: 1px solid #d3d7e2; padding: 11px 0px 11px;">Change
                        Password</a> <a class="dropdown-item li-align" href=""
                                        id="textAlign" data-target="#verModal1" data-toggle="modal"
                                        style="border-top: 1px solid #d3d7e2; padding: 11px 0px 11px;">About
                        D3Sixty</a> <a class="dropdown-item li-align" href="#"
                                       id="textAlign" onclick="location.href='logout.jsp';"
                                       style="border-top: 1px solid #d3d7e2;"><i
                            class="fa fa-sign-out iconColor fa-1x"></i>Logout</a></li>
                </ul>

            </div>


        </div>
    </div>

</nav>


<script>
    let tooltipTriggerList = [].slice.call(document
        .querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl, {
            container : 'body',
            trigger : 'onClick'
        });

    });
</script>
<div class="modal" id="verModal1" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #1565c0;">
                <h4 class="modal-title" id="exampleModalLabel"
                    style="color: white;">About</h4>
                <button type="button" class="btn-close" data-dismiss="modal"
                        style="color: white;" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12">
                                <center>
                                    <img src="images/D3Sixty_logo.png" style="width: 60%;">
                                </center>
                                <div class="col-lg-12">
                                    <center>
                                        <label class="versioninfo">Version : <%=versioninfo1%></label>
                                    </center>
                                    <center>
                                        <label class="versioninfo">Copyright &copy; 2022 <a
                                                href="https://platform3solutions.com/">Platform 3
                                            Solutions.</a> All Rights Reserved.
                                        </label>
                                    </center>
                                    <center>
                                        <label class="versioninfo" for="formInput526">Trademarks
                                            owned by Platform 3 Solutions </label>
                                    </center>
                                </div>

                            </div>
                        </div>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>
<div class="modal" id="changepwd" tabindex="-1"
     aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #1565c0;">
                <h5 class="modal-title" id="exampleModalLabel1"
                    style="color: white;">Change Password</h5>
                <button type="button" class="btn-close" data-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12">
                                <label class="control-label" for="formInput526">Enter
                                    Current Password:</label> <i class="fa fa-eye-slash icon"
                                                                 aria-hidden="true" id="prev_pwd_togglePassword"
                            ></i>
                                <input type="password" class="form-control" id="prev_pwd"
                                       name="prev_pwd" required />
                            </div>
                            <div class="col-lg-12">
                                <label class="control-label" for="formInput526">New
                                    Password:</label> <i class="fa fa-eye-slash icon" aria-hidden="true"
                                                         id="new_pwd_togglePassword"
                            ></i>
                                <input type="password" class="form-control" id="new_pwd"
                                       name="new_pwd" required>
                            </div>
                            <div class="col-lg-12">
                                <label class="control-label" for="formInput526">Confirm
                                    New Password:</label><i class="fa fa-eye-slash icon" aria-hidden="true"
                                                            id="conf_new_pwd_togglePassword"
                            ></i>
                                <input type="password" class="form-control" id="conf_new_pwd"
                                       name="conf_new_pwd" required>
                            </div>
                            <div class="col-lg-12" style="display: none;">
                                <label class="control-label" for="formInput526">Username:</label>
                                <input type="text" class="form-control" id="user_Name"
                                       name="user_Name"
                                       value="<%=Encode.forHtmlAttribute(userName)%>" required>
                            </div>

                            <div class="col-lg-12" style="display: none;">
                                <label class="control-label" for="formInput526">Auth
                                    Type:</label> <input type="text" class="form-control" id="auth_type"
                                                         name="auth_type"
                                                         value="<%=Encode.forHtmlAttribute(authtype8)%>" required>
                            </div>

                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-primary" id="change_PWD"
                        style="font-size: 12px;">Change
                    Password</button>
                <button type="button" class="btn btn-secondary"
                        data-dismiss="modal" style="font-size: 12px;">Close</button>
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
<%
        visit_start.close();
        visit_reset.close();
        connectCon.close();

    }

    catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
<script>
    $(document).ready(function() {
        console.log($('#auth_type').val());
        if($('#auth_type').val()=="SSO")
        {
            $('.changepwwd').hide();
        }
    });
</script>

<script>
    const togglePassword = document
        .querySelector('#new_pwd_togglePassword');

    const password = document.querySelector('#new_pwd');

    togglePassword.addEventListener('click', () => {
        const type = password
            .getAttribute('type') === 'password' ?
            'text' : 'password';

        password.setAttribute('type', type);
        if(type=="password")
        {
            togglePassword.classList.remove("fa-eye");
            togglePassword.classList.add("fa-eye-slash");
        }
        if(type=="text")
        {
            togglePassword.classList.remove("fa-eye-slash");
            togglePassword.classList.add("fa-eye");

        }

    });
</script>
<script>
    const togglePassword1 = document
        .querySelector('#prev_pwd_togglePassword');

    const password1 = document.querySelector('#prev_pwd');

    togglePassword1.addEventListener('click', () => {
        const type = password1
            .getAttribute('type') === 'password' ?
            'text' : 'password';

        password1.setAttribute('type', type);
        if(type=="password")
        {
            togglePassword1.classList.remove("fa-eye");
            togglePassword1.classList.add("fa-eye-slash");
        }
        if(type=="text")
        {
            togglePassword1.classList.remove("fa-eye-slash");
            togglePassword1.classList.add("fa-eye");

        }

    });
</script>
<script>
    const togglePassword2 = document
        .querySelector('#conf_new_pwd_togglePassword');

    const password2 = document.querySelector('#conf_new_pwd');

    togglePassword2.addEventListener('click', () => {
        const type = password2
            .getAttribute('type') === 'password' ?
            'text' : 'password';

        password2.setAttribute('type', type);
        if(type=="password")
        {
            togglePassword2.classList.remove("fa-eye");
            togglePassword2.classList.add("fa-eye-slash");
        }
        if(type=="text")
        {
            togglePassword2.classList.remove("fa-eye-slash");
            togglePassword2.classList.add("fa-eye");

        }

    });
</script>
<script src="../js/admin_modify_module/admin_role.js"></script>
<script src="js/Finance/Role_Check.js"></script>
<script src="js/admin_modify_module/changepwd.js"></script>
<script src="js/notification/notification.js"></script>
<script src="js/BindWave.js"></script>
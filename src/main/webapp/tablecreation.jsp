<%@page import="onboard.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed TableCreation JSP PAGE-----[INFO]"); %>

<%
//String connectionURL = "jdbc:mysql://localhost:3306/decom3sixtytool";
    Connection connection = null;
    Statement statement = null;
    try {
    	DBconnection dbConnection = new DBconnection();
    	connection = (Connection) dbConnection.getConnection();
       

        statement = connection.createStatement();


        String query1 = "CREATE TABLE IF NOT EXISTS `AppEmphazize_ApplicationInfo` ( `appname` varchar(255) DEFAULT NULL, `complexity` varchar(255) DEFAULT NULL, `est_db_size` varchar(255) DEFAULT NULL, `est_cst` varchar(255) DEFAULT NULL, `prjname` varchar(255) DEFAULT NULL, est_scrn varchar(255) DEFAULT NULL,`id` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`))";
        statement.executeUpdate(query1);

        String query2 = "CREATE TABLE IF NOT EXISTS `ArchiveExecution_Defaultvalues` ( `seq_num` int(11) DEFAULT NULL, `level` int(11) DEFAULT NULL, `name` varchar(255) DEFAULT NULL, `mem_ass` varchar(255) DEFAULT NULL, `act_srt_date` varchar(255) DEFAULT NULL, `act_end_date` varchar(255) DEFAULT NULL, `pln_srt_date` varchar(255) DEFAULT NULL, `pln_end_date` varchar(255) DEFAULT NULL, `hours` varchar(255) DEFAULT NULL, `id` varchar(255) DEFAULT NULL, `ref_id` varchar(255) DEFAULT NULL, `stats` varchar(255) DEFAULT NULL, `planned_hrs` varchar(255) DEFAULT NULL )";
        statement.executeUpdate(query2);

        String query3 = "CREATE TABLE IF NOT EXISTS `ArchiveExecution_Details` ( `seq_num` int(11) DEFAULT NULL, `level` int(11) DEFAULT NULL, `name` varchar(255) DEFAULT NULL, `mem_ass` varchar(255) DEFAULT NULL, `act_srt_date` varchar(255) DEFAULT NULL, `act_end_date` varchar(255) DEFAULT NULL, `pln_srt_date` varchar(255) DEFAULT NULL, `pln_end_date` varchar(255) DEFAULT NULL, `hours` varchar(255) DEFAULT NULL, `id` varchar(255) DEFAULT NULL, `ref_id` varchar(255) DEFAULT NULL, `stats` varchar(255) DEFAULT NULL, `planned_hrs` varchar(255) DEFAULT NULL, `projects` varchar(255) DEFAULT NULL, `progressbar` varchar(255) DEFAULT NULL, `stats_date` varchar(255) DEFAULT NULL, `comments` varchar(255))";
        statement.executeUpdate(query3);


        String query5 = "CREATE TABLE IF NOT EXISTS `details` ( `level` int(11) DEFAULT NULL, `name` varchar(255) DEFAULT NULL, `id` varchar(255) DEFAULT NULL, `ref_id` varchar(255) DEFAULT NULL, `indx` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`indx`) )";
        statement.executeUpdate(query5);

        String query6 = "CREATE TABLE IF NOT EXISTS `dummy` ( `value` varchar(255) DEFAULT NULL )";
        statement.executeUpdate(query6);

        String query7 = "CREATE TABLE IF NOT EXISTS `AppEmphazize_ProjectDetails` ( `projectname` varchar(255) DEFAULT NULL, `descr` varchar(255) DEFAULT NULL, `appno` varchar(255) DEFAULT NULL, `Startdate` varchar(255) DEFAULT NULL, `Intdate` varchar(255) DEFAULT NULL, `Plandate` varchar(255) DEFAULT NULL, `Execdate` varchar(255) DEFAULT NULL, `Hyperdate` varchar(255) DEFAULT NULL, `Enddate` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`) )";
        statement.executeUpdate(query7);

        String query8 = "CREATE TABLE IF NOT EXISTS `Role_Details` ( `role` varchar(255) DEFAULT NULL, `admin` varchar(255) DEFAULT NULL, `app_emp` varchar(255) DEFAULT NULL, `intake` varchar(255) DEFAULT NULL, `arch_exe` varchar(255) DEFAULT NULL, `decomm` varchar(255) DEFAULT NULL, `prgm_governance` varchar(255) DEFAULT NULL, `reporting` varchar(255) DEFAULT NULL, `finance` varchar(255) DEFAULT NULL )";
        statement.executeUpdate(query8);

        String query9 = "CREATE TABLE IF NOT EXISTS `Intake_TechnicalDetails` ( `datatype` varchar(255) DEFAULT NULL, `pname` varchar(255) DEFAULT NULL, `archneed` varchar(255) DEFAULT NULL, `formatsp` varchar(255) DEFAULT NULL, `mlang` varchar(255) DEFAULT NULL, `loclang` varchar(255) DEFAULT NULL, `dataretain` varchar(255) DEFAULT NULL, `systemdoc` varchar(255) DEFAULT NULL, `userdoc` varchar(255) DEFAULT NULL, `techdoc` varchar(255) DEFAULT NULL, `traindoc` varchar(255) DEFAULT NULL, `supportdoc` varchar(255) DEFAULT NULL, `datadic` varchar(255) DEFAULT NULL, `testcasedoc` varchar(255) DEFAULT NULL, `testrec` varchar(255) DEFAULT NULL, `designspec` varchar(255) DEFAULT NULL, `validityplan` varchar(255) DEFAULT NULL, `dataloc` varchar(255) DEFAULT NULL, `servername` varchar(255) DEFAULT NULL, `prodinstance` varchar(255) DEFAULT NULL, `prodinstanceloc` varchar(255) DEFAULT NULL, `infraengage` varchar(255) DEFAULT NULL, `sourcearch` varchar(255) DEFAULT NULL, `apphost` varchar(255) DEFAULT NULL, `retenduration` varchar(255) DEFAULT NULL, `clientapp` varchar(255) DEFAULT NULL, `extcustfacing` varchar(255) DEFAULT NULL, `url` varchar(255) DEFAULT NULL, `dbsize` varchar(255) DEFAULT NULL, `nooftable` varchar(255) DEFAULT NULL, `noofrec` varchar(255) DEFAULT NULL, `xmlcount` varchar(255) DEFAULT NULL, `anyvpn` varchar(255) DEFAULT NULL, `vpnacces` varchar(255) DEFAULT NULL, `appintegrate` varchar(255) DEFAULT NULL, `integname` varchar(255) DEFAULT NULL, `decomdate` varchar(255) DEFAULT NULL, `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT, `reqspec` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`) )";
        statement.executeUpdate(query9);

        String query10 = "CREATE TABLE IF NOT EXISTS `Admin_UserDetails` ( `uname` varchar(255) DEFAULT NULL, `fname` varchar(255) DEFAULT NULL, `lname` varchar(255) DEFAULT NULL, `email` varchar(255) DEFAULT NULL, `pwd` varchar(255) DEFAULT NULL, `projects` varchar(255) DEFAULT NULL, `roles` varchar(255) DEFAULT NULL, `stats` varchar(255) DEFAULT NULL, `question` varchar(255) DEFAULT NULL, `answer` varchar(255) DEFAULT NULL, `application` varchar(255) DEFAULT NULL,`id` int(11) NOT NULL AUTO_INCREMENT,PRIMARY KEY (`id`) )";
        statement.executeUpdate(query10);

        String query11 = "CREATE TABLE IF NOT EXISTS `AppEmphazize_ApplicationPrioritization` ( `prj_name` varchar(255) DEFAULT NULL, `IA_lic_cst` varchar(255) DEFAULT NULL, `IA_maint_cst` varchar(255) DEFAULT NULL, `Infrastrct_cst` varchar(255) DEFAULT NULL, `strg_est` varchar(255) DEFAULT NULL, `lab_cst` varchar(255) DEFAULT NULL, `proj_name` varchar(255) DEFAULT NULL, `data_size` varchar(255) DEFAULT NULL, `data_source` varchar(255) DEFAULT NULL, `curnt_users` varchar(255) DEFAULT NULL, `complexity` varchar(255) DEFAULT NULL, `est_archive` varchar(255) DEFAULT NULL, `est_scrn` varchar(255) DEFAULT NULL, `est_db_size` varchar(255) DEFAULT NULL, `est_hrs` varchar(255) DEFAULT NULL, `est_cst` varchar(255) DEFAULT NULL, `ttl_IA_cst` varchar(255) DEFAULT NULL, `ttl_infra_cst` varchar(255) DEFAULT NULL, `ttl_IA_prdct_cst` varchar(255) DEFAULT NULL, `ttl` varchar(255) DEFAULT NULL, `ttl_cst_fr_app` varchar(255) DEFAULT NULL, `add_cst_fr_contigency` varchar(255) DEFAULT NULL, `add_cst` varchar(255) DEFAULT NULL, `IA_app_sprt_cst` varchar(255) DEFAULT NULL, `est_archive_cst` varchar(255) DEFAULT NULL, `id` int(4) NOT NULL AUTO_INCREMENT, `sum` int(11) DEFAULT NULL, `read_date` varchar(255) DEFAULT NULL, `sme_date` varchar(255) DEFAULT NULL, `priorities` varchar(255) DEFAULT NULL, `no_of_app_complexity` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`), `data_retained` varchar(50) DEFAULT NULL, `Decommission` varchar(50) DEFAULT NULL)";
        statement.executeUpdate(query11);

        String query12 = "CREATE TABLE IF NOT EXISTS `logs` (`USER_ID` varchar(20) NOT NULL,   `DATED` varchar(25) NOT NULL,   `LOGGER` varchar(50) NOT NULL,   `LEVEL` varchar(10) NOT NULL,   `MESSAGE` varchar(1000) NOT NULL,   `roles` varchar(255) DEFAULT NULL )";
        statement.executeUpdate(query12);

        String query13 = "CREATE TABLE IF NOT EXISTS `visits` (`uname` varchar(255) NOT NULL,   `date` varchar(255) NOT NULL,   `module` varchar(255) NOT NULL,   `count` varchar(255) NOT NULL, `time` varchar(255) NOT NULL, `Projects` varchar(255) NOT NULL, `Applications` varchar(255) NOT NULL)";
        statement.executeUpdate(query13);

        String query14 = " CREATE TABLE IF NOT EXISTS `Intake_ArchivalRequirement` ( `legalholds` varchar(255) DEFAULT NULL, `dataapp` varchar(255) DEFAULT NULL, `dataloc` varchar(255) DEFAULT NULL, `reconsttools` varchar(255) DEFAULT NULL, `viewblob` varchar(255) DEFAULT NULL, `fieldprop` varchar(255) DEFAULT NULL, `fieldtype` varchar(255) DEFAULT NULL, `splchars` varchar(255) DEFAULT NULL, `foreignlang` varchar(255) DEFAULT NULL, `clob` varchar(255) DEFAULT NULL, `unstructarch` varchar(255) DEFAULT NULL, `accrole` varchar(255) DEFAULT NULL, `dataview` varchar(255) DEFAULT NULL, `complctrl` varchar(255) DEFAULT NULL, `errctrl` varchar(255) DEFAULT NULL, `metadata` varchar(255) DEFAULT NULL, `advsearch` varchar(255) DEFAULT NULL, `searchparam` varchar(255) DEFAULT NULL, `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`) )";
        statement.executeUpdate(query14);

        String query15 = "CREATE TABLE IF NOT EXISTS `Intake_NewRequirements` ( `requirements` varchar(255) DEFAULT NULL, `appname` varchar(255) DEFAULT NULL    )";
        statement.executeUpdate(query15);

        String query16 = "CREATE TABLE IF NOT EXISTS `Intake_BuisnessCustomization` (   `label` varchar(255) DEFAULT NULL,   `type_of_box` varchar(255) DEFAULT NULL,   `mandatory` varchar(255) DEFAULT NULL,   `no_of_box` varchar(255) DEFAULT NULL,   `checkbox_labels` varchar(255) DEFAULT NULL,   `no_of_Rbox` varchar(255) DEFAULT NULL,   `radiobox_labels` varchar(255) DEFAULT NULL,   `no_of_drpdwn` varchar(255) DEFAULT NULL,   `dropdown_labels` varchar(255) DEFAULT NULL, `panels` varchar(255) DEFAULT NULL,   `idname` varchar(255) DEFAULT NULL,   `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (`id`) )";
        statement.executeUpdate(query16);

        String query17 = "CREATE TABLE IF NOT EXISTS `Intake_BuisnessDetails` (   `legappname` varchar(255) DEFAULT NULL,   `reftoapp` varchar(255) DEFAULT NULL,   `tid` varchar(255) DEFAULT NULL,   `descr` varchar(255) DEFAULT NULL,   `vendor` varchar(255) DEFAULT NULL,   `expdate` varchar(255) DEFAULT NULL,   `noticeperiod` varchar(255) DEFAULT NULL,   `contractvalue` varchar(255) DEFAULT NULL,   `rod` varchar(255) DEFAULT NULL,   `cmnt` varchar(255) DEFAULT NULL,   `hasdep` varchar(255) DEFAULT NULL,   `dbsize` varchar(255) DEFAULT NULL,   `dataloc` varchar(255) DEFAULT NULL,   `siteloc` varchar(255) DEFAULT NULL,   `needarch` varchar(255) DEFAULT NULL,   `archcmnt` varchar(255) DEFAULT NULL,   `sourceoft` varchar(255) DEFAULT NULL,   `reccode` varchar(255) DEFAULT NULL,   `triggerdate` varchar(255) DEFAULT NULL,   `retentionperiod` varchar(255) DEFAULT NULL,   `retentiontable` varchar(255) DEFAULT NULL,   `retentionname` varchar(255) DEFAULT NULL,   `legalholds` varchar(255) DEFAULT NULL,   `wholegal` varchar(255) DEFAULT NULL,   `archexp` varchar(255) DEFAULT NULL,   `useforBI` varchar(255) DEFAULT NULL,   `creditacc` varchar(255) DEFAULT NULL,   `financialacc` varchar(255) DEFAULT NULL,   `dob` varchar(255) DEFAULT NULL,   `driverlic` varchar(255) DEFAULT NULL,   `email` varchar(255) DEFAULT NULL,   `family` varchar(255) DEFAULT NULL,   `gender` varchar(255) DEFAULT NULL,   `geoloc` varchar(255) DEFAULT NULL,   `img` varchar(255) DEFAULT NULL,   `income` varchar(255) DEFAULT NULL,   `ipadrs` varchar(255) DEFAULT NULL,   `martialstatus` varchar(255) DEFAULT NULL,   `mobid` varchar(255) DEFAULT NULL,   `name` varchar(255) DEFAULT NULL,   `phno` varchar(255) DEFAULT NULL,   `mailadrs` varchar(255) DEFAULT NULL,   `physic` varchar(255) DEFAULT NULL,   `race` varchar(255) DEFAULT NULL,   `religion` varchar(255) DEFAULT NULL,   `sexualpref` varchar(255) DEFAULT NULL,   `ssn` varchar(255) DEFAULT NULL,   `others` varchar(255) DEFAULT NULL,   `expl` varchar(255) DEFAULT NULL,   `localreq` varchar(255) DEFAULT NULL,   `localcountry` varchar(255) DEFAULT NULL,   `localinf` varchar(255) DEFAULT NULL,   `datacenters` varchar(255) DEFAULT NULL,   `extaccess` varchar(255) DEFAULT NULL,   `who` varchar(255) DEFAULT NULL,   `uname` varchar(255) DEFAULT NULL,   `roledesc` varchar(255) DEFAULT NULL,   `accreason` varchar(255) DEFAULT NULL,   `accfreq` varchar(255) DEFAULT NULL,   `sysreq` varchar(255) DEFAULT NULL,   `appname` varchar(255) DEFAULT NULL,   `projectname` varchar(255) DEFAULT NULL,   `app_data_arch` varchar(255) DEFAULT NULL,   `BItarget` varchar(255) DEFAULT NULL,   `BIengagement` varchar(255) DEFAULT NULL,   `id` int(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;";
        statement.executeUpdate(query17);
        String query18 = "CREATE TABLE IF NOT EXISTS `Intake_TechnicalCustomization` (   `label` varchar(255) DEFAULT NULL,   `type_of_box` varchar(255) DEFAULT NULL,   `mandatory` varchar(255) DEFAULT NULL,   `no_of_box` varchar(255) DEFAULT NULL,   `checkbox_labels` varchar(255) DEFAULT NULL,   `no_of_Rbox` varchar(255) DEFAULT NULL,   `radiobox_labels` varchar(255) DEFAULT NULL,   `no_of_drpdwn` varchar(255) DEFAULT NULL,   `dropdown_labels` varchar(255) DEFAULT NULL, `panels` varchar(255) DEFAULT NULL,   `idname` varchar(255) DEFAULT NULL,   `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (`id`) )";
        statement.executeUpdate(query18);
        String query19 = "CREATE TABLE IF NOT EXISTS `Intake_ArchivalRequirementCustomization` (   `label` varchar(255) DEFAULT NULL,   `type_of_box` varchar(255) DEFAULT NULL,   `mandatory` varchar(255) DEFAULT NULL,   `no_of_box` varchar(255) DEFAULT NULL,   `checkbox_labels` varchar(255) DEFAULT NULL,   `no_of_Rbox` varchar(255) DEFAULT NULL,   `radiobox_labels` varchar(255) DEFAULT NULL,   `no_of_drpdwn` varchar(255) DEFAULT NULL,   `dropdown_labels` varchar(255) DEFAULT NULL, `panels` varchar(255) DEFAULT NULL,   `idname` varchar(255) DEFAULT NULL,   `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (`id`) )";
        statement.executeUpdate(query19);
        String query20 = "CREATE TABLE IF NOT EXISTS `Decomm_Intake_req` (`id` varchar(255) DEFAULT NULL, `OppId` varchar(100) DEFAULT NULL, `OppName` varchar(100) DEFAULT NULL, `legacy_app_name` varchar(255) DEFAULT NULL,  `enterprise_team_decomm_prj_no` varchar(225) DEFAULT NULL, `app_identification_no` varchar(100) DEFAULT NULL, `infra_prj_no` varchar(255) DEFAULT NULL, `read_only_date` varchar(255) DEFAULT NULL)";
        statement.executeUpdate(query20);
        String query21 = "CREATE TABLE IF NOT EXISTS `Decomm_BusinessUnit_GeographicCode`(`id` varchar(255) DEFAULT NULL, `OppId` varchar(255) DEFAULT NULL, `OppName`varchar(255) DEFAULT NULL, `business_unit` varchar(255) DEFAULT NULL, `operation_unit` varchar(255) DEFAULT NULL, `location_unit` varchar(255) DEFAULT NULL, `dept` varchar(255) DEFAULT NULL)";
        statement.executeUpdate(query21);
        String query22 = "CREATE TABLE IF NOT EXISTS `Decomm_SiteLocation_Assets`(`id` varchar(255) DEFAULT NULL, `OppId` varchar(255) DEFAULT NULL, `OppName`varchar(255) DEFAULT NULL, `country` varchar(255) DEFAULT NULL, `city` varchar(255) DEFAULT NULL, `state` varchar(255) DEFAULT NULL, `office_designation` varchar(255) DEFAULT NULL)";
        statement.executeUpdate(query22);
        String query23 = "CREATE TABLE IF NOT EXISTS `Decomm_Intake_Contact_Info`(`seq_num` varchar(255) DEFAULT NULL, `prj_name` varchar(255) DEFAULT NULL, `app_name` varchar(255) DEFAULT NULL, `role` varchar(255) DEFAULT NULL, `user_name` varchar(255) DEFAULT NULL, `Email` varchar(255) DEFAULT NULL, `user_id` varchar(255) DEFAULT NULL, `contact_no` varchar(255) DEFAULT NULL )";
        statement.executeUpdate(query23);
        String query24 = "CREATE TABLE IF NOT EXISTS `Decomm_Legacy_Add_Table`(`seq_num` INTEGER (255) DEFAULT NULL, `prj_name` varchar(255) DEFAULT NULL, `app_name` varchar(255) DEFAULT NULL, `options` varchar(255) DEFAULT NULL, `label_name` varchar(255) DEFAULT NULL, `column_name` varchar(255) DEFAULT NULL, `type` varchar(255) DEFAULT NULL, `mandatory` varchar(255) DEFAULT NULL, `value` varchar(255) DEFAULT NULL)";
        statement.executeUpdate(query24);
        String query25 = "CREATE TABLE IF NOT EXISTS `Decomm_Manage_Execution_Info`(`seq_num` INTEGER (255) DEFAULT NULL, `prj_name` varchar(255) DEFAULT NULL, `app_name` varchar(255) DEFAULT NULL, `options` varchar(255) DEFAULT NULL, `label_name` varchar(255) DEFAULT NULL, `column_name` varchar(255) DEFAULT NULL, `type` varchar(255) DEFAULT NULL, `mandatory` varchar(255) DEFAULT NULL, `value` varchar(255) DEFAULT NULL)";
        statement.executeUpdate(query25);
        String query26 = "CREATE TABLE IF NOT EXISTS `Decomm_Manage_Infra_Comp`(`seq_num` INTEGER (255) DEFAULT NULL, `prj_name` varchar(255) DEFAULT NULL, `app_name` varchar(255) DEFAULT NULL,`infra_comp_type` varchar(255) DEFAULT NULL,`comp_name` varchar(255) DEFAULT NULL,`managed_legacy` varchar(255) DEFAULT NULL,`server_app` varchar(255) DEFAULT NULL,`dev` varchar(255) DEFAULT NULL,`test` varchar(255) DEFAULT NULL,`stage` varchar(255) DEFAULT NULL,`prod` varchar(255) DEFAULT NULL,`retired` varchar(255) DEFAULT NULL,`comments` varchar(255) DEFAULT NULL)";
        statement.executeUpdate(query26);
        String query27 = "CREATE TABLE IF NOT EXISTS `Decomm_Manage_Service_Categories_Checklist`(`seq_num` INTEGER (255) DEFAULT NULL, `prj_name` varchar(255) DEFAULT NULL, `app_name` varchar(255) DEFAULT NULL, `options` varchar(600) DEFAULT NULL, `label_name` varchar(255) DEFAULT NULL, `column_name` varchar(255) DEFAULT NULL, `type` varchar(255) DEFAULT NULL, `mandatory` varchar(255) DEFAULT NULL, `value` varchar(255) DEFAULT NULL,`dev` varchar(255), `test` varchar(255), `stage` varchar(255), `prod` varchar(255),`comments` varchar(600))";
        statement.executeUpdate(query27);
        String query28 = "CREATE TABLE IF NOT EXISTS `Decomm_Manage_Service_Categories_Checklist_others`(`prj_name` varchar(255) DEFAULT NULL, `app_name` varchar(255) DEFAULT NULL,`others`varchar(255) DEFAULT NULL, `questions` varchar(600) DEFAULT NULL, `type` varchar(255) DEFAULT NULL,`value` varchar(600) DEFAULT NULL,`level` INTEGER(255) DEFAULT NULL, `sub_seq` INTEGER(255) DEFAULT NULL, `dev` varchar(255), `test` varchar(255), `stage` varchar(255), `prod` varchar(255), `comments` varchar(600)) ";
        statement.executeUpdate(query28);
        String query29 = "CREATE TABLE IF NOT EXISTS `Decomm_Manage_Key_mile_stone`(`seq_num` INTEGER(255) DEFAULT NULL, `prj_name` varchar(255) DEFAULT NULL, `app_name` varchar(255) DEFAULT NULL, `tab_name` varchar(255) DEFAULT NULL, `tab_name_question` varchar(500) DEFAULT NULL, `tab_name_value` varchar(255))";
        statement.executeUpdate(query29);
        String query30 = "CREATE TABLE IF NOT EXISTS `Decomm_Manage_Service_Categories_Checklist_Server` (`seq_num` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255), `label_name` varchar(255),`column_name` varchar(255), `value` varchar(255),`dev` varchar(255),`test` varchar(255),`stage` varchar(255),`prod` varchar(255),`comments` varchar(600))";
        statement.executeUpdate(query30);
        String query31 = "CREATE TABLE IF NOT EXISTS `Opportunity_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255),INDEX(`column_name`,`value`))";
        statement.executeUpdate(query31);
        String query32 = "CREATE TABLE IF NOT EXISTS `Opportunity_Info_Template_Details` (`seq_no` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query32);
        String query33 = "CREATE TABLE IF NOT EXISTS `Opportunity_Info_Details` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query33);
        String query34 = "CREATE TABLE IF NOT EXISTS `Triage_Info_Template_Details` (`seq_no` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query34);
        String query35 = "CREATE TABLE IF NOT EXISTS `Triage_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query35);
        String query36 = "CREATE TABLE IF NOT EXISTS `Triage_Summary_Info_Template_Details` (`seq_no` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query36);
        String query37 = "CREATE TABLE IF NOT EXISTS `Triage_Summary_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`isCompleted` varchar(45) NULL DEFAULT 'No',`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query37);
        String query38 = "CREATE TABLE IF NOT EXISTS `Assessment_Compliance_Char_Info_Template_Details` (`seq_no` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query38);
        String query39 = "CREATE TABLE IF NOT EXISTS `Assessment_Compliance_Char_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query39);
        String query40 = "CREATE TABLE IF NOT EXISTS `Assessment_Application_Info_Template_Details` (`seq_no` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query40);
        String query41 = "CREATE TABLE IF NOT EXISTS `Assessment_Application_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query41);
        String query42 = "CREATE TABLE IF NOT EXISTS `Assessment_Contract_Info_Template_Details` (`seq_no` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query42);
        String query43 = "CREATE TABLE IF NOT EXISTS `Assessment_Contract_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query43);
         String query44 = "CREATE TABLE IF NOT EXISTS `Assessment_Data_Char_Info_Template_Details` (`seq_no` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query44);
        String query45 = "CREATE TABLE IF NOT EXISTS `Assessment_Data_Char_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query45);
        String query46 = "CREATE TABLE IF NOT EXISTS `Assessment_Archival_Consumption_Info_Template_Details` (`seq_no` INTEGER (255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query46);
        String query47 = "CREATE TABLE IF NOT EXISTS `Assessment_Archival_Consumption_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255),`Section` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`isCompleted` varchar(45) NULL DEFAULT 'No',`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query47);
        String query48 = "CREATE TABLE IF NOT EXISTS `Intake_Stake_Holder_Info` (`seq_no` INTEGER (255),`OppId` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `name` varchar(255),`emailId` varchar(255), `username` varchar(255),`role` varchar(255),`approvalId` varchar(255),`intakeApproval` varchar(255),`moduleId` varchar(255),`comments` varchar(500),`priority_order_num` varchar(55),`mail_flag` varchar(100),`submittedDate` varchar(50),`isCompleted` varchar(45) NULL DEFAULT 'No')";
        statement.executeUpdate(query48);
        String query49 = "CREATE TABLE IF NOT EXISTS `Module_Approval_Info` (`seq_no` INTEGER (255),`OppId` varchar(255),`moduleName` varchar(255),`overAllApproval` varchar(255))";
        statement.executeUpdate(query49);
        
        String query50 = "CREATE TABLE IF NOT EXISTS `Archive_Execution_Info` (`seq_no` INTEGER (255),`oppId` varchar(255),`oppName` varchar(255),`level` varchar(255),`taskId` varchar(255),`taskGroup` varchar(255),`taskName` varchar(255),`taskType` varchar(255),`majorDependencies` varchar(255),`assignedTo` varchar(255),`planSrt` varchar(255),`planEnd` varchar(255),`actSrt` varchar(255),`actEnd` varchar(255),`completion` varchar(255),`status` varchar(255),`remark` varchar(255))";
        statement.executeUpdate(query50);
        
        String query51 = "CREATE TABLE IF NOT EXISTS `Archive_Execution_Template_Info` (`seq_no` INTEGER (255),`level` varchar(255),`taskGroup` varchar(255),`taskName` varchar(255),`taskType` varchar(255),`majorDependencies` varchar(255),`assignedTo` varchar(255),`planSrt` varchar(255),`planEnd` varchar(255),`actSrt` varchar(255),`actEnd` varchar(255),`completion` varchar(255),`status` varchar(255),`remark` varchar(255))";
        statement.executeUpdate(query51);
	
	String query52 = "CREATE TABLE IF NOT EXISTS `ArchiveReq_Approver_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`Field_id` INTEGER (255),`ROLE` varchar(255),`NAME` varchar(255),`TITLE` varchar(255),`APPROVER_PURPOSE` varchar(255) )";
        statement.executeUpdate(query52);
        String query53 = "CREATE TABLE IF NOT EXISTS `ArchiveReq_LegacyApp_Info` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query53);
        String query54 = "CREATE TABLE IF NOT EXISTS `ArchiveReq_LegacyApp_Template_Details` (`seq_no` INTEGER (255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query54);
        String query55 = "CREATE TABLE IF NOT EXISTS `ArchiveReq_Roles_Info_Template_Details` (`seq_no` INTEGER (255), `role` varchar(255),`name` varchar(255), `email` varchar(255), `username` varchar(255), `priority` varchar(55),`approverpurpose` varchar(255))";
        statement.executeUpdate(query55);
        String query56 = "CREATE TABLE IF NOT EXISTS `ArchiveReq_Roles_Info` (`seq_no` INTEGER (255),`OppId` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `role` varchar(255),`name` varchar(255), `emailId` varchar(255),`username` varchar(255),`approvalId` varchar(255),`intakeApproval` varchar(255),`moduleId` varchar(255),`comments` varchar(500),`priority_order_num` varchar(55),`mail_flag` varchar(100),`submittedDate` varchar(50),`isCompleted` varchar(45) NULL DEFAULT 'No')";
        statement.executeUpdate(query56);
        String query57 = "CREATE TABLE IF NOT EXISTS `ArchiveIntro_Info` (`seq_no` INTEGER (255),`OppId` varchar(255), `app_name` varchar(255), `purpose` varchar(2000),`scope` varchar(2000), `assumption` varchar(2000),`isCompleted` varchar(45) NULL DEFAULT 'No')";
        statement.executeUpdate(query57);
        String query58 = "CREATE TABLE IF NOT EXISTS `ArchiveIntro_Info_template_details` (`seq_no` INTEGER (255),`OppId` varchar(255), `app_name` varchar(255), `purpose` varchar(255),`scope` varchar(255), `assumption` varchar(255))";
        statement.executeUpdate(query58);

        String query59 = "CREATE TABLE IF NOT EXISTS `Archive_Environment_Name_Info` (`seq_no` INTEGER (255),`OppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `devName` varchar(255),`testName` varchar(255), `stageName` varchar(255), `prodName` varchar(255))";
        statement.executeUpdate(query59);
        
        String query60 = "CREATE TABLE IF NOT EXISTS `Archive_Environment_ServerIp_Info` (`seq_no` INTEGER (255),`OppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `devServerIp` varchar(255),`testServerIp` varchar(255), `stageServerIp` varchar(255), `prodServerIp` varchar(255),`isCompleted` varchar(45) NULL DEFAULT 'No')";
        statement.executeUpdate(query60);
        
        String query61 = "CREATE TABLE IF NOT EXISTS `Archive_Retention_Template_Details` (`seq_no` INTEGER (255), `retentionCheck` varchar(255), `retentionLevel` varchar(255), `conditions` varchar(500), `dateUsedType` varchar(255), `dateUsed` varchar(255), `descp` varchar(500))";
        statement.executeUpdate(query61);
        
        String query62 = "CREATE TABLE IF NOT EXISTS `Archive_Retention_Info` (`seq_no` INTEGER (255),`OppId` varchar(255), `app_name` varchar(255), `prjName` varchar(255), `retentionCheck` varchar(255), `retentionLevel` varchar(255), `conditions` varchar(500), `dateUsedType` varchar(255), `dateUsed` varchar(255), `descp` varchar(500),`isCompleted` varchar(45) NULL DEFAULT 'No')";
        statement.executeUpdate(query62);
        
        String query63 = "CREATE TABLE IF NOT EXISTS `Archive_Retention_Content_Info` (`OppId` varchar(255), `app_name` varchar(255), `prjName` varchar(255), `contentInfo` varchar(2000))";
        statement.executeUpdate(query63);
        
        String query64 = "CREATE TABLE IF NOT EXISTS `ArchiveBussinessReq_Info` (`seq_no` INTEGER (255),`OppId` varchar(255), `app_name` varchar(255), `businessreq` varchar(2000))";
        statement.executeUpdate(query64);
        String query65 = "CREATE TABLE IF NOT EXISTS `ArchiveBussinessReq_Info_template_details` (`seq_no` INTEGER (255), `businessreq` varchar(2000))";
        statement.executeUpdate(query65);
        String query66 = "CREATE TABLE IF NOT EXISTS `BusinessReqinscope_Info` (`seq_no` INTEGER (255),`OppId` varchar(255),`prj_name` varchar(255), `OppName` varchar(255), `req_in_scope` varchar(255),`description` varchar(255))";
        statement.executeUpdate(query66);
        String query67 = "CREATE TABLE IF NOT EXISTS `BusinessReqinscope_Info_template_details` (`seq_no` INTEGER (255), `req_in_scope` varchar(255),`description` varchar(255))";
        statement.executeUpdate(query67);
        
        String query68 = "CREATE TABLE IF NOT EXISTS `Archive_DataReq_Template_Details` (`seq_no` INTEGER (255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `req` varchar(255), `additionInfo` varchar(255))";
        statement.executeUpdate(query68);
        
        String query69 = "CREATE TABLE IF NOT EXISTS `Archive_DataReq_Info` (`seq_no` INTEGER (255), `oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `req` varchar(255), `additionInfo` varchar(255))";
        statement.executeUpdate(query69);
        
        String query70 = "CREATE TABLE IF NOT EXISTS `Archive_RetentionLegalReq_Template_Details` (`seq_no` INTEGER (255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `descp` varchar(255), `additionInfo` varchar(255))";
        statement.executeUpdate(query70);
        
        String query71 = "CREATE TABLE IF NOT EXISTS `Archive_RetentionLegalReq_Info` (`seq_no` INTEGER (255), `oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `descp` varchar(255), `additionInfo` varchar(255),`isCompleted` varchar(45) NULL DEFAULT 'No')";
        statement.executeUpdate(query71);
        
        String query72 = "CREATE TABLE IF NOT EXISTS `Archive_SecurityReq_Template_Details` (`seq_no` INTEGER (255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `descp` varchar(255), `additionInfo` varchar(255))";
        statement.executeUpdate(query72);
        
        String query73 = "CREATE TABLE IF NOT EXISTS `Archive_SecurityReq_Info` (`seq_no` INTEGER (255), `oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `descp` varchar(255), `additionInfo` varchar(255))";
        statement.executeUpdate(query73);
        
        String query74 = "CREATE TABLE IF NOT EXISTS `Archive_UsabilityReq_Template_Details` (`seq_no` INTEGER (255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `descp` varchar(255), `additionInfo` varchar(255))";
        statement.executeUpdate(query74);
        
        String query75 = "CREATE TABLE IF NOT EXISTS `Archive_UsabilityReq_Info` (`seq_no` INTEGER (255), `oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `descp` varchar(255), `additionInfo` varchar(255))";
        statement.executeUpdate(query75);
        
        String query76 = "CREATE TABLE IF NOT EXISTS `Archive_AuditlReq_Template_Details` (`seq_no` INTEGER (255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `descp` varchar(255), `additionInfo` varchar(255))";
        statement.executeUpdate(query76);
        
        String query77 = "CREATE TABLE IF NOT EXISTS `Archive_AuditReq_Info` (`seq_no` INTEGER (255), `oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `reqId` varchar(255), `reqInScope` varchar(255), `reqType` varchar(255), `descp` varchar(255), `additionInfo` varchar(255),`isCompleted` varchar(45) NULL DEFAULT 'No')";
        statement.executeUpdate(query77);
	
        String query78 = "CREATE TABLE IF NOT EXISTS `Archive_ScreenReq_Info` (`seq_no` INTEGER (255), `oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `reqId` varchar(255), `screenDisplay` varchar(255), `purpose` varchar(255), `equivalentLegacy` varchar(255))";
        statement.executeUpdate(query78);
        
        String query79 = "CREATE TABLE IF NOT EXISTS `Archive_ScreenReq_SearchForm` (`seq_no` INTEGER (255), `oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `reqId` varchar(255), `searchForm` varchar(255), `searchField` varchar(255), `fieldFormat` varchar(255), `dataType` varchar(255), `dataRetrieval` varchar(255), `requiredField` varchar(255), `additionalInfo` varchar(255))";
        statement.executeUpdate(query79);
	
		String query80 = "CREATE TABLE IF NOT EXISTS `Archive_DocumentRevision_Info` (`seq_no` INTEGER (255), `oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255), `date` varchar(255), `version` varchar(255), `documentChanges` varchar(255), `changeAuthor` varchar(255))";
        statement.executeUpdate(query80);
	
	    String query81 = "CREATE TABLE IF NOT EXISTS `Governance_Info_Template_Details` (`seq_no` INTEGER (255),`options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query81);
    
        String query82 = "CREATE TABLE IF NOT EXISTS `Governance_Info_Details` (`seq_no` INTEGER (255), `waveId` varchar(255), `waveName` varchar(255), `prj_name` varchar(255), `options` varchar(14000),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query82);
        
        String query83 = "CREATE TABLE IF NOT EXISTS `Governance_Info` (`seq_no` INTEGER (255), `waveId` varchar(255), `waveName` varchar(255), `prj_name` varchar(255), `options` varchar(14000), `label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),INDEX(`waveName`))";
        statement.executeUpdate(query83);
        
        String query84 = "CREATE TABLE IF NOT EXISTS `Archive_Req_Addendum_Info` (`seq_no` INTEGER (255),`oppId` varchar(255), `oppName` varchar(255), `prjName` varchar(255),`labelName` varchar(255), `addendumInfo` varchar(5000))";
        statement.executeUpdate(query84);
        
        String query85 = "CREATE TABLE IF NOT EXISTS `ArchiveRequirements_Stake_Holder_Info` (`seq_no` INTEGER (255),`OppId` varchar(255),`prj_name` varchar(255), `OppName` varchar(255), `name` varchar(255), `role` varchar(255),`approvalId` varchar(255),`ArchiveRequirementApproval` varchar(255),`moduleId` varchar(255))";
        statement.executeUpdate(query85);
        
        String query86 = "CREATE TABLE IF NOT EXISTS `Phase_Info_Template_Details` (`seq_no` INTEGER (255),`options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query86);
    
        String query87 = "CREATE TABLE IF NOT EXISTS `Phase_Info_Details` (`seq_no` INTEGER (255), `phaseId` varchar(255), `phaseName` varchar(255), `prj_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query87);
        
        String query88 = "CREATE TABLE IF NOT EXISTS `Phase_Info` (`seq_no` INTEGER (255), `phaseId` varchar(255), `phaseName` varchar(255), `prj_name` varchar(255), `options` varchar(255), `label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),INDEX(`phaseName`))";
        statement.executeUpdate(query88);
        
        String query89 = "CREATE TABLE IF NOT EXISTS `Archive_Execution_Governance_Info` (`seq_no` INTEGER (255),`waveId` varchar(255),`waveName` varchar(255),`level` varchar(255),`taskId` varchar(255),`taskGroup` varchar(255),`taskName` varchar(255),`taskType` varchar(255),`majorDependencies` varchar(255),`assignedTo` varchar(255),`planSrt` varchar(255),`planEnd` varchar(255),`actSrt` varchar(255),`actEnd` varchar(255),`completion` varchar(255),`status` varchar(255),`remark` varchar(255))";
        statement.executeUpdate(query89);
        
        String query90 = "CREATE TABLE IF NOT EXISTS `Archive_Execution_Governance_Template_Info` (`seq_no` INTEGER (255),`level` varchar(255),`taskGroup` varchar(255),`taskName` varchar(255),`taskType` varchar(255),`majorDependencies` varchar(255),`assignedTo` varchar(255),`planSrt` varchar(255),`planEnd` varchar(255),`actSrt` varchar(255),`actEnd` varchar(255),`completion` varchar(255),`status` varchar(255),`remark` varchar(255))";
        statement.executeUpdate(query90);
        
        String query91 ="CREATE TABLE IF NOT EXISTS `Legacy_Application_Screenshot` ( seq_num INTEGER, AppId VARCHAR(255), File_Name VARCHAR(255), doc LONGBLOB);";
        statement.executeUpdate(query91);
        
        String query92 ="CREATE TABLE IF NOT EXISTS `Intake_Assessment_Application_Info_Doc` ( seq_num INTEGER, AppId VARCHAR(255), File_Name VARCHAR(255), doc LONGBLOB);";
        statement.executeUpdate(query92);
        
       	String query93 = "CREATE TABLE IF NOT EXISTS `ArchiveExe_Issue_Info_Template_Details` (`seq_no` INTEGER,`app_Id` varchar(255),`impact` varchar(255), `type` varchar(255), `description` varchar(500),`start_date` varchar(255), `raised_by` varchar(255),`status` varchar(500),`assigned_to` varchar(255),`resolved` varchar(255),`exp_date` varchar(255),`end_date` varchar(255),`comments` varchar(500))";
		statement.executeUpdate(query93);

		String query94 = "CREATE TABLE IF NOT EXISTS `ArchiveExe_Issue_Info` (`seq_no` INTEGER,`app_Id` varchar(255),`impact` varchar(255), `type` varchar(255), `description` varchar(500),`start_date` varchar(255), `raised_by` varchar(255),`status` varchar(500),`assigned_to` varchar(255),`resolved` varchar(255),`exp_date` varchar(255),`end_date` varchar(255),`comments` varchar(500),`oppId` varchar(255),`IssueId` varchar(255))";
        statement.executeUpdate(query94);
        
        String query95 = "CREATE TABLE IF NOT EXISTS `user_table` ( seq_num INTEGER, uemail VARCHAR(255), ufname VARCHAR(255), ugroup VARCHAR(255), ulname VARCHAR(255), pwd VARCHAR(255));";
        statement.executeUpdate(query95);
        
        String query96 = "CREATE TABLE IF NOT EXISTS `resources` ( seq_num INTEGER, r_name VARCHAR(255), r_email VARCHAR(255), r_title VARCHAR(255));";
        statement.executeUpdate(query96);
        
        String query97 = "CREATE TABLE IF NOT EXISTS `users` (`seq_num` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`seq_num`),`random_id` VARCHAR(255), `uname` VARCHAR(255), `ufname` VARCHAR(255), `ulname` VARCHAR(255), `u_email` VARCHAR(255), `u_pwd` VARCHAR(255), `u_group` VARCHAR(255),`u_role` VARCHAR(255));";
        statement.executeUpdate(query97);
        
        String query98 = "CREATE TABLE IF NOT EXISTS `license` (`id` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`),`license_info` longtext, `last_update_date` VARCHAR(255));";
        statement.executeUpdate(query98);
        
        String query99 = "CREATE TABLE IF NOT EXISTS `planAndPriorityInfo` (`rowId` varchar(255),`app_Id` varchar(255), `waveId` VARCHAR(255),`phaseId` VARCHAR(255),INDEX(`app_Id`));";
        statement.executeUpdate(query99);
        
        String query100 = "CREATE TABLE IF NOT EXISTS `archivereq_abbreviations_template_details` (`seq_no` int(11) NOT NULL,`abbreviation_acronym` varchar(255) DEFAULT NULL,`description` varchar(5000) DEFAULT NULL,PRIMARY KEY (`seq_no`));";
        statement.executeUpdate(query100);
        
        String query101 = "CREATE TABLE IF NOT EXISTS `archivereq_abbreviations_info_details` (`seq_no` varchar(255) NOT NULL,`random_id` VARCHAR(255),`app_id` varchar(255) DEFAULT NULL, `abbreviation_acronym` varchar(255) DEFAULT NULL,`description` varchar(5000) DEFAULT NULL,PRIMARY KEY (`random_id`));";
        statement.executeUpdate(query101);
        
        String query102 = "CREATE TABLE IF NOT EXISTS `archive_req_addendum_fileupload` (`seq_num` int(11) NOT NULL,`section_no` int(11) DEFAULT NULL, `oppId` varchar(255) DEFAULT NULL,`File_Name` varchar(255) DEFAULT NULL,`doc` longblob);";
        statement.executeUpdate(query102);
        String query103 = "CREATE TABLE IF NOT EXISTS `finance_informations` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255),INDEX(`column_name`,`value`))";
        statement.executeUpdate(query103);
        String query104 = "CREATE TABLE IF NOT EXISTS `finance_info_template_details` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255))";
        statement.executeUpdate(query104);
        String query105 = "CREATE TABLE IF NOT EXISTS `finance_informations_details` (`seq_no` INTEGER (255),`Id` varchar(255),`prj_name` varchar(255), `app_name` varchar(255), `options` varchar(255),`label_name` varchar(255), `column_name` varchar(255),`type` varchar(255),`mandatory` varchar(255),`value` varchar(255),`usermandatoryflag` varchar(255))";
        statement.executeUpdate(query105);
        String query106 ="CREATE TABLE IF NOT EXISTS `finance_screenshot_details` ( seq_num INTEGER, AppId VARCHAR(255), File_Name VARCHAR(255), doc LONGBLOB);";
        statement.executeUpdate(query106);
        String query107 =  " CREATE VIEW IF NOT EXISTS`finance_view` AS SELECT COALESCE(`fi`.`Project_number`, '') AS `Project Number`,COALESCE(`fi`.`Phase`, '') AS `Phase`,COALESCE(`fi`.`Application_Name`, '') AS `Application Name`,COALESCE(`fi`.`Software_and_Licensing`, '') AS `Software and Licensing`,COALESCE(`fi`.`Software_and_Licensing(Cost)`, '') AS `Software and Licensing($)`,COALESCE(`fi`.`Contract End Date`, '') AS `Contract_End_Date`,COALESCE(`fi`.`Contract End Date(Comments)`, '') AS `Comments`,COALESCE(`fi`.`scope_of_infrastructure`, '') AS `scope of infrastructure`,COALESCE(`fi`.`InfraStructure_Cost_Savings`, '') AS `InfraStructure Cost Savings`,COALESCE(`fi`.`Cost_Avoidance`, '') AS `Cost Avoidance`,COALESCE(`fi`.`Cost_of_Archive`, '') AS `Cost of Archive`,COALESCE(`fi`.`Total CBA`, '') AS `Total CBA`,COALESCE(`fi`.`Funding_approval`, '') AS `Funding approval`,COALESCE(`fi`.`Funding_type`, '') AS `Funding type`,COALESCE(`fi`.`Status`, '') AS `Status`,COALESCE(`fi`.`Id`, '') AS `Id`FROM(SELECT `your_table`.`Id` AS `Id`,MAX((CASEWHEN (`your_table`.`column_name` = 'ProjectNumber') THEN `your_table`.`value`END)) AS `Project_number`,MAX((CASEWHEN (`your_table`.`column_name` = 'Phase') THEN `your_table`.`value`END)) AS `Phase`,MAX((CASE WHEN (`your_table`.`column_name` = 'appName') THEN `your_table`.`value`END)) AS `Application_Name`,MAX((CASE WHEN (`your_table`.`column_name` = 'License') THEN `your_table`.`value`END)) AS `Software_and_Licensing`,MAX((CASE WHEN (`your_table`.`column_name` = 'License Cost') THEN `your_table`.`valueEND)) AS `Software_and_Licensing(Cost)`,MAX((CASE WHEN (`your_table`.`column_name` = 'Contract_Date') THEN `your_table`.`value`END)) AS `Contract End Date`,MAX((CASEWHEN (`your_table`.`column_name` = 'Contract_Date_Text') THEN `your_table`.`value`END)) AS `Contract End Date(Comments)`,MAX((CASE WHEN (`your_table`.`column_name` = 'Scope') THEN `your_table`.`value`END)) AS `scope_of_infrastructure`,MAX((CASE WHEN (`your_table`.`column_name` = 'InfraCost') THEN `your_table`.`value`END)) AS `InfraStructure_Cost_Savings`,MAX((CASE WHEN (`your_table`.`column_name` = 'Avoidance_Cost') THEN `your_table`.`value`END)) AS `Cost_Avoidance`,MAX((CASE WHEN (`your_table`.`column_name` = 'Archive_Cost') THEN `your_table`.`value`END)) AS `Cost_of_Archive`,MAX((CASE WHEN (`your_table`.`column_name` = 'CBA') THEN `your_table`.`value`END)) AS `Total CBA`,MAX((CASE WHEN (`your_table`.`column_name` = 'FundingDetails') THEN `your_table`.`value`END)) AS `Funding_approval`,MAX((CASE WHEN (`your_table`.`column_name` = 'Fundings') THEN `your_table`.`value`END)) AS `Funding_type`, MAX((CASE WHEN (`your_table`.`column_name` = 'Status') THEN `your_table`.`value` END)) AS `Status` FROM `your_table`WHERE(`your_table`.`column_name` IN ('appName', 'Phase', 'ProjectNumber', 'License', 'License Cost', 'Contract_Date', 'Contract_Date_Text', 'Scope', 'InfraCost', 'Avoidance_Cost', 'Archive_Cost', 'CBA', 'FundingDetails', 'Fundings', 'Status'))GROUP BY `your_table`.`Id`) `fi`;";
        statement.executeUpdate(query107);
        
%>
<% } catch (Exception ex) {
    ex.printStackTrace();
    System.err.println("[ERROR]-----Got an exception!-----Tables are already created----[ERROR]");
} finally {
    // close all the connections.
    statement.close();
    connection.close();
}
%>
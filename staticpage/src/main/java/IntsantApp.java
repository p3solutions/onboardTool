import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import org.apache.log4j.MDC;

import javax.servlet.ServletConfig;

import javax.servlet.ServletException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IntsantApp
 */
@WebServlet("/IntsantApp")
public class IntsantApp extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Logger logger = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntsantApp() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException

    {

        logger = Logger.getRootLogger();

        BasicConfigurator.configure();
    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed InstantApp servlet-----[INFO]");
        HttpSession details = request.getSession();
        String u_name = (String) details.getAttribute("username");

        String userid = u_name;
        MDC.put("USERID", userid);
        String u_role = (String) details.getAttribute("role");
        MDC.put("USERROLE", u_role);

        String appname = request.getParameter("appname");
        String prjname = request.getParameter("prjname");
        logger.info("created application " + appname + " in project " + prjname + " for AppEmphasize module");

        //System.out.println(appname+" "+prjname);
        class Application {

            String label, type_of_box, mandatory, no_of_box, checkbox_labels, no_of_Rbox, radiobox_labels, no_of_drpdwn, dropdown_labels, panels, idname;

            Application(String label, String type_of_box, String mandatory, String no_of_box, String checkbox_labels, String no_of_Rbox, String radiobox_labels, String no_of_drpdwn, String dropdown_labels, String panels, String idname) {
                this.label = label;
                this.type_of_box = type_of_box;
                this.mandatory = mandatory;
                this.no_of_box = no_of_box;
                this.checkbox_labels = checkbox_labels;
                this.no_of_Rbox = no_of_Rbox;
                this.radiobox_labels = radiobox_labels;
                this.no_of_drpdwn = no_of_drpdwn;
                this.dropdown_labels = dropdown_labels;
                this.panels = panels;
                this.idname = idname;

            }
        }

        Application app[] = new Application[70];
        app[0] = new Application("Legacy Application Name", "Text box", "Yes", "", "", "", "", "", "", "P1", "legappname");
        app[1] = new Application("References to Application", "Text box", "No", "", "", "", "", "", "", "P1", "reftoapp");
        app[2] = new Application("Tracking ID", "Text box", "No", "", "", "", "", "", "", "P1", "tid");
        app[3] = new Application("Description", "Text box", "Yes", "", "", "", "", "", "", "P1", "descr");
        app[4] = new Application("Legacy Application Vendor/Manufacturer", "Text box", "Yes", "", "", "", "", "", "", "P1", "vendor");
        app[5] = new Application("Contract Expiration Date", "Datepicker", "Yes", "", "", "", "", "", "", "P1", "expdate");
        app[6] = new Application("Notice Period for Expiration of Contract", "Text box", "No", "", "", "", "", "", "", "P1", "noticeperiod");
        app[7] = new Application("Contract Value of Application", "Text box", "No", "", "", "", "", "", "", "P1", "contractvalue");
        app[8] = new Application("Read Only Date", "Datepicker", "Yes", "", "", "", "", "", "", "P1", "rod");
        app[9] = new Application("Comment", "Text box", "No", "", "", "", "", "", "", "P1", "cmnt");
        app[10] = new Application("If the applications transitions has dependencies?", "Text box", "No", "", "", "", "", "", "", "P1", "hasdep");
        app[11] = new Application("Size of Database", "Text box", "Yes", "", "", "", "", "", "", "P1", "dbsize");
        app[12] = new Application("Location of Data", "Text box", "No", "", "", "", "", "", "", "P1", "dataloc");
        app[13] = new Application("Site Location of Data", "Text box", "No", "", "", "", "", "", "", "P1", "siteloc");
        app[14] = new Application("Does the application needs archival?", "Dropdown", "Yes", "", "", "", "", "3", "Yes/No/Other/", "P1", "needarch");
        app[15] = new Application("Comments", "Text box", "Yes", " ", " ", " ", "", " ", "", "P1", "archcmnt");
        app[16] = new Application("Is this Application\"s data the source of Truth?", "Check box", "No", "1", "Is this Application\"s data the source of Truth?/", "", "", "", "", "P1", "sourceoft");
        app[17] = new Application("Retention Code", "Text box", "Yes", "", "", "", "", "", "", "P2", "reccode");
        app[18] = new Application("Trigger Date Field", "Datepicker", "Yes", "", "", "", "", "", "", "P2", "triggerdate");
        app[19] = new Application("Period of Retention", "Text box", "Yes", "", "", "", "", "", "", "P2", "retentionperiod");
        app[20] = new Application("Table Name/s where Retention need to apply", "file", "Yes", "", "", "", "", "", "", "P2", "retentiontable");
        app[21] = new Application("Name of the Legal Retention & e-Discovery SME", "Text box", "Yes", "", "", "", "", "", "", "P2", "retentionname");
        app[22] = new Application("Does any Records have legal holds/Tax Holds or any indication?", "Dropdown", "No", "", "", "", "", "3", "Yes/No/Other", "P2", "legalholds");
        app[23] = new Application("Who or what entity provided legal or tax hold identification", "Text box", "No", "", "", "", "", "", "", "P2", "wholegal");
        app[24] = new Application("Should this application\"s data to be archived?", "Dropdown", "Yes", "", "", "", "", "2", "Yes/No", "P2", "app_data_arch");
        app[25] = new Application("Brief Explanation", "Text box", "No", "", "", "", "", "", "", "P2", "archexp");
        app[26] = new Application("Is this application\"s been used for BI report?", "Dropdown", "No", "", "", "", "", "2", "Yes/No", "P3", "useforBI");
        app[27] = new Application("Is BI aware of using new/alternate target application data to support operational report/", "Check box", "No", "1", "Is BI aware of using new/alternate target application data to support operational report/", "", "", "", "", "P3", "BItarget");
        app[28] = new Application("BI Engagement should be initiated by Application owner and completed prior archiving", "Check box", "No", "1", "BI Engagement should be initiated by Application owner and completed prior archiving/", "", "", "", "", "P3", "BIengagement");
        app[29] = new Application("Account Credit Card", "Check box", "No", "1", "Account Credit Card/", "", "", "", "", "P4", "creditacc");
        app[30] = new Application("Account Number - Financial", "Check box", "No", "1", "Account Number - Financial/", "", "", "", "", "P4", "financialacc");
        app[31] = new Application("Date of Birth", "Check box", "No", "1", "Date of Birth/", "", "", "", "", "P4", "dob");
        app[32] = new Application("Drivers License Number", "Check box", "No", "1", "Drivers License Number/", "", "", "", "", "P4", "driverlic");
        app[33] = new Application("Email Address", "Check box", "No", "1", "Email Address/", "", "", "", "", "P4", "email");
        app[34] = new Application("family Status", "Check box", "No", "1", "family Status/", "", "", "", "", "P4", "family");
        app[35] = new Application("Gender", "Check box", "No", "1", "Gender/", "", "", "", "", "P4", "gender");
        app[36] = new Application("Geo Location", "Check box", "No", "1", "Geo Location/", "", "", "", "", "P4", "geoloc");
        app[37] = new Application("Image or Video", "Check box", "No", "1", "Image or Video/", "", "", "", "", "P4", "img");
        app[38] = new Application("Income", "Check box", "No", "1", "Income/", "", "", "", "", "P4", "income");
        app[39] = new Application("IP Address", "Check box", "No", "1", "IP Address/", "", "", "", "", "P4", "ipadrs");
        app[40] = new Application("Martial Status", "Check box", "No", "1", "Martial Status/", "", "", "", "", "P4", "martialstatus");
        app[41] = new Application("Mobile Device Id", "Check box", "No", "1", "Mobile Device Id/", "", "", "", "", "P4", "mobid");
        app[42] = new Application("Name", "Check box", "No", "1", "Name/", "", "", "", "", "P4", "name");
        app[43] = new Application("Phone Number", "Check box", "No", "1", "Phone Number/", "", "", "", "", "P4", "phno");
        app[44] = new Application("Physical or Mailing Address", "Check box", "No", "1", "Physical or Mailing Address/", "", "", "", "", "P4", "mailadrs");
        app[45] = new Application("Physical Description", "Check box", "No", "1", "Physical Description/", "", "", "", "", "P4", "physic");
        app[46] = new Application("Race or Ethnicity", "Check box", "No", "1", "Race or Ethnicity/", "", "", "", "", "P4", "race");
        app[47] = new Application("Religion", "Check box", "No", "1", "Religion/", "", "", "", "", "P4", "religion");
        app[48] = new Application("Sexual Preference", "Check box", "No", "1", "Sexual Preference/", "", "", "", "", "P4", "sexualpref");
        app[49] = new Application("SSN", "Check box", "No", "1", "SSN/", "", "", "", "", "P4", "ssn");
        app[50] = new Application("Others", "Check box", "No", "1", "Others/", "", "", "", "", "P4", "others");
        app[51] = new Application("Brief Explanation", "Text box", "No", "", "", "", "", "", "", "P4", "expl");
        app[52] = new Application("Does the application have localization requirement/ regulations", "Dropdown", "Yes", "", "", "", "", "2", "Yes/No", "P4", "localreq");
        app[53] = new Application("List of Countries where localization requirement/ regulations apply", "Dropdown", "Yes", "", "", "", "", "2", "Yes/No", "P4", "localcountry");
        app[54] = new Application("Are the Localization requirements/regulations enforced with infrastructure or geofencing", "Dropdown", "Yes", "", "", "", "", "2", "Yes/No", "P4", "localinf");
        app[55] = new Application("Infrastructure Localization enforcement, please list the locations of the datacenters", "Dropdown", "Yes", "", "", "", "", "2", "Yes/No", "P4", "datacenters");
        app[56] = new Application("External access for archived data", "Dropdown", "No", "", "", "", "", "2", "Yes/No", "P4", "extaccess");
        app[57] = new Application("Describe who or what external entity needs access", "Text box", "No", "", "", "", "", "", "", "P4", "who");
        app[58] = new Application("User Name", "Text box", "No", "", "", "", "", "", "", "P4", "uname");
        app[59] = new Application("Role Description", "Text box", "No", "", "", "", "", "", "", "P4", "roledesc");
        app[60] = new Application("Reason for Access", "Text box", "No", "", "", "", "", "", "", "P4", "accreason");
        app[61] = new Application("Frequency of Access", "Text box", "No", "", "", "", "", "", "", "P4", "accfreq");
        app[62] = new Application("Additional System Requirements", "Text box", "No", "", "", "", "", "", "", "P4", "sysreq");

        class Technical {

            String label, type_of_box, mandatory, no_of_box, checkbox_labels, no_of_Rbox, radiobox_labels, no_of_drpdwn, dropdown_labels, panels, idname;

            Technical(String label, String type_of_box, String mandatory, String no_of_box, String checkbox_labels, String no_of_Rbox, String radiobox_labels, String no_of_drpdwn, String dropdown_labels, String panels, String idname) {
                this.label = label;
                this.type_of_box = type_of_box;
                this.mandatory = mandatory;
                this.no_of_box = no_of_box;
                this.checkbox_labels = checkbox_labels;
                this.no_of_Rbox = no_of_Rbox;
                this.radiobox_labels = radiobox_labels;
                this.no_of_drpdwn = no_of_drpdwn;
                this.dropdown_labels = dropdown_labels;
                this.panels = panels;
                this.idname = idname;

            }
        }

        Technical t[] = new Technical[70];
        t[0] = new Technical("Datatype Characteristics", "Radio box", "Yes", " ", " ", "3", "Structured/Unstructured/Hybrid/", " ", " ", "P5", "datatype");
        t[1] = new Technical("If the Data Type is Unstructured or Hybrid, process for extracting unstructured data?", "Text box", "Yes", " ", " ", " ", " ", " ", " ", "P5", "pname");
        t[2] = new Technical("Does Unstructured or Hybrid business objects needs to be archived?", "Dropdown", "Yes", " ", " ", " ", " ", "2", "Yes/No", "P5", "archneed");
        t[3] = new Technical("Please specify the formats", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "format");
        t[4] = new Technical(" ", "Check box", "No", "1", "Any Special or Multi Language characters or Foreign Language contained in the application?", " ", " ", " ", " ", "P5", "mlang");
        t[5] = new Technical(" ", "Check box", "No", "1", "If the legacy application contains local language, should the local language be maintained in the archive?", " ", " ", " ", " ", "P5", "loclang");
        t[6] = new Technical(" ", "Check box", "No", "1", "Based on the application data and date range of the data, is all or part of the data required to be retained beyond application retirement or repurposing?", " ", " ", " ", " ", "P5", "dateretain");
        t[7] = new Technical(" ", "Check box", "No", "1", "System Documentation and its Location", " ", " ", " ", " ", "P5", "systemdoc");
        t[8] = new Technical("User Documentation", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "userdoc");
        t[9] = new Technical("Technical Documentation", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "techdoc");
        t[10] = new Technical("Training Documentation", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "traindoc");
        t[11] = new Technical("Support Documentation", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "supportdoc");
        t[12] = new Technical("Data Dictionary", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "datadic");
        t[13] = new Technical("Test Case Documentation", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "testcasedoc");
        t[14] = new Technical("Testing Records", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "testrec");
        t[15] = new Technical("Design Specification", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "designspec");
        t[16] = new Technical("Requirements Specification", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "reqspec");
        t[17] = new Technical("Validation Plan", "Text box", "No", " ", " ", " ", " ", " ", " ", "P5", "validityplan");
        t[18] = new Technical("Server Name", "Text box", "Yes", " ", " ", " ", " ", " ", " ", "P6", "servername");
        t[19] = new Technical("Production Instances", "Text box", "Yes", " ", " ", " ", " ", " ", " ", "P6", "prodinstance");
        t[20] = new Technical("Location of Production Instances", "Text box", "Yes", " ", " ", " ", " ", " ", " ", "P6", "prodinstanceloc");
        t[21] = new Technical("Contact Name or Entity for Infrastructure Engagement", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "infraengage");
        t[22] = new Technical(" ", "Check box", "No", "1", "Do you need to archive source code?", " ", " ", " ", " ", "P6", "sourcearch");
        t[23] = new Technical("Is this Application a Hosted Service ?", "Dropdown", "No", " ", " ", " ", " ", "2", "Yes/No", "P6", "apphost");
        t[24] = new Technical("Duration for retention agreements with the vendor", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "retenduration");
        t[25] = new Technical("Does the legacy applicationâs data need to be archived in the client archive application", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "clientapp");
        t[26] = new Technical("Is the Application external customer facing or have a component of being external customer facing", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "extcustfacing");
        t[27] = new Technical("If external facing, web apps/website URLs", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "url");
        t[28] = new Technical("Database size of the application", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "dbsize");
        t[29] = new Technical("Estimated No of Table in the application", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "nooftable");
        t[30] = new Technical("Estimated No of Records(volume) in the application", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "noofrec");
        t[31] = new Technical("XML counts for the database", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "xmlcount");
        t[32] = new Technical("Does this application utilize any VPN environments (E.g. Citrix) for access", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "anyvpn");
        t[33] = new Technical("VPN access required for application access", "Check box", "No", "1", "Yes", " ", " ", " ", " ", "P6", "vpnacces");
        t[34] = new Technical("Does data in the Application integrate to or from other systems? ", "Check box", "No", "1", "Yes", " ", " ", " ", " ", "P6", "appintegrate");
        t[35] = new Technical("Specify the application to integrate ", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "integname");
        t[36] = new Technical("Ready Date for Complete Server decommission and Application Retirement", "Text box", "No", " ", " ", " ", " ", " ", " ", "P6", "decomdate");
        t[37] = new Technical("Downloadable Attachment1", "file", "No", " ", " ", " ", " ", " ", " ", "P7", "file1");
        t[38] = new Technical("Downloadable Attachment2", "file", "No", " ", " ", " ", " ", " ", " ", "P7", "file2");
        t[39] = new Technical("Downloadable Attachment3 ", "file", "No", " ", " ", " ", " ", " ", " ", "P7", "file3");
        t[40] = new Technical("Downloadable Attachment4", "file", "No", " ", " ", " ", " ", " ", " ", "P7", "file4");

        class Arch_Req {

            String label, type_of_box, mandatory, no_of_box, checkbox_labels, no_of_Rbox, radiobox_labels, no_of_drpdwn, dropdown_labels, panels, idname;

            Arch_Req(String label, String type_of_box, String mandatory, String no_of_box, String checkbox_labels, String no_of_Rbox, String radiobox_labels, String no_of_drpdwn, String dropdown_labels, String panels, String idname) {
                this.label = label;
                this.type_of_box = type_of_box;
                this.mandatory = mandatory;
                this.no_of_box = no_of_box;
                this.checkbox_labels = checkbox_labels;
                this.no_of_Rbox = no_of_Rbox;
                this.radiobox_labels = radiobox_labels;
                this.no_of_drpdwn = no_of_drpdwn;
                this.dropdown_labels = dropdown_labels;
                this.panels = panels;
                this.idname = idname;
            }
        }
        Arch_Req ar[] = new Arch_Req[30];
        ar[0] = new Arch_Req(" ", "Check box", "No", "1", "Current Legal holds on the application data must be applied to the application\"s archived data to override the Retention schedule", " ", " ", " ", "", "P9", "legalholds");
        ar[1] = new Arch_Req(" ", "Check box", "No", "1", "Data from application must be retained based on the Client Retention schedule", " ", " ", " ", "", "P9", "dataapp");
        ar[2] = new Arch_Req(" ", "Check box", "No", "1", "Data Localization Laws must be followed where relevant", " ", " ", " ", "", "P9", "dataloc");
        ar[3] = new Arch_Req(" ", "Check box", "No", "1", "The System has tools to reconstruct the data in its original format", " ", " ", " ", "", "P9", "reconsttools");
        ar[4] = new Arch_Req(" ", "Check box", "No", "1", "The System allows for user viewing of blob data in its original format in relationship to its structured data", " ", " ", " ", "", "P9", "viewblob");
        ar[5] = new Arch_Req(" ", "Check box", "No", "1", "Archived data maintains its field properties and formats from the source system (i.e. decimals, %, commas, .00x, YYY-MM-DD) to display values defined in Views and schemas", " ", " ", " ", "", "P9", "fieldprop");
        ar[6] = new Arch_Req(" ", "Check box", "No", "1", "Archived data maintains its field types from the source system (i.e. STRING, Integer, CHAR, VCHAR, Date) to display values defined in Views and schemas", " ", " ", " ", "", "P9", "fieldtype");
        ar[7] = new Arch_Req(" ", "Check box", "No", "1", "The System supports archiving special characters as found in source data to include Foreign characters", " ", " ", " ", "", "P9", "splchars");
        ar[8] = new Arch_Req(" ", "Check box", "No", "1", "The System supports archiving Foreign Language data and maintains the Language in the archive", " ", " ", " ", "", "P9", "foreignlang");
        ar[9] = new Arch_Req(" ", "Check box", "No", "1", "The System Maintains CLOBs from source systems", " ", " ", " ", "", "P9", "clob");
        ar[10] = new Arch_Req(" ", "Check box", "No", "1", "The System supports archiving unstructured formats such as word, excel, PowerPoint, pdf.", " ", " ", " ", "", "P9", "unstructarch");
        ar[11] = new Arch_Req(" ", "Check box", "No", "1", "Access to the Archive is role based and controlled through Active Directory.", " ", " ", " ", "", "P9", "accrole");
        ar[12] = new Arch_Req(" ", "Check box", "No", "1", "The System allows for configuration of data views.", " ", " ", " ", "", "P9", "dataview");
        ar[13] = new Arch_Req(" ", "Check box", "No", "1", "Completeness Control - record level check (The number of records sent from the Application are compared to the number of records posted to the target.)", " ", " ", " ", "", "P9", "complctrl");
        ar[14] = new Arch_Req(" ", "Check box", "No", "1", "Error Handling Control - record level check (During the load, records deemed as errors based on program logic will be written to an exception log in their entirety).", " ", " ", " ", "", "P9", "errctrl");
        ar[15] = new Arch_Req(" ", "Check box", "No", "1", "The System supports metadata management and indexing", " ", " ", " ", "", "P9", "metadata");
        ar[16] = new Arch_Req(" ", "Check box", "No", "1", "The System provides advanced search tools to include data parameters and the standard search tools", " ", " ", " ", "", "P9", "advsearch");
        ar[17] = new Arch_Req(" ", "Check box", "No", "1", "Based on search parameters, data can be exported out of the system for analysis", " ", " ", " ", "", "P9", "searchparam");



        try {
            // create a mysql database connection
            String myDriver = "org.gjt.mm.mysql.Driver";
            String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
            Class.forName(myDriver);
            Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
            try {
                for (int j = 0; j < 63; j++) {
                    String query = " insert into Intake_BuisnessCustomization (`label`,`type_of_box`,`mandatory`,`no_of_box`,`checkbox_labels`,`no_of_Rbox`,`radiobox_labels`,`no_of_drpdwn`,`dropdown_labels`,`panels`,`idname`,`appname`,`projectname`)"
                            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                    PreparedStatement preparedStmt = conn.prepareStatement(query);
                    preparedStmt.setString(1, app[j].label);
                    preparedStmt.setString(2, app[j].type_of_box);
                    preparedStmt.setString(3, app[j].mandatory);
                    preparedStmt.setString(4, app[j].no_of_box);
                    preparedStmt.setString(5, app[j].checkbox_labels);
                    preparedStmt.setString(6, app[j].no_of_Rbox);
                    preparedStmt.setString(7, app[j].radiobox_labels);
                    preparedStmt.setString(8, app[j].no_of_drpdwn);
                    preparedStmt.setString(9, app[j].dropdown_labels);
                    preparedStmt.setString(10, app[j].panels);
                    preparedStmt.setString(11, app[j].idname);
                    preparedStmt.setString(12, appname);
                    preparedStmt.setString(13, prjname);


                    preparedStmt.execute();
                }
            } catch (Exception e) {
                System.err.println("[ERROR]-----Got an exception!" + formatter.format(date) + "-----Buisness Page-----" + e.getMessage() + "----[ERROR]");
            }
            try {
                for (int j = 0; j < 41; j++) {
                    String query1 = " insert into Intake_TechnicalCustomization (`label`,`type_of_box`,`mandatory`,`no_of_box`,`checkbox_labels`,`no_of_Rbox`,`radiobox_labels`,`no_of_drpdwn`,`dropdown_labels`,`panels`,`idname`,`appname`,`projectname`)"
                            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                    PreparedStatement preparedStmt1 = conn.prepareStatement(query1);
                    preparedStmt1.setString(1, t[j].label);
                    preparedStmt1.setString(2, t[j].type_of_box);
                    preparedStmt1.setString(3, t[j].mandatory);
                    preparedStmt1.setString(4, t[j].no_of_box);
                    preparedStmt1.setString(5, t[j].checkbox_labels);
                    preparedStmt1.setString(6, t[j].no_of_Rbox);
                    preparedStmt1.setString(7, t[j].radiobox_labels);
                    preparedStmt1.setString(8, t[j].no_of_drpdwn);
                    preparedStmt1.setString(9, t[j].dropdown_labels);
                    preparedStmt1.setString(10, t[j].panels);
                    preparedStmt1.setString(11, t[j].idname);
                    preparedStmt1.setString(12, appname);
                    preparedStmt1.setString(13, prjname);


                    preparedStmt1.execute();
                }
            } catch (Exception e) {
                System.err.println("[ERROR]-----Got an exception!" + formatter.format(date) + "-----Technical page-----" + e.getMessage() + "----[ERROR]");
            }
            try {
                for (int j = 0; j < 18; j++) {
                    String query2 = " insert into Intake_ArchivalRequirementCustomization (`label`,`type_of_box`,`mandatory`,`no_of_box`,`checkbox_labels`,`no_of_Rbox`,`radiobox_labels`,`no_of_drpdwn`,`dropdown_labels`,`panels`,`idname`,`appname`,`projectname`)"
                            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement preparedStmt2 = conn.prepareStatement(query2);
                    preparedStmt2.setString(1, ar[j].label);
                    preparedStmt2.setString(2, ar[j].type_of_box);
                    preparedStmt2.setString(3, ar[j].mandatory);
                    preparedStmt2.setString(4, ar[j].no_of_box);
                    preparedStmt2.setString(5, ar[j].checkbox_labels);
                    preparedStmt2.setString(6, ar[j].no_of_Rbox);
                    preparedStmt2.setString(7, ar[j].radiobox_labels);
                    preparedStmt2.setString(8, ar[j].no_of_drpdwn);
                    preparedStmt2.setString(9, ar[j].dropdown_labels);
                    preparedStmt2.setString(10, ar[j].panels);
                    preparedStmt2.setString(11, ar[j].idname);
                    preparedStmt2.setString(12, appname);
                    preparedStmt2.setString(13, prjname);
                    preparedStmt2.execute();
                }
            } catch (Exception e) {
                System.err.println("[ERROR]-----Got an exception!" + formatter.format(date) + "-----Requirement Page" + e.getMessage() + "----[ERROR]");
            }

            int i = 0;

            // the mysql insert statement
            //System.out.println("Application update "+appname+"prj name "+prjname);
            String query_app = " insert into AppEmphazize_ApplicationInfo (appname, prjname)"
                    + " values (?,?)";

            PreparedStatement preparedStmt = conn.prepareStatement(query_app);
            preparedStmt.setString(1, appname);
            preparedStmt.setString(2, prjname);
            preparedStmt.execute();

            String query1 = "select appname from AppEmphazize_ApplicationInfo where prjname='" + prjname + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query1);
            int x = 20;
            int y = 1;
            int cnt = 0;

            while (rs.next()) {
                cnt = 0;
                System.out.println("Application name :" + rs.getString(1));


                String query2 = "select seq_num from ArchiveExecution_Details where name='Closure' and projects='" + prjname + "'";
                Statement st2 = conn.createStatement();
                ResultSet rs2 = st2.executeQuery(query2);
                String query7 = "select id from ArchiveExecution_Details where name='Execute'";
                Statement st7 = conn.createStatement();
                ResultSet rs7 = st7.executeQuery(query7);
                if (rs2.next() && rs7.next()) {

                    String query9 = "select name from ArchiveExecution_Details where level=2 and seq_num>=22 and seq_num<" + rs2.getInt(1) + " and projects='" + prjname + "'";
                    Statement st9 = conn.createStatement();
                    ResultSet rs9 = st9.executeQuery(query9);
                    while (rs9.next()) {
                        // System.out.println("projects name --- "+rs9.getString(1));
                        if (rs9.getString(1).equals(rs.getString(1))) {
                            cnt++;
                        }
                    }

                    //  System.out.println("aaa... "+cnt);

                    if (cnt == 0) {
                        String query3 = "update ArchiveExecution_Details set seq_num=seq_num+62 where seq_num>=" + rs2.getInt(1);
                        PreparedStatement preparedStmt1 = conn.prepareStatement(query3);
                        preparedStmt1.execute();
                        String query4 = "insert into ArchiveExecution_Details(seq_num,level,name,mem_ass,act_srt_date,act_end_date,pln_srt_date,pln_end_date,hours,planned_hrs,id,ref_id,projects,progressbar)" + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        PreparedStatement preparedStmt2 = conn.prepareStatement(query4);
                        preparedStmt2.setInt(1, rs2.getInt(1));
                        preparedStmt2.setInt(2, 2);
                        preparedStmt2.setString(3, rs.getString(1));
                        preparedStmt2.setString(4, "");
                        preparedStmt2.setString(5, "");
                        preparedStmt2.setString(6, "");
                        preparedStmt2.setString(7, "");
                        preparedStmt2.setString(8, "");
                        preparedStmt2.setString(9, "");
                        preparedStmt2.setString(10, "");
                        preparedStmt2.setString(11, String.valueOf(x));
                        preparedStmt2.setString(12, rs7.getString(1));
                        preparedStmt2.setString(13, prjname);
                        preparedStmt2.setString(14, "0");
                        preparedStmt2.execute();
                        int count = rs2.getInt(1);
                        String query5 = "select * from details";
                        Statement st5 = conn.createStatement();
                        ResultSet rs5 = st5.executeQuery(query5);
                        while (rs5.next()) {
                            //"" System.out.println(count);
                            String query6 = "insert into ArchiveExecution_Details(seq_num,level,name,mem_ass,act_srt_date,act_end_date,pln_srt_date,pln_end_date,hours,planned_hrs,id,ref_id,projects,progressbar)" + " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                            PreparedStatement preparedStmt3 = conn.prepareStatement(query6);
                            preparedStmt3.setInt(1, ++count);
                            preparedStmt3.setInt(2, rs5.getInt(1));
                            preparedStmt3.setString(3, rs5.getString(2));
                            preparedStmt3.setString(4, "");
                            preparedStmt3.setString(5, "");
                            preparedStmt3.setString(6, "");
                            preparedStmt3.setString(7, "");
                            preparedStmt3.setString(8, "");
                            preparedStmt3.setString(9, "");
                            preparedStmt3.setString(10, "");
                            preparedStmt3.setString(11, String.valueOf(y) + rs5.getString(3));
                            if (rs5.getInt(1) == 3)
                                preparedStmt3.setString(12, String.valueOf(x));
                            else
                                preparedStmt3.setString(12, String.valueOf(y) + rs5.getString(4));
                            preparedStmt3.setString(13, prjname);
                            preparedStmt3.setString(14, "0");
                            preparedStmt3.execute();

                        }
                    }
                    x++;
                    y++;

                }

            }


            conn.close();

        } catch (Exception e) {

            System.err.println("[ERROR]-----Got an exception!" + formatter.format(date) + "-----" + e.getMessage() + "----[ERROR]");
        }
        // return response

        response.sendRedirect("AppEmphasize_Application.jsp");


    }

}

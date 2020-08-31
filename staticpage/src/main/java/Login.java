import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sun.jersey.spi.inject.Errors;
import org.apache.log4j.BasicConfigurator;

import org.apache.log4j.Logger;

import org.apache.log4j.MDC;
import javax.servlet.ServletConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import onboard.encryption;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException

    {

              logger=Logger.getRootLogger();

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
		//System.out.println("HI");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	   System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Login servlet-----[INFO]");  
		// TODO Auto-generated method stub
		HttpSession details=request.getSession(); 
		HttpSession session=request.getSession();
		String userid=request.getParameter("usr");
		String pwd=request.getParameter("pwd"); 
		session.setAttribute("username",userid);
		details.setAttribute("u_Name",userid);
		
	
	class Samp
	{
		
		String seq_num,level,name,id,refid;
		Samp(String seq_num,String level,String name,String id,String refid)
		{
			this.seq_num=seq_num;
			this.level=level;
			this.name=name;
			this.id=id;
			this.refid=refid;
			
		}
	}

	class Exec
	{
		String level,name,id,refid,index;
		Exec(String level,String name,String id,String refid,String index)
		{
			this.level=level;
			this.name=name;
			this.id=id;
			this.refid=refid;
			this.index=index;
			
		}
	}

	class Role
	{
		String role,admin,app_emp,intake,arch_exe,decomm,prgm_governance,reporting,finance;
		Role(String role,String admin,String app_emp,String intake,String arch_exe,String decomm,String prgm_governance,String reporting,String finance)
		{
			this.role=role;
			this.admin=admin;
			this.app_emp=app_emp;
			this.intake=intake;
			this.arch_exe=arch_exe;
			this.decomm=decomm;
			this.prgm_governance=prgm_governance;
			this.reporting=reporting;
			this.finance=finance;
			
		}
		
	}
	
	class OpportunityDetails
	{
		int seq_num;
		String project,app_name,label,column,options,type,mandatory,value;
		OpportunityDetails(int seq_num, String project, String app_name, String options, String label, String column, String type, String mandatory, String value)
		{
			this.seq_num = seq_num;
			this.project = project;
			this.app_name = app_name;
			this.options = options;
			this.label = label;
			this.column = column;
			this.type = type;
			this.mandatory = mandatory;
			this.value = value;
		}
	}
	
	class Triage
	{
		int seq_num;
		String project,app_name,label,column,options,type,mandatory,value;
		Triage(int seq_num, String project, String app_name, String options, String label, String column, String type, String mandatory, String value)
		{
			this.seq_num = seq_num;
			this.project = project;
			this.app_name = app_name;
			this.options = options;
			this.label = label;
			this.column = column;
			this.type = type;
			this.mandatory = mandatory;
			this.value = value;
		}
	}
	
	class TriageSummary
	{
		int seq_num;
		String project,app_name,label,column,options,type,mandatory,value;
		TriageSummary(int seq_num, String project, String app_name, String options, String label, String column, String type, String mandatory, String value)
		{
			this.seq_num = seq_num;
			this.project = project;
			this.app_name = app_name;
			this.options = options;
			this.label = label;
			this.column = column;
			this.type = type;
			this.mandatory = mandatory;
			this.value = value;
		}
	}
	
	class Assessment
	{
		int seq_num;
		String project,app_name,section,label,column,options,type,mandatory,value;
		Assessment(int seq_num, String project, String app_name,String section, String options, String label, String column, String type, String mandatory, String value)
		{
			this.seq_num = seq_num;
			this.project = project;
			this.app_name = app_name;
			this.section = section;
			this.options = options;
			this.label = label;
			this.column = column;
			this.type = type;
			this.mandatory = mandatory;
			this.value = value;
		}
	}
	
	int i=0,exec_det=0,dum=0,lm=0;
	
		
try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool","root","password123");

	
	
	Statement st5= con.createStatement(); 
	ResultSet rs5=st5.executeQuery("select * from ArchiveExecution_Defaultvalues");
	Statement st6= con.createStatement(); 
	ResultSet rs6=st6.executeQuery("select * from details");
	Statement st7= con.createStatement(); 
	ResultSet rs7=st7.executeQuery("select * from dummy");
	Statement st8= con.createStatement(); 
	ResultSet rs8=st8.executeQuery("select * from Role_Details");
	while(rs8.next())
	lm++;
	while(rs5.next())
		i++;
	while(rs6.next())
		exec_det++;
	while(rs7.next())
		dum++;
	if(lm==0)
	{
		Role r[]=new Role[11];
		r[0]=new Role("Admin", "X", "X", "X", "X", "X", "X", "X", "R");
		r[1]=new Role("ArchivalAdmin", "X", "X", "X", "X", "X", "R", "X", "R");
		r[2]=new Role("LegacyTechnicalSME", "N", "X", "XR", "R", "N", "N", "R", "N");
		r[3]=new Role("LegacyBusinessSME", "N", "X", "RX", "R", "N", "N", "R", "N");
		r[4]=new Role("LegacyProgramManager", "N", "X", "X", "R", "N", "N", "R", "N");
		r[5]=new Role("ArchivalBusinessAnalyst", "N", "X", "X", "X", "N", "N", "X", "N");
		r[6]=new Role("ArchivalProgramManager", "R", "X", "X", "X", "X", "X", "X", "X");
		r[7]=new Role("ArchivalProjectManager", "R", "X", "X", "X", "X", "X", "X", "X");
		r[8]=new Role("ArchivalDeveloper", "N", "R", "R", "R", "N", "N", "R", "N");
		r[9]=new Role("TestLead", "N", "N", "N", "R", "N", "N", "R", "N");
		for(int j=0;j<10;j++){
		    String query = " insert into Role_Details (role, admin, app_emp, intake, arch_exe, decomm, prgm_governance, reporting, finance)"
		            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		          PreparedStatement preparedStmt = con.prepareStatement(query);
		          preparedStmt.setString(1, r[j].role);
		          preparedStmt.setString(2, r[j].admin);
		          preparedStmt.setString(3, r[j].app_emp);
		          preparedStmt.setString(4, r[j].intake);
		          preparedStmt.setString(5, r[j].arch_exe);
		          preparedStmt.setString(6, r[j].decomm);
		          preparedStmt.setString(7, r[j].prgm_governance);
		          preparedStmt.setString(8, r[j].reporting);
		          preparedStmt.setString(9, r[j].finance);
		   
		  	          
		     preparedStmt.execute();
		}
		
	}

	if(dum==0){
	String q = " insert into dummy (value)"
	        + " values (?)";

	      PreparedStatement preparedStmt01 = con.prepareStatement(q);

	      preparedStmt01.setString (1, "10000");

	      preparedStmt01.execute();
	      }

	if(i==0){
		Samp s[]=new Samp[30];
		s[0]=new Samp("1", "1", "Ideation and Initiate", "10000", "10000");
		s[1]=new Samp("2", "2", "Develop and Approve Business Case", "10012", "10000");
		s[2]=new Samp("3", "2", "Request Project in GPS with Assigned Project", "10011", "10000");
		s[3]=new Samp("4", "2", "Assign PM and Project Owner", "10010", "10000");
		s[4]=new Samp("5", "2", "Assign Priority and Project Risk Score", "10009", "10000");
		s[5]=new Samp("6", "2", "Gate1 Approval to Plan", "10004", "10000");
		s[6]=new Samp("7", "1", "Plan", "10001", "10001");
		s[7]=new Samp("8", "2", "Onboarding", "10015", "10001");
		s[8]=new Samp("9", "3", "Allocate Resources", "10017", "10015");
		s[9]=new Samp("10", "3", "Compliance Training", "10016", "10015");
		s[10]=new Samp("11", "2", "Project Kickoff", "10014", "10001");
		s[11]=new Samp("12", "2", "Project Plan", "10013", "10001");
		s[12]=new Samp("13", "3", "Draft project Plan", "10023", "10013");
		s[13]=new Samp("14", "3", "Delivery of draft project plan", "10022", "10013");
		s[14]=new Samp("15", "3", "Review project plan", "10021", "10013");
		s[15]=new Samp("16", "3", "Revise project plan", "10020", "10013");
		s[16]=new Samp("17", "3", "Delivery of project plan for approval", "10019", "10013");
		s[17]=new Samp("18", "3", "Approval of project plan", "10018", "10013");
		s[18]=new Samp("19", "2", "Process and Procedure definition", "10005", "10001");
		s[19]=new Samp("20", "3", "Archive Information and Requirements (AIR) Template", "10024", "10005");
		s[20]=new Samp("21", "1", "Execute", "10002", "10002");
		s[21]=new Samp("22", "1", "Closure", "10025", "10025");
		s[22]=new Samp("23", "2", "Hypercare Support", "10026", "10025");
		s[23]=new Samp("24", "2", "Exit criteria meeting and Retirement communication", "10027", "10025");
		s[24]=new Samp("25", "2", "Stakeholder communication", "10028", "10025");
		s[25]=new Samp("26", "2", "Lessons learned", "10029", "10025");
		s[26]=new Samp("27", "2", "Project close check list", "10030", "10025");
		s[27]=new Samp("28", "2", "Final finances and invoices", "10031", "10025");
		
	for(int j=0;j<28;j++){
	    String query = " insert into ArchiveExecution_Defaultvalues (seq_num, level, name, id, ref_id, mem_ass, act_srt_date, act_end_date, pln_srt_date, pln_end_date,  hours, stats, planned_hrs)"
	            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	          PreparedStatement preparedStmt = con.prepareStatement(query);
	          preparedStmt.setString(1, s[j].seq_num);
	          preparedStmt.setString(2, s[j].level);
	          preparedStmt.setString(3, s[j].name);
	          preparedStmt.setString(4, s[j].id);
	          preparedStmt.setString(5, s[j].refid);
	          preparedStmt.setString(6, "");
	          preparedStmt.setString(7, "");
	          preparedStmt.setString(8, "");
	          preparedStmt.setString(9, "");
	          preparedStmt.setString(10, "");
	          preparedStmt.setString(11, "");
	          preparedStmt.setString(12, "");
	          preparedStmt.setString(13, "");
	  	          
	     preparedStmt.execute();
	}
	}
	if(exec_det==0)
	{
		Exec e[]=new Exec[62];
		e[0]=new Exec("3", "Requirements", "101", "", "1");
		e[1]=new Exec("4", "Prepopulate Draft AIR and Load in Box", "114", "101", "2");
		e[2]=new Exec("4", "Send link to draft AIR to SME", "113", "101", "3");
		e[3]=new Exec("4", "Update AIR and Load in Box", "112", "101", "4");
		e[4]=new Exec("4", "Q&A with SME", "111", "101", "5");
		e[5]=new Exec("4", "Legacy System and Database Access", "110", "101", "6");
		e[6]=new Exec("4", "Functional Pillars Review", "109", "101", "7");
		e[7]=new Exec("4", "Sign Off Requirements (AIR, Approvals)", "108", "101", "8");
		e[8]=new Exec("4", "Finalized read only date for the application", "107", "101", "9");
		e[9]=new Exec("3", "Gate 2 Approval to Build", "102", "", "10");
		e[10]=new Exec("3", "Build and Test", "103", "", "11");
		e[11]=new Exec("4", "Configuration", "136", "103", "12");
		e[12]=new Exec("5", "Technical Design Document-Development", "145", "136", "13");
		e[13]=new Exec("5", "Technical Design Document ? Approval", "144", "136", "14");
		e[14]=new Exec("5", "Shell Application Set up", "143", "136", "15");
		e[15]=new Exec("5", "Ingestion Configuration", "142", "136", "16");
		e[16]=new Exec("5", "Build & Configuration Screens and Reports", "141", "136", "17");
		e[17]=new Exec("5", "ETL Extraction Scripts", "140", "136", "18");
		e[18]=new Exec("5", "ETL Jobs setup", "139", "136", "19");
		e[19]=new Exec("5", "Build Unit Test Scripts", "138", "136", "20");
		e[20]=new Exec("5", "Test Extraction for connection validation", "137", "136", "21");
		e[21]=new Exec("4", "Cycle 1 (Dev)", "135", "103", "22");
		e[22]=new Exec("5", "First Sample Extraction", "149", "135", "23");
		e[23]=new Exec("5", "Load of the Sample Extraction", "148", "135", "24");
		e[24]=new Exec("5", "Build Index", "147", "135", "25");
		e[25]=new Exec("5", "Unit Testing", "146", "135", "26");
		e[26]=new Exec("4", "Cycle 2 (Stage)", "133", "103", "27");
		e[27]=new Exec("5", "Promote Application to Stage", "153", "133", "28");
		e[28]=new Exec("5", "Test Script inventory - approval", "152", "133", "29");
		e[29]=new Exec("5", "First Full Extraction", "151", "133", "30");
		e[30]=new Exec("5", "Full Load and Build Index", "150", "133", "31");
		e[31]=new Exec("4", "UAT setup (Stage)", "132", "103", "32");
		e[32]=new Exec("5", "Access and Authentication setup for Application", "157", "132", "33");
		e[33]=new Exec("5", "Assistance to UAT Test Plan", "156", "132", "34");
		e[34]=new Exec("5", "Stakeholder Communication", "155", "132", "35");
		e[35]=new Exec("5", "Get Business approval to proceed with UAT", "154", "132", "36");
		e[36]=new Exec("4", "UAT", "131", "103", "37");
		e[37]=new Exec("5", "Pre - Test script inventoryapproval", "162", "131", "38");
		e[38]=new Exec("5", "Coordinate Business UAT", "161", "131", "39");
		e[39]=new Exec("5", "Business UAT", "160", "131", "40");
		e[40]=new Exec("5", "Review results, Defect Fixes", "159", "131", "41");
		e[41]=new Exec("5", "Job Aid Completion", "158", "131", "42");
		e[42]=new Exec("3", "Gate 3 Approval to Deploy", "104", "", "43");
		e[43]=new Exec("3", "Implement", "105", "", "44");
		e[44]=new Exec("4", "Pre-Deployment Activities", "116", "105", "45");
		e[45]=new Exec("5", "Stakeholder Communication", "122", "116", "46");
		e[46]=new Exec("5", "Create CI - Configuration Item request", "121", "116", "47");
		e[47]=new Exec("5", "Re-evaluate Access and  authentication setup for application", "120", "116", "48");
		e[48]=new Exec("5", "Review deployment team tasks and  timeline", "119", "116", "49");
		e[49]=new Exec("5", "Active Directory Integration", "118", "116", "50");
		e[50]=new Exec("5", "Deploy Infrastructure Components", "117", "116", "51");
		e[51]=new Exec("4", "Deployment Activities", "115", "105", "52");
		e[52]=new Exec("5", "Gather meta data for all the files that are extracted from", "130", "115", "53");
		e[53]=new Exec("5", "Migrate data from stage to prod", "129", "115", "54");
		e[54]=new Exec("5", "Migrate components from Stage to Prod- Federation", "128", "115", "55");
		e[55]=new Exec("5", "Create/Validate/update indexes", "127", "115", "56");
		e[56]=new Exec("5", "Request for Change (RFC)Submission and approval", "126", "115", "57");
		e[57]=new Exec("5", "Change Approval Board (CAB) Submission and approval", "125", "115", "58");
		e[58]=new Exec("5", "Release to production/operations environment", "124", "115", "59");
		e[59]=new Exec("5", "Migration Report sign-off", "123", "115", "60");
		e[60]=new Exec("3", "Gate 4 Approval to close", "106", "", "61");
		
		for(int j=0;j<61;j++){
		    String query3 = " insert into details (level, name, id, ref_id, indx)"
		            + " values (?, ?, ?, ?, ?)";

		          PreparedStatement preparedStmt3 = con.prepareStatement(query3);
		          preparedStmt3.setString(1, e[j].level);
		          preparedStmt3.setString(2, e[j].name);
		          preparedStmt3.setString(3, e[j].id);
		          preparedStmt3.setString(4, e[j].refid);
		          preparedStmt3.setString(5, e[j].index);
		  	          
		     preparedStmt3.execute();
		}
		
	}
	
	String NewOpportunityQuery = "select * from Opportunity_Info_Template_Details";
	Statement statement = con.createStatement();
	ResultSet rs_opportunity = statement.executeQuery(NewOpportunityQuery);
	
	if(!rs_opportunity.next())
	{
		OpportunityDetails opportunity[] = new OpportunityDetails[20];
		opportunity[0] = new OpportunityDetails(1,"","","","Application Id", "apmid", "Text box","Yes", "");
		opportunity[1] = new OpportunityDetails(2,"","","","Application Name", "appName", "Text box", "Yes", "");
		opportunity[2] = new OpportunityDetails(3,"","","","Creation Date", "creation_date", "Datepicker", "No", "");
		opportunity[3] = new OpportunityDetails(4,"","","","Request Source", "source", "Text box", "No", "");
		opportunity[4] = new OpportunityDetails(5,"","","","Status", "status", "Text box", "No", "");
		opportunity[5] = new OpportunityDetails(6,"","","Decommission,Archive,To be retired","Request Type", "request_type", "Dropdown", "Yes", "");
		opportunity[6] = new OpportunityDetails(7,"","","","Requester", "requester", "Text box", "Yes", "");
		opportunity[7] = new OpportunityDetails(8,"","","","Application Descrpition", "appdesc", "Text box", "No", "");
		opportunity[8] = new OpportunityDetails(9,"","","","Application Owner", "appowner", "Text box", "Yes", "");
		opportunity[9] = new OpportunityDetails(10,"","","","Business Owner", "businessowner", "Text box", "No", "");
		opportunity[10] = new OpportunityDetails(11,"","","","Development Owner/SME", "sme", "Text box", "Yes", "");
		opportunity[11] = new OpportunityDetails(12,"","","","Billing Code", "billcode", "Text box", "No", "");
		opportunity[12] = new OpportunityDetails(13,"","","","Buisness Segment", "buisnesssegment", "Text box", "No", "");
		opportunity[13] = new OpportunityDetails(14,"","","","Buisness Unit", "buisnessunit", "Text box", "No", "");
		opportunity[14] = new OpportunityDetails(15,"","","","Key Function", "keyfunction", "Text box", "No", "");
		opportunity[15] = new OpportunityDetails(16,"","","","Program or Segment Contact", "pscontact", "Text box", "No", "");
		opportunity[16] = new OpportunityDetails(17,"","","EMR System,ERP Data,Financial Data,HealthCare Data,HR Data,MR/HR Data,Other Data","Data Type", "date_type", "Dropdown", "No", "");
		opportunity[17] = new OpportunityDetails(18,"","","","If Other Data", "if_other_data", "Text box", "No", "");
		opportunity[18] = new OpportunityDetails(19,"","","","Please describe your needs for Archival and Decommission Service", "arcdecomm", "Text box", "No", "");
		opportunity[19] = new OpportunityDetails(20,"","","","Desired Completion Date", "completion_date", "Datepicker", "No", "");
		
		for (int index = 0; index<opportunity.length; index++)
		{
			String Opportunity_InsertQuery = "insert into Opportunity_Info_Template_Details (seq_no, prj_name, app_name, options, label_name, column_name, type, mandatory, value)"
										+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
				  PreparedStatement prestmt = con.prepareStatement(Opportunity_InsertQuery);
		          prestmt.setInt(1, opportunity[index].seq_num);
				  prestmt.setString(2, opportunity[index].project);
				  prestmt.setString(3, opportunity[index].app_name);
				  prestmt.setString(4, opportunity[index].options);
				  prestmt.setString(5, opportunity[index].label);
				  prestmt.setString(6, opportunity[index].column);
				  prestmt.setString(7, opportunity[index].type);
				  prestmt.setString(8, opportunity[index].mandatory);
				  prestmt.setString(9, opportunity[index].value);
				  
				prestmt.execute();
		
		}
	}
	
	String Triage_Query = "select * from Triage_Info_Template_Details";
	Statement statement1 = con.createStatement();
	ResultSet rs_Triage = statement1.executeQuery(Triage_Query);
	
	
	if(!rs_Triage.next())
	{
		Triage Details[] = new Triage[41];
		Details[0] = new Triage(1,"","","","Application Id", "appId", "Text box","No", "");
		Details[1] = new Triage(2,"","","","Application Name", "applicationName", "Text box", "No", "");
		Details[2] = new Triage(3,"","","","Application Description", "applicationDesc", "Text box", "No", "");
		Details[3] = new Triage(4,"","","","Application Owner", "applicationOwner", "Text box", "No", "");
		Details[4] = new Triage(5,"","","","Business Owner", "busOwner", "Text box", "No", "");
		Details[5] = new Triage(6,"","","","Developement Owner or SME", "devOwner", "Text box", "No", "");
		Details[6] = new Triage(7,"","","","Billing Code", "billing_Code", "Text box", "No", "");
		Details[7] = new Triage(8,"","","","Business Segement", "business_Segment", "Text box", "No", "");
		Details[8] = new Triage(9,"","","","Business Unit", "busUnit", "Text box", "No", "");
		Details[9] = new Triage(10,"","","","Program or Segement Contact", "segment_contact", "Text box", "No", "");
		Details[10] = new Triage(11,"","","","Logical Grouping", "logic_Grp", "Text box", "No", "");
		Details[11] = new Triage(12,"","","","Preliminary CBA", "Preliminary_CBA", "Text box", "No", "");
		Details[12] = new Triage(13,"","","Yes,No","Funding Available", "funding_Avl", "Dropdown", "No", "");
		Details[13] = new Triage(14,"","","","Program Funder", "prgFunder", "Text box", "No", "");
		Details[14] = new Triage(15,"","","","Project Portfolio Information", "PrjInfo", "Text box", "No", "");
		Details[15] = new Triage(16,"","","","Project Decomission Date", "Decom_date", "Datepicker", "No", "");
		Details[16] = new Triage(17,"","","Yes,No","Infrastructure Impact","infrastructure_impact", "Dropdown", "No", "");
		Details[17] = new Triage(18,"","","","Number of Infrastructure Components", "nmbr_of_infrastructure_components", "Text box", "No", "");
		Details[18] = new Triage(19,"","","Yes,No","Archival Solution", "archival_Sol", "Dropdown", "No", "");
		Details[19] = new Triage(20,"","","","Status/Notes", "Status", "Text box", "No", "");
		Details[20] = new Triage(21,"","","","Decom Analyst", "decomAnalyst", "Text box", "No", "");
		Details[21] = new Triage(22,"",""," Replace,Retire,Combine,Other","Rationalization Type", "rationalization_type", "Dropdown", "No", "");
		Details[22] = new Triage(23,"","","","If other, please describe ", "If_other_please_describe", "HiddenText", "Yes", "");
		Details[23] = new Triage(24,"","","Mainframe,Distibuted - Unix,Windows,hybrid,Others","Application platform", "appPlatfrm", "Dropdown", "Yes", "");
		Details[24] = new Triage(25,"","","","If Other,please describe ", "If_Other_describe", "HiddenText", "Yes", "");
		Details[25] = new Triage(26,"","","Yes,No","Is application and Data hosted externally?", "app_and_data_hosted", "Radio box", "No", "");
		Details[26] = new Triage(27,"","","","If yes,vendor?Location?", "vendor", "HiddenText", "Yes", "");
		Details[27] = new Triage(28,"","","Yes,No","Are there any compliance or legal drivers determining retirement by a certain date ", "compliance", "Radio box", "No", "");
		Details[28] = new Triage(29,"","","","If yes above,please describe", "describe", "HiddenText", "Yes", "");
		Details[29] = new Triage(30,"","","Yes,No","Are there any business or financial drivers determining retirement by a certain date?Eg.,contract expiring", "Financialdate", "Radio box", "No", "");
		Details[30] = new Triage(31,"","","","If Yes above,please describe", "plsdescribe", "HiddenText", "Yes", "");
		Details[31] = new Triage(32,"","","Yes,No","Are there any technical drivers determining retirement by a certain date?.(Eg server end of life ,support,software,end of life,support)", "TechincalDeterminingdate", "Radio box", "No", "");
		Details[32] = new Triage(33,"","","","If Yes above, please describe ", "pls_describe", "HiddenText", "Yes", "");
		Details[33] = new Triage(34,"","","","Please describe business need/use for Archival", "useforArchival", "Text box", "No", "");
		Details[34] = new Triage(35,"","","","Please describe at high-level your applications data ", "highlevelapplicationdata", "Text box", "No", "");
		Details[35] = new Triage(36,"","","","Idea Number", "ideaNmbr", "Text box", "No", "");
		Details[36] = new Triage(37,"","","","Demand Number ", "DemandNmbr", "Text box", "No", "");
		Details[37] = new Triage(38,"","","","Project Number ", "PrjNmbr", "Text box", "No", "");
		Details[38] = new Triage(39,"","","","Project Task Number ", "PrjctTaskNmbr", "Text box", "No", "");
		Details[39] = new Triage(40,"","","Yes,No","Big Rock ", "Bigrock", "Radio box", "No", "");
		Details[40] = new Triage(41,"","","","Denial Reason ", "DenialRsn", "Text box", "No", "");
		int j=1;
		for (int index = 0; index<Details.length; index++)
		{
			String Triage_InsertQuery = "insert into Triage_Info_Template_Details (seq_no, prj_name, app_name, options, label_name, column_name, type, mandatory, value)"
										+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
				  PreparedStatement prestmt = con.prepareStatement(Triage_InsertQuery);
		          prestmt.setInt(1, Details[index].seq_num);
				  prestmt.setString(2, Details[index].project);
				  prestmt.setString(3, Details[index].app_name);
				  prestmt.setString(4, Details[index].options);
				  prestmt.setString(5, Details[index].label);
				  prestmt.setString(6, Details[index].column);
				  prestmt.setString(7, Details[index].type);
				  prestmt.setString(8, Details[index].mandatory);
				  prestmt.setString(9, Details[index].value);
		          prestmt.execute();
		}
	}
	
	String TriageSummary = "select * from Triage_Summary_Info_Template_Details";
	Statement stTriSumm = con.createStatement();
	ResultSet rsTriSumm = stTriSumm.executeQuery(TriageSummary);
	
	if(!rsTriSumm.next())
	{
		TriageSummary Trisumm[] = new TriageSummary[6];
		Trisumm[0] = new TriageSummary(1,"","","","Idea Number", "ideaNumber", "Text box", "No", "");
		Trisumm[1] = new TriageSummary(2,"","","","Demand Number ", "DemandNumber", "Text box", "No", "");
		Trisumm[2] = new TriageSummary(3,"","","","Project Number ", "PrjNumber", "Text box", "No", "");
		Trisumm[3] = new TriageSummary(4,"","","","Project Task Number ", "PrjctTaskNumber", "Text box", "No", "");
		Trisumm[4] = new TriageSummary(5,"","","Yes,No","Big Rock ", "BigrockSumm", "Radio box", "No", "");
		Trisumm[5] = new TriageSummary(6,"","","","Denial Reason ", "DenialReason", "Text box", "No", "");
		
		for (int index = 0; index<Trisumm.length; index++)
		{
			String Triage_Summary_InsertQuery = "insert into Triage_Summary_Info_Template_Details (seq_no, prj_name, app_name, options, label_name, column_name, type, mandatory, value)"
					+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement prestmt1 = con.prepareStatement(Triage_Summary_InsertQuery);
			prestmt1.setInt(1, Trisumm[index].seq_num);
			prestmt1.setString(2, Trisumm[index].project);
			prestmt1.setString(3, Trisumm[index].app_name);
			prestmt1.setString(4, Trisumm[index].options);
			prestmt1.setString(5, Trisumm[index].label);
			prestmt1.setString(6, Trisumm[index].column);
			prestmt1.setString(7, Trisumm[index].type);
			prestmt1.setString(8, Trisumm[index].mandatory);
			prestmt1.setString(9, Trisumm[index].value);
			prestmt1.execute();
		
		}
	}
	
	String AssessmentDataChar = "select * from Assessment_Data_Char_Info_Template_Details";
	Statement AssDataCharst = con.createStatement();
	ResultSet AssDataCharrs = AssDataCharst.executeQuery(AssessmentDataChar);
	
	if(!AssDataCharrs.next())
	{
		String DataChar = "DataCharacteristics";
		Assessment Assdata[] = new Assessment[23];
		Assdata[0] = new Assessment(1,"","",DataChar,"DB2, MS SQL, MySQL, Oracle, Sybase, Other","Database type", "DatabaseType", "Dropdown", "Yes", "");
		Assdata[1] = new Assessment(2,"","",DataChar,"Flat File, Structured, Unstructured, Hybrid, Other","Data Type Characteristics ", "DataTypeCharacteristics", "Dropdown", "Yes", "");
		Assdata[2] = new Assessment(3,"","",DataChar,"","Structured Data - Database size of the Application (stated in GB) ", "StrucDBsize", "Text box", "Yes", "");
		Assdata[3] = new Assessment(4,"","",DataChar,"","Structured Data - Number of tables (if known) ", "StrucNoofTables", "Text box", "No", "");
		Assdata[4] = new Assessment(5,"","",DataChar,"","Unstructured Data - Volume of data (stated in GB) ", "UnstrucDataVolume", "Text box", "Yes", "");
        Assdata[5] = new Assessment(6,"","",DataChar,"","Unstructured Data - Number of files (E.g Attachments) ", "UnstrucNoofFiles", "Text box", "No", "");
        Assdata[6] = new Assessment(7,"","",DataChar,"","Database Server Name (Data Location) ", "DBServerName", "Text box", "No", "");
        Assdata[7] = new Assessment(8,"","",DataChar,"","Database Names ", "DBNames", "Text box", "No", "");
        Assdata[8] = new Assessment(9,"","",DataChar,"","Table Names if appropriate ", "TableNames", "Text box", "No", "");
        Assdata[9] = new Assessment(10,"","",DataChar,"","DBA Contact ", "DBAContact", "Text box", "No", "");
        Assdata[10] = new Assessment(11,"","",DataChar,"Yes,No","Are there any datasets on Mainframe  that this application uses? ", "DataSetMainframe", "RadioBoxDependencyYes", "No", "");
        Assdata[11] = new Assessment(12,"","",DataChar,"","If yes, please provide additional information","plsprovideinfo","TextBoxDependencyYes","No","");
        Assdata[12] = new Assessment(13,"","",DataChar,"Yes,No","Does this application generate any reports to other systems? ", "ReportGeneration", "RadioBoxDependencyYes", "No", "");
        Assdata[13] = new Assessment(14,"","",DataChar,"","If yes, please provide details ", "plsprovidedetails", "TextBoxDependencyYes", "No", "");
        Assdata[14] = new Assessment(15,"","",DataChar,"","File share location (unstructured) ", "FileShareLocation", "Text box", "No", "");
        Assdata[15] = new Assessment(16,"","",DataChar,"Yes,No","Data is static (no updates are being made) ", "StaticData", "Radio box", "Yes", "");        
        Assdata[16] = new Assessment(17,"","",DataChar,"Yes,No","Data is in Read Only state (no updates CAN be made) ", "ReadonlyData", "Radio box", "No", "");
        Assdata[17] = new Assessment(18,"","",DataChar,"","If yes, when was the last updates made? ", "LastUpdateMade", "DatepickerDependency", "No", "");
        Assdata[18] = new Assessment(19,"","",DataChar,"","If no, when is it expected to be read only? ", "ExpectedDate", "DatepickerDependency", "No", "");
        Assdata[19] = new Assessment(20,"","",DataChar,"PCI, SOX, Consumer PII, Customer PII, Associate PII, SSN","Application  Data ", "ApplicationData", "Dropdown", "Yes", "");
        Assdata[20] = new Assessment(21,"","",DataChar,"Yes,No","Upstream/Downstream dependencies ", "UpDownStream", "RadioBoxDependencyYes", "Yes", "");
        Assdata[21] = new Assessment(22,"","",DataChar,"","If yes, please decsribe ", "plsdescribeStreams", "TextBoxDependencyYes", "No", "");
        Assdata[22] = new Assessment(23,"","",DataChar,"","Date Range (age of records, e.g., 2009 - May, 2019) ", "Datepicker", "Text box", "No", "");
        
		for (int index = 0; index<Assdata.length; index++)
		{
			String AssessmentDataChar_InsertQuery = "insert into Assessment_Data_Char_Info_Template_Details (seq_no, prj_name, app_name, section, options, label_name, column_name, type, mandatory, value)"
					+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement prestmt2 = con.prepareStatement(AssessmentDataChar_InsertQuery);
			prestmt2.setInt(1, Assdata[index].seq_num);
			prestmt2.setString(2, Assdata[index].project);
			prestmt2.setString(3, Assdata[index].app_name);
			prestmt2.setString(4, Assdata[index].section);
			prestmt2.setString(5, Assdata[index].options);
			prestmt2.setString(6, Assdata[index].label);
			prestmt2.setString(7, Assdata[index].column);
			prestmt2.setString(8, Assdata[index].type);
			prestmt2.setString(9, Assdata[index].mandatory);
			prestmt2.setString(10, Assdata[index].value);
			prestmt2.execute();
		
		}
	}
	
	
	String AssessmentQuery = "Select * from Assessment_Compliance_Char_Info_Template_Details;";
	
	Statement AssessmentSt = con.createStatement();
	
	ResultSet AssessmentRs = AssessmentSt.executeQuery(AssessmentQuery);
	
	if(!AssessmentRs.next())
	{
		String ComplianceChar = "ComplianceCharacteristics";
		Assessment AssessmentDetails[] = new Assessment[12];
		AssessmentDetails[0] = new Assessment(1,"","",ComplianceChar,"","Retention Category","retentioncategory","Text box","No","");
		AssessmentDetails[1] = new Assessment(2,"","",ComplianceChar,"","Record Type","recordtype","Text box","No","");
		AssessmentDetails[2] = new Assessment(3,"","",ComplianceChar,"","Retention Period","retentionperiod","Text box","No","");
		AssessmentDetails[3] = new Assessment(4,"","",ComplianceChar,"Yes,No","Archival Required?","archivalrequired","Radio box","No","");
		AssessmentDetails[4] = new Assessment(5,"","",ComplianceChar,"","Remaining Retention Period (if applicable)","remainingretentionperiod","Datepicker","Yes","");
		AssessmentDetails[5] = new Assessment(6,"","",ComplianceChar,"","Special Data Retention Requirements","specialdataretention","Text box","No","");
		AssessmentDetails[6] = new Assessment(7,"","",ComplianceChar,"Yes,No","Legal Hold","legalhold","RadioBoxDependencyYes","Yes","");
		AssessmentDetails[7] = new Assessment(8,"","",ComplianceChar,"","If any, please describe details","ifanypleasedescribe","TextBoxDependencyYes","Yes","");
		AssessmentDetails[8] = new Assessment(9,"","",ComplianceChar,"Yes,No","Are there any pending litigations that impacts the retirment of the application and data","retirementappanddata","Radio box","Yes","");
		AssessmentDetails[9] = new Assessment(10,"","",ComplianceChar,"On Hold, Pending review, Cleared","Legal Status","legalstatus","Dropdown","Yes","");
		AssessmentDetails[10] = new Assessment(11,"","",ComplianceChar,"Yes,No","Any specific Purge requirements?","specificpurgerequirements","RadioBoxDependencyYes","Yes","");
		AssessmentDetails[11] = new Assessment(12,"","",ComplianceChar,"","If any, please describe details","describedetails","TextBoxDependencyYes","Yes","");		
		for (int index = 0; index<AssessmentDetails.length; index++)
		{
			String ComplianceChar_InsertQuery = "insert into Assessment_Compliance_Char_Info_Template_Details (seq_no, prj_name, app_name, section, options, label_name, column_name, type, mandatory, value)"
					+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement prestmt1 = con.prepareStatement(ComplianceChar_InsertQuery);			
			prestmt1.setInt(1, AssessmentDetails[index].seq_num);
			prestmt1.setString(2, AssessmentDetails[index].project);			
			prestmt1.setString(3, AssessmentDetails[index].app_name);
			prestmt1.setString(4, AssessmentDetails[index].section);
			prestmt1.setString(5, AssessmentDetails[index].options);
			prestmt1.setString(6, AssessmentDetails[index].label);
			prestmt1.setString(7,  AssessmentDetails[index].column);
			prestmt1.setString(8, AssessmentDetails[index].type);
			prestmt1.setString(9, AssessmentDetails[index].mandatory);
			prestmt1.setString(10, AssessmentDetails[index].value);
			prestmt1.execute();
		}
	}
	
	String AssessmentArchival = "Select * from Assessment_Archival_Consumption_Info_Template_Details";	
	Statement AssArchivalst = con.createStatement();	
	ResultSet AssArchivalrs = AssArchivalst.executeQuery(AssessmentArchival);
	
	if(!AssArchivalrs.next())
	{
		String ArchivConsump = "ArchivalConsumption";
		Assessment AssessmentArchiv[] = new Assessment[10];
		AssessmentArchiv[0] = new Assessment(1,"","",ArchivConsump,"Frequent users with Online Inquiry, Retention for Audit purposes, Ad-hoc reporting, Long-term Retention Only","Archival needs","archiveneed","Dropdown","Yes","");
		AssessmentArchiv[1] = new Assessment(2,"","",ArchivConsump,"","How many users are expected to use the InfoArchive system after archival?","archivalusercount","Text box","Yes","");
		AssessmentArchiv[2] = new Assessment(3,"","",ArchivConsump,"","Number of concurrent users","concurrentuser","Text box","No","");
		AssessmentArchiv[3] = new Assessment(4,"","",ArchivConsump,"","Estimated number of Search Forms (screens) needed in the archive ","noofsearch","Text box","Yes","");
		AssessmentArchiv[4] = new Assessment(5,"","",ArchivConsump,"","Please describe any known Search screen requirements","plsdescscrreq","Text box","Yes","");
		AssessmentArchiv[5] = new Assessment(6,"","",ArchivConsump,"","Frequency of Search","searchfreq","Text box","No","");
		AssessmentArchiv[6] = new Assessment(7,"","",ArchivConsump,"","Format of results (e.g., online, report, etc.)","resformat","Text box","Yes","");
		AssessmentArchiv[7] = new Assessment(8,"","",ArchivConsump,"","Response time requirement","responsetime","Text box","No","");
		AssessmentArchiv[8] = new Assessment(9,"","",ArchivConsump,"Yes,No","Encryption?","enc","Radio box","Yes","");
		AssessmentArchiv[9] = new Assessment(10,"","",ArchivConsump,"Yes,No","Data Masking?","datamask","Radio box","Yes","");
		for (int index = 0; index<AssessmentArchiv.length; index++)
		{
			String Archival_InsertQuery = "insert into Assessment_Archival_Consumption_Info_Template_Details (seq_no, prj_name, app_name, section, options, label_name, column_name, type, mandatory, value)"
					+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement prestmt3 = con.prepareStatement(Archival_InsertQuery);			
			prestmt3.setInt(1, AssessmentArchiv[index].seq_num);
			prestmt3.setString(2, AssessmentArchiv[index].project);			
			prestmt3.setString(3, AssessmentArchiv[index].app_name);
			prestmt3.setString(4, AssessmentArchiv[index].section);
			prestmt3.setString(5, AssessmentArchiv[index].options);
			prestmt3.setString(6, AssessmentArchiv[index].label);
			prestmt3.setString(7,  AssessmentArchiv[index].column);
			prestmt3.setString(8, AssessmentArchiv[index].type);
			prestmt3.setString(9, AssessmentArchiv[index].mandatory);
			prestmt3.setString(10, AssessmentArchiv[index].value);
			prestmt3.execute();
		}
	}
	
	 String AssessAppInfoQuery = "Select * from Assessment_Application_Info_Template_Details;";
		
		Statement AssessAppInfoSt = con.createStatement();
		
		ResultSet AssessAppInfoRs = AssessAppInfoSt.executeQuery(AssessAppInfoQuery);
		
		if(!AssessAppInfoRs.next())
		{
			String AppInfo = "ApplicationInformation";
			Assessment AssessmentDetails[] = new Assessment[19];
			AssessmentDetails[0] = new Assessment(1,"","",AppInfo,"Shrink Wrap,Third Party,Internally Developed","Application Details","AppDetails","Dropdown","No","");
			AssessmentDetails[1] = new Assessment(2,"","",AppInfo,"Currently supported, Nearing end of life, End of life with extended support/maintenance, unsupported","Lifecycle","Lifecycle","Dropdown","No","");
			AssessmentDetails[2] = new Assessment(3,"","",AppInfo,"Yes,No","Is this a currently supported application?","SupportedApp","RadioBoxDependencyNo","No","");
			AssessmentDetails[3] = new Assessment(4,"","",AppInfo,"","If NO,who supports this Application?","SupportApp","TextBoxDependencyNo","No","");
			AssessmentDetails[4] = new Assessment(5,"","",AppInfo,"Yes,No","Operational support staff/SME's available for analysis?","OperationalSupportStaff","Radio box","No","");
			AssessmentDetails[5] = new Assessment(6,"","",AppInfo,"Mainframe,Distibuted - Unix,Windows,hybrid,Others","Application platform","AssessAppPlatform","Dropdown","Yes","");
			AssessmentDetails[6]= new Assessment(7,"","",AppInfo,"","If Other,please describe ", "OtherPleaseDescribe", "Text box", "Yes", "");
			AssessmentDetails[7] = new Assessment(8,"","",AppInfo,"","Brief architecture description","BriefArchitectureDescription","TextAreaFile","Yes","");
			AssessmentDetails[8] = new Assessment(9,"","",AppInfo,"","Application Hosting Vendor","AppHost","Text box","No","");
			AssessmentDetails[9] = new Assessment(10,"","",AppInfo,"","Application Supporting Vendor","AppSupport","Text box","No","");
			AssessmentDetails[10] = new Assessment(11,"","",AppInfo,"","Decommission Readiness Date","DecomReadiness","Datepicker","No","");
			AssessmentDetails[11] = new Assessment(12,"","",AppInfo,"","Data Migration complete","DataMigrationComplete","Datepicker","No","");
			AssessmentDetails[12] = new Assessment(13,"","",AppInfo,"","Data Migrated to <application name>:","DataMigrateApp","Text box","No","");
			AssessmentDetails[13] = new Assessment(14,"","",AppInfo,"Yes,No","Are there any compliance or legal drivers determining retirement by a certain date?","ComplianceLegalDrivers","RadioBoxDependencyYes","No","");
			AssessmentDetails[14] = new Assessment(15,"","",AppInfo,"","If Yes above, please describe","PleaseDescribe1","TextBoxDependencyYes","No","");
			AssessmentDetails[15] = new Assessment(16,"","",AppInfo,"Yes,No","Are there any business or financial drivers determining retirement by a certain date?","BusinessDriversDrivers","RadioBoxDependencyYes","No","");
			AssessmentDetails[16] = new Assessment(17,"","",AppInfo,"","If Yes above, please describe","PleaseDescribe2","TextBoxDependencyYes","No","");
			AssessmentDetails[17] = new Assessment(18,"","",AppInfo,"Yes,No","Are there any technical drivers determining retirement by a certain date?","TechnicalDrivers","RadioBoxDependencyYes","No","");
			AssessmentDetails[18] = new Assessment(19,"","",AppInfo,"","If Yes above, please describe","PleaseDescribe3","TextBoxDependencyYes","No","");

		for (int index = 0; index<AssessmentDetails.length; index++)
		{
			String AppInfo_InsertQuery = "insert into Assessment_Application_Info_Template_Details (seq_no, prj_name, app_name, section, options, label_name, column_name, type, mandatory, value)"
					+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement prestmt1 = con.prepareStatement(AppInfo_InsertQuery);			
			prestmt1.setInt(1, AssessmentDetails[index].seq_num);
			prestmt1.setString(2, AssessmentDetails[index].project);			
			prestmt1.setString(3, AssessmentDetails[index].app_name);
			prestmt1.setString(4, AssessmentDetails[index].section);
			prestmt1.setString(5, AssessmentDetails[index].options);
			prestmt1.setString(6, AssessmentDetails[index].label);
			prestmt1.setString(7,  AssessmentDetails[index].column);
			prestmt1.setString(8, AssessmentDetails[index].type);
			prestmt1.setString(9, AssessmentDetails[index].mandatory);
			prestmt1.setString(10, AssessmentDetails[index].value);
			prestmt1.execute();
		}
	}

    //Template tale for Assessment Contract Information
	
    String AssessContractInfoQuery = "Select * from Assessment_Contract_Info_Template_Details;";
	
	Statement AssessContractInfoSt = con.createStatement();
	
	ResultSet AssessContractInfoRs = AssessContractInfoSt.executeQuery(AssessContractInfoQuery);
	
	if(!AssessContractInfoRs.next())
	{
		String ContractInfo = "ContractInformation";
		Assessment AssessmentDetails[] = new Assessment[5];
		AssessmentDetails[0] = new Assessment(1,"","",ContractInfo,"","Contract:  Vendor Name","VendorName","Text box","Yes","");
		AssessmentDetails[1] = new Assessment(2,"","",ContractInfo,"","Contract:  Vendor Contact Name","VendorContactName","Text box","No","");
		AssessmentDetails[2] = new Assessment(3,"","",ContractInfo,"","Contract:  App Name","ContractAppName","Text box","Yes","");
		AssessmentDetails[3] = new Assessment(4,"","",ContractInfo,"","Contract:  Expiration Date","ExpirationDate","Datepicker","Yes","");
		AssessmentDetails[4] = new Assessment(5,"","",ContractInfo,"","Contract Termination Notice Period","TerminationNoticePeriod","Text box","No","");

		for (int index = 0; index<AssessmentDetails.length; index++)
		{
			String ContractInfo_InsertQuery = "insert into Assessment_Contract_Info_Template_Details (seq_no, prj_name, app_name, section, options, label_name, column_name, type, mandatory, value)"
					+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement prestmt1 = con.prepareStatement(ContractInfo_InsertQuery);			
			prestmt1.setInt(1, AssessmentDetails[index].seq_num);
			prestmt1.setString(2, AssessmentDetails[index].project);			
			prestmt1.setString(3, AssessmentDetails[index].app_name);
			prestmt1.setString(4, AssessmentDetails[index].section);
			prestmt1.setString(5, AssessmentDetails[index].options);
			prestmt1.setString(6, AssessmentDetails[index].label);
			prestmt1.setString(7,  AssessmentDetails[index].column);
			prestmt1.setString(8, AssessmentDetails[index].type);
			prestmt1.setString(9, AssessmentDetails[index].mandatory);
			prestmt1.setString(10, AssessmentDetails[index].value);
			prestmt1.execute();
		}
	}

	
	Statement st= con.createStatement(); 
	ResultSet rs=st.executeQuery("select * from Admin_UserDetails where uname='"+userid+"'");


	if(userid.equals("admin")&&pwd.equals("admin"))
	{
		
		details.setAttribute("role","admin");
		details.setAttribute("projects","all");
		details.setAttribute("admin","X");
		details.setAttribute("prj","X");
		details.setAttribute("app_emp","X");
		details.setAttribute("intake","X");
		details.setAttribute("archive_exec","X");

	    String redirectURL = "OpportunityList.jsp";

	    response.sendRedirect(redirectURL);
	}
	else
		{
		if(rs.next()) 
		
	{
		
		encryption et=new encryption();
		  String passw=(String)et.decrypt(rs.getString(5));
		// System.out.println("decrypted pass is "+passw+" and entered passw is "+pwd);
			if((passw.equals(pwd)))
	{ 
		details.setAttribute("role",rs.getString(7));
		details.setAttribute("projects",rs.getString(6));
		details.setAttribute("applications",rs.getString(11));
		Statement st1= con.createStatement(); 
		ResultSet rs1=st.executeQuery("select * from Role_Details where role='"+rs.getString(7)+"'"); 
		if(rs1.next())
		{
			details.setAttribute("admin",rs1.getString(2));
			details.setAttribute("app_emp",rs1.getString(3));
			details.setAttribute("intake",rs1.getString(4));
			details.setAttribute("archive_exec",rs1.getString(5));
			
		}
		


		
		
		
			        String redirectURL = "OpportunityList.jsp";
		
			        response.sendRedirect(redirectURL);
		
			   

	}
			else 
			{ 
				
				response.sendRedirect("Login_Error.jsp?ErrorMessage=Password is Incorrect");//pwd is incorrect
			}
			
				
			
	
		
	}
		else {
            //System.out.println("if");
            String msg = "";
            if (!userid.equals("admin")) {
                msg = "This user not yet registered.";
            } else
            {
                msg="Password is Incorrect";
            }
			response.sendRedirect("Login_Error.jsp?ErrorMessage="+msg);// user you have entered not registered.
		}
		}
	
	String u_name=(String)details.getAttribute("username");
	String u_role=(String)details.getAttribute("role");
		String user_id=u_name;
				MDC.put("USERID", user_id);
				MDC.put("USERROLE", u_role);
				
   
				logger.info("Logged In"); 
}
	
catch( Exception e)
{
	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
}
	
		
	

}
}
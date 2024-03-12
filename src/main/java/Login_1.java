import ArchiveExecutionGovernanceModule.service.ArchiveExecutionGovernanceTemplateService;
import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionTemplateService;
import Finance.FinanceAppTemplateService;
import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveReqLegacyAppTemplateService;
import NewArchiveRequirements.LegacyApplicationInfo.retentionDetails.Service.archiveRetentionTemplateDetailsService;
import NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service.archiveFunDataReqTemplate;
import onboard.DBconnection;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import logger.System;

/**
 * Servlet implementation class Login_1
 */
@WebServlet("/Login_1")
public class Login_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login_1() {
		super();
		// TODO Auto-generated constructor stub
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
		// TODO Auto-generated method stub
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		Date date = new Date();  
		System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Login servlet-----[INFO]");  
		// TODO Auto-generated method stub
		HttpSession details=request.getSession(); 
		HttpSession session=request.getSession();

		String user_email=request.getParameter("user_email");
		String user_fname=request.getParameter("user_fname");
		String user_lname=request.getParameter("user_lname");
		String username=request.getParameter("username");
		String user_group=request.getParameter("user_group");

		session.setAttribute("username",username);
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
		class GovernanceDetails
		{
			int seq_num;
			String label,column,options,type,mandatory,value;
			GovernanceDetails(int seq_num, String options, String label, String column, String type, String mandatory, String value)
			{
				this.seq_num = seq_num;
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
		class rolesRespons{
			int seq_no;
			String role, name, email, username, priority,approverPurpose;
			rolesRespons(int seq_no, String role, String name, String email, String username,String priority,String approverPurpose){
				this.seq_no = seq_no;
				this.role = role;
				this.name = name;
				this.email = email;
				this.username = username;
				this.priority = priority;
				this.approverPurpose = approverPurpose;
			}
		}
		class BusinessReqInScope{
			int seq_no;
			String req_in_scope, description;
			BusinessReqInScope(int seq_no, String req_in_scope, String description){
				this.seq_no = seq_no;
				this.req_in_scope = req_in_scope;
				this.description = description;
			}
		}
		int i=0,exec_det=0,dum=0,lm=0;
		try
		{	PreparedStatement st5=null,st6=null,st7=null,st8=null,stTriSumm=null,AssDataCharst=null,statement=null,statements=null,PhaseStatement=null,statement1=null,stRoleRes=null,AssessmentSt=null,AssArchivalst=null,AssessAppInfoSt=null,AssessContractInfoSt=null,stBusReqInScope=null;
		ResultSet rs5=null,rs6=null,rs7=null,rs8=null,rsTriSumm=null,AssDataCharrs=null,rs_opportunity=null,rs_governance=null,rs_phase=null,rs_Triage=null,RsroleRes=null,AssessmentRs=null,AssArchivalrs=null,AssessAppInfoRs=null,AssessContractInfoRs=null,RsBusReqInScope=null;

		DBconnection dbConnection = new DBconnection();
		Connection con = (Connection) dbConnection.getConnection();
		st5= con.prepareStatement("select * from ArchiveExecution_Defaultvalues");
		rs5=st5.executeQuery();
		st6= con.prepareStatement("select * from details");
		rs6=st6.executeQuery();
		st7= con.prepareStatement("select * from dummy"); 
		rs7=st7.executeQuery();
		st8= con.prepareStatement("select * from Role_Details");
		rs8=st8.executeQuery();
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
		String NewOpportunityQuery = "select * from Opportunity_Info_Template_Details";
		statement = con.prepareStatement(NewOpportunityQuery);
		rs_opportunity = statement.executeQuery();
		if(!rs_opportunity.next())
		{
			OpportunityDetails opportunity[] = new OpportunityDetails[20];
			opportunity[0] = new OpportunityDetails(1,"","","","Application Id", "apmid", "Text box","Yes", "");
			opportunity[1] = new OpportunityDetails(2,"","","","Application Name", "appName", "Text box", "Yes", "");
			opportunity[2] = new OpportunityDetails(3,"","","","Creation Date", "creation_date", "Datepicker", "No", "");
			opportunity[3] = new OpportunityDetails(4,"","","","Request Source", "source", "Text box", "No", "");
			opportunity[4] = new OpportunityDetails(5,"","","","Status", "status", "Text box", "No", "");
			opportunity[5] = new OpportunityDetails(6,"","",",Archive,Decommission,Archive+Decommission","Request Type", "request_type", "Dropdown", "Yes", "");
			opportunity[6] = new OpportunityDetails(7,"","","","Requester", "requester", "Text box", "Yes", "");
			opportunity[7] = new OpportunityDetails(8,"","","","Application Descrpition", "appdesc", "Text box", "No", "");
			opportunity[8] = new OpportunityDetails(9,"","","","Application Owner", "appowner", "Text box", "Yes", "");
			opportunity[9] = new OpportunityDetails(10,"","","","Business Owner", "businessowner", "Text box", "No", "");
			opportunity[10] = new OpportunityDetails(11,"","","","Development Owner/SME", "sme", "Text box", "Yes", "");
			opportunity[11] = new OpportunityDetails(12,"","","","Billing Code", "billcode", "Text box", "No", "");
			opportunity[12] = new OpportunityDetails(13,"","","","Business Segment", "businesssegment", "Text box", "No", "");
			opportunity[13] = new OpportunityDetails(14,"","","","Business Unit", "businessunit", "Text box", "No", "");
			opportunity[14] = new OpportunityDetails(15,"","","","Key Function", "keyfunction", "Text box", "No", "");
			opportunity[15] = new OpportunityDetails(16,"","","","Program or Segment Contact", "pscontact", "Text box", "No", "");
			opportunity[16] = new OpportunityDetails(17,"","",",EMR System,ERP Data,Financial Data,HealthCare Data,HR Data,MR/HR Data,Other Data","Data Type", "date_type", "Dropdown", "No", "");
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
		statement.close();
		rs_opportunity.close();
		//
		String NewGovernanceQuery = "select * from Governance_Info_Template_Details";
		statements = con.prepareStatement(NewGovernanceQuery);
		rs_governance = statements.executeQuery();
		if(!rs_governance.next())
		{
			GovernanceDetails governance[] = new GovernanceDetails[5];
			governance[0] = new GovernanceDetails(1,"","Wave Id", "waveId", "Text box","Yes", "");
			governance[1] = new GovernanceDetails(2,"","Wave Name", "waveName", "Text box", "Yes", "");
			governance[2] = new GovernanceDetails(3,"","Creation Date", "creation_date", "Datepicker", "No", "");
			governance[3] = new GovernanceDetails(4,"","Planned Completion Date", "completion_date", "Datepicker", "No", "");
			governance[4] = new GovernanceDetails(5,"","Applications", "apps", "MultiselectDropdown", "No", "");
			for (int index = 0; index<governance.length; index++)
			{
				String Opportunity_InsertQuery = "insert into Governance_Info_Template_Details (seq_no, options, label_name, column_name, type, mandatory, value)"
						+ "value(?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement prestmt = con.prepareStatement(Opportunity_InsertQuery);
				prestmt.setInt(1, governance[index].seq_num);
				prestmt.setString(2, governance[index].options);
				prestmt.setString(3, governance[index].label);
				prestmt.setString(4, governance[index].column);
				prestmt.setString(5, governance[index].type);
				prestmt.setString(6, governance[index].mandatory);
				prestmt.setString(7, governance[index].value);              
				prestmt.execute();
				prestmt.close();
			}
		}
		// phase template info
		String NewPhaseQuery = "select * from Phase_Info_Template_Details";
		PhaseStatement = con.prepareStatement(NewPhaseQuery);
		rs_phase = statements.executeQuery();
		if(!rs_phase.next())
		{
			GovernanceDetails governance[] = new GovernanceDetails[5];
			governance[0] = new GovernanceDetails(1,"","Phase Id", "phaseId", "Text box","Yes", "");
			governance[1] = new GovernanceDetails(2,"","Phase Name", "phaseName", "Text box", "Yes", "");
			governance[2] = new GovernanceDetails(3,"","Creation Date", "creation_date", "Datepicker", "No", "");
			governance[3] = new GovernanceDetails(4,"","Planned Completion Date", "completion_date", "Datepicker", "No", "");
			governance[4] = new GovernanceDetails(5,"","Waves", "waves", "MultiselectDropdown", "No", "");
			for (int index = 0; index<governance.length; index++)
			{
				String phase_InsertQuery = "insert into Phase_Info_Template_Details (seq_no, options, label_name, column_name, type, mandatory, value)"
						+ "value(?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement prestmt = con.prepareStatement(phase_InsertQuery);
				prestmt.setInt(1, governance[index].seq_num);
				prestmt.setString(2, governance[index].options);
				prestmt.setString(3, governance[index].label);
				prestmt.setString(4, governance[index].column);
				prestmt.setString(5, governance[index].type);
				prestmt.setString(6, governance[index].mandatory);
				prestmt.setString(7, governance[index].value);              
				prestmt.execute();
				prestmt.close();
			}
		}
		PhaseStatement.close();
		rs_phase.close();
		statements.close();
		rs_governance.close();

		String Triage_Query = "select * from Triage_Info_Template_Details";
		statement1 = con.prepareStatement(Triage_Query);
		rs_Triage = statement1.executeQuery();
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
			Details[12] = new Triage(13,"","",",Yes,No","Funding Available", "funding_Avl", "Dropdown", "No", "");
			Details[13] = new Triage(14,"","","","Program Funder", "prgFunder", "Text box", "No", "");
			Details[14] = new Triage(15,"","","","Project Portfolio Information", "PrjInfo", "Text box", "No", "");
			Details[15] = new Triage(16,"","","","Project Decomission Date", "Decom_date", "Datepicker", "Yes", "");
			Details[16] = new Triage(17,"","",",Yes,No","Infrastructure Impact","infrastructure_impact", "Dropdown", "No", "");
			Details[17] = new Triage(18,"","","","Number of Infrastructure Components", "nmbr_of_infrastructure_components", "Text box", "No", "");
			Details[18] = new Triage(19,"","",",Yes,No","Archival Solution", "archival_Sol", "Dropdown", "No", "");
			Details[19] = new Triage(20,"","","","Status/Notes", "Status", "Text box", "No", "");
			Details[20] = new Triage(21,"","","","EDR Analyst", "decomAnalyst", "Text box", "No", "");
			Details[21] = new Triage(22,"","",",Replace,Retire,Combine,Other","Rationalization Type", "rationalization_type", "Dropdown", "No", "");
			Details[22] = new Triage(23,"","","","If other, please describe ", "If_other_please_describe", "HiddenText", "Yes", "");
			Details[23] = new Triage(24,"","",",Mainframe,Distibuted - Unix,Windows,hybrid,Others","Application platform", "appPlatfrm", "Dropdown", "Yes", "");
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
		statement1.close();
		rs_Triage.close();
		String TriageSummary = "select * from Triage_Summary_Info_Template_Details";
		stTriSumm = con.prepareStatement(TriageSummary);
		rsTriSumm = stTriSumm.executeQuery();
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
		stTriSumm.close();
		rsTriSumm.close();
		// Archive Requirement - Role&Response
		String roleRes = "select * from ArchiveReq_Roles_Info_Template_Details";
		stRoleRes = con.prepareStatement(roleRes);
		RsroleRes = stRoleRes.executeQuery();
		if(!RsroleRes.next()) {
			rolesRespons RoleResponse[] = new rolesRespons[5];
			RoleResponse[0] = new rolesRespons(1,"Project Sponsor","","","","","Approves the�document�from an overall�program�perspective");
			RoleResponse[1] = new rolesRespons(2,"Business Owner","","","","","Approves the�document�from an overall project perspective");
			RoleResponse[2] = new rolesRespons(3,"Project Manager","","","","","Approves the�document�from an overall project perspective");
			RoleResponse[3] = new rolesRespons(4,"System Architect","","","","","Approves the�document�from an�architecture�perspective");
			RoleResponse[4] = new rolesRespons(5,"Technical Lead","","","","","Approves the�document�from a�technical�perspective");    
			for (int index = 0; index<RoleResponse.length; index++) {
				String RolesResponse_InsertQuery = "insert into ArchiveReq_Roles_Info_Template_Details(seq_no, role, name, email, username,priority,approverPurpose)"
						+" value(?,?,?,?,?,?,?)";
				PreparedStatement prestmtResponse = con.prepareStatement(RolesResponse_InsertQuery);
				prestmtResponse.setInt(1, RoleResponse[index].seq_no);
				prestmtResponse.setString(2, RoleResponse[index].role);
				prestmtResponse.setString(3, RoleResponse[index].name);
				prestmtResponse.setString(4, RoleResponse[index].email);
				prestmtResponse.setString(5, RoleResponse[index].username);
				prestmtResponse.setString(6, RoleResponse[index].priority);
				prestmtResponse.setString(7, RoleResponse[index].approverPurpose);
				prestmtResponse.execute();
			}
		}
		stRoleRes.close();
		RsroleRes.close();
		String AssessmentDataChar = "select * from Assessment_Data_Char_Info_Template_Details";
		AssDataCharst = con.prepareStatement(AssessmentDataChar);
		AssDataCharrs = AssDataCharst.executeQuery();
		if(!AssDataCharrs.next())
		{
			String DataChar = "DataCharacteristics";
			Assessment Assdata[] = new Assessment[23];
			Assdata[0] = new Assessment(1,"","",DataChar,",DB2, MS SQL, MySQL, Oracle, Sybase, Other","Database type", "DatabaseType", "Dropdown", "Yes", "");
			Assdata[1] = new Assessment(2,"","",DataChar,",Flat File, Structured, Unstructured, Hybrid, Other","Data Type Characteristics ", "DataTypeCharacteristics", "Dropdown", "Yes", "");
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
	        Assdata[19] = new Assessment(20,"","",DataChar,",PCI,SOX,Consumer PII,Customer PII,Associate PII,SSN,None","Application  Data ", "ApplicationData", "Dropdown", "No", "");
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
		AssessmentSt = con.prepareStatement(AssessmentQuery);
		AssessmentRs = AssessmentSt.executeQuery();
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
			AssessmentDetails[7] = new Assessment(8,"","",ComplianceChar,"","If any, please describe details","ifanypleasedescribe","TextBoxDependencyYes","No","");
			AssessmentDetails[8] = new Assessment(9,"","",ComplianceChar,"Yes,No","Are there any pending litigations that impacts the retirement of the application and data","retirementappanddata","Radio box","Yes","");
			AssessmentDetails[9] = new Assessment(10,"","",ComplianceChar,",On Hold,Pending review,Cleared,N/A","Legal Status","legalstatus","Dropdown","No","");
			AssessmentDetails[10] = new Assessment(11,"","",ComplianceChar,"Yes,No","Any specific Purge requirements?","specificpurgerequirements","RadioBoxDependencyYes","Yes","");
			AssessmentDetails[11] = new Assessment(12,"","",ComplianceChar,"","If any, please describe details","describedetails","TextBoxDependencyYes","No","");     
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
		AssessmentSt.close();
		AssessmentRs.close();
		String AssessmentArchival = "Select * from Assessment_Archival_Consumption_Info_Template_Details";  
		AssArchivalst = con.prepareStatement(AssessmentArchival);    
		AssArchivalrs = AssArchivalst.executeQuery();
		if(!AssArchivalrs.next())
		{
			String ArchivConsump = "ArchivalConsumption";
			Assessment AssessmentArchiv[] = new Assessment[10];
			AssessmentArchiv[0] = new Assessment(1,"","",ArchivConsump,",Frequent users with Online Inquiry, Retention for Audit purposes, Ad-hoc reporting, Long-term Retention Only","Archival needs","archiveneed","Dropdown","Yes","");
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
		AssArchivalst.close();
		AssArchivalrs.close();
		String AssessAppInfoQuery = "Select * from Assessment_Application_Info_Template_Details;";
		AssessAppInfoSt = con.prepareStatement(AssessAppInfoQuery);
		AssessAppInfoRs = AssessAppInfoSt.executeQuery();
		if(!AssessAppInfoRs.next())
		{
			String AppInfo = "ApplicationInformation";
			Assessment AssessmentDetails[] = new Assessment[19];
			AssessmentDetails[0] = new Assessment(1,"","",AppInfo,",COTS - Commercial Off The Shelf,MOTS - Modified Off The Shelf,Custom - In-house Development","Application Details","AppDetails","Dropdown","Yes","");
			AssessmentDetails[1] = new Assessment(2,"","",AppInfo,",Currently supported,Nearing end of life,End of life with extended support/maintenance,unsupported","Lifecycle","Lifecycle","Dropdown","No","");
			AssessmentDetails[2] = new Assessment(3,"","",AppInfo,"Yes,No","Is this a currently supported application?","SupportedApp","RadioBoxDependencyNo","No","");
			AssessmentDetails[3] = new Assessment(4,"","",AppInfo,"","If NO,who supports this Application?","SupportApp","TextBoxDependencyNo","No","");
			AssessmentDetails[4] = new Assessment(5,"","",AppInfo,"Yes,No","Operational support staff/SME's available for analysis?","OperationalSupportStaff","Radio box","No","");
			AssessmentDetails[5] = new Assessment(6,"","",AppInfo,",Mainframe,Distibuted - Unix,Windows,hybrid,Others","Application platform","AssessAppPlatform","Dropdown","Yes","");
			AssessmentDetails[6]= new Assessment(7,"","",AppInfo,"","If Other,please describe ", "OtherPleaseDescribe", "Text box", "No", "");
			AssessmentDetails[7] = new Assessment(8,"","",AppInfo,"","Brief architecture description","BriefArchitectureDescription","TextAreaFile","No","");
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
		AssessAppInfoSt.close();
		AssessAppInfoRs.close();
		String AssessContractInfoQuery = "Select * from Assessment_Contract_Info_Template_Details;";
		AssessContractInfoSt = con.prepareStatement(AssessContractInfoQuery);
		AssessContractInfoRs = AssessContractInfoSt.executeQuery();
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
		// Business Requirements
		AssessContractInfoSt.close();
		AssessContractInfoRs.close();
		String BusReqInScope = "select * from BusinessReqinscope_Info_template_details";
		stBusReqInScope = con.prepareStatement(BusReqInScope);
		RsBusReqInScope = stBusReqInScope.executeQuery();
		if(!RsBusReqInScope.next()) {
			BusinessReqInScope BusreqinscopeDetails[] = new BusinessReqInScope[2];
			BusreqinscopeDetails[0] = new BusinessReqInScope(1,"Yes/Y","Requirements in-scope for this archive project and is marked in Requirement Table accordingly");
			BusreqinscopeDetails[1] = new BusinessReqInScope(2,"No/N","Requirements out-scope for this archive project and is marked in Requirement Table accordingly");
			for (int index = 0; index<BusreqinscopeDetails.length; index++) {
				String BusinessReqInScope_InsertQuery = "insert into BusinessReqinscope_Info_template_details(seq_no, req_in_scope, description)"
						+" value(?,?,?)";
				PreparedStatement prestmtBusReq = con.prepareStatement(BusinessReqInScope_InsertQuery);
				prestmtBusReq.setInt(1, BusreqinscopeDetails[index].seq_no);
				prestmtBusReq.setString(2, BusreqinscopeDetails[index].req_in_scope);
				prestmtBusReq.setString(3, BusreqinscopeDetails[index].description);
				prestmtBusReq.execute();
			}
		}
		stBusReqInScope.close();
		RsBusReqInScope.close();
		st5.close();
		rs5.close();
		st6.close();
		rs6.close();
		st7.close();
		rs7.close();
		st8.close();
		rs8.close();
		AssDataCharst.close();
		AssDataCharrs.close();
		// Finance_Template_Details
			FinanceAppTemplateService financeAppTemplateService = new FinanceAppTemplateService("");
			financeAppTemplateService.financeAppTemplate();
		//calling Archive Execution Template function 
		ArchiveExecutionTemplateService archiveExecObj = new ArchiveExecutionTemplateService("");
		archiveExecObj.archiveExecutionDefaultRecords();
		archiveExecObj = null;
		System.gc();
		//calling archive Execution Governance Template Function
		ArchiveExecutionGovernanceTemplateService archiveExecGovObj = new ArchiveExecutionGovernanceTemplateService("");
		archiveExecGovObj.archiveExecutionDefaultRecords();
		archiveExecGovObj=null;
		System.gc();
		// Archive Legacy Application Info
		archiveReqLegacyAppTemplateService archiveReqLegacyObj = new archiveReqLegacyAppTemplateService("");
		archiveReqLegacyObj.archiveReqLegacyAppTemplate();
		archiveReqLegacyObj = null;
		System.gc();
		//Archive Retention Details
		archiveRetentionTemplateDetailsService archiveRetentionObj = new archiveRetentionTemplateDetailsService();
		archiveRetentionObj.archiveRetentionTemplate();
		archiveRetentionObj = null;
		System.gc();
		//Archive Function Data Req Details
		String[] tableNamesFunctionReq = {"Archive_DataReq_Template_Details","Archive_RetentionLegalReq_Template_Details","Archive_SecurityReq_Template_Details","Archive_UsabilityReq_Template_Details","Archive_AuditlReq_Template_Details"};
		for(int index=0;index<tableNamesFunctionReq.length;index++)
		{
			archiveFunDataReqTemplate archiveDataReqObj = new archiveFunDataReqTemplate(tableNamesFunctionReq[index]);
			archiveDataReqObj.archiveDataReqTemplate();
			archiveDataReqObj = null;
			System.gc();
		}
		String admin_user_details="select * from Admin_UserDetails where uname=?";
		PreparedStatement st = con.prepareStatement(admin_user_details);
		st.setString(1, username);
		ResultSet rs = st.executeQuery();

		try
		{   String dbuname="";

		PreparedStatement ps=con.prepareStatement("SELECT * FROM users WHERE uname=?  ");
		ps.setString(1, username);
		ResultSet rs2=ps.executeQuery();
		if(rs2.next())
		{
			dbuname=rs2.getString("uname");
			String dbufname=rs2.getString("ufname");
			String dbulname=rs2.getString("ulname");
			String dbu_email=rs2.getString("u_email");
			String dbu_role=rs2.getString("u_role");

			if(username.equals(dbuname)&& user_fname.equals(dbufname)&& user_lname.equals(dbulname)&&user_email.equals(dbu_email)&& user_group.equals(dbu_role)) 
			{
				String lic_info="";
				StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
				EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
				config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
				config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
				encryptor.setConfig(config);
				encryptor.setKeyObtentionIterations(1000);
				PreparedStatement lc=con.prepareStatement("select license_info from license ORDER BY id DESC LIMIT 1");
				ResultSet r1=lc.executeQuery();
				if(r1.next())
				{
					lic_info=r1.getString("license_info");
				}
				else if(!r1.next())
				{
					String msg1="Please Add License Details!";

					response.sendRedirect("Update_License.jsp?ErrorMessage="+msg1);
				}

				System.out.println("Issue To : "+lic_info);
				String enc=encryptor.decrypt(lic_info);
				JSONObject jsonObj = new JSONObject(enc.toString());
				System.out.println("Decrypted Value is : "+jsonObj);
				String s=jsonObj.getString("Valid Till");
				System.out.println("SS : "+s);
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");  
				//dates to be compare  
				String pattern = "dd-MMM-yyyy";
				String dateInString =new SimpleDateFormat(pattern).format(new Date());
				System.out.println("Date:"+dateInString);
				Date cur_date = sdf.parse(dateInString);  
				Date lic_valid_date = sdf.parse(s);  
				//prints dates  
				System.out.println("Date 1: " + sdf.format(cur_date));  
				System.out.println("Date 2: " + sdf.format(lic_valid_date));  

				if(cur_date.before(lic_valid_date)|| cur_date.equals(lic_valid_date))
				{

					details.setAttribute("role",dbu_role);
					details.setAttribute("projects","all");
					details.setAttribute("dbu_role","X");
					details.setAttribute("prj","X");
					details.setAttribute("app_emp","X");
					details.setAttribute("intake","X");
					details.setAttribute("archive_exec","X");
					String pagename = (String)session.getAttribute("pageUrl");
                    if(pagename != null)
                    {
                    	response.sendRedirect(pagename);
                    }
					String redirectURL = "DashBoard.jsp";
					response.sendRedirect(redirectURL);
				}
				else if(cur_date.after(lic_valid_date))
				{
					String msg1="Your License was Expired.Please Update Your License Details!";

					response.sendRedirect("Update_License.jsp?ErrorMessage="+msg1);
				}

			}}
		else {
			//System.out.println("if");
			String msg = "";
			if (!username.equals(dbuname)) {
				msg = "This user not yet registered.";
			} else
			{
				msg="Password is Incorrect";
			}
			response.sendRedirect("Login_Error.jsp?ErrorMessage="+msg);// user you have entered not registered.
		}

		String u_name=(String)details.getAttribute("username");
		String u_role=(String)details.getAttribute("role");
		String user_id=u_name;
		MDC.put("USERID", user_id);
		MDC.put("USERROLE", u_role);
		logger.info("Logged In"); 

		}
		catch(Exception e)
		{
		}
		}
		catch(Exception e) {
		}   
	}}
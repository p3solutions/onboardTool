package ArchiveExecutionGovernanceModule.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.UUID;


import ArchiveExecutionGovernanceModule.bean.ArchiveExecBean;
import onboard.DBconnection;
import logger.System;

public class ArchiveExecutionGovernanceTemplateService {
	DBconnection dBconnection =null;

	public Connection con = null;

	public String Id = null;

	int seqNo = 1;

	boolean FirstRow_Flag  = true; 

	ArchiveExecutionGovernanceTemplateDetails archiveExecTemp[];
	public ArchiveExecutionGovernanceTemplateService(String Id) throws ClassNotFoundException, SQLException {

		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
	}

	public void archiveExecutionDefaultRecords() throws SQLException {

		PreparedStatement st=null;
		ResultSet rs=null;
		try {

			String selectQuery = "select * from Archive_Execution_Governance_Template_Info";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();

			if(!rs.next()) {
				ArchiveExecutionGovernanceTemplateDetails archiveExecTemp[] = new ArchiveExecutionGovernanceTemplateDetails[63];

				archiveExecTemp[0] = new ArchiveExecutionGovernanceTemplateDetails("1","1","Initiation & Setup - General","");
				archiveExecTemp[1] = new ArchiveExecutionGovernanceTemplateDetails("2","2","","Project Kickoff Meeting");
				archiveExecTemp[2] = new ArchiveExecutionGovernanceTemplateDetails("3","2","","Stakeholder/Project Team Identification");
				archiveExecTemp[3] = new ArchiveExecutionGovernanceTemplateDetails("4","2","","Consultants Remote access setup");
				archiveExecTemp[4] = new ArchiveExecutionGovernanceTemplateDetails("5","2","","Secure link Access, Applications enablement");
				archiveExecTemp[5] = new ArchiveExecutionGovernanceTemplateDetails("6","2","","Project Plan, Implementation Roadmap");

				archiveExecTemp[6] = new ArchiveExecutionGovernanceTemplateDetails("7","1","Infrastructure","");
				archiveExecTemp[7] = new ArchiveExecutionGovernanceTemplateDetails("8","2","InfoArchive","Access to Existing InfoArchive  - All regions");
				archiveExecTemp[8] = new ArchiveExecutionGovernanceTemplateDetails("9","2","InfoArchive","Review InfoArchive Architecture");
				archiveExecTemp[9] = new ArchiveExecutionGovernanceTemplateDetails("10","2","InfoArchive","Architecture Change recommendations (if any)");
				archiveExecTemp[10] = new ArchiveExecutionGovernanceTemplateDetails("11","2","Archon","Archon - Architecture/Components list");
				archiveExecTemp[11] = new ArchiveExecutionGovernanceTemplateDetails("12","2","Archon - Dev","Access to Archon Infrastructure");
				archiveExecTemp[12] = new ArchiveExecutionGovernanceTemplateDetails("13","2","Archon - Dev","Install Archon");
				archiveExecTemp[13] = new ArchiveExecutionGovernanceTemplateDetails("14","2","Archon - Dev","Test/Validation of Archon");
				archiveExecTemp[14] = new ArchiveExecutionGovernanceTemplateDetails("15","2","Archon - Dev","LDAP Integration");
				archiveExecTemp[15] = new ArchiveExecutionGovernanceTemplateDetails("16","2","Archon - Dev","Job Aid/Install Documentation");
				archiveExecTemp[16] = new ArchiveExecutionGovernanceTemplateDetails("17","2","Archon - Test","Access to Archon Infrastructure");
				archiveExecTemp[17] = new ArchiveExecutionGovernanceTemplateDetails("18","2","Archon - Test","Install Archon");
				archiveExecTemp[18] = new ArchiveExecutionGovernanceTemplateDetails("19","2","Archon - Test","Test/Validation of Archon");
				archiveExecTemp[19] = new ArchiveExecutionGovernanceTemplateDetails("20","2","Archon - Test","LDAP Integration");
				archiveExecTemp[20] = new ArchiveExecutionGovernanceTemplateDetails("21","2","Archon - Test","Job Aid/Install Documentation");
				archiveExecTemp[21] = new ArchiveExecutionGovernanceTemplateDetails("22","2","Archon - Prod","Access to Archon Infrastructure");
				archiveExecTemp[22] = new ArchiveExecutionGovernanceTemplateDetails("23","2","Archon - Prod","Install Archon");
				archiveExecTemp[23] = new ArchiveExecutionGovernanceTemplateDetails("24","2","Archon - Prod","Test/Validation of Archon");
				archiveExecTemp[24] = new ArchiveExecutionGovernanceTemplateDetails("25","2","Archon - Prod","LDAP Integration");
				archiveExecTemp[25] = new ArchiveExecutionGovernanceTemplateDetails("26","2","Archon - Prod","Job Aid/Install Documentation");

				archiveExecTemp[26] = new ArchiveExecutionGovernanceTemplateDetails("27","1","Intake Process / Methodology","");
				archiveExecTemp[27] = new ArchiveExecutionGovernanceTemplateDetails("28","2","","Intake Workshop");
				archiveExecTemp[28] = new ArchiveExecutionGovernanceTemplateDetails("29","2","","Define Organizational structure");
				archiveExecTemp[29] = new ArchiveExecutionGovernanceTemplateDetails("30","2","","Define characteristics of Opportunity Management");
				archiveExecTemp[30] = new ArchiveExecutionGovernanceTemplateDetails("31","2","","Triage");
				archiveExecTemp[31] = new ArchiveExecutionGovernanceTemplateDetails("32","2","","Assessment");
				archiveExecTemp[32] = new ArchiveExecutionGovernanceTemplateDetails("33","2","","Legal (retention) Review");
				archiveExecTemp[33] = new ArchiveExecutionGovernanceTemplateDetails("34","2","","Financial Models, Cost Benefit Analysis");
				archiveExecTemp[34] = new ArchiveExecutionGovernanceTemplateDetails("35","2","","Finance & ROI Measurement");
				archiveExecTemp[35] = new ArchiveExecutionGovernanceTemplateDetails("36","2","","Plan and Prioritize; Estimation");
				archiveExecTemp[36] = new ArchiveExecutionGovernanceTemplateDetails("37","2","","Deliverables - Process flow, Templates, Recommendations");
				archiveExecTemp[37] = new ArchiveExecutionGovernanceTemplateDetails("38","2","","Applications Intake assessment, Define Waves, Implementation Roadmap for 19 In-scope applications");

				archiveExecTemp[38] = new ArchiveExecutionGovernanceTemplateDetails("39","1","Archive Implementation","");
				archiveExecTemp[39] = new ArchiveExecutionGovernanceTemplateDetails("40","2","OppurtunityName � Allscripts","Requirements Gathering");
				archiveExecTemp[40] = new ArchiveExecutionGovernanceTemplateDetails("41","2","OppurtunityName � Allscripts","Requirements Documentation/Approval");
				archiveExecTemp[41] = new ArchiveExecutionGovernanceTemplateDetails("42","2","OppurtunityName � Allscripts","Technical Design Document");
				archiveExecTemp[42] = new ArchiveExecutionGovernanceTemplateDetails("43","2","OppurtunityName � Allscripts","Technical Design Documentation/Approval");
				archiveExecTemp[43] = new ArchiveExecutionGovernanceTemplateDetails("44","2","OppurtunityName � Allscripts","Archon - Source system connectivity");
				archiveExecTemp[44] = new ArchiveExecutionGovernanceTemplateDetails("45","2","OppurtunityName � Allscripts","Data Archive in Test Environment");
				archiveExecTemp[45] = new ArchiveExecutionGovernanceTemplateDetails("46","2","OppurtunityName � Allscripts","Screens Configuration in Test Environment");
				archiveExecTemp[46] = new ArchiveExecutionGovernanceTemplateDetails("47","2","OppurtunityName � Allscripts","Perform System Testing");
				archiveExecTemp[47] = new ArchiveExecutionGovernanceTemplateDetails("48","2","OppurtunityName � Allscripts","System Test Documentation/Results Approval");
				archiveExecTemp[48] = new ArchiveExecutionGovernanceTemplateDetails("49","2","OppurtunityName � Allscripts","UAT Testing");
				archiveExecTemp[49] = new ArchiveExecutionGovernanceTemplateDetails("50","2","OppurtunityName � Allscripts","UAT Signoff");
				archiveExecTemp[50] = new ArchiveExecutionGovernanceTemplateDetails("51","2","OppurtunityName � Allscripts","Production implementation - Data Archival");
				archiveExecTemp[51] = new ArchiveExecutionGovernanceTemplateDetails("52","2","OppurtunityName � Allscripts","Production implementation - Screens configuration");
				archiveExecTemp[52] = new ArchiveExecutionGovernanceTemplateDetails("53","2","OppurtunityName � Allscripts","Production implementation - Users configuration");
				archiveExecTemp[53] = new ArchiveExecutionGovernanceTemplateDetails("54","2","OppurtunityName � Allscripts","Production implementation - Retention configuration");
				archiveExecTemp[54] = new ArchiveExecutionGovernanceTemplateDetails("55","2","OppurtunityName � Allscripts","Chain of Custody validation/documentation");
				archiveExecTemp[55] = new ArchiveExecutionGovernanceTemplateDetails("56","2","OppurtunityName � Allscripts","Chain of Custody documentation approval");
				archiveExecTemp[56] = new ArchiveExecutionGovernanceTemplateDetails("57","2","OppurtunityName � Allscripts","Implementation Signoff");

				archiveExecTemp[57] = new ArchiveExecutionGovernanceTemplateDetails("58","1","Closure","");
				archiveExecTemp[58] = new ArchiveExecutionGovernanceTemplateDetails("59","2","","Warranty Support - 6 Weeks");
				archiveExecTemp[59] = new ArchiveExecutionGovernanceTemplateDetails("60","2","","Stakeholder Communication");
				archiveExecTemp[60] = new ArchiveExecutionGovernanceTemplateDetails("61","2","","Lessons Learned");
				archiveExecTemp[61] = new ArchiveExecutionGovernanceTemplateDetails("62","2","","Project Close Check List");
				archiveExecTemp[62] = new ArchiveExecutionGovernanceTemplateDetails("63","2","","Final Finances and Invoices");

				for ( int index = 0; index<archiveExecTemp.length; index++) {

					String archiveExecTemp_InsertQuery = "insert into Archive_Execution_Governance_Template_Info (seq_no, level, taskGroup, taskName, taskType, majorDependencies, assignedTo, planSrt, planEnd, actSrt, actEnd, completion, status, remark)"
							+"value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement prestmt = con.prepareStatement(archiveExecTemp_InsertQuery);
					prestmt.setString(1, archiveExecTemp[index].seq_no);
					prestmt.setString(2, archiveExecTemp[index].level);
					prestmt.setString(3, archiveExecTemp[index].taskGroup);
					prestmt.setString(4, archiveExecTemp[index].taskName);
					prestmt.setString(5, "");
					prestmt.setString(6, "");
					prestmt.setString(7, "");
					prestmt.setString(8, "");
					prestmt.setString(9, "");
					prestmt.setString(10, "");
					prestmt.setString(11, "");
					prestmt.setString(12, "");
					prestmt.setString(13, "");
					prestmt.setString(14, "");
					prestmt.execute();
				}

			}

		}

		catch(Exception e) {
			e.printStackTrace();
		}

		finally {
			st.close();
			rs.close();
		}

	}

	public void archiveTemplateToArchiveInfo(String waveName) throws SQLException {
		PreparedStatement st=null,st1=null,st3=null,pst=null,pst1=null;
		ResultSet rs=null,rs1=null,rs2=null,rs3=null,rs4=null;
		try {

			// to insert records until archive implementation
			String SelectQuery = "select * from Archive_Execution_Governance_Template_Info where seq_no < 39 order by seq_no";
			st1 = con.prepareStatement(SelectQuery);
			rs1 = st1.executeQuery();

			int number = 0, decimalNumber = 1;

			while(rs1.next()) {
				//String taskId = generateTaskId();
				String taskId = "";
				if(rs1.getString(2).equals("1")) {
					number++;
					taskId =  number+"";
					decimalNumber = 1;
				}
				else {
					taskId =number+"."+((decimalNumber<10)?"0"+decimalNumber:decimalNumber);
					decimalNumber++;
				}

				InsertRecord(rs1, waveName, taskId, "");		
			}

			String apps = "";
			String selectQuery1 = "select * from governance_info where waveId = ? and column_name = 'apps';";
			st = con.prepareStatement(selectQuery1);
			st.setString(1, Id);
			rs = st.executeQuery();

			if(rs.next())
			{
				apps = rs.getString("value");
			}

			String [] appNames = apps.split(",");
			for(String app : appNames) {
				String SelectQuery2 = "select * from Archive_Execution_Info where taskGroup = 'Archive Implementation' and oppName=? order by seq_no";
				pst = con.prepareStatement(SelectQuery2);
				pst.setString(1, app);
				rs2 = pst.executeQuery();


				boolean matchFlag = true;
				if(rs2.next())
				{
					int fromSeqNum = rs2.getInt(1);
					String selectQuery4 = "select * from Archive_Execution_Info where seq_no>=? and oppName='app' order by seq_no;" ;
					pst1 = con.prepareStatement(selectQuery4);
					pst1.setInt(1, fromSeqNum);

					rs4 = pst1.executeQuery();
					boolean firstRow = true;

					while(rs4.next()) {

						//String taskId = generateTaskId();

						String taskId = "";

						if(!matchFlag&&rs4.getString(4).equals("1"))
							break;

						if(rs4.getString(4).equals("1")&&matchFlag) {
							number++;
							taskId =  number+"";
							decimalNumber = 1;
						}
						else {
							taskId =number+"."+((decimalNumber<10)?"0"+decimalNumber:decimalNumber);
							decimalNumber++;
						}

						InsertRecordFromInfo(rs4, waveName, taskId,app);

						matchFlag = false;

					}

					pst1.close();
					rs4.close();
				}


			}

			// to insert records till the end

			String SelectQuery3 = "select * from Archive_Execution_Governance_Template_Info where seq_no > 57 order by seq_no";
			st3 = con.prepareStatement(SelectQuery3);
			rs3 = st3.executeQuery();
			while(rs3.next()) {
				//String taskId = generateTaskId();
				String taskId = "";
				if(rs3.getString(2).equals("1")) {
					number++;
					taskId =  number+"";
					decimalNumber = 1;
				}
				else {
					taskId =number+"."+((decimalNumber<10)?"0"+decimalNumber:decimalNumber);
					decimalNumber++;
				}
				InsertRecord(rs3, waveName, taskId, "");	

			}




		}

		catch(Exception e) {
			e.printStackTrace();
		}

		finally {
			st.close();
			st1.close();
			st3.close();
			pst.close();
			rs.close();
			rs1.close();
			rs2.close();
			rs3.close();

		}

	}


	private void InsertRecordFromInfo(ResultSet rs1,String waveName, String taskId, String appName) throws SQLException {

		String taskGroup = ("Archive Implementation".equals(rs1.getString(6))?"Archive Implementation - "+ appName: rs1.getString(6));
		String template_InsertQuery = "insert into Archive_Execution_Governance_Info (seq_no, waveId, waveName, level, taskId, taskGroup, taskName, taskType, majorDependencies, assignedTo, planSrt, planEnd, actSrt, actEnd, completion, status, remark)"
				+"value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement prestmt = con.prepareStatement(template_InsertQuery);
		prestmt.setInt(1, seqNo);
		prestmt.setString(2, Id);
		prestmt.setString(3, waveName);
		prestmt.setString(4, rs1.getString("level"));
		prestmt.setString(5, taskId);
		prestmt.setString(6, taskGroup);
		prestmt.setString(7, rs1.getString(7));
		prestmt.setString(8, rs1.getString(8));
		prestmt.setString(9, rs1.getString(9));
		prestmt.setString(10, rs1.getString(10));
		prestmt.setString(11, rs1.getString(11));
		prestmt.setString(12, rs1.getString(12));
		prestmt.setString(13, rs1.getString(13));
		prestmt.setString(14, rs1.getString(14));
		prestmt.setString(15, rs1.getString(15));
		prestmt.setString(16, rs1.getString(16));
		prestmt.setString(17, rs1.getString(17));
		prestmt.execute();
		seqNo++;

	}


	private void InsertRecord(ResultSet rs1,String waveName, String taskId, String appName) throws SQLException {

		String taskGroup = ("Archive Implementation".equals(rs1.getString(3))?"Archive Implementation - "+ appName: rs1.getString(3));
		String template_InsertQuery = "insert into Archive_Execution_Governance_Info (seq_no, waveId, waveName, level, taskId, taskGroup, taskName, taskType, majorDependencies, assignedTo, planSrt, planEnd, actSrt, actEnd, completion, status, remark)"
				+"value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement prestmt = con.prepareStatement(template_InsertQuery);
		prestmt.setInt(1, seqNo);
		prestmt.setString(2, Id);
		prestmt.setString(3, waveName);
		prestmt.setString(4, rs1.getString("level"));
		prestmt.setString(5, taskId);
		prestmt.setString(6, taskGroup);
		prestmt.setString(7, rs1.getString(4));
		prestmt.setString(8, rs1.getString(5));
		prestmt.setString(9, rs1.getString(6));
		prestmt.setString(10, rs1.getString(7));
		prestmt.setString(11, rs1.getString(8));
		prestmt.setString(12, rs1.getString(9));
		prestmt.setString(13, rs1.getString(10));
		prestmt.setString(14, rs1.getString(11));
		prestmt.setString(15, rs1.getString(12));
		prestmt.setString(16, rs1.getString(13));
		prestmt.setString(17, rs1.getString(14));
		prestmt.execute();
		seqNo++;
	}
	public void getDataRetrieveBasedOnApps() throws SQLException {
		PreparedStatement st1=null;
		ResultSet rs1=null;
		try {
			String apps[] = getApps();		 
			String selectNodeQuery = "select * from Archive_Execution_Governance_Info order by seq_no";
			st1 = con.prepareStatement(selectNodeQuery);
			rs1 = st1.executeQuery();
			while(rs1.next()) {
				String taskGroup = "";
				String taskName = "";
				int level = rs1.getInt("level");

				if(level == 1) {
					taskGroup = rs1.getString("taskGroup");

				}
				else {
					taskName = rs1.getString("taskName");
				}

				if(taskGroup.startsWith("Archive Implementation"))
					break;

				//		 String selectApps = "select * from Governance_Info where waveId='"+Id+"' and column_name = 'apps';";
				//		 Statement st = con.createStatement();
				//		 ResultSet rs = st.executeQuery(selectApps);
				//		 if(rs.next()) 
				//			 apps = rs.getString("value").split(",");
				//		 rs.close();
				//		 st.close();

				getDateDetails(apps, taskGroup,taskName, level);
			}

			updateClosureNodes(apps);

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			st1.close();
			rs1.close();

		}
	}

	private String[] getApps() {

		String apps[] = null;
		try {

			String selectApps = "select * from Governance_Info where waveId=? and column_name = 'apps';";
			PreparedStatement pst = con.prepareStatement(selectApps);
			pst.setString(1, Id);
			ResultSet rs = pst.executeQuery();

			if(rs.next()) 
				apps = rs.getString("value").split(",");
			rs.close();
			pst.close();

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return apps;
	}

	private int getSeqNo() {
		int seq_no = -1;
		try {
			String selectSeqNo ="select * from Archive_Execution_Governance_Info where waveId=? and taskGroup = 'Closure';";
			PreparedStatement pst2 = con.prepareStatement(selectSeqNo);
			pst2.setString(1, Id);
			ResultSet rs = pst2.executeQuery();

			if(rs.next())
				seq_no = rs.getInt(1);
			rs.close();
			pst2.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return seq_no;
	}
	private void updateClosureNodes(String apps[]) {
		try {

			int fromSeqNo = getSeqNo();
			String selectQuery = "select * from Archive_Execution_Governance_Info where waveId=? and seq_no >=? order by seq_no;";  
			PreparedStatement pst3 = con.prepareStatement(selectQuery);
			pst3.setString(1, Id);
			pst3.setInt(2, fromSeqNo);
			ResultSet rs = pst3.executeQuery();

			while(rs.next()) {

				String taskGroup = "";

				String taskName = "";

				int level = rs.getInt("level");

				if(level == 1) {
					taskGroup = rs.getString("taskGroup"); 
				}
				else {
					taskName = rs.getString("taskName");
				}

				getDateDetails(apps, taskGroup,taskName, level);

			}
			rs.close();
			pst3.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArchiveExecBean getDateDetails(String apps[],String taskGroup,String taskName, int level) {
		ArchiveExecBean bean = null;
		try {
			bean = new ArchiveExecBean();
			SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy");
			ArrayList<Date> minPlanDate = new ArrayList<Date>();
			ArrayList<Date> maxPlanDate = new ArrayList<Date>();
			ArrayList<Date> minActDate = new ArrayList<Date>();
			ArrayList<Date> maxActDate = new ArrayList<Date>();

			for(String app:apps) {
				String appId = getApplicationIdByName(app);
				ResultSet rs = getDate(appId,taskGroup,taskName,level);
				if(rs.next()) {
					if(!rs.getString("planSrt").equals(""))
						minPlanDate.add(fmt.parse(rs.getString("planSrt")));
					if(!rs.getString("planEnd").equals(""))
						maxPlanDate.add(fmt.parse(rs.getString("planEnd")));
					if(!rs.getString("actSrt").equals(""))
						minActDate.add(fmt.parse(rs.getString("actSrt")));
					if(!rs.getString("actEnd").equals(""))
						maxActDate.add(fmt.parse(rs.getString("actEnd")));

				}
				rs.close();
			}

			String minDate =minPlanDate.isEmpty()?"":fmt.format(Collections.min(minPlanDate));
			String maxDate =maxPlanDate.isEmpty()?"":fmt.format(Collections.max(maxPlanDate));
			String minDate1 =minActDate.isEmpty()?"":fmt.format(Collections.min(minActDate));
			String maxDate1 =maxActDate.isEmpty()?"":fmt.format(Collections.max(maxActDate));

			updateWaveNodeDate(minDate,maxDate,minDate1,maxDate1,taskGroup,taskName,level);

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	private void updateWaveNodeDate(String min, String max, String min2, String max2, String taskGroup, String taskName, int level) {

		try {
			String cond = "";
			if(level ==1)
			{
				cond = "taskGroup='"+taskGroup+"';";
				String updateQuery = "update Archive_Execution_Governance_Info set planSrt = ?, planEnd=?, actSrt=?, actEnd=? where waveId =? and taskGroup=?";
				
				PreparedStatement prestmt = con.prepareStatement(updateQuery);
				prestmt.setString(1, min.toString());
				prestmt.setString(2, max.toString());
				prestmt.setString(3, min2.toString());
				prestmt.setString(4, max2.toString());
				prestmt.setString(5, Id);
				prestmt.setString(6, taskGroup);
				prestmt.execute();

				prestmt.close();

			}
			else
			{
				cond = "taskName='"+taskName+"';";
				String updateQuery = "update Archive_Execution_Governance_Info set planSrt = ?, planEnd=?, actSrt=?, actEnd=? where waveId =? and taskName=?";
				PreparedStatement prestmt = con.prepareStatement(updateQuery);
				prestmt.setString(1, min.toString());
				prestmt.setString(2, max.toString());
				prestmt.setString(3, min2.toString());
				prestmt.setString(4, max2.toString());
				prestmt.setString(5, Id);
				prestmt.setString(6, taskName);
				prestmt.execute();

				prestmt.close();
			}
//			System.out.println("Cond :"+cond);
//			String updateQuery = "update Archive_Execution_Governance_Info set planSrt = ?, planEnd=?, actSrt=?, actEnd=? where waveId =? and ?";
//			System.out.println("Update query :"+updateQuery);
//			PreparedStatement prestmt = con.prepareStatement(updateQuery);
//			prestmt.setString(1, min.toString());
//			prestmt.setString(2, max.toString());
//			prestmt.setString(3, min2.toString());
//			prestmt.setString(4, max2.toString());
//			prestmt.setString(5, Id);
//			prestmt.setString(6, cond);
//			prestmt.execute();
//
//			prestmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	private ResultSet getDate(String appId, String taskGroup, String taskName, int level) {
		ResultSet rs = null;
		try {
			String cond = "";
			if(level ==1)
			{
				cond = "taskGroup='"+taskGroup+"';";
			}
			else
			{
				cond = "taskName='"+taskName+"';";
			}
			String selectQuery = "select * from archive_execution_info where oppId = ? and ?";
			PreparedStatement pst4 = con.prepareStatement(selectQuery);
			pst4.setString(1, appId);
			pst4.setString(2, cond);
			rs = pst4.executeQuery();


		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	public void ArchiveExecutionEditApplicationParentNode(String waveName)
	{
		try
		{
			String appNames = getAppNames();

			int fromSeqNum = deleteAllArchiveImplementParentNode();
			System.out.println();
			int closureSeqNum = getClosureSeqNum(fromSeqNum,appNames);

			// to update correct seq_no

			//int appLength = (!appNames.equals(""))?0:appNames.split(",").length;

			updateClosureSeqNum(fromSeqNum,closureSeqNum);

			insertAppParentNodes(appNames, fromSeqNum, waveName);
			updateTaskCount(waveName);
			//updateSeqNum();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}


	private void updateTaskCount(String waveName) {
		try {
			int number = 1;
			String selectQuery ="select * from Archive_Execution_Governance_Info where waveName=? order by seq_no;";
			PreparedStatement pst5 = con.prepareStatement(selectQuery);
			pst5.setString(1, waveName);
			ResultSet rs = pst5.executeQuery();

			int levelCount = 0;
			while(rs.next()) {
				int level = rs.getInt("level");
				if(level==1) {
					levelCount++;
					number=1;
					if(levelCount != rs.getInt("level"))
						updateTaskId(String.valueOf(levelCount), rs.getString(1), waveName);
				}
				else if(!rs.getString("taskId").startsWith(String.valueOf(levelCount))) {
					String taskId = levelCount+".";
					if(String.valueOf(number).length()==1)
						taskId += "0"+number;
					else
						taskId += number;
					updateTaskId(taskId,rs.getString(1),waveName);
					number++;				
				}
			}
			pst5.close();
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	private void updateTaskId(String taskId, String seq_no, String waveName) {

		try {
			String updateQuery = "update Archive_Execution_Governance_Info set taskId = ? where waveName = ? and seq_no = ?";
			PreparedStatement prestmt = con.prepareStatement(updateQuery);
			prestmt.setString(1,taskId);
			prestmt.setString(2, waveName);
			prestmt.setString(3, seq_no);
			prestmt.execute();	 
			prestmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private int getClosureSeqNum(int fromSeqNum, String appNames) {
		int seqNum = 0;

		try {
			String apps[] = appNames.split(",");
			for(String app : apps ) {
				int ArchiveSeqNum = getArchiveImplementationSeqNum(app);
				String selectQuery ="select * from Archive_Execution_Info where oppName =? and seq_no>=? order by seq_no";
				PreparedStatement pst5 = con.prepareStatement(selectQuery);
				pst5.setString(1, app);
				pst5.setInt(2, ArchiveSeqNum);
				ResultSet rs = pst5.executeQuery();
				boolean FirstRow = true;
				while(rs.next()) {
					if(rs.getInt(4)==1&&!FirstRow)
					{
						break;
					}
					seqNum++;
					FirstRow = false;

				}
				rs.close();
				pst5.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return seqNum;
	}

	private int getArchiveImplementationSeqNum(String app) {
		int seqNum = 0;
		try {

			String selectQuery ="select * from Archive_Execution_Info where oppName =? and taskGroup = 'Archive Implementation'";
			PreparedStatement pst6 = con.prepareStatement(selectQuery);
			pst6.setString(1, app);
			ResultSet rs = pst6.executeQuery();

			if(rs.next())
				seqNum= rs.getInt(1);
			rs.close();
			pst6.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return seqNum;
	}

	//private void updateSeqNum() {
	//	try {
	//		
	//		int rowCount = 1;
	//		
	//		String selectQuery = "select * from Archive_Execution_Governance_Info where waveId='"+Id+"' order by seq_no;";
	//		Statement st = con.createStatement();
	//		ResultSet rs = st.executeQuery(selectQuery);
	//		
	//		while(rs.next()) {
	//			
	//			if(rs.getInt(1)!=rowCount) {
	//			  
	//			  String updateQuery = "update Archive_Execution_Governance_Info set seq_no = "+rowCount+" where waveId='"+Id+"' and seq_no = "+rs.getInt(1);
	//			  Statement st1 = con.createStatement();
	//			  st1.executeUpdate(updateQuery);
	//			  st1.close();
	//			  
	//			}
	//			
	//			rowCount++;
	//		}
	//		rs.close();
	//		st.close();
	//	}
	//	catch(Exception e)
	//	{
	//		e.printStackTrace();
	//	}
	//	
	//}

	private String getAppNames() {
		String apps = "";
		try {
			String selectQuery = "select * from governance_Info where waveId = ? and column_name = 'apps';";
			PreparedStatement pst7 = con.prepareStatement(selectQuery);
			pst7.setString(1, Id);

			ResultSet rs = pst7.executeQuery();

			if(rs.next()) {
				apps = rs.getString("value");
			}

			rs.close();
			pst7.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return apps;
	}

	public void insertAppParentNodes(String appNames, int govSeqNum,String waveName)
	{
		String[] appArr = appNames.split(",");

		Arrays.stream(appArr).forEach(app -> insertNode(app,govSeqNum,waveName));

	}

	public void insertNode(String appName, int govSeqNum, String waveName)
	{
		try
		{
			String appId = getApplicationIdByName(appName);
			String s="Archive Implementation";
			String selectQuery =  "select * from Archive_Execution_Info where oppId=? and taskGroup = ? order by seq_no;";
			PreparedStatement pst8 = con.prepareStatement(selectQuery);
			pst8.setString(1, appId);
			pst8.setString(2, s);
			ResultSet rs = pst8.executeQuery();
			int taskCount = getTaskCount(waveName);
			boolean FirstRow = true;
			if(FirstRow_Flag)
				seqNo = govSeqNum;
			int number = 0, decimalNumber = 1;
			if(rs.next())
			{
				String selectQuery1 = "select * from Archive_Execution_Info where oppId=? and seq_no>=? order by seq_no;";
				PreparedStatement pst9 = con.prepareStatement(selectQuery1);
				pst9.setString(1, appId);
				pst9.setInt(2, rs.getInt(1));
				ResultSet rs1 = pst9.executeQuery();

				while(rs1.next()) {
					System.out.println(rs1.getString("taskGroup"));
					if(rs1.getInt("level") == 1 && !FirstRow)
						break;
					else {
						String taskId = "";
						if(rs1.getString(4).equals("1")) {
							number++;
							taskId =  number+"";
							decimalNumber = 1;
						}
						else {
							taskId =number+"."+((decimalNumber<10)?"0"+decimalNumber:decimalNumber);
							decimalNumber++;
						}
						InsertRecordFromInfo(rs1, waveName, taskId, appName);
					}
					FirstRow = false;
				}
				rs1.close();
				pst9.close();



				FirstRow_Flag = false;

			}

			pst8.close();
			rs.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	private int getTaskCount(String waveName) {
		int taskCount = 0;
		try {
			int l=1;
			String selectQuery = "select * from Archive_Execution_Governance_info where waveName = ? and level=?  order by seq_no;";
			PreparedStatement psts = con.prepareStatement(selectQuery);
			psts.setString(1, waveName);
			psts.setInt(2, l);
			ResultSet rs = psts.executeQuery();

			while(rs.next())
			{
				if(rs.getString("taskGroup").equals("Intake Process / Methodology")) {
					taskCount++;
					break;
				} else
					taskCount++;	 
			}

			rs.close();
			psts.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return taskCount;
	}

	private String getApplicationIdByName(String appName) {
		String appId="";
		try {
			String selectQuery = "select * from opportunity_info where column_name = 'appName' and value = ?;";
			PreparedStatement psts1 = con.prepareStatement(selectQuery);
			psts1.setString(1, appName);
			ResultSet rs = psts1.executeQuery();

			if(rs.next())
			{
				appId=rs.getString("Id");
			}
			rs.close();
			psts1.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return appId;
	}

	public int deleteAllArchiveImplementParentNode()
	{
		int seqNum = 0;
		int toseqNum = 0;
		try
		{ 
			// to get from seq_no
			String selectQuery1 = "select * from Archive_Execution_Governance_Info where waveId=? and taskGroup like 'Archive Implementation%' order by seq_no;";
			PreparedStatement psts2 = con.prepareStatement(selectQuery1);
			psts2.setString(1, Id);
			ResultSet rs = psts2.executeQuery();

			boolean firstRow = true;
			if(rs.next())
				seqNum = rs.getInt(1);
			rs.close();
			psts2.close();

			//to get to seq_no
			String selectQuery3 = "select * from Archive_Execution_Governance_Info where waveId=? and taskGroup = 'Closure' order by seq_no;";
			PreparedStatement psts3 = con.prepareStatement(selectQuery3);
			psts3.setString(1, Id);
			ResultSet rs3 = psts3.executeQuery();

			if(rs3.next())
				toseqNum = rs3.getInt(1);
			rs3.close();
			psts3.close();

			// delete the row in between from and to seq_no
			String deleteQuery = "delete from Archive_Execution_Governance_Info where waveId = ? and seq_no >= ? and seq_no < ? order by seq_no;";	
			PreparedStatement st1 = con.prepareStatement(deleteQuery);
			st1.setString(1,Id);
			st1.setInt(2,seqNum);
			st1.setInt(3,toseqNum);
			st1.executeUpdate();
			st1.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return seqNum;
	}

	private void updateClosureSeqNum(int fromSeqNum,int seqNum) {
		try {

			String selectQuery = "select * from Archive_Execution_Governance_info where waveId=? and taskGroup = 'Closure' order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			//int appImpCount = 18 * appLength;

			while(rs.next()) {
				String selectQuery1 = "select * from Archive_Execution_Governance_info where waveId=? and seq_no >= ? order by seq_no;";
				PreparedStatement pst = con.prepareStatement(selectQuery1);
				pst.setString(1, Id);
				pst.setInt(2, rs.getInt(1));
				ResultSet rs1 = pst.executeQuery();

				while(rs1.next()) {
					String updateQuery = "update Archive_Execution_Governance_info set seq_no = ? where waveId=? and seq_no = ?";
					PreparedStatement pst1 = con.prepareStatement(updateQuery);
					int no=seqNum+fromSeqNum;
					pst1.setInt(1, no);
					pst1.setString(2, Id);
					pst1.setInt(3, rs1.getInt(1));
					pst1.execute();
					pst1.close();

					seqNum++;

				}
				pst.close();
				rs1.close();
			}

			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

	public String generateTaskId() throws SQLException {

		String uniqueID = "";
		boolean checkTermination = true;

		while(checkTermination) {

			uniqueID = UUID.randomUUID().toString();
			//System.out.println("Task Id : " + uniqueID);

			boolean checkDupilcateId = checkDuplicateTaskId(uniqueID);

			if(checkDupilcateId == false) {
				checkTermination = false;
			}
		}

		return uniqueID;
	}

	public boolean checkDuplicateTaskId(String uniqueID) throws SQLException {

		boolean checkDuplicate = false;

		String selectQuery = "select * from Archive_Execution_Info order by seq_no;";
		Statement state = con.createStatement();
		ResultSet result = state.executeQuery(selectQuery);

		while(result.next()) {
			String checkTaskId = result.getString("taskId");
			if(checkTaskId == uniqueID) {
				checkDuplicate = true;
			}	
		}
		state.close();
		result.close();		
		return checkDuplicate;
	}

	protected void finalize() throws Throwable 
	{ 
		System.out.println("Db connection closed.");
		con.close();
	}



}

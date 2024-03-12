package NewArchiveRequirements.LegacyApplicationInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveReqLegacyAppTemplateService {

	DBconnection dBconnection;
	Connection con;
	public String Id = null;
	
	public archiveReqLegacyAppTemplateService(String Id) throws ClassNotFoundException, SQLException {
		
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
	}
	
	public void archiveReqLegacyAppTemplate() throws SQLException {
		PreparedStatement Legacystmt=null;
		ResultSet rs_legacy=null;
		try {
			String LegacyAppInfo = "select * from ArchiveReq_LegacyApp_Template_Details";
			Legacystmt = con.prepareStatement(LegacyAppInfo);
			rs_legacy = Legacystmt.executeQuery();
			
			if(!rs_legacy.next())
			{
				archiveReqLegacyTemplateInfo legacy[] = new archiveReqLegacyTemplateInfo[22];
				legacy[0] = new archiveReqLegacyTemplateInfo(1,"","Legacy Application Name", "legacyappname", "Text box","Yes", "");
				legacy[1] = new archiveReqLegacyTemplateInfo(2,"","Source Platform/Databases", "srcdb", "Text box", "Yes", "");
				legacy[2] = new archiveReqLegacyTemplateInfo(3,"","Legacy Application Description(High level Usage)", "legacyappdesc", "Text box", "No", "");
				legacy[3] = new archiveReqLegacyTemplateInfo(4,"","What is the read-only date?", "readonly", "Datepicker", "Yes", "");
				legacy[4] = new archiveReqLegacyTemplateInfo(5,"","Is this application the only source of truth for the data?", "onlysrcdata", "Text box", "No", "");
				legacy[5] = new archiveReqLegacyTemplateInfo(6,",Internal,Third Party","Is the legacy application hosted internally or with an third-party  vendor?", "thirdpartyvendor", "Dropdown", "No", "");
				legacy[6] = new archiveReqLegacyTemplateInfo(7,"City,State,Country","If hosted internally, where is the data center location?(City, State,Country)", "locationcenter", "HiddenText", "No", "");
				legacy[7] = new archiveReqLegacyTemplateInfo(8,"","Name of the DBA who will grant access to the database", "dbaaccess", "Text box", "No", "");
				legacy[8] = new archiveReqLegacyTemplateInfo(9,"Yes,No","Is the legacy application following data localization laws?", "dataloclaw", "Radio box", "No", "");
				legacy[9] = new archiveReqLegacyTemplateInfo(10,"","If yes, List out the countries where the regulations apply?", "listcountry", "HiddenText", "No", "");
				legacy[10] = new archiveReqLegacyTemplateInfo(11,",Structured,Unstructured, Hybrid","Data Type Charecteristics:", "datachar", "Dropdown", "Yes", "");
				legacy[11] = new archiveReqLegacyTemplateInfo(12,"","What is the total data size?(MB,GB ,TB)", "totalsize", "Text box", "Yes", "");
				legacy[12] = new archiveReqLegacyTemplateInfo(13,"","What is the estimated number of tables?", "nooftables", "Text box", "No", "");
				legacy[13] = new archiveReqLegacyTemplateInfo(14,"","What is the estimated size of Structured data ?( MB,GB, TB)", "estimatestrucsize", "Text box", "No", "");
				legacy[14] = new archiveReqLegacyTemplateInfo(15,"","What is the estimated size of UnStructured data ?( MB,GB, TB)", "estimateunstrucsize", "Text box", "No", "");
				legacy[15] = new archiveReqLegacyTemplateInfo(16,"","If Unstructured/Hybrid the estimated number of files/documents", "estimatefile", "Text box", "No", "");
				legacy[16] = new archiveReqLegacyTemplateInfo(17,"","What languages are represented in the data?","datalang", "Text box", "No", "");
				legacy[17] = new archiveReqLegacyTemplateInfo(18,"Yes,No","Are there legal hold on any of the data?", "datahold", "Radio box", "Yes", "");
				legacy[18] = new archiveReqLegacyTemplateInfo(19,"","List out any dependencies that will interrupt the archival process", "archivalprocess", "Text box", "No", "");
				legacy[19] = new archiveReqLegacyTemplateInfo(20,"Yes,No","Encryption required on data?", "encreq", "Radio box", "Yes", "");
				legacy[20] = new archiveReqLegacyTemplateInfo(21,"Yes,No","Masking  required on data?", "makreq", "Radio box", "Yes", "");
				legacy[21] = new archiveReqLegacyTemplateInfo(22,"","Additional Questions", "addque", "Text box", "No", "");
				
				for (int index = 0; index<legacy.length; index++)
				{
					String Legacy_InsertQuery = "insert into ArchiveReq_LegacyApp_Template_Details (seq_no, options, label_name, column_name, type, mandatory, value)"
												+ "value(?, ?, ?, ?, ?, ?, ?)";
				
						  PreparedStatement legacystmt = con.prepareStatement(Legacy_InsertQuery);
				          legacystmt.setInt(1, legacy[index].seq_num);
						  legacystmt.setString(2, legacy[index].options);
						  legacystmt.setString(3, legacy[index].label);
						  legacystmt.setString(4, legacy[index].column);
						  legacystmt.setString(5, legacy[index].type);
						  legacystmt.setString(6, legacy[index].mandatory);
						  legacystmt.setString(7, legacy[index].value);
						  legacystmt.execute();
				}
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally
		{
			Legacystmt.close();
			rs_legacy.close();
		}
		
	}
	
	public void archiveReqlegacyTemplateToLegacy(String Id,String Opportunityname) throws SQLException {
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			
		
		String SelectQuery = "select * from archivereq_legacyapp_info where Id='"+Id+"' order by seq_no";
		st = con.prepareStatement(SelectQuery);
		rs = st.executeQuery();
		
		if (!rs.next()){
			String TemplateQuery = "select * from archivereq_legacyapp_template_details order by seq_no;";
			st1 = con.prepareStatement(TemplateQuery);
			rs1 = st1.executeQuery();
			
			while(rs1.next()) {
				
				JsonObject jsonObject = new JsonObject();
				boolean checkexsistent=false; 
				jsonObject.addProperty("checkexsistent",checkexsistent);
				jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
				jsonObject.addProperty("id", Id);
				jsonObject.addProperty("Project_Name", "");
				jsonObject.addProperty("App_Name", Opportunityname);
				jsonObject.addProperty("options", rs1.getString("options"));
				jsonObject.addProperty("LabelName", rs1.getString("label_name"));
				jsonObject.addProperty("ColumnName", rs1.getString("column_name"));
				jsonObject.addProperty("Type", rs1.getString("type"));
				jsonObject.addProperty("Mandatory", rs1.getString("mandatory"));
				jsonObject.addProperty("Value", rs1.getString("value"));
				
				jsonArray.add(jsonObject);
				
			}
			LegacyAppInfoRecordsStorage(Id,Opportunityname);
			new LegacyAppInfoService().LegacyAppInfoDataRetrieveService(Id,Opportunityname);
		}
		else
		{
			String TemplateQuery = "select * from archivereq_legacyapp_info where id='"+Id+"' order by seq_no;";
			st1 = con.prepareStatement(TemplateQuery);
			rs1 = st1.executeQuery();
			
			while(rs1.next()) {
				JsonObject jsonObject = new JsonObject();
				boolean checkexsistent=true; 
				jsonObject.addProperty("checkexsistent",checkexsistent);
				jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
				jsonObject.addProperty("id", Id);
				jsonObject.addProperty("Project_Name", "");
				jsonObject.addProperty("App_Name", Opportunityname);
				jsonObject.addProperty("options", rs1.getString("options"));
				jsonObject.addProperty("LabelName", rs1.getString("label_name"));
				jsonObject.addProperty("ColumnName", rs1.getString("column_name"));
				jsonObject.addProperty("Type", rs1.getString("type"));
				jsonObject.addProperty("Mandatory", rs1.getString("mandatory"));
				jsonObject.addProperty("Value", rs1.getString("value"));
				
				jsonArray.add(jsonObject);
				
			}
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally
		{
			st.close();
			rs.close();
			st1.close();
			rs1.close();
			
		}
	}
	
	private static void LegacyAppInfoRecordsStorage(String Id,String Opportunityname) throws SQLException {
		PreparedStatement st=null;
		ResultSet rs=null;
		try
		{
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectRecords = "select * from archivereq_legacyapp_info_template_details ";
			st = con.prepareStatement(SelectRecords);
			rs = st.executeQuery();
			int seq_num=1;
			while(rs.next())
			{
				String insert_query = "insert into archivereq_legacyapp_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
				preparedStatement1.setInt(1, seq_num++);
				preparedStatement1.setString(2, Id);
				preparedStatement1.setString(3, "");
				preparedStatement1.setString(4, Opportunityname);
				preparedStatement1.setString(5, rs.getString("options"));
				preparedStatement1.setString(6, rs.getString("label_name"));
				preparedStatement1.setString(7,rs.getString("column_name"));
				preparedStatement1.setString(8,rs.getString("type"));
				preparedStatement1.setString(9, rs.getString("mandatory"));
				preparedStatement1.setString(10, "");
				preparedStatement1.execute();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception------[Legacy App info]-----"+e);
		}
		finally
		{
			st.close();
			rs.close();
		}
	}
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}

}
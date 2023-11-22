package finance_module_service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import finance_module_service.FinanceTemplateService;
import onboard.DBconnection;

public class FinanceTemplateService {
	DBconnection dBconnection;
	Connection con;
	public String app_name = null;
	
	public FinanceTemplateService(String app_name) throws ClassNotFoundException, SQLException {
		
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.app_name = app_name;
	}
	
	public void FinanceAppTemplate() throws SQLException {
		PreparedStatement Financestmt=null;
		ResultSet rs_finance=null;
		try {
			String FinanceAppInfo = "select * from decom3sixtytool.finance_info_detail";
			Financestmt = con.prepareStatement(FinanceAppInfo);
			rs_finance = Financestmt.executeQuery();
			
			if(!rs_finance.next())
			{
				financeTemplateInfo finance[] = new financeTemplateInfo[12];
				finance[0] = new financeTemplateInfo(1,"Project_Number", "legacyappname", "Text box","No", "");
				finance[1] = new financeTemplateInfo(2,"Application_Name", "srcdb", "Text box", "Yes", "");
				finance[2] = new financeTemplateInfo(3,"Software_and_Licensing", "legacyappdesc", "Text box", "No", "");
				finance[3] = new financeTemplateInfo(4,"Contract_possibly_terms_of_contract e.g., length, expiration", "readonly", "Text box", "Yes", "");
				finance[4] = new financeTemplateInfo(5,"Scope_of_infrastructure", "onlysrcdata", "Text box", "No", "");
				finance[5] = new financeTemplateInfo(6,"Cost_Avoidance", "thirdpartyvendor", "Text box", "Yes", "");
				finance[6] = new financeTemplateInfo(7,"Cost_of_Archive", "locationcenter", "Text box", "Yes", "");

				finance[7] = new financeTemplateInfo(8,"CBA", "dbaaccess", "Text box", "No", "");
				finance[8] = new financeTemplateInfo(9,"Verification_or_approval", "dataloclaw", "Text box", "Yes", "");
				finance[9] = new financeTemplateInfo(10,"Ability_to_pull_up_archive_target_and_input_financial_information.", "listcountry", "Text box", "Yes", "");
				finance[10] = new financeTemplateInfo(11,"Funding_approved?", "datachar", "Text box", "Yes", "");
				finance[11] = new financeTemplateInfo(12,"Funding_type", "totalsize", "Text box", "Yes", "");
				finance[12] = new financeTemplateInfo(13,"PRJ#", "nooftables", "Text box", "Yes", "");
				
				
				for (int index = 0; index<finance.length; index++)
				{
					String Legacy_InsertQuery = "insert into finance_{info_detail (seq_no,  label_name, column_name, type, mandatory, value)"
												+ "value(?, ?, ?, ?, ?, ?, ?)";
				
						  PreparedStatement legacystmt = con.prepareStatement(Legacy_InsertQuery);
				          legacystmt.setInt(1, finance[index].seq_no);
						  legacystmt.setString(2, finance[index].options);
						  legacystmt.setString(3, finance[index].label_name);
						  legacystmt.setString(4, finance[index].column_name);
						  legacystmt.setString(5, finance[index].type);
						  legacystmt.setString(6, finance[index].mandatory);
						  legacystmt.setString(7, finance[index].value);
						  legacystmt.execute();
				}
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally
		{
			Financestmt.close();
			rs_finance.close();
		}
		
	}
	
	public void archiveReqlegacyTemplateToLegacy(String srcdb ,String Opportunityname) throws SQLException {
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			
		
		String SelectQuery = "select * from finance_info where srcdb='"+srcdb+"' order by seq_no";
		st = con.prepareStatement(SelectQuery);
		rs = st.executeQuery();
		
		if (!rs.next()){
			String TemplateQuery = "select * from finance_info__detail order by seq_no;";
			st1 = con.prepareStatement(TemplateQuery);
			rs1 = st1.executeQuery();
			
			while(rs1.next()) {
				
				JsonObject jsonObject = new JsonObject();
				boolean checkexsistent=false; 
				jsonObject.addProperty("checkexsistent",checkexsistent);
				jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
				
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
			FinanceAppInfoRecordsStorage(app_name);
			new FinanceAppInfoService().FinanceAppInfoDataRetrieveService(app_name);
		}
		else
		{
			String TemplateQuery = "select * from archivereq_legacyapp_info where id='"+app_name+"' order by seq_no;";
			st1 = con.prepareStatement(TemplateQuery);
			rs1 = st1.executeQuery();
			
			while(rs1.next()) {
				JsonObject jsonObject = new JsonObject();
				boolean checkexsistent=true; 
				jsonObject.addProperty("checkexsistent",checkexsistent);
				jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
				
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
	
	private static void FinanceAppInfoRecordsStorage(String app_name) throws SQLException {
		PreparedStatement st=null;
		ResultSet rs=null;
		try
		{
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectRecords = "select * from finance_info_detail ";
			st = con.prepareStatement(SelectRecords);
			rs = st.executeQuery();
			int seq_num=1;
			while(rs.next())
			{
				String insert_query = "insert into finance_info (seq_no,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
				preparedStatement1.setInt(1, seq_num++);
			
				preparedStatement1.setString(2, "");
			
				preparedStatement1.setString(3, rs.getString("options"));
				preparedStatement1.setString(4, rs.getString("label_name"));
				preparedStatement1.setString(5,rs.getString("column_name"));
				preparedStatement1.setString(6,rs.getString("type"));
				preparedStatement1.setString(7, rs.getString("mandatory"));
				preparedStatement1.setString(8, "");
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

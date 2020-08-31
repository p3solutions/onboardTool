package IntakeDetails.IntakeAssessment.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.common.util.concurrent.Service.State;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.sun.jersey.core.impl.provider.entity.XMLJAXBElementProvider.App;

import onboard.DBconnection;

public class IntakeAssessSectionDataRetrieveService {
    DBconnection dBconnection =null;
	
	Connection con = null;
	
	public static String SectionName;
	
	public static String SectionTemplateTable;
	
	public static String SectionInfoTable;
	
	public static String id;
	
	public static boolean checkContractInfo;
	
	public static boolean checkThirdParty; 
	
	public IntakeAssessSectionDataRetrieveService(String Section,String id) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.id = id;
		SetTableName(Section);
	}
	
	private void SetTableName(String section) {
		
		SectionName = section;
		
		switch(section)
		{
		case "APPLICATIONINFO" :
			SectionTemplateTable = "Assessment_Application_Info_Template_Details";
			SectionInfoTable = "Assessment_Application_Info";
	        //checkThirdParty = CheckAppInfoThirdParty();
			checkContractInfo = true;
			break;
		
		case "DATACHARACTERISTICS" :
			SectionTemplateTable = "assessment_data_char_info_template_details";
			SectionInfoTable = "assessment_data_char_info";		
			break;
			
		case "COMPLIANCE" :
			SectionTemplateTable = "assessment_compliance_char_info_template_details";
			SectionInfoTable = "Assessment_Compliance_Char_Info";
			checkContractInfo = true;
			break;
	 	
		case "ARCHIVALCONSUMPTION" :
			SectionTemplateTable = "Assessment_Archival_Consumption_Info_Template_Details";
			SectionInfoTable = "Assessment_Archival_Consumption_Info";
			break;
		
		case "CONTRACTINFO":
			SectionTemplateTable = "Assessment_Contract_Info_Template_Details";
			SectionInfoTable = "Assessment_Contract_Info";
			checkContractInfo = false;
			break;
		}
		
	}
	public JsonArray DataRetrieveTableInfo()
	 {
		 JsonArray jsonArray = new JsonArray();
		 try
		 {	 
			 String SelectQueryComplianceChar = "Select * from "+SectionInfoTable+" Where Id ='"+id+"' order by seq_no;";
			 
			 Statement st1 = con.createStatement();
			 
			 ResultSet rs1 = st1.executeQuery(SelectQueryComplianceChar);
		     
			 boolean CeckExistance = true;
			 
			 if(rs1.next())
			 {
				    JsonObject jsonObject = new JsonObject();
				    jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
					jsonObject.addProperty("id", rs1.getString("Id"));
					jsonObject.addProperty("Project_Name", rs1.getString("prj_name"));
					jsonObject.addProperty("App_Name", rs1.getString("app_name"));
					jsonObject.addProperty("section", rs1.getString("section"));
					jsonObject.addProperty("options", rs1.getString("options"));
					jsonObject.addProperty("LabelName", rs1.getString("label_name"));
					jsonObject.addProperty("ColumnName", rs1.getString("column_name"));
					jsonObject.addProperty("Type", rs1.getString("type"));
					jsonObject.addProperty("Mandatory", rs1.getString("mandatory"));
					jsonObject.addProperty("Value", rs1.getString("value"));
					jsonArray.add(jsonObject);
				 while(rs1.next())
				 {
					    JsonObject jsonObject1 = new JsonObject();
					    jsonObject1.addProperty("seq_num", rs1.getString("seq_no"));
						jsonObject1.addProperty("id", rs1.getString("Id"));
						jsonObject1.addProperty("Project_Name", rs1.getString("prj_name"));
						jsonObject1.addProperty("App_Name", rs1.getString("app_name"));
						jsonObject1.addProperty("section", rs1.getString("section"));
						jsonObject1.addProperty("options", rs1.getString("options"));
						jsonObject1.addProperty("LabelName", rs1.getString("label_name"));
						jsonObject1.addProperty("ColumnName", rs1.getString("column_name"));
						jsonObject1.addProperty("Type", rs1.getString("type"));
						jsonObject1.addProperty("Mandatory", rs1.getString("mandatory"));
						jsonObject1.addProperty("Value", rs1.getString("value"));
						jsonArray.add(jsonObject1);  
				 }
				 st1.close();
				 rs1.close();
			 }
			 else
			 {
				 String SelectQueryComplianceCharTemp = "Select * from "+SectionTemplateTable+" order by seq_no;";
				 
				 Statement st2 = con.createStatement();
				 
				 ResultSet rs2 = st2.executeQuery(SelectQueryComplianceCharTemp);
			     while(rs2.next())
			     {
			    	 JsonObject jsonObject = new JsonObject();
					    jsonObject.addProperty("seq_num", rs2.getString("seq_no"));
						//jsonObject.addProperty("id", rs1.getString("Id"));
						jsonObject.addProperty("Project_Name", rs2.getString("prj_name"));
						jsonObject.addProperty("App_Name", rs2.getString("app_name"));
						jsonObject.addProperty("section", rs2.getString("section"));
						jsonObject.addProperty("options", rs2.getString("options"));
						jsonObject.addProperty("LabelName", rs2.getString("label_name"));
						jsonObject.addProperty("ColumnName", rs2.getString("column_name"));
						jsonObject.addProperty("Type", rs2.getString("type"));
						jsonObject.addProperty("Mandatory", rs2.getString("mandatory"));
						jsonObject.addProperty("Value", rs2.getString("value"));
						jsonArray.add(jsonObject);
			     }
			     st2.close();
			     rs2.close();
			     
			     //moving records from template table to info table
			     
			     MovingTemplateRecordsToInfo();
			     
			 }
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
			 System.out.println("Exception-------[error]-----"+e); 
		 }
		 return jsonArray;
	 }
	private void MovingTemplateRecordsToInfo()
	{
		try
		{
			String SelectTempQuery = "Select * from "+SectionTemplateTable+" order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(SelectTempQuery);
			
			while(rs.next())
			{
				String InsertQuery = "insert into "+SectionInfoTable+" (seq_no, id, prj_name, app_name, section, options, label_name, column_name, type, mandatory, value)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement prestmt1 = con.prepareStatement(InsertQuery);			
				prestmt1.setInt(1, rs.getInt(1));
				prestmt1.setString(2, id);			
				prestmt1.setString(3, rs.getString(2));
				prestmt1.setString(4, rs.getString(3));
				prestmt1.setString(5, rs.getString(4));
				prestmt1.setString(6, rs.getString(5));
				prestmt1.setString(7, rs.getString(6));
				prestmt1.setString(8, rs.getString(7));
				prestmt1.setString(9, rs.getString(8));
				prestmt1.setString(10,rs.getString(9));
				prestmt1.setString(11,rs.getString(10));
				prestmt1.execute();
			}
		}
		catch(Exception e)
		{
	      e.printStackTrace();
		}
	}
	
	public JsonArray DataRetrieveForContractInformation(String id)
	{
		JsonArray jsonArray = new JsonArray();
       try
       {
    	   String SelectTemplateQuery = "select * from " +SectionTemplateTable+" order by seq_no;";
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(SelectTemplateQuery);
			
			while(rs1.next())
			{
				String InsertQueryCon = "insert into "+SectionInfoTable+" (seq_no, id, prj_name, app_name, section, options, label_name, column_name, type, mandatory, value)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement prestmt1 = con.prepareStatement(InsertQueryCon);			
				prestmt1.setInt(1, rs1.getInt(1));
				prestmt1.setString(2, id);			
				prestmt1.setString(3, rs1.getString(2));
				prestmt1.setString(4, rs1.getString(3));
				prestmt1.setString(5, rs1.getString(4));
				prestmt1.setString(6, rs1.getString(5));
				prestmt1.setString(7, rs1.getString(6));
				prestmt1.setString(8, rs1.getString(7));
				prestmt1.setString(9, rs1.getString(8));
				prestmt1.setString(10,rs1.getString(9));
				prestmt1.setString(11,rs1.getString(10));
				prestmt1.execute();
				
				 JsonObject jsonObject1 = new JsonObject();
				    jsonObject1.addProperty("seq_num", rs1.getString("seq_no"));
					//jsonObject1.addProperty("id", rs1.getString("Id"));
					jsonObject1.addProperty("Project_Name", rs1.getString("prj_name"));
					jsonObject1.addProperty("App_Name", rs1.getString("app_name"));
					jsonObject1.addProperty("section", rs1.getString("section"));
					jsonObject1.addProperty("options", rs1.getString("options"));
					jsonObject1.addProperty("LabelName", rs1.getString("label_name"));
					jsonObject1.addProperty("ColumnName", rs1.getString("column_name"));
					jsonObject1.addProperty("Type", rs1.getString("type"));
					jsonObject1.addProperty("Mandatory", rs1.getString("mandatory"));
					jsonObject1.addProperty("Value", rs1.getString("value"));
					jsonArray.add(jsonObject1); 
			}

       }
       catch(Exception e)
       {
    	   e.printStackTrace();
    	   System.out.println("Exception-----[info]-------"+e);
       }
       return jsonArray;
	}
	
	public void ContractInformationDelete() {
		try 
		{
			String DeleteContractInfoQuery = "delete from "+SectionInfoTable+" where id = '"+id+"'";
			Statement st = con.createStatement();
			st.executeUpdate(DeleteContractInfoQuery);
		}
		catch(Exception e) {
			System.out.println("Exception-----[info]-------" +e);
		}
	}
	public boolean CheckAppInfoThirdParty()
	{
		boolean Check = false;
	 try
	  {
	   if(SectionName.equals("CONTRACTINFO"))
		{
			String value = "Third Party";
			
			String selectQuery = "Select * from Assessment_Application_Info where id ='"+id+"' and column_name = 'AppDetails';";
			
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(selectQuery);
			
			if(rs.next())
			{
			  if(value.equals(rs.getString("value").toString()))
			  {
				  Check = true;
			  }
			}
		  }
		}
	catch(Exception e)
	{
		  e.printStackTrace();
	}
	return Check;
	}
}

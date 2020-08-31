package IntakeDetails.IntakeAssessment.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class IntakeAssessmentSaveFunctionalityService {

	
	DBconnection dBconnection =null;
	
	Connection con = null;
	
	public static String SectionName;
	
	public static String SectionTemplateTable;
	
	public static String SectionInfoTable;
	
	public static String id;
	
	public static boolean checkContractInfo;
	
	public static boolean checkThirdParty;
	
	public IntakeAssessmentSaveFunctionalityService(String Section,String id) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.id = id;
		SetTableName(Section);
	}
	
private void SetTableName(String section) {
		
		SectionName = section;
		
		switch(section)
		{
		case "ComplianceCharacteristics" :
			SectionTemplateTable = "assessment_compliance_char_info_template_details";
			SectionInfoTable = "Assessment_Compliance_Char_Info";
			break;
			
		case "ApplicationInformation" :
			SectionTemplateTable = "Assessment_Application_Info_Template_Details";
			SectionInfoTable = "Assessment_Application_Info";
			break;
		case "ContractInformation":
			SectionTemplateTable = "Assessment_Contract_Info_Template_Details";
			SectionInfoTable = "Assessment_Contract_Info";
			break;
		case "DataCharacteristics" :
			SectionTemplateTable = "assessment_data_char_info_template_details";
			SectionInfoTable = "assessment_data_char_info";		
			break;
		case "ArchivalConsumption" :
			SectionTemplateTable = "Assessment_Archival_Consumption_Info_Template_Details";
			SectionInfoTable = "Assessment_Archival_Consumption_Info";
			break;
		}
		
	}
public void Save(JsonArray jsonArr,String id) {

	 try {
			 DBconnection con = new DBconnection();
			 Connection connection = (Connection) con.getConnection();
					  for(int i=0;i<jsonArr.size();i++)
						 {
							JsonObject jsonObj = jsonArr.get(i).getAsJsonObject();
							String name = jsonObj.get("Name").getAsString();
							String value = jsonObj.get("Value").getAsString();
							String SelectQuery = "select * from "+SectionInfoTable+" where id ='"+id+"' and column_name='"+name+"' and section = '"+SectionName+"';";
							Statement st = connection.createStatement();
							ResultSet rs = st.executeQuery(SelectQuery);
								if(rs.next())
									{   
										String UpdateQuery = "update "+SectionInfoTable+" set value='"+value+"' where id ='"+id+"' and column_name ='"+name+"' and section = '"+SectionName+"';";
										Statement st1 = connection.createStatement();
							            st1.executeUpdate(UpdateQuery);
							           
									}
						 }
			connection.close();
	  
		 }
		 
	 
	 catch(Exception e) {
		 e.printStackTrace();
		System.out.println("Exception----------[info]--------"+e);
	 }
	
}

}
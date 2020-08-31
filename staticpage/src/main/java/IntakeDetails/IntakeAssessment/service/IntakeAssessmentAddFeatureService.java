package IntakeDetails.IntakeAssessment.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Set;

import com.google.gson.JsonObject;

import onboard.DBconnection;

public class IntakeAssessmentAddFeatureService {
DBconnection dBconnection =null;
	
	Connection con = null;
	
	public static String SectionName;
	
	public static String SectionTemplateTable;
	
	public static String SectionInfoTable;
	
	public static String id,label_name, mandatory, type, options;

	public static int NumberofInputfields = 0 ;
	public IntakeAssessmentAddFeatureService(DBconnection dBconnection, Connection con,String SectionName,String id,String label_name, String mandatory, String type, int NumberofInputfields, String options) {
		this.dBconnection = dBconnection;
		this.con = con;
		this.SectionName = SectionName;
		this.id = id;
		SetTableName(SectionName);
		this.label_name = label_name;
		this.mandatory = mandatory;
		this.type = type;
		this.NumberofInputfields = NumberofInputfields;
		this.options = options;
	}
private void SetTableName(String section) {
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
	public Boolean CheckDuplicateAddLabel() 
	{
	  JsonObject jsonObject = new JsonObject();
	  boolean labelcheck=false;
	  try
	  {
		  String select_lab = "select * from "+SectionInfoTable+" where Id = '"+id+"' and label_name = '"+label_name+"' ";
          Statement st1=con.createStatement();
          ResultSet rs1=st1.executeQuery(select_lab);
          if(rs1.next()){
              labelcheck = true;   
          }
	  }
	  catch(Exception e)
	  {
		e.printStackTrace();  
	  }
	    return labelcheck;
	}
	public int AddFieldsToSectionTable() {
		int max_seq_num = 1;
		try {
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String select_query = "select * from "+SectionInfoTable+" where Id = '"+id+"' order by seq_no;";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(select_query);
			String name = "AssessmentAddInfo";
			
			if (rs.next()) {
				String max_seqnum = "select max(seq_no) from "+SectionInfoTable+" where Id = '"+id+"' order by seq_no;";
				Statement st1 = connection.createStatement();
				ResultSet rs1 = st1.executeQuery(max_seqnum);

				if (rs1.next()) {
					max_seq_num = Integer.parseInt(rs1.getString(1));
					max_seq_num++;
				}
			}
			if (!type.equals("Text box") && !type.equals("Datepicker")) {
				options = options.substring(0, options.length() - 1);
			}
			String insert_query = "insert into "+SectionInfoTable+" (seq_no,id,prj_name,app_name,Section,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
			preparedStatement1.setInt(1, max_seq_num);
			preparedStatement1.setString(2, id);
			preparedStatement1.setString(3, "");
			preparedStatement1.setString(4, "");
			preparedStatement1.setString(5, SectionName);
			preparedStatement1.setString(6, options);
			preparedStatement1.setString(7, label_name);
			preparedStatement1.setString(8, (name + max_seq_num));
			preparedStatement1.setString(9, type);
			preparedStatement1.setString(10, mandatory);
			preparedStatement1.setString(11, "");
			preparedStatement1.execute();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception---[info]------" + e);
		}
		return max_seq_num;
	}
}

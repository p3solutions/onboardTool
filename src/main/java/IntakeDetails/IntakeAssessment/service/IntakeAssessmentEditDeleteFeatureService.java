package IntakeDetails.IntakeAssessment.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class IntakeAssessmentEditDeleteFeatureService {
	DBconnection dBconnection =null;
	Connection con = null;
	public static String ID;
	public static String SectionName;
	public static String SectionTemplateTable;
	public static String SectionInfoTable;
	public static int Seq_num;
	public static String type;
	public static int DeleteCount;
	public static String column_name;
	public static boolean DependencyFlag;
	public IntakeAssessmentEditDeleteFeatureService(String ID,String SectionName,int Seq_num) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.ID =ID;
		this.SectionName = SectionName;
		SetTableName(SectionName);
		this.Seq_num  = Seq_num;
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
	public JsonObject EditField(String label_name)
	{
		JsonObject jsonobj = new JsonObject();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String PreviouslabelQuery = "select label_name from "+SectionInfoTable +" where id = ? and seq_no =?;";
			PreparedStatement st1 = connection.prepareStatement(PreviouslabelQuery);
			st1.setString(1, ID);
			st1.setInt(2, Seq_num);
			ResultSet rs1 = st1.executeQuery();
			if (rs1.next()) {
				jsonobj.addProperty("previous_label_name", rs1.getString(1));
			}
			String update_query = "update "+SectionInfoTable+" set label_name =? where id = ? and seq_no=?;";
			PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
			preparedStmt1.setString(1, label_name);
			preparedStmt1.setString(2, ID);
			preparedStmt1.setInt(3, Seq_num);
			preparedStmt1.execute();
			String SelectQuery = "select * from "+SectionInfoTable+" where id =? and seq_no =?;";
			PreparedStatement st = connection.prepareStatement(SelectQuery);
			st.setString(1, ID);
			st.setInt(2, Seq_num);
			ResultSet rs = st.executeQuery();
			int i = 1;
			if (rs.next()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				while (i <= rsmd.getColumnCount()) {
					jsonobj.addProperty(rs.getMetaData().getColumnName(i), rs.getString(i));
					i++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception---->>>>" + e);
		}
		System.out.println("Json object " + jsonobj);
		return jsonobj;
	}
	public JsonObject DeleteFeature()
	{
		JsonObject jsonObject = new JsonObject();
		try {
			if(isDependecyField())
			{
				for(int i = 0; i<DeleteCount; i++) 
				{
					deleteSingleField(); 
				}
			}
			else
			{
				deleteSingleField();
			}
			OrderingColumnNameBySeq();
			jsonObject.addProperty("index", Seq_num-1);
			jsonObject.addProperty("CheckDelete",DependencyFlag);
			jsonObject.addProperty("DeleteCount",DeleteCount);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception---->>>" + e);
		}
		return jsonObject;
	}
	public void OrderingColumnNameBySeq()
	{
		try {
			String SelectQuery ="Select * from "+SectionInfoTable+" where id = ? and section = ? order by seq_no";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, ID);
			st.setString(2, SectionName);
			ResultSet rs = st.executeQuery();
			String startStr = "AssessmentAddInfo";
			while(rs.next())
			{
				if(rs.getString("column_name").startsWith("AssessmentAddInfo"))
				{
					String seqnum = rs.getString("seq_no");
					String column_name = rs.getString("column_name");
					String append_seq_num=column_name.substring(startStr.length(),column_name.length());
					if(!seqnum.equals(append_seq_num))
					{
						String updateColumnName = startStr+seqnum;
						String UpdateQuery = "Update "+SectionInfoTable+" set column_name =? where id = ? and section =? and seq_no=?;";  
						PreparedStatement st1 = con.prepareStatement(UpdateQuery);
						st1.setString(1, updateColumnName);
						st1.setString(2, ID);
						st1.setString(3, SectionName);
						st1.setString(4, seqnum);
						st1.execute(); 
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception-----------[info]-------"+e);
		}
	}
	private Boolean isDependecyField()
	{
		DependencyFlag = false;
		try {
			String selectQuery = "Select * from "+SectionInfoTable+" where seq_no = ? and section =?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setInt(1, Seq_num);
			st.setString(2, SectionName);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				type = rs.getString("type");
				column_name = rs.getString("column_name");
				if(column_name .equals("StaticData"))
				{
					DependencyFlag = true; 
					DeleteCount = 3;
				}
				else if(type.equals("RadioBoxDependencyYes")||type.equals("RadioBoxDependencyNo"))
				{
					DependencyFlag = true; 
					DeleteCount = 2;
				}
				else if(type.equals("RadioBoxDependencyYesNo"))
				{
					DependencyFlag = true; 
					DeleteCount = 3;
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return DependencyFlag;
	}
	public void deleteSingleField()
	{
		try
		{
			int seqmax = 0;
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
			ArrayList<String> arr_id = new ArrayList<String>();
			ArrayList<String> arr_prj = new ArrayList<String>();
			ArrayList<String> arr_app = new ArrayList<String>();
			ArrayList<String> arr_section = new ArrayList<String>();
			ArrayList<String> arr_options = new ArrayList<String>();
			ArrayList<String> arr_label_name = new ArrayList<String>();
			ArrayList<String> arr_column_name = new ArrayList<String>();
			ArrayList<String> arr_type = new ArrayList<String>();
			ArrayList<String> arr_mandatory = new ArrayList<String>();
			ArrayList<String> arr_value = new ArrayList<String>();
			ArrayList<String> arr_umandatory = new ArrayList<String>();
			ArrayList<Integer> arr_seqmax_split = new ArrayList<Integer>();
			ArrayList<String> arr_id_split = new ArrayList<String>();
			ArrayList<String> arr_prj_split = new ArrayList<String>();
			ArrayList<String> arr_app_split = new ArrayList<String>();
			ArrayList<String> arr_section_split = new ArrayList<String>();
			ArrayList<String> arr_options_split = new ArrayList<String>();
			ArrayList<String> arr_label_name_split = new ArrayList<String>();
			ArrayList<String> arr_column_name_split = new ArrayList<String>();
			ArrayList<String> arr_type_split = new ArrayList<String>();
			ArrayList<String> arr_mandatory_split = new ArrayList<String>();
			ArrayList<String> arr_value_split = new ArrayList<String>();
			ArrayList<String> arr_umandatory_split = new ArrayList<String>();
			String select_query = "select max(seq_no) from "+SectionInfoTable+" where Id = ? and section =? order by seq_no;";
			PreparedStatement st = con.prepareStatement(select_query);
			st.setString(1, ID);
			st.setString(2, SectionName);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				seqmax = Integer.parseInt(rs.getString(1));
			}
			String query = "select * from "+SectionInfoTable+" where Id = ? and section =? order by seq_no;";
			PreparedStatement st1 = connection.prepareStatement(query);
			st1.setString(1, ID);
			st1.setString(2, SectionName);
			ResultSet rs1 = st1.executeQuery();
			while (rs1.next()) {
				arr_seqmax.add(rs1.getInt("seq_no"));
				arr_id.add(rs1.getString("Id"));
				arr_prj.add(rs1.getString("prj_name"));
				arr_app.add(rs1.getString("app_name"));
				arr_section.add(rs1.getString("Section"));
				arr_options.add(rs1.getString("options"));
				arr_label_name.add(rs1.getString("label_name"));
				arr_column_name.add(rs1.getString("column_name"));
				arr_type.add(rs1.getString("type"));
				arr_mandatory.add(rs1.getString("mandatory"));
				arr_value.add(rs1.getString("value"));
				arr_umandatory.add(rs1.getString("usermandatoryflag"));
			}
			for (int i = 0; i < seqmax; i++) {
				if (arr_seqmax.get(i) < Seq_num) {
					arr_seqmax_split.add(arr_seqmax.get(i));
					arr_id_split.add(arr_id.get(i));
					arr_prj_split.add(arr_prj.get(i));
					arr_app_split.add(arr_app.get(i));
					arr_section_split.add(arr_section.get(i));
					arr_options_split.add(arr_options.get(i));
					arr_label_name_split.add(arr_label_name.get(i));
					arr_column_name_split.add(arr_column_name.get(i));
					arr_type_split.add(arr_type.get(i));
					arr_mandatory_split.add(arr_mandatory.get(i));
					arr_value_split.add(arr_value.get(i));
					arr_umandatory_split.add(arr_umandatory.get(i));
				} else if (arr_seqmax.get(i) > Seq_num) {
					arr_seqmax_split.add((arr_seqmax.get(i) - 1));
					arr_id_split.add(arr_id.get(i));
					arr_prj_split.add(arr_prj.get(i));
					arr_app_split.add(arr_app.get(i));
					arr_section_split.add(arr_section.get(i));
					arr_options_split.add(arr_options.get(i));
					arr_label_name_split.add(arr_label_name.get(i));
					arr_column_name_split.add(arr_column_name.get(i));
					arr_type_split.add(arr_type.get(i));
					arr_mandatory_split.add(arr_mandatory.get(i));
					arr_value_split.add(arr_value.get(i));
					arr_umandatory_split.add(arr_umandatory.get(i));
				}
			}
			String delete_query = "delete from "+SectionInfoTable+" where id=? and section =?;";
			PreparedStatement st2=connection.prepareStatement(delete_query);
			st2.setString(1, ID);
			st2.setString(2, SectionName);
			st2.executeUpdate();
			for (int j = 0; j < seqmax - 1; j++) {
				String insert_query = "insert into "+SectionInfoTable+" (seq_no,id,prj_name,app_name,section,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
				PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
				preparedStatement1.setInt(1, arr_seqmax_split.get(j));
				preparedStatement1.setString(2, arr_id_split.get(j));
				preparedStatement1.setString(3, arr_prj_split.get(j));
				preparedStatement1.setString(4, arr_app_split.get(j));
				preparedStatement1.setString(5,arr_section.get(j));
				preparedStatement1.setString(6, arr_options_split.get(j));
				preparedStatement1.setString(7, arr_label_name_split.get(j));
				preparedStatement1.setString(8, arr_column_name_split.get(j));
				preparedStatement1.setString(9, arr_type_split.get(j));
				preparedStatement1.setString(10, arr_mandatory_split.get(j));
				preparedStatement1.setString(11, arr_value_split.get(j));
				preparedStatement1.setString(12, arr_umandatory_split.get(j));
				preparedStatement1.execute();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception : " + e);
		}
	}
}
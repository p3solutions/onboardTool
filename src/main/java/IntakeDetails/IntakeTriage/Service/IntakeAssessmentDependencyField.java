package IntakeDetails.IntakeTriage.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import IntakeDetails.IntakeAssessment.service.IntakeAssessmentEditDeleteFeatureService;
import onboard.DBconnection;
import logger.System;
public class IntakeAssessmentDependencyField {
	DBconnection dBconnection =null;
	Connection con = null;
	String id;
	String column_name;
	String AssessmentColumName;
	String AssessmentDependencyColumnName;
	public IntakeAssessmentDependencyField(String id,String ColumnName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.id =id;
		this.column_name = ColumnName;
		AssessmentColumName = getTriageAssessmentColumnPair().get(column_name);
		AssessmentDependencyColumnName = getAssessmentDependentPair().get(AssessmentColumName);
	}
	private HashMap<String,String> getTriageAssessmentColumnPair()
	{
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("appPlatfrm","AssessAppPlatform");
		map.put("compliance","ComplianceLegalDrivers");
		map.put("Financialdate","BusinessDriversDrivers");
		map.put("TechincalDeterminingdate","TechnicalDrivers");
		return map;
	}
	private HashMap<String,String> getAssessmentDependentPair()
	{
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("AssessAppPlatform","OtherPleaseDescribe");
		map.put("ComplianceLegalDrivers","PleaseDescribe1");
		map.put("BusinessDriversDrivers","PleaseDescribe2");
		map.put("TechnicalDrivers","PleaseDescribe3");
		return map;
	}
	private boolean isAssessmentDependencyField()
	{
		return getTriageAssessmentColumnPair().containsKey(column_name); 
	}
	public JsonArray AddAssessmentDependentField()
	{
		JsonArray jsonArray = new JsonArray(); 
		try
		{
			if(isAssessmentDependencyField())
			{
				jsonArray = AddField(AssessmentColumName);
				jsonArray.addAll(AddField(AssessmentDependencyColumnName));
			}   
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	private JsonArray AddField(String Column_Name)
	{
		PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonArray jsonArray = new JsonArray();
		try
		{
			if(!CheckColumnNameInAssessmentAppInfoTable(Column_Name))
			{
				String TempFieldQuery = "select * from assessment_application_info_template_details where column_name ='"+Column_Name+"';";
				st1 = con.prepareStatement(TempFieldQuery);
				rs1 = st1.executeQuery();
				if(rs1.next())
				{
					int seq_num = getSeqNum();
					JsonObject  json = InsertFieldApplicationInfo(seq_num,id,rs1);
					jsonArray.add(json);
				}  
			}
			st1.close();
			rs1.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	private int getSeqNum()
	{
		int seq_num =1;
		try
		{
			String SeqNumQuery = "select max(seq_no) from assessment_application_info where id= ? ;";
			PreparedStatement st2 = con.prepareStatement(SeqNumQuery);
			st2.setString(1,id);
			ResultSet rs2 = st2.executeQuery();
			if(rs2.next())
				seq_num = Integer.parseInt(rs2.getString(1));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return seq_num+1;
	}
	private boolean CheckColumnNameInAssessmentAppInfoTable(String column)
	{
		boolean check = false;
		try
		{
			String AddFieldQuery = "select * from assessment_application_info where id =? and column_name =?;";
			PreparedStatement st = con.prepareStatement(AddFieldQuery);
			st.setString(1,id);
			st.setString(2,column);
			ResultSet rs = st.executeQuery();
			if(rs.next())
				check = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return check;
	}
	private JsonObject InsertFieldApplicationInfo(int seq_num,String id,ResultSet rs1) {
		JsonObject jsonobject = new JsonObject();
		try
		{
			String AppInfo_InsertQuery = "insert into Assessment_Application_Info (seq_no, id, prj_name, app_name, section, options, label_name, column_name, type, mandatory, value)"
					+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement prestmt1 = con.prepareStatement(AppInfo_InsertQuery);         
			prestmt1.setInt(1, seq_num);
			prestmt1.setString(2,id);           
			prestmt1.setString(3,rs1.getString(2));
			prestmt1.setString(4,rs1.getString(3));
			prestmt1.setString(5,rs1.getString(4));
			prestmt1.setString(6,rs1.getString(5));
			prestmt1.setString(7,rs1.getString(6));
			prestmt1.setString(8,rs1.getString(7));
			prestmt1.setString(9,rs1.getString(8));
			prestmt1.setString(10,rs1.getString(9));
			prestmt1.setString(11,rs1.getString(10));
			prestmt1.execute();
			jsonobject.addProperty("seq_num",seq_num);
			jsonobject.addProperty("id", id);
			jsonobject.addProperty("prj_name", rs1.getString(2));
			jsonobject.addProperty("app_name", rs1.getString(3));
			jsonobject.addProperty("section", rs1.getString(4));
			jsonobject.addProperty("options",rs1.getString(5));
			jsonobject.addProperty("LabelName",rs1.getString(6));
			jsonobject.addProperty("ColumnName",rs1.getString(7));
			jsonobject.addProperty("Type",rs1.getString(8));
			jsonobject.addProperty("Mandatory",rs1.getString(9));
			jsonobject.addProperty("Value",rs1.getString(10));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonobject;
	}
	public String DeleteAssessmentDependentField()
	{
		String column_name ="";
		try
		{
			if(isAssessmentDependencyField())
			{
				DeleteField(AssessmentColumName);
				DeleteField(AssessmentDependencyColumnName);
				column_name += AssessmentColumName+","+AssessmentDependencyColumnName+",";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return column_name;
	}
	private int DeleteField(String Column_Name)
	{
		int deleteseq = 1;
		try
		{
			JsonObject jsonobject = new JsonObject();
			if(CheckColumnNameInAssessmentAppInfoTable(Column_Name))
			{
				deleteseq = getSeqNum(Column_Name);
				System.out.println("Delete sequence number :"+deleteseq);
				new IntakeAssessmentEditDeleteFeatureService(id,"ApplicationInformation",deleteseq).DeleteFeature();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return deleteseq;
	}
	private int getSeqNum(String Column_Name)
	{
		int DeleteSeq = 1;
		try
		{
			String TempFieldQuery = "select * from assessment_application_info where id=? and column_name =?;";
			PreparedStatement st1 = con.prepareStatement(TempFieldQuery);
			st1.setString(1,id);
			st1.setString(2,column_name);
			ResultSet rs1 = st1.executeQuery();
			if(rs1.next())
			{
				DeleteSeq = rs1.getInt(1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return DeleteSeq;
	}
}
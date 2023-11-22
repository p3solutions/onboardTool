package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import java.util.ArrayList;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Opportunity.OpportunityBean;
import onboard.DBconnection;
public class FinanceDetailRetrieveService {
    public static JsonArray InputDetailsRetrieve() {
        JsonArray jsonArray = null;
        try {
            String randomNumber = RandomIdGenerator();
            OpportunityBean.setRecord_Number(randomNumber);
            AddingOpportunityRecords(randomNumber);
            jsonArray = InputDetailsRetrievalService(randomNumber);
        } catch (Exception e) {
            System.out.println("Exception e" + e);
        }
        return jsonArray;
    }
    
    public static void FinanceLabelDelete(int delete_seqnum) {
		PreparedStatement st=null,st1=null,st2=null;
		ResultSet rs=null,rs1=null;
        try {
        	
        	
        	System.out.println("The control comes to Service"+delete_seqnum);
            int seqmax = 0;
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
            ArrayList<String> arr_id = new ArrayList<String>();
            ArrayList<String> arr_prj = new ArrayList<String>();
            ArrayList<String> arr_app = new ArrayList<String>();
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
            ArrayList<String> arr_options_split = new ArrayList<String>();
            ArrayList<String> arr_label_name_split = new ArrayList<String>();
            ArrayList<String> arr_column_name_split = new ArrayList<String>();
            ArrayList<String> arr_type_split = new ArrayList<String>();
            ArrayList<String> arr_mandatory_split = new ArrayList<String>();
            ArrayList<String> arr_value_split = new ArrayList<String>();
            ArrayList<String> arr_umandatory_split = new ArrayList<String>();
            String select_query = "select max(seq_no) from Finance_Informations_Details order by seq_no;";
			st = connection.prepareStatement(select_query);
			rs = st.executeQuery();
            if (rs.next()) {
                seqmax = Integer.parseInt(rs.getString(1));
            }
            String query = "select * from Finance_Informations_Details order by seq_no;";
			st1 = connection.prepareStatement(query);
			rs1 = st1.executeQuery();
            while (rs1.next()) {
                arr_seqmax.add(rs1.getInt("seq_no"));
                arr_id.add(rs1.getString("Id"));
                arr_prj.add(rs1.getString("prj_name"));
                arr_app.add(rs1.getString("app_name"));
                arr_options.add(rs1.getString("options"));
                arr_label_name.add(rs1.getString("label_name"));
                arr_column_name.add(rs1.getString("column_name"));
                arr_type.add(rs1.getString("type"));
                arr_mandatory.add(rs1.getString("mandatory"));
                arr_value.add(rs1.getString("value"));
                arr_umandatory.add(rs1.getString("usermandatoryflag"));
            }
            for (int i = 0; i < seqmax; i++) {
                if (arr_seqmax.get(i) < delete_seqnum) {
                    arr_seqmax_split.add(arr_seqmax.get(i));
                    arr_id_split.add(arr_id.get(i));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_options_split.add(arr_options.get(i));
                    arr_label_name_split.add(arr_label_name.get(i));
                    arr_column_name_split.add(arr_column_name.get(i));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                    arr_umandatory_split.add(arr_umandatory.get(i));
                } else if (arr_seqmax.get(i) > delete_seqnum) {
                    arr_seqmax_split.add((arr_seqmax.get(i) - 1));
                    arr_id_split.add(arr_id.get(i));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_options_split.add(arr_options.get(i));
                    arr_label_name_split.add(arr_label_name.get(i));
                    arr_column_name_split.add(arr_column_name.get(i));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                    arr_umandatory_split.add(arr_umandatory.get(i));
                }
            }
            String delete_query = "delete from Finance_Informations_Details;";
			st2 = connection.prepareStatement(delete_query);
			System.out.println("The Sequence  Number");
			st2.executeUpdate();
            for (int j = 0; j < seqmax - 1; j++) {
                String insert_query = "insert into Finance_Informations_Details (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
                PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
                preparedStatement1.setInt(1, arr_seqmax_split.get(j));
                preparedStatement1.setString(2, arr_id_split.get(j));
                preparedStatement1.setString(3, arr_prj_split.get(j));
                preparedStatement1.setString(4, arr_app_split.get(j));
                preparedStatement1.setString(5, arr_options_split.get(j));
                preparedStatement1.setString(6, arr_label_name_split.get(j));
                preparedStatement1.setString(7, arr_column_name_split.get(j));
                preparedStatement1.setString(8, arr_type_split.get(j));
                preparedStatement1.setString(9, arr_mandatory_split.get(j));
                preparedStatement1.setString(10, arr_value_split.get(j));
                preparedStatement1.setString(11, arr_umandatory_split.get(j));
                preparedStatement1.execute();
            }
            st2.close();
            OrderingColumnNameBySeq();
			st.close();
			rs.close();
			st1.close();
			rs1.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception---->>>" + e);
        }
    }
    public static void OrderingColumnNameBySeq()
    {
		PreparedStatement st=null;
		ResultSet rs=null;
        try {  
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection(); 
            String SelectQuery ="Select * from Finance_Informations_Details order by seq_no";
			st = connection.prepareStatement(SelectQuery);
			rs = st.executeQuery();
            String startStr = "UpdateDetails";
            while(rs.next())
            {
                if(rs.getString("column_name").startsWith("UpdateDetails"))
                {
                    String seqnum = rs.getString("seq_no");
                    String column_name = rs.getString("column_name");
                    String append_seq_num=column_name.substring(startStr.length(),column_name.length());
                    if(!seqnum.equals(append_seq_num))
                    {
                      String updateColumnName = startStr+seqnum;
                      String UpdateQuery = "Update Finance_Informations_Details set column_name =? where seq_no=?;";  
                      PreparedStatement st1 = connection.prepareStatement(UpdateQuery);
                      st1.setString(1,updateColumnName);
                      st1.setString(2,seqnum);
                      st1.executeUpdate();
                    }
                }
            }
          rs.close();
          st.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Exception-----------[info]-------"+e);
        }
    }
    
    public static JsonObject FinanceLabelEdit(String label_name, int sequencenumber) {
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
        JsonObject jsonobj = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String PreviouslabelQuery = "select label_name from Finance_Informations_Details where seq_no ='"
                    + sequencenumber + "';";
			st1 = connection.prepareStatement(PreviouslabelQuery);
			rs1 = st1.executeQuery();
            if (rs1.next()) {
                jsonobj.addProperty("previous_label_name", rs1.getString(1));
            }
            String update_query = "update Finance_Informations_Details set label_name =? where seq_no='" + sequencenumber
                    + "'";
            PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
            preparedStmt1.setString(1, label_name);
            preparedStmt1.execute();
            String SelectQuery = "select * from Finance_Informations_Details where seq_no ='" + sequencenumber + "';";
			st = connection.prepareStatement(SelectQuery);
			rs = st.executeQuery();
            int i = 1;
            if (rs.next()) {
                ResultSetMetaData rsmd = rs.getMetaData();
                while (i <= rsmd.getColumnCount()) {
                    jsonobj.addProperty(rs.getMetaData().getColumnName(i), rs.getString(i));
                    i++;
                }
            }
		st.close();
		rs.close();
		st1.close();
		rs1.close();
        } catch (Exception e) {
            System.out.println("Exception---->>>>" + e);
        }
        System.out.println("Json object " + jsonobj);
        return jsonobj;
    }
    public static JsonArray InputDetailsRetrievalService(String randomNumber) {
		PreparedStatement statementforcheck=null;
		ResultSet Resultset=null;
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String query = "select * from  Finance_Info_Template_Details order by seq_no;";
			statementforcheck = connection.prepareStatement(query);
			Resultset = statementforcheck.executeQuery();
            if (Resultset.next()) {
               
                String value = Resultset.getString("value");
                JsonObject jsonObject1 = new JsonObject();
                jsonObject1.addProperty("seq_num", Resultset.getString("seq_no"));
                jsonObject1.addProperty("Project_Name", Resultset.getString("prj_name"));
                jsonObject1.addProperty("App_Name", Resultset.getString("app_name"));
                jsonObject1.addProperty("options", Resultset.getString("options"));
                jsonObject1.addProperty("LabelName", Resultset.getString("label_name"));
                jsonObject1.addProperty("ColumnName", Resultset.getString("column_name"));
                jsonObject1.addProperty("Type", Resultset.getString("type"));
                jsonObject1.addProperty("Mandatory", Resultset.getString("mandatory"));
                jsonObject1.addProperty("Value", value);
                jsonArray.add(jsonObject1);
                while (Resultset.next()) {
                    
                    String value1 = Resultset.getString("value");
                    JsonObject jsonObject2 = new JsonObject();
                    jsonObject2.addProperty("seq_num", Resultset.getString("seq_no"));
                    jsonObject2.addProperty("Project_Name", Resultset.getString("prj_name"));
                    jsonObject2.addProperty("App_Name", Resultset.getString("app_name"));
                    jsonObject2.addProperty("options", Resultset.getString("options"));
                    jsonObject2.addProperty("LabelName", Resultset.getString("label_name"));
                    jsonObject2.addProperty("ColumnName", Resultset.getString("column_name"));
                    jsonObject2.addProperty("Type", Resultset.getString("type"));
                    jsonObject2.addProperty("Mandatory", Resultset.getString("mandatory"));
                    jsonObject2.addProperty("Value", value1);
                    jsonArray.add(jsonObject2);
                }
            }
			statementforcheck.close();
			Resultset.close();
        } catch (Exception e) {
            System.out.println("Exception--->>" + e);
        }
        System.out.println("Json array from retrival"+jsonArray);
        return jsonArray;
    }
    
    
    public static String RandomIdGenerator() {
        int n = 10;
        String AlphaNumericNumber = "";
        String randomNumber = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789";
        JsonObject jsonObject1 = new JsonObject();
        boolean DuplicateFlag = true;
        try {
            while (DuplicateFlag) {
               
                for (int i = 0; i < n; i++) { 
                    int index 
                        = (int)(randomNumber.length() 
                                * Math.random()); 
                    AlphaNumericNumber += randomNumber .charAt(index);
                } 
                System.out.println("Random No In Service : " + randomNumber);
                DBconnection dBconnection = new DBconnection();
                Connection connection = (Connection) dBconnection.getConnection();
                String query = "select * from Finance_informations where id='" +"D3S"+AlphaNumericNumber
                        + "' order by seq_no;";
				PreparedStatement statementforcheck = connection.prepareStatement(query);
				ResultSet Resultset = statementforcheck.executeQuery();
                if (!Resultset.next()) {
                    DuplicateFlag = false;
                }
				statementforcheck.close();
				Resultset.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception-------[info]---------" + e);
        }jsonObject1.addProperty("RandomNumber", "D3S" + AlphaNumericNumber);
        return "D3S" + AlphaNumericNumber;
    }
    public static JsonObject InputDetailsValidation(String AppName,JsonArray jsonArray,boolean checkMandatory)
	{
    	
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean checkExistance=false;
			boolean checkAppName = false;
			DBconnection dBconnection = new DBconnection();
			System.out.println("Connected to Validation Service");
			Connection connection = (Connection) dBconnection.getConnection();
			String CheckQueryExist = "SELECT * FROM Finance_Informations WHERE COLUMN_NAME = 'appName';";
			st = connection.prepareStatement(CheckQueryExist);
			rs = st.executeQuery();
			while(rs.next()) {
				if(rs.getString("value").equals(AppName))
					
				{
					checkExistance =true;
					
				}
			}
			String CheckQueryAppName = "SELECT * FROM Opportunity_info WHERE COLUMN_NAME = 'appName';";
			st1 = connection.prepareStatement(CheckQueryAppName);
			rs1 = st1.executeQuery();
			while(rs1.next()) {
				if(rs1.getString("value").equals(AppName))
					
				{
					checkAppName =true;
					
				}
			}
			jsonObject.addProperty("Details_VALIDATION",checkExistance);
			jsonObject.addProperty("AppName_VALIDATION",checkAppName);
			
			if(checkMandatory==true &&checkExistance==false&&  checkAppName == true)
				
			{
				
				FinanceDetailRetrieveService.FinanceDetailsSave(jsonArray);
				
			
					
					}
				
			
			st.close();
			st.close();
			st1.close();
			rs1.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception----------[info]--------"+e);
		}
		return jsonObject;
	}
    public static void FinanceDetailsSave(JsonArray jsonArray) {
		PreparedStatement st=null,st1=null,st2=null;
		ResultSet rs=null,rs2=null;
		
		
		
		 try {
			 System.out.println("The value of array"+jsonArray);
			 DBconnection con = new DBconnection();
			 Connection connection = (Connection) con.getConnection();
			 
			  for(int i=0;i<jsonArray.size();i++)
			 {
			JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
			
			String name = jsonObj.get("Name").getAsString();
			String value = jsonObj.get("Value").getAsString();
			String SelectQuery = "select * from Finance_Informations_Details where column_name='"+name+"';";
			
			st = connection.prepareStatement(SelectQuery);
			rs = st.executeQuery();
			if(rs.next())
			{
				String UpdateQuery = "update Finance_Informations_Details set value='"+value+"' where column_name ='"+name+"'";
				st1 = connection.prepareStatement(UpdateQuery);
                st1.executeUpdate();
                
			}
			 }
			String SelectTableQuery = "select * from Finance_Informations_Details order by seq_no;";
			st2 = connection.prepareStatement(SelectTableQuery);
            rs2 = st2.executeQuery();
            int count =0;
            String id = null;
            while(rs2.next()) {
            	 if(count==14){
                 	id=rs2.getString("Id");
                     System.out.println("The value of id by vijay"+id);	 
                 }
            	System.out.println("The value of result set"+rs2);
            	String Finance_InsertQuery = "insert into Finance_Informations (seq_no,Id, prj_name, app_name, options, label_name, column_name, type, mandatory, value,usermandatoryflag)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

				PreparedStatement prestmt = connection.prepareStatement(Finance_InsertQuery);
				prestmt.setInt(1, rs2.getInt("seq_no"));
				prestmt.setString(2, rs2.getString("Id"));
				prestmt.setString(3, rs2.getString("prj_name"));
				prestmt.setString(4, rs2.getString("app_name"));
				prestmt.setString(5, rs2.getString("options"));
				prestmt.setString(6, rs2.getString("label_name"));
				prestmt.setString(7, rs2.getString("column_name"));
				prestmt.setString(8, rs2.getString("type"));
				prestmt.setString(9, rs2.getString("mandatory"));
				prestmt.setString(10, rs2.getString("value"));
				prestmt.setString(11, rs2.getString("usermandatoryflag"));
				prestmt.execute();
			count++; 
            }
           
        	String SelectId = "select value from Finance_Informations where column_name='AppName' and Id='"+id+"';";
			PreparedStatement st3 = connection.prepareStatement(SelectId );
            ResultSet rs3 = st3.executeQuery();
            String value1=null;
            if(rs3.next()) {
            	
           	 value1=rs3.getString("value");
           	
           }
            String Selectvalue = "select Id from opportunity_info where column_name='AppName' and value='"+value1+"';";
			PreparedStatement st4 = connection.prepareStatement(Selectvalue);
            ResultSet rs4 = st4.executeQuery();
            String Id1=null;
            if(rs4.next()) {
           	 Id1=rs4.getString("Id");
           	 System.out.println("The value in info"+Id1);
           }
            String updatevalue = "update Finance_Informations set Id='"+Id1+"' where Id ='"+id+"'";
			PreparedStatement st5 = connection.prepareStatement(updatevalue);
            st5.executeUpdate();
			st2.close();
			
			rs4.close();
			rs3.close();
			st5.close();
			st4.close();
			st3.close();
			rs2.close();
			st.close();
			rs.close();
			st1.close();
			connection.close();
      
		 }
		 catch(Exception e) {
			 e.printStackTrace();
			System.out.println("Exception----------[info]--------"+e);
		 }
	}


	
     
	public static void AddingOpportunityRecords(String RecordNumber) {
		PreparedStatement st=null,st1=null;
		ResultSet rs=null;
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String Deletequery = "delete from Finance_Informations_details";
			st = connection.prepareStatement(Deletequery);
			st.executeUpdate();
           
            String SelectQuery = "select * from Finance_Info_Template_Details order by seq_no";
			st1 = connection.prepareStatement(SelectQuery);
			rs = st1.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) <= 16) {
                    String Finance_InsertQuery = "insert into Finance_Informations_Details (seq_no,Id, prj_name, app_name, options, label_name, column_name, type, mandatory, value)"
                            + "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement prestmt = connection.prepareStatement(Finance_InsertQuery);
                    prestmt.setInt(1, rs.getInt(1));
                    prestmt.setString(2, RecordNumber);
                    prestmt.setString(3, rs.getString(2));
                    prestmt.setString(4, rs.getString(3));
                    prestmt.setString(5, rs.getString(4));
                    prestmt.setString(6, rs.getString(5));
                    prestmt.setString(7, rs.getString(6));
                    prestmt.setString(8, rs.getString(7));
                    prestmt.setString(9, rs.getString(8));
                    prestmt.setString(10, rs.getString(9));
                    prestmt.execute();
                }
            }
		st.close();
		rs.close();
		st1.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception ---------[info]---------" + e);
        }
    }
}
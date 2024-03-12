package IntakeDetails.IntakeTriage.Service;

import IntakeDetails.Common.DynamicFields;
import IntakeDetails.IntakeAssessment.service.IntakeAssessmentService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import logger.System;

public class IntakeTriageService extends DynamicFields {

	   @Override
		public JsonArray DataRetrieve(String Id) {
		   PreparedStatement st1=null;
		   ResultSet rs1=null;
			JsonArray jsonArray = new JsonArray();
			try {
				DBconnection dBconnection = new DBconnection();
				Connection con = (Connection) dBconnection.getConnection();
				
				String SelectQuery = "select * from triage_info where Id=? order by seq_no;";
				PreparedStatement st = con.prepareStatement(SelectQuery);
				st.setString(1, Id);
				ResultSet rs = st.executeQuery();
				if (!rs.next()){
					String TemplateQuery = "select * from triage_info_template_details order by seq_no;";
					st1 = con.prepareStatement(TemplateQuery);
					rs1 = st1.executeQuery();
					
					while(rs1.next()) {
						JsonObject jsonObject = new JsonObject();
						boolean checkexsistent=false; 
						if (rs1.getInt("seq_no")>=11 && rs1.getInt("seq_no")<=21)
							checkexsistent=true;
						jsonObject.addProperty("checkexsistent",checkexsistent);
						jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
						//jsonObject.addProperty("id", rs.getString("Id"));
						jsonObject.addProperty("Project_Name", rs1.getString("prj_name"));
						jsonObject.addProperty("App_Name", rs1.getString("app_name"));
						jsonObject.addProperty("options", rs1.getString("options"));
						jsonObject.addProperty("LabelName", rs1.getString("label_name"));
						jsonObject.addProperty("ColumnName", rs1.getString("column_name"));
						jsonObject.addProperty("Type", rs1.getString("type"));
						jsonObject.addProperty("Mandatory", rs1.getString("mandatory"));
						jsonObject.addProperty("Value", rs1.getString("value"));
						//jsonObject.addProperty("UMandatory", rs1.getString("umandatory"));
						jsonArray.add(jsonObject);
						
					}
					IntakeTriageInfoRecordsStorage(Id);
					new IntakeAssessmentService().DataRetrieve(Id);
				rs1.close();
				st1.close();
				}
				else
				{
					String TemplateQuery = "select * from triage_info where id=? order by seq_no;";
					st1 = con.prepareStatement(TemplateQuery);
					st1.setString(1, Id);
					rs1 = st1.executeQuery();
									
					while(rs1.next()) {
						JsonObject jsonObject = new JsonObject();
						boolean checkexsistent=true; 
						jsonObject.addProperty("checkexsistent",checkexsistent);
						jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
						//jsonObject.addProperty("id", rs.getString("Id"));
						jsonObject.addProperty("Project_Name", rs1.getString("prj_name"));
						jsonObject.addProperty("App_Name", rs1.getString("app_name"));
						jsonObject.addProperty("options", rs1.getString("options"));
						jsonObject.addProperty("LabelName", rs1.getString("label_name"));
						jsonObject.addProperty("ColumnName", rs1.getString("column_name"));
						jsonObject.addProperty("Type", rs1.getString("type"));
						jsonObject.addProperty("Mandatory", rs1.getString("mandatory"));
						jsonObject.addProperty("Value", rs1.getString("value"));
						jsonObject.addProperty("UMandatory", rs1.getString("usermandatoryflag"));
						jsonArray.add(jsonObject);
						
					}
				st1.close();
				rs1.close();
				}

				
			}
			catch(Exception e) {
				e.printStackTrace();
				System.out.println("Exception-------[info]--------" +e);
			}
			return jsonArray;
		}
		public static void IntakeTriageInfoRecordsStorage(String id) {
			PreparedStatement st=null;
			ResultSet rs=null;
			try
			{
				DBconnection dBconnection = new DBconnection();
				Connection con = (Connection) dBconnection.getConnection();
				System.out.println("Triage Insert : ");
				// selecting the defaiult set from triage template 
				
				String SelectRecords = "select * from triage_info_template_details where seq_no>='11' and seq_no<='21'";
				
				st = con.prepareStatement(SelectRecords);
				rs = st.executeQuery();
				int seq_num=1;
				while(rs.next())
				{
					String insert_query = "insert into triage_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
					PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
					preparedStatement1.setInt(1, seq_num++);
					preparedStatement1.setString(2, id);
					preparedStatement1.setString(3, "");
					preparedStatement1.setString(4, "");
					preparedStatement1.setString(5, rs.getString("options"));
					preparedStatement1.setString(6, rs.getString("label_name"));
					preparedStatement1.setString(7,rs.getString("column_name"));
					preparedStatement1.setString(8,rs.getString("type"));
					preparedStatement1.setString(9, rs.getString("mandatory"));
					preparedStatement1.setString(10, "");
					preparedStatement1.execute();
				}
			rs.close();
			st.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("Exception------[info]-----"+e);
			}
		}
		@Override
		public int Add(String id,String label_name, String mandatory,String umandatory, String type, int NumberofInputfields, String options )
		{
			int max_seq_num = 1;
				try {
					DBconnection dBconnection = new DBconnection();
					Connection connection = (Connection) dBconnection.getConnection();
					String select_query = "select * from triage_info where Id = ? order by seq_no;";
					PreparedStatement st = connection.prepareStatement(select_query);
					st.setString(1, id);
					ResultSet rs = st.executeQuery();
					String name = "TriageAddInfo";
					
					if (rs.next()) {
						String max_seqnum = "select max(seq_no) from triage_info where Id = ? order by seq_no;";
						PreparedStatement st1 = connection.prepareStatement(max_seqnum);
						st1.setString(1, id);
						ResultSet rs1 = st1.executeQuery();
						if (rs1.next()) {
							max_seq_num = Integer.parseInt(rs1.getString(1));
							max_seq_num++;
						}
					}
					if (!type.equals("Text box") && !type.equals("Datepicker")) {
						options = options.substring(0, options.length() - 1);
					}
					String insert_query = "insert into triage_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
					PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
					preparedStatement1.setInt(1, max_seq_num);
					preparedStatement1.setString(2, id);
					preparedStatement1.setString(3, "");
					preparedStatement1.setString(4, "");
					preparedStatement1.setString(5, options);
					preparedStatement1.setString(6, label_name);
					preparedStatement1.setString(7, (name + max_seq_num));
					preparedStatement1.setString(8, type);
					preparedStatement1.setString(9, mandatory);
					preparedStatement1.setString(10, "");
					preparedStatement1.setString(11, umandatory);
					preparedStatement1.execute();
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Exception---[info]------" + e);
				}
				return max_seq_num;
		}
		
		public static JsonObject IntakeTriageEditService(String label_name, int sequencenumber,String id,String Mandatory) {
			JsonObject jsonobj = new JsonObject();
			try {
				DBconnection dBconnection = new DBconnection();
				Connection connection = (Connection) dBconnection.getConnection();
				String PreviouslabelQuery = "select label_name from triage_info where id = ? and seq_no =?;";
				PreparedStatement st1 = connection.prepareStatement(PreviouslabelQuery);
				st1.setString(1, id);
				st1.setInt(2, sequencenumber);
				ResultSet rs1 = st1.executeQuery();
				if (rs1.next()) {
					jsonobj.addProperty("previous_label_name", rs1.getString(1));
				}

				String update_query = "update triage_info set label_name =?,mandatory=? where id = ? and seq_no=?;";
				PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
				preparedStmt1.setString(1, label_name);
				preparedStmt1.setString(2, Mandatory);
				preparedStmt1.setString(3, id);
				preparedStmt1.setInt(4, sequencenumber);
				preparedStmt1.execute();
				String SelectQuery = "select * from triage_info where id =? and seq_no =?;";
				PreparedStatement st = connection.prepareStatement(SelectQuery);
				st.setString(1, id);
				st.setInt(2, sequencenumber);
				ResultSet rs = st.executeQuery();
				int i = 1;
				if (rs.next()) {
					ResultSetMetaData rsmd = rs.getMetaData();
					while (i <= rsmd.getColumnCount()) {
						jsonobj.addProperty(rs.getMetaData().getColumnName(i), rs.getString(i));
						i++;
					}
				}
				jsonobj.addProperty("mandatory",Mandatory.equals("Yes")?true:false);
			} catch (Exception e) {
				System.out.println("Exception---->>>>" + e);
			}
			System.out.println("Json object " + jsonobj);
			return jsonobj;
		}
		
		
		public JsonArray deleteField(int delete_seqnum, String Id) {
			JsonArray jsonArray= new JsonArray();
			try {
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
				String select_query = "select max(seq_no) from triage_info where Id = ? order by seq_no;";
				PreparedStatement st = connection.prepareStatement(select_query);
				st.setString(1, Id);
				ResultSet rs = st.executeQuery();
				if (rs.next()) {
					seqmax = Integer.parseInt(rs.getString(1));
				}

				String query = "select * from triage_info where Id = ? order by seq_no;";
				PreparedStatement st1 = connection.prepareStatement(query);
				st1.setString(1, Id);
				ResultSet rs1 = st1.executeQuery();
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

				String delete_query = "delete from triage_info where id=?;";
				PreparedStatement st2 = connection.prepareStatement(delete_query);
				st2.setString(1,Id);
				st2.executeUpdate();	
				st2.close();
		
				for (int j = 0; j < seqmax - 1; j++) {
					String insert_query = "insert into triage_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
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
				
				OrderingColumnNameBySeq(Id);
				String column_name =arr_column_name.get(arr_seqmax.indexOf(delete_seqnum));
				 if(isDependecyColumnName(column_name))
				 {
					 String col_name = getDependencyColumnNamePair().get(column_name);
					 deleteField(arr_column_name_split.indexOf(col_name)+1, Id);
				 }
				 IntakeAssessmentDependencyField DependencyFieldObj = new IntakeAssessmentDependencyField(Id, column_name);
				  jsonArray = DependencyFieldObj.AddAssessmentDependentField();
				 } catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception---->>>" + e);
			}
			return jsonArray;
		}
		public static HashMap<String,String> KeyValuePairForOpportunityTriage()
		{
	    	  HashMap<String,String> KeyValue = new HashMap<String,String>(); 
	    	  KeyValue.put("appId","apmid");
	    	  KeyValue.put("applicationName","appName");
	    	  KeyValue.put("applicationDesc","appdesc");
	    	  KeyValue.put("applicationOwner","appowner");
	    	  KeyValue.put("busOwner","businessowner");
	    	  KeyValue.put("devOwner","sme");
	    	  KeyValue.put("billing_Code","billcode");
	    	  KeyValue.put("business_Segment","buisnesssegment");
	    	  KeyValue.put("busUnit","buisnessunit");
	    	  KeyValue.put("segment_contact","pscontact");
			return KeyValue;
		}
		public static String getOpportunityColumnName(String TriageColumnName)
		{
			HashMap<String,String> KeyValue = KeyValuePairForOpportunityTriage();
			return KeyValue.get(TriageColumnName); 
		}
		public static boolean isOpportunityField(String column_name)
		{
			HashMap<String,String> OpportunityTriageKeyValuePair = KeyValuePairForOpportunityTriage();
			return OpportunityTriageKeyValuePair.containsKey(column_name);
		}
		public static String getValue(String column_name,String id)
		{
			String value="";
			try
			{
			HashMap<String,String> OpportunityTriageKeyValuePair = KeyValuePairForOpportunityTriage();
			 DBconnection dBconnection = new DBconnection();   
	    	 Connection connection = (Connection) dBconnection.getConnection(); 
			String SelectQuery = "select * from opportunity_info where id=? and column_name=?";	
			PreparedStatement st = connection.prepareStatement(SelectQuery);
			st.setString(1, id);
			st.setString(2, OpportunityTriageKeyValuePair.get(column_name));
			ResultSet rs = st.executeQuery(); 
			if(rs.next())
			 {
				 value =rs.getString("value");
			 }
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("Exception------------[info]----------"+e);
			}
			 return value; 
		}
		
		public HashMap<String,String> getDependencyColumnNamePair()
		{
		HashMap<String,String> KeyValuePair = new HashMap<String,String>();
		try
		{
			KeyValuePair.put("rationalization_type","If_other_please_describe");
			KeyValuePair.put("appPlatfrm","If_Other_describe");
			KeyValuePair.put("app_and_data_hosted","vendor");
			KeyValuePair.put("compliance","describe");
			KeyValuePair.put("Financialdate","plsdescribe");
			KeyValuePair.put("TechincalDeterminingdate","pls_describe");
		}
	   catch(Exception e)
		{
		  e.printStackTrace();
		}
		return KeyValuePair;
		}
		
		public boolean isDependecyColumnName(String ColumnName)
		{
		    return getDependencyColumnNamePair().containsKey(ColumnName);
		}
		
		@Override
		public JsonArray AddTemplateFields(int[] selected_index,String id,String templateMandatory,String umandatory) {
			  PreparedStatement st1=null;
			  ResultSet rs1=null;
		      JsonArray jsonArray = new JsonArray();
		      JsonArray FinalJson = new JsonArray();
		      JsonArray jsonAssessment = new JsonArray();
		      try
		      {
		    	  
		    	   ArrayList<Integer> seq_no = new ArrayList<Integer>(); 
		    	   
		    	   ArrayList<String> temp_column_name = new ArrayList<String>(); 
		    	   
		    	   ArrayList<String> selected_temp_column_name = new ArrayList<String>(); 
		    	   
		    	   DBconnection dBconnection = new DBconnection();
		    	   
		    	   Connection connection = (Connection) dBconnection.getConnection(); 
		    	   
		    	   //Storing template fields column name in temp_column_name
		    	   
		    	   String SelectedColumnQuery ="select * from triage_info_template_details;"; 
		    	   
		    	   st1 =connection.prepareStatement(SelectedColumnQuery);
		    	   
		    	   rs1 =st1.executeQuery(); 
		    	   
		    	   while(rs1.next()) {
		    		
		    		   temp_column_name.add(rs1.getString("column_name")); 
		    		
		    	   }
		    	   
		    	   //Storing the selected temp column name in selected_temp_column_name
		    	   
		    	   for(int k=0;k<selected_index.length;k++) {
		    	   
		    		   selected_temp_column_name.add(temp_column_name.get(selected_index[k]-1)); 
		    	   
		    	   }
		    	   
		    	   String delete_seq_num = ""; 
		    	   
		    	   String delete_column_name = "";
		    	   
		    	   // Deleting the unchecked fields
		    	   
		    	   JsonArray jsonArrayAdd = new JsonArray();
		    	   
		    	   String CheckQuery = "select * from triage_info where id=? order by seq_no";
		    	    PreparedStatement st2 = connection.prepareStatement(CheckQuery);
					st2.setString(1, id);
					ResultSet rs2 = st2.executeQuery();
	    	   
		    	   boolean check_first_occurance = true;
		    	   
		    	   while(rs2.next())
		    	   {
		    		   String column_name = rs2.getString("column_name");
		    		   if(!selected_temp_column_name.contains(column_name)&&!column_name.startsWith("TriageAddInfo")&&!getDependencyColumnNamePair().containsValue(column_name))
		    		   {
		    			 String Seq_Num_Query = "Select * from triage_info where id = ? and column_name = ?;";
		    			 PreparedStatement st3 = connection.prepareStatement(Seq_Num_Query);
		    			 st3.setString(1, id);
		    			 st3.setString(2, column_name);	
		    			 ResultSet rs3 = st3.executeQuery();
		    			 int seq_num = 0;
		    			 if(rs3.next())
		    			 {
		    				 seq_num =rs3.getInt(1);
		    			 }
		    			 deleteField(seq_num,id);
						/*
						 * if(check_first_occurance) { IntakeTriageDeleteService(rs2.getInt(1),id);
						 * check_first_occurance = false; }else {
						 * IntakeTriageDeleteService(rs2.getInt(1)-1,id); }
						 * 
						 */	    			    
		    			 
		    			 System.out.println("DELETING COLUMN "+rs2.getString("column_name"));
		                    delete_seq_num += rs2.getInt(1)+",";
		                    delete_column_name +=rs2.getString("column_name")+",";
		                    JsonArray jsonAdd  =   new IntakeAssessmentDependencyField(id,column_name).AddAssessmentDependentField();
		                    jsonArrayAdd.addAll(jsonAdd);
		                    if(isDependecyColumnName(column_name))
			    			 {
		                    	delete_column_name += getDependencyColumnNamePair().get(column_name)+",";
			    			 }
		    		   }
		    	   }
		    	   System.out.println("jsonArray add all :"+jsonArrayAdd);
		    	   if(delete_seq_num.contains(","))
		    	   
		    		   delete_seq_num = delete_seq_num.substring(0,delete_seq_num.length()-1);
		    	   
		    	   if(delete_column_name.contains(","))
		        	
		    		   delete_column_name = delete_column_name.substring(0,delete_column_name.length()-1);

				   jsonArray.add(delete_column_name);
		    	   
				   String MaxSeqnoQuery = "select max(seq_no) from triage_info where Id = ? order by seq_no"; 
				   PreparedStatement st = connection.prepareStatement(MaxSeqnoQuery);
				   st.setString(1, id);
				   ResultSet rs = st.executeQuery();
				   		
				   int max_seq = 1; 
					
				   if(rs.next()) { 
					
					   max_seq = rs.getInt(1); 
						
				   } 
		    	   String AssessmentDeleteColumnName = "";
				   for(String col_name : selected_temp_column_name)
				   {
		    		
					   String SelectedQuery = "select * from triage_info where id=? and column_name =?;";
					   PreparedStatement st3 = connection.prepareStatement(SelectedQuery);
					   st3.setString(1, id);
					   st3.setString(2, col_name);
					   ResultSet rs3 = st3.executeQuery();
		    		 				 	        	   
					   if(!rs3.next())
		        	   
					   {
		        		
						   
		        			  String SelectDetailsQuery = "select * from triage_info_template_details where column_name=?;";
		        			  PreparedStatement st4 = connection.prepareStatement(SelectDetailsQuery);
						      st4.setString(1, col_name);
							  ResultSet rs4 = st4.executeQuery();
		        				        		  
		        		  if(rs4.next()) {
		        			  //String id = OpportunityBean.getRecord_Number();
		        			  String project_name = rs4.getString(2);
		        			  String appname = rs4.getString(3); 
		        			  String options =rs4.getString(4); 
		        			  String label_name = rs4.getString(5); 
		        			  String column_name = rs4.getString(6); 
		        			  String type = rs4.getString(7); 
		        			  String mandatory = templateMandatory;
		        			  String value = rs4.getString(9);
		        			  String usermandatory = umandatory;
		        			  if(isOpportunityField(column_name))
		        				value =getValue(column_name,id);  
		        			  String Triage_InsertQuery ="insert into triage_info (seq_no, id,  prj_name, app_name, options, label_name, column_name, type, mandatory, value,usermandatoryflag) value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
		        		  
		        		  PreparedStatement prestmt = connection.prepareStatement(Triage_InsertQuery); 
		        		  prestmt.setInt(1,max_seq+1); 
		        		  prestmt.setString(2, id); 
		        		  prestmt.setString(3, project_name);
		        		  prestmt.setString(4, appname); 
		        		  prestmt.setString(5, options);
		        		  prestmt.setString(6, label_name); 
		        		  prestmt.setString(7, column_name);
		        		  prestmt.setString(8, type); 
		        		  prestmt.setString(9, mandatory);
		        		  prestmt.setString(10, value);
		        		  prestmt.setString(11, usermandatory);
		        		  prestmt.execute();
		        		  JsonObject jsonObj = new JsonObject(); 
		        		  jsonObj.addProperty("seq_num",max_seq+1);
		        		  jsonObj.addProperty("id",id); 
		        		  jsonObj.addProperty("Project_Name",project_name);
		        		  jsonObj.addProperty("App_Name",appname);
		        		  jsonObj.addProperty("options",options);
		        		  jsonObj.addProperty("LabelName",label_name);
		        		  jsonObj.addProperty("ColumnName",column_name);
		        		  jsonObj.addProperty("Type",type);
		        		  jsonObj.addProperty("Mandatory",mandatory);
		        		  jsonObj.addProperty("Value",value); 
		        		  jsonObj.addProperty("UMandatory",usermandatory);
		        		  jsonArray.add(jsonObj);
		        		  IntakeAssessmentDependencyField intakeObj = new IntakeAssessmentDependencyField(id, column_name);
		        		  AssessmentDeleteColumnName += intakeObj.DeleteAssessmentDependentField();
		        		  if(isDependecyColumnName(column_name))
		        		  {
		        			String ColumnName = getDependencyColumnNamePair().get(column_name); 
		          		    String selectQuery = "select * from triage_info_template_details where column_name=?;";
		          		    PreparedStatement st5 = connection.prepareStatement(selectQuery);
		          		    st5.setString(1, ColumnName);
		          		    ResultSet rs5 = st5.executeQuery();
		          		    if(rs5.next())
		          		    {
		          		    	String Triage_InsertQuery1 ="insert into triage_info (seq_no, id,  prj_name, app_name, options, label_name, column_name, type, mandatory, value) value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				        		  
				        		  PreparedStatement prestmt1 = connection.prepareStatement(Triage_InsertQuery1);
				        		  int seqno = max_seq+2;
				        		  max_seq++;		        		  
				        		  prestmt1.setInt(1,seqno); 
				        		  prestmt1.setString(2, id); 
				        		  prestmt1.setString(3, project_name);
				        		  prestmt1.setString(4, appname); 
				        		  prestmt1.setString(5, rs5.getString("options"));
				        		  prestmt1.setString(6, rs5.getString("label_name")); 
				        		  prestmt1.setString(7, rs5.getString("column_name"));
				        		  prestmt1.setString(8, rs5.getString("type")); 
				        		  prestmt1.setString(9, rs5.getString("options"));
				        		  prestmt1.setString(10, rs5.getString("value")); 
				        		  prestmt1.execute();
				        		  JsonObject jsonObj1 = new JsonObject(); 
				        		  jsonObj1.addProperty("seq_num",seqno);
				        		  jsonObj1.addProperty("id",id); 
				        		  jsonObj1.addProperty("Project_Name",project_name);
				        		  jsonObj1.addProperty("App_Name",appname);
				        		  jsonObj1.addProperty("options",rs5.getString("options"));
				        		  jsonObj1.addProperty("LabelName",rs5.getString("label_name"));
				        		  jsonObj1.addProperty("ColumnName",rs5.getString("column_name"));
				        		  jsonObj1.addProperty("Type",rs5.getString("type"));
				        		  jsonObj1.addProperty("Mandatory",rs5.getString("mandatory"));
				        		  jsonObj1.addProperty("Value",rs5.getString("value")); 
				        		  jsonArray.add(jsonObj1);	
		          		    }
		        		  }
		        		  max_seq++; 
		        	   }

					
				}
		      }
				   System.out.println("Assessment Delete Column Name :"+AssessmentDeleteColumnName);
		      jsonAssessment.add(AssessmentDeleteColumnName);//0
		      jsonAssessment.addAll(jsonArrayAdd);//add all [1] : 1,2 0 , add 1,2
		      System.out.println("json Assessment : "+jsonAssessment);
		      FinalJson.add(jsonArray);
		      FinalJson.add(jsonAssessment);
		      System.out.println("Finaljson : "+FinalJson);
		      st1.close();
		      rs1.close();
		      }
		      catch(Exception e)
		      {
		    	  e.printStackTrace();
		    	  System.out.println("Exception---------[info]---------"+e);
		      }
		       return FinalJson;
		      }
		public static JsonObject intakeDetailsTriageValidation(String AppName,JsonArray jsonArray,boolean checkMandatory,String APMID,String id)
		{
			PreparedStatement st1=null;
			ResultSet rs1=null;
			JsonObject jsonObject = new JsonObject();
			try
			{
				boolean checkAPMID = false;
				boolean checkAppName = false;
				boolean CheckAPP = false,Checkapmid = false;
				DBconnection dBconnection = new DBconnection();
				Connection connection = (Connection) dBconnection.getConnection();
				String SelectQuery = "SELECT * FROM triage_info WHERE ID = ? and  column_name = 'Id' and value = ?;";
				PreparedStatement st2 = connection.prepareStatement(SelectQuery);
				st2.setString(1, id);
				st2.setString(2, APMID);
				ResultSet rs2 = st2.executeQuery();
				if(rs2.next())
				{
					Checkapmid =true;
				}
				String SelectQuery1 = "SELECT * FROM triage_info WHERE ID = ? and  column_name = 'app_name' and value = ?;";
				PreparedStatement st3 = connection.prepareStatement(SelectQuery1);
				st3.setString(1, id);
				st3.setString(2, AppName);
				ResultSet rs3 = st3.executeQuery();
				if(rs3.next())
				{
					CheckAPP = true;
				}
				if(!Checkapmid)
				{
				String CheckQueryAmpid = "SELECT * FROM triage_info WHERE column_name='Id' and value=?;";
				PreparedStatement st = connection.prepareStatement(CheckQueryAmpid);
				st.setString(1, APMID);
				ResultSet rs = st.executeQuery();
				if(rs.next())
				{
					checkAPMID = true;
				}
				}
				if(!CheckAPP)
				{
				String CheckQueryAppName = "SELECT * FROM triage_info WHERE COLUMN_NAME = 'app_name';";
				st1 = connection.prepareStatement(CheckQueryAppName);
				rs1 = st1.executeQuery();
				while(rs1.next()) {
					if(rs1.getString("value").equals(AppName))
					{
						checkAppName =true;
					}
				}
				}
				jsonObject.addProperty("APMID_VALIDATION", checkAPMID);
				jsonObject.addProperty("AppName_VALIDATION",checkAppName);
				if(checkMandatory==true && checkAPMID == false && checkAppName == false)
				{
					IntakeTriageService.IntakeDetailsTriageDetailsSave(jsonArray,id);
				}
			rs1.close();
			st1.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("Exception----------[info]--------"+e);
			}
			return jsonObject;
		}
		
		
		public static void IntakeDetailsTriageDetailsSave(JsonArray jsonArr,String id) {
			 try {
				 
				 DBconnection con = new DBconnection();
				 Connection connection = (Connection) con.getConnection();
				 
				  for(int i=0;i<jsonArr.size();i++)
				 {
				JsonObject jsonObj = jsonArr.get(i).getAsJsonObject();
				String name = jsonObj.get("Name").getAsString();
				String value = jsonObj.get("Value").getAsString();
				String SelectQuery = "select * from triage_info where id =? and column_name=?;";
				PreparedStatement st = connection.prepareStatement(SelectQuery);
				st.setString(1, id);
				st.setString(2, name);
				ResultSet rs = st.executeQuery();
				if(rs.next())
				{
					String UpdateQuery = "update triage_info set value=? where id =? and column_name =?";
					PreparedStatement st1 = connection.prepareStatement(UpdateQuery);
			          st1.setString(1, value);
			          st1.setString(2, id);
			          st1.setString(3, name);
			          st1.execute();
					                
				}
				 }
				  connection.close();
	      
			 }
			 catch(Exception e) {
				 e.printStackTrace();
				System.out.println("Exception----------[info]--------"+e);
			 }
		}

		@Override
		 public void OrderingColumnNameBySeq(String ID)
	     {
		 	PreparedStatement st=null;
	     	ResultSet rs=null;
	   		  try {
	   		  
	   		  DBconnection dBconnection = new DBconnection();
	      	      Connection connection = (Connection) dBconnection.getConnection(); 
	      	      String SelectQuery ="Select * from triage_info order by seq_no";
	      	      st = connection.prepareStatement(SelectQuery);
	      	      rs = st.executeQuery();
	      	      String startStr = "TriageAddInfo";
	      	      while(rs.next())
	      	      {
	      	    	  if(rs.getString("column_name").startsWith("TriageAddInfo"))
	      	    	  {
	      	    		  String seqnum = rs.getString("seq_no");
	      	    		  String column_name = rs.getString("column_name");
	      	    		  String append_seq_num=column_name.substring(startStr.length(),column_name.length());
	      	    		  if(!seqnum.equals(append_seq_num))
	      	    		  {
	      	    			String updateColumnName = startStr+seqnum;
	      	    			String UpdateQuery = "Update triage_info set column_name =? where id = ? and seq_no=?;";  
	      	    			PreparedStatement st1 = connection.prepareStatement(UpdateQuery);
	      	    			st1.setString(1, updateColumnName);
	      	    			st1.setString(2, ID);
	      	    			st1.setString(3, seqnum);
	      	    			st1.execute();
	      	    		}
	      	    	  }
	      	      }
	      	      st.close();
	      	      rs.close();
	   
	   	  }
	   	  catch(Exception e)
	   	  {
	   		  e.printStackTrace();
	   		  System.out.println("Exception-----------[info]-------"+e);
	   	  }
	     }
		@Override
		public JsonObject edit(String lavel_name, int sequence_number, String id) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public void Save(JsonArray jsonArr,String id) {
			 try {
				 
				 DBconnection con = new DBconnection();
				 Connection connection = (Connection) con.getConnection();
				 
				  for(int i=0;i<jsonArr.size();i++)
				 {
				JsonObject jsonObj = jsonArr.get(i).getAsJsonObject();
				String name = jsonObj.get("Name").getAsString();
				String value = jsonObj.get("Value").getAsString();
				if(value.contains("$") && name.equals("Preliminary_CBA"))
				{
					 value = value.substring(1);
				}
				String SelectQuery = "select * from triage_info where id =? and column_name=?;";
				PreparedStatement st = connection.prepareStatement(SelectQuery);
				st.setString(1, id);
				st.setString(2, name);
				ResultSet rs = st.executeQuery();
				if(rs.next())
				{   
					boolean DuplicateCheck;
					String UpdateQuery = "update triage_info set value=? where id =? and column_name =?";
					PreparedStatement st1 = connection.prepareStatement(UpdateQuery);
  	    			st1.setString(1, value);
  	    			st1.setString(2, id);
  	    			st1.setString(3, name);
  	    			st1.execute();
				if(isOpportunityField(name))
	            	   OpportunityDetailsUpdate(id,name,value);
				}
				 }
				  connection.close();
	      
			 }
			 catch(Exception e) {
				 e.printStackTrace();
				System.out.println("Exception----------[info]--------"+e);
			 }
	}

	private void OpportunityDetailsUpdate(String id,String name,String value) throws SQLException
	{
		
		Connection connection = null;
		try
		{
			DBconnection con = new DBconnection();
		    connection = (Connection) con.getConnection();
			String OpportunitycolumnName = getOpportunityColumnName(name);
			String UpdateQuery = "update opportunity_info set value=? where id = ? and column_name=?;";
			PreparedStatement st = connection.prepareStatement(UpdateQuery);
  			st.setString(1, value);
  			st.setString(2, id);
  			st.setString(3, OpportunitycolumnName);
  			st.execute();
  			st.close();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			
			connection.close();
		}
	}
	public static boolean DuplicateValueCheck(String id, String name,String value)
	{
		boolean check = true;
	  try
	  {
		  String columnname="appId";
		  if(name.equals("appId")||name.equals("applicationName"))
		  {
			  DBconnection con = new DBconnection();
			  Connection connection = (Connection) con.getConnection();
			  String CheckOpportunityQuery="select * from opportunity_info where id != ? and column_name=? and value=?;";
			  PreparedStatement st = connection.prepareStatement(CheckOpportunityQuery);
			  st.setString(1, id);
			  st.setString(2, getOpportunityColumnName(name));
			  st.setString(3, value);
			  ResultSet rs = st.executeQuery();
			  if(rs.next())
			  check =  false;
			  String CheckTriageQuery="select * from triage_info where id != ? and column_name=? and value=?;";
			  PreparedStatement st1 = connection.prepareStatement(CheckTriageQuery);
			  st1.setString(1, id);
			  st1.setString(2, name);
			  st1.setString(3, value);
			  ResultSet rs1 = st1.executeQuery();
			  if(rs1.next())
			  check =false;
		  }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	return check;
	}
	@Override
	public void delete(int seq_num, String id) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public JsonArray AddTemplateFields(int[] selected_index, String id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int Add(String id, String label_name, String mandatory, String type, int NumberofInputfields,
			String options) {
		// TODO Auto-generated method stub
		return 0;
	}
   }
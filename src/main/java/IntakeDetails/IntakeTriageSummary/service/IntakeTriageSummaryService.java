package IntakeDetails.IntakeTriageSummary.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.Common.DynamicFields;
import onboard.DBconnection;
import logger.System;

public class IntakeTriageSummaryService  extends DynamicFields{

	@Override
	public JsonArray DataRetrieve(String Id)  {
		PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonArray jsonArray = new JsonArray();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectQuery = "select * from Triage_Summary_Info where Id = ? order by seq_no;";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("CheckExistance", true);
				jsonObject.addProperty("seq_num", rs.getString("seq_no"));
				jsonObject.addProperty("id", rs.getString("Id"));
				jsonObject.addProperty("Project_Name", rs.getString("prj_name"));
				jsonObject.addProperty("App_Name", rs.getString("app_name"));
				jsonObject.addProperty("options", rs.getString("options"));
				jsonObject.addProperty("LabelName", rs.getString("label_name"));
				jsonObject.addProperty("ColumnName", rs.getString("column_name"));
				jsonObject.addProperty("Type", rs.getString("type"));
				jsonObject.addProperty("Mandatory", rs.getString("mandatory"));
				jsonObject.addProperty("Value", rs.getString("value"));
				jsonObject.addProperty("isCompleted", rs.getString("isCompleted"));
				jsonObject.addProperty("UMandatory", rs.getString("usermandatoryflag"));
				
				jsonArray.add(jsonObject);
				
				while(rs.next()) {
					JsonObject jsonObject1 = new JsonObject();
					jsonObject1.addProperty("CheckExistance", true);
					jsonObject1.addProperty("seq_num", rs.getString("seq_no"));
					jsonObject1.addProperty("id", rs.getString("Id"));
					jsonObject1.addProperty("Project_Name", rs.getString("prj_name"));
					jsonObject1.addProperty("App_Name", rs.getString("app_name"));
					jsonObject1.addProperty("options", rs.getString("options"));
					jsonObject1.addProperty("LabelName", rs.getString("label_name"));
					jsonObject1.addProperty("ColumnName", rs.getString("column_name"));
					jsonObject1.addProperty("Type", rs.getString("type"));
					jsonObject1.addProperty("Mandatory", rs.getString("mandatory"));
					jsonObject1.addProperty("Value", rs.getString("value"));
					jsonObject1.addProperty("isCompleted", rs.getString("isCompleted"));
					jsonObject1.addProperty("UMandatory", rs.getString("usermandatoryflag"));
					
					jsonArray.add(jsonObject1);
				}
				System.out.println("JSON ARRAY 1 :: "+jsonArray);
			}
			
			else
			{
				String SelectQuery1 = "select * from triage_summary_info_template_details order by seq_no;";
				st1 = con.prepareStatement(SelectQuery1);
				rs1 = st1.executeQuery();
				
				while(rs1.next()) {
					JsonObject jsonObject1 = new JsonObject();
					jsonObject1.addProperty("CheckExistance", true);
					jsonObject1.addProperty("seq_num", rs1.getString("seq_no"));
					//jsonObject1.addProperty("id", rs1.getString("Id"));
					jsonObject1.addProperty("Project_Name", rs1.getString("prj_name"));
					jsonObject1.addProperty("App_Name", rs1.getString("app_name"));
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
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception-------[info]--------" +e);
		}
		System.out.println("JSON ARRAY :: "+jsonArray);
		return jsonArray;
	}
	@Override
	public JsonArray AddTemplateFields(int[] selected_index,String id) {
		PreparedStatement st1=null;
		ResultSet rs1=null;
	      JsonArray jsonArray = new JsonArray();
	      try
	      {
	    	  DBconnection dBconnection = new DBconnection();
	    	   
	    	   Connection connection = (Connection) dBconnection.getConnection(); 
	    	  if(selected_index!=null)
	    	  {
	    	   ArrayList<Integer> seq_no = new ArrayList<Integer>(); 
	    	   
	    	   ArrayList<String> temp_column_name = new ArrayList<String>(); 
	    	   
	    	   ArrayList<String> selected_temp_column_name = new ArrayList<String>(); 
	    	   
	    	   //Storing template fields column name in temp_column_name
	    	   
	    	   String SelectedColumnQuery ="select * from triage_summary_info_template_details;"; 
	    	   
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
	    	   
	    	   //
	    	   
	    	   String CheckQuery = "select * from triage_summary_info where id=? order by seq_no";
	    	    PreparedStatement st2 = connection.prepareStatement(CheckQuery);
				st2.setString(1, id);
				ResultSet rs2 = st2.executeQuery();
	    	   
	    	   boolean check_first_occurance = true;
	    	   
	    	   while(rs2.next())
	    	   {
	    		   String column_name = rs2.getString("column_name");
	    		   if(!selected_temp_column_name.contains(column_name)&&!column_name.startsWith("TriageSummaryAddInfo"))
	    		   {
	    			 String Seq_Num_Query = "Select * from triage_summary_info where id = ? and column_name = ?;";
	    			 PreparedStatement st3 = connection.prepareStatement(Seq_Num_Query);
	    			 st3.setString(1, id);
	    			 st3.setString(2, column_name);
	    			 ResultSet rs3 = st3.executeQuery();
	    			 int seq_num = 0;
	    			 if(rs3.next())
	    			 {
	    				 seq_num =rs3.getInt(1);
	    			 }
	    			 delete(seq_num, id);
					/*
					 * if(check_first_occurance) { IntakeOpportunityDeleteService(rs2.getInt(1),id);
					 * check_first_occurance = false; }else {
					 * IntakeOpportunityDeleteService(rs2.getInt(1)-1,id); }
					 * 
					 */	    			    System.out.println("DELETING COLUMN "+rs2.getString("column_name"));
	                    delete_seq_num += rs2.getInt(1)+",";
	                    delete_column_name +=rs2.getString("column_name")+",";
	    		   }
	    	   }
	    	   
	    	   if(delete_seq_num.contains(","))
	    	   
	    		   delete_seq_num = delete_seq_num.substring(0,delete_seq_num.length()-1);
	    	   
	    	   if(delete_column_name.contains(","))
	        	
	    		   delete_column_name = delete_column_name.substring(0,delete_column_name.length()-1);

			   jsonArray.add(delete_column_name);
	    	   
			   String MaxSeqnoQuery = "select max(seq_no) from triage_summary_info where Id = ? order by seq_no"; 
			   PreparedStatement st = connection.prepareStatement(MaxSeqnoQuery);
  			   st.setString(1, id);
  			   ResultSet rs = st.executeQuery();
				
			   int max_seq = 1; 
				
			   if(rs.next()) { 
				
				   max_seq = rs.getInt(1); 
					
			   } 
	    	   
			   for(String col_name : selected_temp_column_name)
			   {
	    		
				   String SelectedQuery = "select * from triage_summary_info where id=? and column_name =?;";
				   PreparedStatement st3 = connection.prepareStatement(SelectedQuery);
	  			   st3.setString(1, id);
	  			   st3.setString(2, col_name);
	  			   ResultSet rs3 = st3.executeQuery();

				   if(!rs3.next())
	        	   
				   {
   							   
	        			  String SelectDetailsQuery = "select * from triage_summary_info_template_details where column_name=?;";
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
	        			  String mandatory = rs4.getString(8);
	        			  String value = rs4.getString(9);
	        			  String Opportunity_InsertQuery ="insert into Triage_summary_info (seq_no, id,  prj_name, app_name, options, label_name, column_name, type, mandatory, value) value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        		  
	        		  PreparedStatement prestmt = connection.prepareStatement(Opportunity_InsertQuery); 
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
	        		  jsonArray.add(jsonObj);
	        		  max_seq++; 
	        	   }
	        	   
				
			}
	      }
	    	 st1.close();
	    	 rs1.close();
	    	  }
	    	  else
	    	  {	  PreparedStatement st2=null;
	    	  	  ResultSet rs2=null;
	    		  String selectQuery ="select * from triage_summary_info_template_details order by seq_no;";
	    		  st2 = connection.prepareStatement(selectQuery);
	    		  rs2 = st2.executeQuery();
	    		  String delete_column_name ="";
	    		  while(rs2.next())
	    		  {
	    			  String DeleteQuery = "delete from triage_summary_info where id=? and column_name=?;";
	    			  st1 = connection.prepareStatement(DeleteQuery);
	    				st1.setString(1,id);
	    				st1.setString(2,rs2.getString("column_name"));
	    				st1.executeUpdate();	
	    				st1.close();
	    			  delete_column_name += rs2.getString("column_name")+",";
	    		  }
	    		  int seq_no = 1 ;
	    		  String selectQueryTriageInfo ="select * from triage_summary_info where id =? order by seq_no;";
	    		  PreparedStatement st3 = connection.prepareStatement(selectQueryTriageInfo);
	  			  st3.setString(1, id);
	  			  ResultSet rs3 = st3.executeQuery();
	    		  	    		  
	    		  while(rs3.next())
	    		  {
	    			  String UpdateSeqNumQuery = "Update triage_summary_info set seq_no=? where id=? and column_name=?;";
	    			  st1 = connection.prepareStatement(UpdateSeqNumQuery);
	    	          st1.setInt(1, seq_no++);
	    	          st1.setString(2, id);
	    	          st1.setString(3, rs3.getString("column_name"));
	    	          st1.execute();
	    		  }
	    		  OrderingColumnNameBySeq(id);
	    		  jsonArray.add(delete_column_name.substring(0,delete_column_name.length()-1));
	    	  st1.close();
	    	  st2.close();
	    	  rs2.close();
	    	  }
	    	  
	      }
	      catch(Exception e)
	      {
	    	  e.printStackTrace();
	    	  System.out.println("Exception---------[info]---------"+e);
	      }
	       return jsonArray;
	      }
	@Override
	public void delete(int delete_seqnum, String Id) {
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
			String select_query = "select max(seq_no) from Triage_summary_info where Id = ? order by seq_no;";
			PreparedStatement st = connection.prepareStatement(select_query);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				seqmax = Integer.parseInt(rs.getString(1));
			}

			String query = "select * from Triage_summary_info where Id = ? order by seq_no;";
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

			String delete_query = "delete from Triage_summary_info where id=?;";
			PreparedStatement st2 = connection.prepareStatement(delete_query);
			st2.setString(1,Id);
			st2.executeUpdate();	
			st2.close();

			for (int j = 0; j < seqmax - 1; j++) {
				String insert_query = "insert into Triage_summary_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
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

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception---->>>" + e);
		}
	}
	
	@Override
	public void OrderingColumnNameBySeq(String ID)
    {	PreparedStatement st=null;
    	ResultSet rs=null;
  		  try {
  		  
  		  DBconnection dBconnection = new DBconnection();
     	      Connection connection = (Connection) dBconnection.getConnection(); 
     	      String SelectQuery ="Select * from Triage_summary_info order by seq_no";
     	      st = connection.prepareStatement(SelectQuery);
     	      rs = st.executeQuery();
     	      String startStr = "TriageSummaryAddInfo";
     	      while(rs.next())
     	      {
     	    	  if(rs.getString("column_name").startsWith("TriageSummaryAddInfo"))
     	    	  {
     	    		  String seqnum = rs.getString("seq_no");
     	    		  String column_name = rs.getString("column_name");
     	    		  String append_seq_num=column_name.substring(startStr.length(),column_name.length());
     	    		  if(!seqnum.equals(append_seq_num))
     	    		  {
     	    			String updateColumnName = startStr+seqnum;
     	    			String UpdateQuery = "Update Triage_summary_info set column_name =? where id = ? and seq_no=?;";  
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
	public int Add(String id,String label_name, String mandatory,String umandatory, String type, int NumberofInputfields, String options )
	{
		int max_seq_num = 1;
			try {
				DBconnection dBconnection = new DBconnection();
				Connection connection = (Connection) dBconnection.getConnection();
				String select_query = "select * from Triage_summary_info where Id = ? order by seq_no;";
				PreparedStatement st = connection.prepareStatement(select_query);
				st.setString(1, id);
				ResultSet rs = st.executeQuery();
				String name = "TriageSummaryAddInfo";
				
				if (rs.next()) {
					String max_seqnum = "select max(seq_no) from Triage_summary_info where Id = ? order by seq_no;";
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
				String insert_query = "insert into Triage_summary_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
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
				System.out.println("Exception---[info]------" + e);
			}
			return max_seq_num;
	}
	@Override
	public JsonObject edit(String label_name, int sequencenumber,String id) {
		JsonObject jsonobj = new JsonObject();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String PreviouslabelQuery = "select label_name from Triage_Summary_Info where id = ? and seq_no =?;";
			PreparedStatement st1 = connection.prepareStatement(PreviouslabelQuery);
			st1.setString(1, id);
			st1.setInt(2, sequencenumber);
			ResultSet rs1 = st1.executeQuery();
			if (rs1.next()) {
				jsonobj.addProperty("previous_label_name", rs1.getString(1));
			}

			String update_query = "update Triage_Summary_Info set label_name =? where id = ? and seq_no=?;";
			PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
			preparedStmt1.setString(1, label_name);
			preparedStmt1.setString(2, id);
			preparedStmt1.setInt(3, sequencenumber);
			preparedStmt1.execute();
			String SelectQuery = "select * from Triage_Summary_Info where id =? and seq_no =?;";
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
		} catch (Exception e) {
			System.out.println("Exception---->>>>" + e);
		}
		System.out.println("Json object " + jsonobj);
		return jsonobj;
	}

	
	public JsonObject complete(String id,String completeType) {
		boolean status=false;
		JsonObject jsonobj = new JsonObject();
		String SelectQuery="";

		 try {
			 DBconnection con = new DBconnection();
			 Connection connection = (Connection) con.getConnection();
			 if(completeType.equals("TriageSummary")) {
			  SelectQuery = "select * from triage_summary_info where id =? ;";
			 }
			 else if(completeType.equals("Assesment")) {
				  SelectQuery = "select * from assessment_archival_consumption_info where id =? ;";
			 }
			 else if(completeType.equals("StakeHolder")) {
				  SelectQuery = "select * from intake_stake_holder_info where OppId =? ;";
			 }
			 PreparedStatement st = connection.prepareStatement(SelectQuery);
				st.setString(1, id);
				ResultSet rs = st.executeQuery();
				if(rs.next())
				{ String UpdateQuery="";
				 if(completeType.equals("TriageSummary")) {
					 UpdateQuery = "update triage_summary_info set isCompleted ='Yes'  where id =? ";
				 }
				 else if(completeType.equals("Assesment")) {
					 UpdateQuery = "update assessment_archival_consumption_info set isCompleted ='Yes'  where id =? ";

				 }
				 else if(completeType.equals("StakeHolder")) {
					 UpdateQuery = "update intake_stake_holder_info set isCompleted ='Yes'  where OppId =? ";

				 }
				 PreparedStatement st1 = connection.prepareStatement(UpdateQuery);
		          st1.setString(1, id);
		          st1.execute();
		          status=true;
					 }
				jsonobj.addProperty("iscompleted", status);
			     connection.close();

		 }
		 catch(Exception e) {
			 e.printStackTrace();
			System.out.println("Exception----------[info]--------"+e);
		 }
		 
		return jsonobj;
	}
	public JsonObject getCompleteStatus(String id,String completeType) {
		boolean status=false;
		JsonObject jsonobj = new JsonObject();
		String SelectQuery="";
		
		try {
			DBconnection con = new DBconnection();
			Connection connection = (Connection) con.getConnection();
			if(completeType.equals("TriageSummary")) {
				SelectQuery = "select ifnull(isCompleted,'No')isCompleted from triage_summary_info where id =? ;";
			}
			else if(completeType.equals("Assesment")) {
				SelectQuery = "select ifnull(isCompleted,'No')isCompleted from assessment_archival_consumption_info where id =? ;";
			}
			else if(completeType.equals("StakeHolder")) {
				SelectQuery = "select ifnull(isCompleted,'No')isCompleted from intake_stake_holder_info where OppId =? ;";
			}
			PreparedStatement st = connection.prepareStatement(SelectQuery);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
			{ String isCompleted="";
				isCompleted = rs.getString("isCompleted");
			if(isCompleted.equals("Yes")) {
				status=true;
			}
			
			}
			jsonobj.addProperty("iscompleted", status);
			connection.close();
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception----------[info]--------"+e);
		}
		
		return jsonobj;
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
			String SelectQuery = "select ifnull(isCompleted,'No')isCompleted from triage_summary_info where id =? and column_name=?;";
			PreparedStatement st = connection.prepareStatement(SelectQuery);
			st.setString(1, id);
			st.setString(2, name);
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
			{ String UpdateQuery="";
				if(rs.getString("isCompleted").isEmpty()||rs.getString("isCompleted").equals("No"))
			{
				 UpdateQuery = "update triage_summary_info set isCompleted ='No' ,value=? where id =? and column_name =?";
			}else{
				 UpdateQuery = "update triage_summary_info set isCompleted ='Yes' ,value=? where id =? and column_name =?";

			}PreparedStatement st1 = connection.prepareStatement(UpdateQuery);
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
	public int Add(String id, String label_name, String mandatory, String type, int NumberofInputfields,
			String options) {
		// TODO Auto-generated method stub
		return 0;
	}

}

package Opportunity.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import org.json.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Opportunity.OpportunityBean;
import onboard.DBconnection;

public class NewOpportunityService {
	public static JsonArray OpportunityDataRetrieve() {
		JsonArray jsonArray = null;
		try {
			String randomNumber = RandomIdGenerator();
			OpportunityBean.setRecord_Number(randomNumber);
			AddingOpportunityRecords(randomNumber);
			jsonArray = NewOpportunityInfoDataRetrieveService(randomNumber);
		} catch (Exception e) {
			System.out.println("Exception e" + e);
		}
		return jsonArray;
	}

	public static JsonArray NewOpportunityInfoDataRetrieveService(String randomNumber) {
		JsonArray jsonArray = new JsonArray();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String query = "select * from opportunity_info_Template_details order by seq_no;";
			Statement statementforcheck = connection.createStatement();
			ResultSet Resultset = statementforcheck.executeQuery(query);
			if (Resultset.next()) {
				//String value = Resultset.getString("column_name").equals("apmid") ? randomNumber
					//	: Resultset.getString("value");
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
					//String value1 = Resultset.getString("column_name").equals("apmid") ? randomNumber
						//	: Resultset.getString("value");
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
		} catch (Exception e) {
			System.out.println("Exception--->>" + e);
		}
		return jsonArray;
	}

	public static int NewOpportunityAddOperationService(String applicationname, String label_name, String column_name,
			String mandatory, String type, int NumberofInputfields, String options) {
		int max_seq_num = 1;
		try {
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String select_query = "select * from Opportunity_Info_Details  order by seq_no;";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(select_query);
			String name = "OpportunityAddInfo";
			String randomNumber = OpportunityBean.getRecord_Number();
			
			if (rs.next()) {
				String max_seqnum = "select max(seq_no) from Opportunity_Info_Details;";
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
			String insert_query = "insert into Opportunity_Info_Details (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
			preparedStatement1.setInt(1, max_seq_num);
			preparedStatement1.setString(2, randomNumber);
			preparedStatement1.setString(3, "");
			preparedStatement1.setString(4, applicationname);
			preparedStatement1.setString(5, options);
			preparedStatement1.setString(6, label_name);
			preparedStatement1.setString(7, (name + max_seq_num));
			preparedStatement1.setString(8, type);
			preparedStatement1.setString(9, mandatory);
			preparedStatement1.setString(10, "");
			preparedStatement1.execute();
		} catch (Exception e) {
			System.out.println("Exception---[info]------" + e);
		}
		return max_seq_num;
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
				/*
				 * int m = (int) Math.pow(10, 10 - 1); randomNumber = m + new Random().nextInt(9
				 * * m);
				 */
				/*while (true) {
					long numb = (long) (Math.random() * 100000000 * 1000000); // had to use this as int's are to small
																				// for a 10 digit number.
					if (String.valueOf(numb).length() == 10) {
						randomNumber = numb;
						break;
					}*/
				
				for (int i = 0; i < n; i++) { 
					  
		            // generate a random number between 
		            // 0 to AlphaNumericString variable length 
		            int index 
		                = (int)(randomNumber.length() 
		                        * Math.random()); 
		  
		            // add Character one by one in end of sb 
					/*
					 * sb.append(randomNumber .charAt(index));
					 */
		            AlphaNumericNumber += randomNumber .charAt(index);
		        } 
				
				
				System.out.println("Random No : " + randomNumber);
				DBconnection dBconnection = new DBconnection();
				Connection connection = (Connection) dBconnection.getConnection();
				String query = "select * from opportunity_info where id='" +"D3S"+AlphaNumericNumber
						+ "' order by seq_no;";
				Statement statementforcheck = connection.createStatement();
				ResultSet Resultset = statementforcheck.executeQuery(query);
				if (!Resultset.next()) {
					DuplicateFlag = false;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception-------[info]---------" + e);
		}
		// OpportunityBean.setRecord_Number(randomNumber);

		// NewOpportunityService.AddingOpportunityRecords("D3S"+randomNumber);
		jsonObject1.addProperty("RandomNumber", "D3S" + AlphaNumericNumber);
		return "D3S" + AlphaNumericNumber;
		
	}

	public static void AddingOpportunityRecords(String RecordNumber) {
		try {
			// Deleting the opportunity_info_details table for adding template for new
			// Opportunity
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String Deletequery = "delete from opportunity_info_details";
			Statement st = connection.createStatement();
			st.executeUpdate(Deletequery);

			// Selecting the records from opportunity_template_info_details to
			// opportunity_info_template_details

			String SelectQuery = "select * from opportunity_info_template_details order by seq_no";
			Statement st1 = connection.createStatement();
			ResultSet rs = st1.executeQuery(SelectQuery);
			while (rs.next()) {
				if (rs.getInt(1) <= 16) {
					String Opportunity_InsertQuery = "insert into Opportunity_Info_Details (seq_no,Id, prj_name, app_name, options, label_name, column_name, type, mandatory, value)"
							+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

					PreparedStatement prestmt = connection.prepareStatement(Opportunity_InsertQuery);
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

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception ---------[info]---------" + e);
		}
	}

	public static JsonObject NewOpportunityModifyOperationService(String label_name, int sequencenumber) {
		JsonObject jsonobj = new JsonObject();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String PreviouslabelQuery = "select label_name from Opportunity_Info_Details where seq_no ='"
					+ sequencenumber + "';";
			Statement st1 = connection.createStatement();
			ResultSet rs1 = st1.executeQuery(PreviouslabelQuery);
			if (rs1.next()) {
				jsonobj.addProperty("previous_label_name", rs1.getString(1));
			}

			String update_query = "update Opportunity_Info_Details set label_name =? where seq_no='" + sequencenumber
					+ "'";
			PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
			preparedStmt1.setString(1, label_name);
			preparedStmt1.execute();
			String SelectQuery = "select * from Opportunity_Info_Details where seq_no ='" + sequencenumber + "';";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(SelectQuery);
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

	public static void NewOportunityDeleteOperationService(int delete_seqnum) {
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

			String select_query = "select max(seq_no) from opportunity_info_details order by seq_no;";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(select_query);
			if (rs.next()) {
				seqmax = Integer.parseInt(rs.getString(1));
			}

			String query = "select * from opportunity_info_details order by seq_no;";
			Statement st1 = connection.createStatement();
			ResultSet rs1 = st1.executeQuery(query);
			while (rs1.next()) {
				arr_seqmax.add(rs1.getInt(1));
				arr_id.add(rs1.getString(2));
				arr_prj.add(rs1.getString(3));
				arr_app.add(rs1.getString(4));
				arr_options.add(rs1.getString(5));
				arr_label_name.add(rs1.getString(6));
				arr_column_name.add(rs1.getString(7));
				arr_type.add(rs1.getString(8));
				arr_mandatory.add(rs1.getString(9));
				arr_value.add(rs1.getString(10));
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
				}
			}

			String delete_query = "delete from opportunity_info_details;";
			Statement st2 = connection.createStatement();
			st2.executeUpdate(delete_query);
			for (int j = 0; j < seqmax - 1; j++) {
				String insert_query = "insert into opportunity_info_details (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
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
				preparedStatement1.execute();
			}
			st2.close();
			OrderingColumnNameBySeq();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception---->>>" + e);
		}
	}
	
	  public static JsonArray AddTemplateFields(int[] selected_index) { JsonArray
	  jsonArray = new JsonArray();
	  try { 
	  ArrayList<Integer> seq_no = new ArrayList<Integer>();
	  ArrayList<String> temp_column_name = new ArrayList<String>();
	  ArrayList<String> selected_temp_column_name = new ArrayList<String>();
	  DBconnection dBconnection = new DBconnection();
	  Connection connection = (Connection) dBconnection.getConnection();
	  
	  String SelectedColumnQuery ="select * from opportunity_info_template_details;"; 
	  Statement st1 = connection.createStatement(); 
	  ResultSet rs1 = st1.executeQuery(SelectedColumnQuery);
	  while(rs1.next()) {
	  temp_column_name.add(rs1.getString("column_name"));
	  }
	  for(int k=0;k<selected_index.length;k++) {
	  selected_temp_column_name.add(temp_column_name.get(selected_index[k]-1)); 
	  }
	  ArrayList<String> infodetails_column = new ArrayList<String>();
	  String SelectQuery1 = "select * from opportunity_info_details order by seq_no;";
	  Statement st4 = connection.createStatement(); 
	  ResultSet rs4 = st4.executeQuery(SelectQuery1); 
	  while(rs4.next()) {
	  infodetails_column.add(rs4.getString("column_name"));
	  } 
	  String SelectQuery = "select * from opportunity_info_details order by seq_no;"; 
	  Statement st2 = connection.createStatement(); 
	  ResultSet rs2 = st2.executeQuery(SelectQuery);
	  ArrayList<String> existing_column = new ArrayList<String>();
	  ArrayList<String> add_column = new ArrayList<String>(); 
	  ArrayList<String> delete_column = new ArrayList<String>(); 
	  while(rs2.next()) { 
		  String col_name=rs2.getString("column_name"); 
		  //boolean check_column_name = false; 
		  for(int k = 0; k < selected_temp_column_name.size();k++) {
	  //134567 123456
	  if(selected_temp_column_name.contains(rs2.getString("column_name"))) 
	  {
	  existing_column.add(rs2.getString("column_name")); 
	  }
	  else { //delete records column name 
		  if(infodetails_column.contains(rs2.getString("column_name"))) {
	  delete_column.add(rs2.getString("column_name")); 
	  } 
		  //add records column name
	  else {
		  add_column.add(rs2.getString("columnLabel")); 
		  }
		  }
	  } 
	  //deleting the unchecked records in opportunity info table 
	  String del_seq_num = ""; 
	  boolean delete_first_occurance = true;
	  for(int index = 0;index<delete_column.size();index++) { 
		  String selectDeleteSeqQuery = "select seq_no from opportunity_info_details where column_name='"+delete_column.get(index)+"';"; 
		  Statement st5 = connection.createStatement();
	      ResultSet rs5 = st5.executeQuery(selectDeleteSeqQuery); 
	      if(rs5.next()) {
	    	  if(delete_first_occurance)
	    	  {
	        NewOportunityDeleteOperationService(rs5.getInt(1));
	    	  delete_first_occurance =false;
	    	  }
	    	  else
	    	  {
	    		 NewOportunityDeleteOperationService(rs5.getInt(1)-1);
	    	  }
	        del_seq_num+=rs5.getInt(1)+",";
	        }
	      }
	  jsonArray.add(del_seq_num.substring(0,del_seq_num.length()-1));
	  //adding the checked records in opportunity info table 
	  String MaxSeqnoQuery = "select max(seq_no) from opportunity_info_details order by seq_no"; 
	  Statement st = connection.createStatement(); 
	  ResultSet rs = st.executeQuery(MaxSeqnoQuery); 
	  int max_seq = 1; 
	  if(rs.next()) { 
		  max_seq = rs.getInt(1); 
		  } 
	  for(int n=0; n< add_column.size() ; n++) 
	  {
		  String SelectDetailsQuery = "select * from opportunity_info_template_details where column_name='"+add_column.get(n)+"';";
		  Statement st3 = connection.createStatement();
	      ResultSet rs3 = st3.executeQuery(SelectDetailsQuery);
	  
	  if(rs3.next()) {
		  String id = OpportunityBean.getRecord_Number();
		  String project_name = rs3.getString(2);
		  String appname = rs3.getString(3); String
	  options =rs3.getString(4); String label_name = rs3.getString(5); String
	  column_name = rs3.getString(6); String type = rs3.getString(7); String
	  mandatory = rs3.getString(8); String value = rs3.getString(9); String
	  Opportunity_InsertQuery =
	  "insert into Opportunity_Info_Details (seq_no, id,  prj_name, app_name, options, label_name, column_name, type, mandatory, value)"
	  + "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	  
	  PreparedStatement prestmt =
	  connection.prepareStatement(Opportunity_InsertQuery); prestmt.setInt(1,
	  max_seq); prestmt.setString(2, id); prestmt.setString(3, project_name);
	  prestmt.setString(4, appname); prestmt.setString(5, options);
	  prestmt.setString(6, label_name); prestmt.setString(7, column_name);
	  prestmt.setString(8, type); prestmt.setString(9, mandatory);
	  prestmt.setString(10, value); prestmt.execute(); JsonObject jsonObj = new
	  JsonObject(); jsonObj.addProperty("seq_no",max_seq);
	  jsonObj.addProperty("id",id); jsonObj.addProperty("prj_name",project_name);
	  jsonObj.addProperty("app_name",appname);
	  jsonObj.addProperty("options",options);
	  jsonObj.addProperty("label_name",label_name);
	  jsonObj.addProperty("column_name",column_name);
	  jsonObj.addProperty("type",label_name);
	  jsonObj.addProperty("mandatory",mandatory);
	  jsonObj.addProperty("value",value); jsonArray.add(jsonObj); max_seq++; 
	      } 
	    } 
	  }
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  System.out.println("Exception----------[info]----------"+e); 
	  }
	  return jsonArray; 
	  }
	  
	 
      public static JsonArray AddTemplateFields1(int[] selected_index) {
      JsonArray jsonArray = new JsonArray();
      try
      {
    	   ArrayList<Integer> seq_no = new ArrayList<Integer>(); 
    	   ArrayList<String> temp_column_name = new ArrayList<String>(); 
    	   ArrayList<String> selected_temp_column_name = new ArrayList<String>(); 
    	   DBconnection dBconnection = new DBconnection();
    	   Connection connection = (Connection) dBconnection.getConnection(); 
    	   String SelectedColumnQuery ="select * from opportunity_info_template_details;"; 
    	   Statement st1 =connection.createStatement(); 
    	   ResultSet rs1 =st1.executeQuery(SelectedColumnQuery); 
    	   while(rs1.next()) {
    		temp_column_name.add(rs1.getString("column_name")); 
    		}
    	   for(int k=0;k<selected_index.length;k++) {
    	   selected_temp_column_name.add(temp_column_name.get(selected_index[k]-1)); 
    	   }
    	   String delete_seq_num = ""; 
    	   String delete_column_name ="";
    	   String CheckQuery = "select * from opportunity_info_details order by seq_no";
    	   Statement st2 = connection.createStatement();
    	   ResultSet rs2 = st2.executeQuery(CheckQuery);
    	   boolean check_first_occurance = true;
    	   
    	   while(rs2.next())
    	   {
    		   String column_name = rs2.getString("column_name");
    		   if(!selected_temp_column_name.contains(column_name)&&!column_name.startsWith("OpportunityAddInfo"))
    		   {
    			   String Seq_Num_Query  = "Select * from Opportunity_Info_Details where column_name ='"+column_name+"';";
    			   Statement st3 = connection.createStatement();
    			   ResultSet rs3 = st3.executeQuery(Seq_Num_Query);
    			   int seq_num = 0;
    			   if(rs3.next())
    			   {
    				seq_num = rs3.getInt(1);   
    			   }
    			   NewOportunityDeleteOperationService(seq_num);
					/*
					 * if(check_first_occurance) { NewOportunityDeleteOperationService(seq);
					 * check_first_occurance = false; }else {
					 * NewOportunityDeleteOperationService(rs2.getInt(1)-1); }
					 */
    			    	
    			    System.out.println("DELETING COLUMN "+rs2.getString("column_name"));
                    delete_seq_num += rs2.getInt(1)+",";
                    delete_column_name +=rs2.getString("column_name")+",";
    		   }
    	   }
    	   if(delete_seq_num.contains(","))
    	   delete_seq_num = delete_seq_num.substring(0,delete_seq_num.length()-1);
    	   if(delete_column_name.contains(","))
        	   delete_column_name = delete_column_name.substring(0,delete_column_name.length()-1);

		   jsonArray.add(delete_column_name);
    	   String MaxSeqnoQuery = "select max(seq_no) from opportunity_info_details order by seq_no"; 
			  Statement st = connection.createStatement(); 
			  ResultSet rs = st.executeQuery(MaxSeqnoQuery); 
			  int max_seq = 1; 
			  if(rs.next()) { 
				  max_seq = rs.getInt(1); 
				  } 
    	   for(String col_name : selected_temp_column_name)
    	   {
    		   String SelectedQuery = "select * from opportunity_info_details where column_name ='"+col_name+"'";
    		   Statement st3 = connection.createStatement();
        	   ResultSet rs3 = st3.executeQuery(SelectedQuery);
        	   if(!rs3.next())
        	   {
        		   
        			  String SelectDetailsQuery = "select * from opportunity_info_template_details where column_name='"+col_name+"';";
        			  Statement st4 = connection.createStatement();
        		      ResultSet rs4 = st3.executeQuery(SelectDetailsQuery);
        		  
        		  if(rs4.next()) {
        			  String id = OpportunityBean.getRecord_Number();
        			  String project_name = rs4.getString(2);
        			  String appname = rs4.getString(3); 
        			  String options =rs4.getString(4); 
        			  String label_name = rs4.getString(5); 
        			  String column_name = rs4.getString(6); 
        			  String type = rs4.getString(7); 
        			  String mandatory = rs4.getString(8);
        			  String value = rs4.getString(9);
        			  String Opportunity_InsertQuery ="insert into Opportunity_Info_Details (seq_no, id,  prj_name, app_name, options, label_name, column_name, type, mandatory, value) value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        		  
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
      }
      catch(Exception e)
      {
    	  e.printStackTrace();
    	  System.out.println("Exception---------[info]---------"+e);
      }
       return jsonArray;
      }
      public static void OrderingColumnNameBySeq()
      {
    	  try {  
    		  DBconnection dBconnection = new DBconnection();
       	      Connection connection = (Connection) dBconnection.getConnection(); 
       	      String SelectQuery ="Select * from Opportunity_Info_Details order by seq_no";
       	      Statement st = connection.createStatement();
       	      ResultSet rs = st.executeQuery(SelectQuery);
       	      String startStr = "OpportunityAddInfo";
       	      while(rs.next())
       	      {
       	    	  if(rs.getString("column_name").startsWith("OpportunityAddInfo"))
       	    	  {
       	    		  String seqnum = rs.getString("seq_no");
       	    		  String column_name = rs.getString("column_name");
       	    		  String append_seq_num=column_name.substring(startStr.length(),column_name.length());
       	    		  if(!seqnum.equals(append_seq_num))
       	    		  {
       	    			String updateColumnName = startStr+seqnum;
       	    			String UpdateQuery = "Update Opportunity_Info_Details set column_name ='"+updateColumnName+"' where seq_no='"+seqnum+"';";  
       	    			Statement st1 = connection.createStatement();
       	       	        st1.executeUpdate(UpdateQuery);
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
 }

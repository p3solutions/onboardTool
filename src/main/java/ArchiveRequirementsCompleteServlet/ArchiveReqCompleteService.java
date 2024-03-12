package ArchiveRequirementsCompleteServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class ArchiveReqCompleteService {
	
	public JsonObject complete(String id,String completeType) {
		boolean status=false;
		JsonObject jsonobj = new JsonObject();
		String SelectQuery="";

		 try {
			 DBconnection con = new DBconnection();
			 Connection connection = (Connection) con.getConnection();
			 if(completeType.equals("LegacyApplication")) {
			  SelectQuery = "select * from archive_environment_serverip_info where OppId =? ;";
			 }
			 else if(completeType.equals("RetentionApplication")) {
				  SelectQuery = "select * from archive_retention_info where OppId =? ;";
			 }
			 else if(completeType.equals("BusinessRequirement")) {
				  SelectQuery = "select * from archive_retentionlegalreq_info where OppId =? ;";
			 }
			 	  PreparedStatement st=connection.prepareStatement(SelectQuery);
			 	  st.setString(1, id);
				  ResultSet rs = st.executeQuery();
				if(rs.next())
				{ String UpdateQuery="";
				 if(completeType.equals("LegacyApplication")) {
					 UpdateQuery = "update archive_environment_serverip_info set isCompleted ='Yes'  where OppId =? ";
				 }
				 else if(completeType.equals("RetentionApplication")) {
					 UpdateQuery = "update archive_retention_info set isCompleted ='Yes'  where OppId =? ";

				 }
				 else if(completeType.equals("BusinessRequirement")) {
					 UpdateQuery = "update archive_retentionlegalreq_info set isCompleted ='Yes'  where OppId =? ";

				 }	 PreparedStatement st1=connection.prepareStatement(UpdateQuery);
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
	public JsonObject intoDetails(String id) {
		boolean status=false;
		JsonObject jsonobj = new JsonObject();
		String SelectQueryInfo="";
		boolean rolesFlag=false;
		boolean introFlag=false;
		
		try {
			DBconnection con = new DBconnection();
			Connection connection = (Connection) con.getConnection();
			SelectQueryInfo = "select * from archiveintro_info where OppId =? ;";
			PreparedStatement st=connection.prepareStatement(SelectQueryInfo);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				if(!(rs.getString("scope").equals("Read-only data will be archived"))) {
					introFlag=true;
				}
			}
            rs.close();
            st.close();
			String SelectQueryRoleInfo = "select ifNull(priority_order_num,'0')priority_order_num ,ifNull(emailId,'NA')emailId from archivereq_roles_info where OppId =? ;";
			PreparedStatement st1=connection.prepareStatement(SelectQueryRoleInfo);
			st1.setString(1,id);
			ResultSet rs1 = st1.executeQuery();
			while(rs1.next()) {
				if(!(rs1.getString("priority_order_num").equals("0")&& rs1.getString("emailId").equals("NA"))) {
					rolesFlag=true;
				}
			}
            rs1.close();
            st1.close();
			if(introFlag==true && rolesFlag==true) {
				String updateIntro="update archiveintro_info set isCompleted='Yes' where OppId =? ;";
				PreparedStatement st3=connection.prepareStatement(updateIntro);
				st3.setString(1, id);
				st3.execute();
				st3.close();
				
				String updateRoles="update archivereq_roles_info set isCompleted='Yes' where OppId =? ;";
				PreparedStatement st4=connection.prepareStatement(updateRoles);
				st4.setString(1, id);
				st4.execute();
				st4.close();
				status=true;

				
			}else {
				status=false;

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
	public JsonObject intoDetailsCompleteStatus(String id) {
		boolean status=false;
		JsonObject jsonobj = new JsonObject();
		String SelectQueryInfo="";
		boolean rolesFlag=false;
		boolean introFlag=false;
		
		
		try {
			DBconnection con = new DBconnection();
			Connection connection = (Connection) con.getConnection();
			SelectQueryInfo = "select distinct isCompleted from archiveintro_info where OppId =? ;";
			PreparedStatement st=connection.prepareStatement(SelectQueryInfo);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				if(rs.getString("isCompleted").equals("Yes")) {
					introFlag=true;
				}
			}
			rs.close();
			st.close();
			String SelectQueryRoleInfo = "select distinct isCompleted from archivereq_roles_info where OppId =? ;";
			PreparedStatement st1=connection.prepareStatement(SelectQueryRoleInfo);
			st1.setString(1, id);
			ResultSet rs1 = st1.executeQuery();
			while(rs1.next()) {
				if(rs1.getString("isCompleted").equals("Yes")) {
					rolesFlag=true;
				}
			}
			rs1.close();
			st1.close();
			if(introFlag==true && rolesFlag==true) {
				
				status=true;
			}else {
				status=false;
				
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
			if(completeType.equals("LegacyApplication")) {
				SelectQuery = "select ifnull(isCompleted,'No')isCompleted from archive_environment_serverip_info where OppId =? ;";
			}
			else if(completeType.equals("RetentionApplication")) {
				SelectQuery = "select ifnull(isCompleted,'No')isCompleted from archive_retention_info where OppId =? ;";
			}
			else if(completeType.equals("BusinessRequirement")) {
				SelectQuery = "select ifnull(isCompleted,'No')isCompleted from archive_retentionlegalreq_info where OppId =? ;";
			}
			PreparedStatement st=connection.prepareStatement(SelectQuery);
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
	public JsonObject getCurrentPage(String id) {
		Connection con=null;
		DBconnection dBconnection=null;
		JsonObject jsonObj = new JsonObject();
		boolean rolesFlag=false;
		boolean introFlag=false;
		

	try {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		
			String SelectQueryInfo = "select distinct ifnull(IsCompleted,'No')IsCompleted from archiveintro_info where OppId =? ;";
			PreparedStatement st=con.prepareStatement(SelectQueryInfo);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				if((rs.getString("IsCompleted").equals("Yes"))) {
					introFlag=true;
				}
			}
            rs.close();
            st.close();
			String SelectQueryRoleInfo = "select distinct ifnull(IsCompleted,'No')IsCompleted from archivereq_roles_info where OppId =? ;";
			PreparedStatement st1=con.prepareStatement(SelectQueryRoleInfo);
			st1.setString(1, id);
			ResultSet rs1 = st1.executeQuery();
			while(rs1.next()) {
				if((rs1.getString("IsCompleted").equals("Yes"))) {
					rolesFlag=true;
				}
			}
            rs1.close();
            st1.close();
			if(introFlag==true && rolesFlag==true) {
			
					jsonObj.addProperty("completeStatus", "Yes");
					jsonObj.addProperty("cuurrentModule", "ArchiveIntro");
					String LegacyAppQuery = "select ifnull(isCompleted,'No')isCompleted from archive_environment_serverip_info where OppId =? ;";
					PreparedStatement st2=con.prepareStatement(LegacyAppQuery);
					st2.setString(1, id);
					ResultSet rs2 = st2.executeQuery();
					if (rs2.next()) {
						if (rs2.getString("IsCompleted").equals("Yes")) {
							jsonObj.addProperty("completeStatus", rs2.getString("IsCompleted"));
							jsonObj.addProperty("cuurrentModule", "LegacyApplication");

							String RetentionQuery = "select ifnull(isCompleted,'No')isCompleted from archive_retention_info where OppId =? ;";
							PreparedStatement st3=con.prepareStatement(RetentionQuery);
							st3.setString(1, id);
							ResultSet rs3 = st3.executeQuery();
							if (rs3.next()) {
								if (rs3.getString("IsCompleted").equals("Yes")) {
									jsonObj.addProperty("completeStatus", rs3.getString("IsCompleted"));
									jsonObj.addProperty("cuurrentModule", "RetentionApplication");
									
									String BusinessRequirementQuery = "select ifnull(isCompleted,'No')isCompleted from archive_retentionlegalreq_info where OppId =? ;";
									PreparedStatement st4=con.prepareStatement(BusinessRequirementQuery);
									st4.setString(1, id);
									ResultSet rs4 = st4.executeQuery();
									if (rs4.next()) {
										if (rs4.getString("IsCompleted").equals("Yes")) {
											jsonObj.addProperty("completeStatus", rs4.getString("IsCompleted"));
											jsonObj.addProperty("cuurrentModule", "BusinessRequirement");


											String revisionQuery = "select * from archive_documentrevision_info where OppId =? and date !=''and version !='' and documentChanges !='' and changeAuthor !='' ;";
											PreparedStatement st5=con.prepareStatement(revisionQuery);
											st5.setString(1, id);
											ResultSet rs5 = st5.executeQuery();
											if (rs5.next()) {
													jsonObj.addProperty("completeStatus", "Yes");
													jsonObj.addProperty("cuurrentModule", "Revisions");
													String addendumQuery = "select * from archive_req_addendum_info where OppId =? and addendumInfo !='';";
													PreparedStatement st6=con.prepareStatement(addendumQuery);
													st6.setString(1, id);
													ResultSet rs6 = st6.executeQuery();
													if (rs6.next()) {
															jsonObj.addProperty("completeStatus", "Yes");
															jsonObj.addProperty("cuurrentModule", "Addendum");
													}else {
														jsonObj.addProperty("completeStatus", "Yes");
														jsonObj.addProperty("cuurrentModule", "Revisions");
													}
												}
												
										
											else {
												jsonObj.addProperty("completeStatus", "No");
												jsonObj.addProperty("cuurrentModule", "Revisions");
											}
											}
										
									}
									else {
										jsonObj.addProperty("completeStatus", "Yes");
										jsonObj.addProperty("cuurrentModule", "RetentionApplication");
									}
									
									
								}
								
							}
							else {
								jsonObj.addProperty("completeStatus", "Yes");
								jsonObj.addProperty("cuurrentModule", "LegacyApplication");
							}
							
						}
					}
					else {
						jsonObj.addProperty("completeStatus", "Yes");
						jsonObj.addProperty("cuurrentModule", "ArchiveIntro");
					}
			}
				else {
					jsonObj.addProperty("completeStatus", "No");
					jsonObj.addProperty("cuurrentModule", "ArchiveIntro");
				}
			
			
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	return jsonObj;

	}

}

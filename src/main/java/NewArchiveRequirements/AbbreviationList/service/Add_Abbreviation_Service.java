package NewArchiveRequirements.AbbreviationList.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import java.security.*;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class Add_Abbreviation_Service {
	public static JsonObject add_Abbreviation(String app_id,String abbreviation_acronym,String description) {
		JsonObject jsonobj = new JsonObject();
		try {
//			int uabbcount=0,udescount=0;
			int newSeqNum=0;
			String random_id = generateRandomApprovalId();
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			String select_query ="select max(seq_no) from archivereq_abbreviations_info_details where app_id=?";
			PreparedStatement preparedStmt = connection.prepareStatement(select_query);
			preparedStmt.setString(1, app_id);
			ResultSet rs=preparedStmt.executeQuery();
			rs.next();
			newSeqNum = rs.getInt(1);	
				String insert_query ="insert into archivereq_abbreviations_info_details (seq_no,random_id,app_id,abbreviation_acronym,description) values( ?, ?, ?, ?,?);";
				PreparedStatement preparedStmt1 = connection.prepareStatement(insert_query);
				preparedStmt1.setInt(1, newSeqNum+1);
				preparedStmt1.setString(2, random_id);
				preparedStmt1.setString(3, app_id);
				preparedStmt1.setString(4, abbreviation_acronym);
				preparedStmt1.setString(5, description);
				
				preparedStmt1.execute();
				jsonobj.addProperty("flag", "Success");
				jsonobj.addProperty("id", random_id);
				jsonobj.addProperty("app_id", app_id);
				jsonobj.addProperty("abbreviation_acronym", abbreviation_acronym);
				jsonobj.addProperty("description", description);
			//}
			}
			catch(Exception e)
			{
				System.out.println("Exception Occurs");
				e.printStackTrace();
			}
			return jsonobj;
		}
		public static String generateRandomApprovalId() throws SQLException {
			String uniqueID = "";
			boolean checkTermination = true;
			while(checkTermination) {
				uniqueID = UUID.randomUUID().toString();
				System.out.println("App Id : " + uniqueID);
				boolean checkDuplicateId = checkDuplicateApprovalId(uniqueID);
				if(checkDuplicateId == false) {
					checkTermination = false;
				}
			}
			return uniqueID;
		}
		public static boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
			PreparedStatement state=null;
			ResultSet result=null;
			boolean checkDuplicate = false;

			try {
				DBconnection dBconnection = new DBconnection();
				Connection connection = (Connection) dBconnection.getConnection();
				System.out.println("Connected...");
				String selectQuery = "select * from archivereq_abbreviations_info_details order by app_id;";
				state = connection.prepareStatement(selectQuery);
				result= state.executeQuery();
				while(result.next()) {
					String checkApprovalId = result.getString("random_id");
					if(checkApprovalId.equals(uniqueID)) {
						checkDuplicate = true;
					}   
				}
				state.close();
				result.close();
			}
			catch(Exception e)
			{

			}
			return checkDuplicate;

		}
		
		public static JsonObject TemplateInsert(String app_id) {
			JsonObject jsonobj = new JsonObject();
			try {
				
				DBconnection dBconnection = new DBconnection();
				Connection connection = (Connection) dBconnection.getConnection();
				System.out.println("Connected...");
				String select_query ="select * from archivereq_abbreviations_template_details order by seq_no";
				PreparedStatement preparedStmt = connection.prepareStatement(select_query);				
				ResultSet rs=preparedStmt.executeQuery();
				while(rs.next())
				{
					String random_id = generateRandomApprovalId();
					String insert_query ="insert into archivereq_abbreviations_info_details (seq_no,random_id,app_id,abbreviation_acronym,description) values( ?, ?, ?, ?,?);";
					PreparedStatement preparedStmt1 = connection.prepareStatement(insert_query);
					preparedStmt1.setString(1, rs.getString("seq_no"));
					preparedStmt1.setString(2, random_id);
					preparedStmt1.setString(3, app_id);
					preparedStmt1.setString(4, rs.getString("abbreviation_acronym"));
					preparedStmt1.setString(5, rs.getString("description"));
					preparedStmt1.execute();				
				//}
				}
			}
				catch(Exception e)
				{
					System.out.println("Exception Occurs");
				}
				return jsonobj;
			}
		
	}
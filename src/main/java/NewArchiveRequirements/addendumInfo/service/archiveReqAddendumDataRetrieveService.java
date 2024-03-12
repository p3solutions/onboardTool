package NewArchiveRequirements.addendumInfo.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveReqAddendumDataRetrieveService {

	DBconnection dBconnection;
	public Connection con;
	
	String Id;
	String oppName;
	
	public archiveReqAddendumDataRetrieveService(String Id, String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.oppName = oppName;
	}
	
public JsonArray archiveReqAddendumDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		try {
			
			String selectQuery = "select * from Archive_Req_Addendum_Info where OppId = ? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
			    JsonObject jsonObj = new JsonObject();
			    jsonObj.addProperty("checkExistance", true);
			    jsonObj.addProperty("section_no", rs.getString("seq_no"));
			    jsonObj.addProperty("seq_no", rs.getString("seq_no"));
			    jsonObj.addProperty("labelName", rs.getString("labelName"));
			    jsonObj.addProperty("addendumInfo", rs.getString("addendumInfo"));

			    String selectQuery2 = "select File_Name,seq_num from archive_req_addendum_fileupload where OppId = ? and section_no = ?;";
			    PreparedStatement st2 = con.prepareStatement(selectQuery2);
			    st2.setString(1, Id);
			    st2.setString(2, rs.getString("seq_no"));
			    ResultSet rs2 = st2.executeQuery();

			    JsonObject fileNames = new JsonObject();
				boolean checkData = false;
			    while (rs2.next()) {
			    	checkData=true;
			    	fileNames.addProperty("checkData",checkData);
			        fileNames.addProperty(rs2.getString("seq_num"),rs2.getString("File_Name"));
			    }
			    if(!checkData) {
			    	fileNames.addProperty("checkData",checkData);
			    }
			    jsonObj.add("fileNames", fileNames);
			    jsonArray.add(jsonObj);

			    while (rs.next()) {
			        JsonObject jsonObj1 = new JsonObject();
			        jsonObj1.addProperty("section_no", rs.getString("seq_no"));
			        jsonObj1.addProperty("seq_no", rs.getString("seq_no"));
			        jsonObj1.addProperty("labelName", rs.getString("labelName"));
			        jsonObj1.addProperty("addendumInfo", rs.getString("addendumInfo"));

			        String selectQuery3 = "select File_Name,seq_num from archive_req_addendum_fileupload where OppId = ? and section_no = ?;";
			        PreparedStatement st3 = con.prepareStatement(selectQuery3);
			        st3.setString(1, Id);
			        st3.setString(2, rs.getString("seq_no"));
			        ResultSet rs3 = st3.executeQuery();

			        JsonObject fileNames1 = new JsonObject();
					boolean checkData1 = false;
			        while (rs3.next()) {
			        	checkData1=true;
				    	fileNames1.addProperty("checkData",checkData1);
			            fileNames1.addProperty(rs3.getString("seq_num"),rs3.getString("File_Name"));
			        }
			        if(!checkData1) {
				    	fileNames1.addProperty("checkData",checkData1);
				    }

			        jsonObj1.add("fileNames", fileNames1);

			        jsonArray.add(jsonObj1);
			    }
			}

			else
            {
				String InsertQuery = "insert into Archive_Req_Addendum_Info(seq_no, OppId, oppName, prjName, labelName, addendumInfo)"
						+ " value(?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, 1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, "Section 1");
	          prestmt.setString(6, "");
	          prestmt.execute();
	          prestmt.close();
                JsonObject jsonObj2 = new JsonObject();
                jsonObj2.addProperty("checkExistance",false);
                jsonArray.add(jsonObj2);
            }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
		
	}
	
	protected void finalize() throws Throwable {
	      con.close();
	      System.out.println("Db connection Closed");
		}

	
}

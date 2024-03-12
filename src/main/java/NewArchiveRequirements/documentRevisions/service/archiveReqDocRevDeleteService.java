package NewArchiveRequirements.documentRevisions.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveReqDocRevDeleteService {

	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	
	public archiveReqDocRevDeleteService(int SeqNum,String Id) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
	}
	
	
	public JsonObject archiveReqDocRevDelete()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag = false;
		try
		{
			
			ArrayList<String> seqNum = new ArrayList<String>();
			ArrayList<String> date = new ArrayList<String>();
			ArrayList<String> version = new ArrayList<String>();
			ArrayList<String> documentChanges = new ArrayList<String>();
			ArrayList<String> changeAuthor = new ArrayList<String>();
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> dateRes = new ArrayList<String>();
			ArrayList<String> versionRes = new ArrayList<String>();
			ArrayList<String> documentChangesRes = new ArrayList<String>();
			ArrayList<String> changeAuthorRes = new ArrayList<String>();
			
			String oppName ="";
			int newSeqNum = SeqNum+1;
			String selectQuery = "select * from archive_documentrevision_info where OppId=? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
						
			while(rs.next())
			{
			   seqNum.add(rs.getString("seq_no"));
			   date.add(rs.getString("date"));
			   version.add(rs.getString("version"));
			   documentChanges.add(rs.getString("documentChanges"));
			   changeAuthor.add(rs.getString("changeAuthor"));
			   oppName = rs.getString("OppName");
			}
			
			for(int i=0;i<seqNum.size();i++)
			{
				if(SeqNum<Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					dateRes.add(date.get(i));
					versionRes.add(version.get(i));
					documentChangesRes.add(documentChanges.get(i));
					changeAuthorRes.add(changeAuthor.get(i));
				}
				else if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(String.valueOf(Integer.parseInt(seqNum.get(i))-1));
					dateRes.add(date.get(i));
					versionRes.add(version.get(i));
					documentChangesRes.add(documentChanges.get(i));
					changeAuthorRes.add(changeAuthor.get(i));
				}
			}
			
			
			String deleteQuery ="delete from archive_documentrevision_info where OppId=?;";
			PreparedStatement st1 = con.prepareStatement(deleteQuery);
			st1.setString(1,Id);
			st1.executeUpdate();	
			st1.close();
		
			for(int i=0;i<seqNumRes.size();i++)
			{
			 	
			  String InsertQuery = "insert into archive_documentrevision_info (seq_no, OppId, OppName, prjName, date, version, documentChanges, changeAuthor)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNum.get(i)));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, dateRes.get(i));
	          prestmt.setString(6, versionRes.get(i));
	          prestmt.setString(7, documentChangesRes.get(i));
	          prestmt.setString(8, changeAuthorRes.get(i));
	          prestmt.execute();
	          
			}
			statusFlag =true;
			
			
		}
		
		catch(Exception e)
		{
			statusFlag =false;
			e.printStackTrace();
		}
		jsonObject.addProperty("DeleteStatus", statusFlag);
		return jsonObject;
		
	}
	
	protected void finalize() throws Throwable {
	      con.close();
		}
}

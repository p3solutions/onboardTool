package NewArchiveRequirements.addendumInfo.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class archiveReqAddendumDeleteService {
	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	
	public archiveReqAddendumDeleteService(int SeqNum,String Id) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
	}
	
	
	public JsonObject archiveReqAddendumDelete()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag = false;
		try
		{
			
			ArrayList<String> seqNum = new ArrayList<String>();
			ArrayList<String> label = new ArrayList<String>();
			ArrayList<String> addendumInfo = new ArrayList<String>();
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> labelRes = new ArrayList<String>();
			ArrayList<String> addendumInfoRes = new ArrayList<String>();
			
			String oppName ="";
			int newSeqNum = SeqNum+1;
			String selectQuery = "select * from archive_req_addendum_info where OppId='"+Id+"' order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			while(rs.next())
			{
			   seqNum.add(rs.getString("seq_no"));
			   label.add(rs.getString("labelName"));
			   addendumInfo.add(rs.getString("addendumInfo"));
			   oppName = rs.getString("OppName");
			}
			
			for(int i=0;i<seqNum.size();i++)
			{
				if(SeqNum<Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					labelRes.add(label.get(i));
					 addendumInfoRes.add(addendumInfo.get(i));
				}
				else if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(String.valueOf(Integer.parseInt(seqNum.get(i))-1));
					labelRes.add(label.get(i));
					 addendumInfoRes.add(addendumInfo.get(i));
				}
			}
			
			
			String deleteQuery ="delete from archive_req_addendum_info where OppId='"+Id+"';";
			Statement st1 = con.createStatement();
			st1.executeUpdate(deleteQuery);
			st1.close();
			
			for(int i=0;i<seqNumRes.size();i++)
			{
			 	
			  String InsertQuery = "insert into archive_req_addendum_info (seq_no, OppId, OppName, prjName, labelName, addendumInfo)"
						+ " value(?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNum.get(i)));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, labelRes.get(i));
	          prestmt.setString(6, addendumInfo.get(i));
	          prestmt.execute();
	          prestmt.close();
	          
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
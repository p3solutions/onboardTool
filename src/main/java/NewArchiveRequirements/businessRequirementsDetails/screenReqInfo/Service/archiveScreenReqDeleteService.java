package NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveScreenReqDeleteService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	String OppName;
	int SeqNum;
	String deleteReqId;
	
	public archiveScreenReqDeleteService(int SeqNum, String Id, String OppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id =Id;
		this.OppName = OppName;
		this.SeqNum = SeqNum;
	}
	
	public JsonObject deleteScreenInfo() {
		
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag = false;
		try {
			
			ArrayList<String> seqNum = new ArrayList<String>();
			ArrayList<String> reqId = new ArrayList<String>();
			ArrayList<String> screenDisplay = new ArrayList<String>();
			ArrayList<String> purpose = new ArrayList<String>();
			ArrayList<String> equivalentLegacy = new ArrayList<String>();
			
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> reqIdRes = new ArrayList<String>();
			ArrayList<String> screenDisplayRes = new ArrayList<String>();
			ArrayList<String> purposeRes = new ArrayList<String>();
			ArrayList<String> equivalentLegacyRes = new ArrayList<String>();
				
			String oppName ="";
			int newSeqNum = SeqNum+1;
			String selectQuery = "select * from archive_screenreq_info where OppId=? order by seq_no;";
			PreparedStatement st=con.prepareStatement(selectQuery);
			st.setString(1, Id);
     		ResultSet rs = st.executeQuery();
						
			while(rs.next())
			{
			   seqNum.add(rs.getString("seq_no"));
			   reqId.add(rs.getString("reqId"));
			   screenDisplay.add(rs.getString("screenDisplay"));
			   purpose.add(rs.getString("purpose"));
			   equivalentLegacy.add(rs.getString("equivalentLegacy"));
			}
			
			for(int i=0;i<seqNum.size();i++)
			{
				if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					reqIdRes.add(reqId.get(i));
					screenDisplayRes.add(screenDisplay.get(i));
					purposeRes.add(purpose.get(i));
					equivalentLegacyRes.add(equivalentLegacy.get(i));
					
				}
				else if(SeqNum<Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(String.valueOf(Integer.parseInt(seqNum.get(i))-1));
					reqIdRes.add("SDR-"+getSeqNum(Integer.parseInt(seqNum.get(i))-1));
					screenDisplayRes.add(screenDisplay.get(i));
					purposeRes.add(purpose.get(i));
					equivalentLegacyRes.add(equivalentLegacy.get(i));
				}
				else if(SeqNum == Integer.parseInt(seqNum.get(i))) {
					deleteReqId = reqId.get(i);
				}
			}
			
			
			String deleteQuery ="delete from archive_screenreq_info where OppId=?;";
			PreparedStatement st1=con.prepareStatement(deleteQuery);
			st1.setString(1, Id);
			st1.executeUpdate();
			st1.close();
			
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+reqIdRes.get(i)+" "+screenDisplayRes.get(i)+" "+purposeRes.get(i)+" "+equivalentLegacyRes.get(i)+" ");	
			  String ScreenInfoInsertQuery = "insert into archive_screenreq_info (seq_no, OppId, oppName, prjname, reqId, screenDisplay, purpose, equivalentLegacy)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(ScreenInfoInsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNum.get(i)));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, reqIdRes.get(i));
	          prestmt.setString(6, screenDisplayRes.get(i));
	          prestmt.setString(7, purposeRes.get(i));
	          prestmt.setString(8, equivalentLegacyRes.get(i));
	          prestmt.execute();
	          
			}
			jsonObject.addProperty("searchFormDeleteStatus",deleteSearchFormParent());
			jsonObject.addProperty("deleteReqId",deleteReqId);
			statusFlag =true;
		
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		jsonObject.addProperty("DeleteStatus", statusFlag);
		
		
		return jsonObject;
	}
	
	private String getSeqNum(int seq_no)
	{
		String seq_num="";
	  try
	  {
		  int count = 0;
		  seq_num=String.valueOf(seq_no);
		  if(seq_num.length()<3)
		  {
		  count = 3-seq_num.length();
		  for(int i=0;i<count;i++)
		  seq_num = "0"+seq_num;
		  }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return seq_num;
	}
	private boolean deleteSearchFormParent()
	{
		boolean statusFlag = false;
		try
		{
			int seq_no = 0; 
			String selectQuery = "select min(seq_no) from Archive_ScreenReq_SearchForm where oppid=? and reqId=?;";
			PreparedStatement st=con.prepareStatement(selectQuery);
			st.setString(1, Id);
			st.setString(2, deleteReqId);
     		ResultSet rs = st.executeQuery();
			
			if(rs.next())
			{
				seq_no = rs.getInt(1);
			   archiveScreenSearchFormDeleteService deleteService = new archiveScreenSearchFormDeleteService(seq_no, Id, OppName);
			   deleteService.deleteSearchForm();
			   deleteService.con.close();
			}
			rs.close();
			st.close();
			statusFlag = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}
}

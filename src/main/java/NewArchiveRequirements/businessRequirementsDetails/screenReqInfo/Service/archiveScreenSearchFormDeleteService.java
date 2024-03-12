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

public class archiveScreenSearchFormDeleteService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	String OppName;
	int SeqNum;
	 
	int fromSeqNum;
	int toseqNum;
	int RowCount=0;
	boolean isParent = false;
	public archiveScreenSearchFormDeleteService(int SeqNum, String Id, String OppName) throws ClassNotFoundException, SQLException {
	
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id =Id;
		this.OppName = OppName;
		this.SeqNum = SeqNum;
		checkForParentNode();
	}
	
	private void checkForParentNode()
	{
		String reqId="";
		try
		{
			String selectQuery = "select * from archive_screenreq_searchform where OppId=? and seq_no = ?";
			PreparedStatement st1 = con.prepareStatement(selectQuery);
			st1.setString(1, Id);
			st1.setInt(2, SeqNum);
			ResultSet rs1 = st1.executeQuery(); 
			
			 if(rs1.next())
			 {
				 reqId = rs1.getString(5);
			 } 
			st1.close();
			 rs1.close();
				
		 String selectQuery1 = "select min(seq_no) from archive_screenreq_searchform where OppId=? and reqId = ?";
		 PreparedStatement st = con.prepareStatement(selectQuery1);
		 st.setString(1, Id);
		 st.setString(2, reqId);
		 ResultSet rs = st.executeQuery(); 
	
		 if(rs.next())
		 {
		   fromSeqNum = rs.getInt(1); 
		 }
		 st.close();
		 rs.close();
		 if(SeqNum==fromSeqNum)
		 {
			 isParent=true;
			 String selectQuery2 = "select max(seq_no) from archive_screenreq_searchform where OppId=? and reqId = ?";
			 PreparedStatement st2 = con.prepareStatement(selectQuery2);
				st2.setString(1, Id);
				st2.setString(2, reqId);
			ResultSet rs2 = st2.executeQuery(); 
			 
			 if(rs2.next())
			 {
			   toseqNum = rs2.getInt(1); 
			 }
			 
			 st2.close();
			 rs2.close();
			for(int i=fromSeqNum;i<=toseqNum;i++)
				RowCount++;
		 }
		 else
		 {
			 isParent = false;
			 toseqNum = SeqNum;
			 fromSeqNum =SeqNum;
			 RowCount=1;
		 }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
	public JsonObject deleteSearchForm() {
		
		boolean statusFlag =false;
		JsonObject jsonObject = new JsonObject();
		try {
			
			ArrayList<String> seqNum = new ArrayList<String>();
			ArrayList<String> reqId = new ArrayList<String>();
			ArrayList<String> searchForm = new ArrayList<String>();
			ArrayList<String> searchField = new ArrayList<String>();
			ArrayList<String> fieldFormat = new ArrayList<String>();
			ArrayList<String> dataType = new ArrayList<String>();
			ArrayList<String> dataRetrieval = new ArrayList<String>();
			ArrayList<String> requiredField = new ArrayList<String>();
			ArrayList<String> additionalInfo = new ArrayList<String>();
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> reqIdRes = new ArrayList<String>();
			ArrayList<String> searchFormRes = new ArrayList<String>();
			ArrayList<String> searchFieldRes = new ArrayList<String>();
			ArrayList<String> fieldFormatRes = new ArrayList<String>();
			ArrayList<String> dataTypeRes = new ArrayList<String>();
			ArrayList<String> dataRetrievalRes = new ArrayList<String>();
			ArrayList<String> requiredFieldRes = new ArrayList<String>();
			ArrayList<String> additionalInfoRes = new ArrayList<String>();
			
			boolean checkReqId = false;
			
			
			String selectQuerySearch  = "select * from archive_screenreq_searchform where OppId=? order by seq_no;";
			PreparedStatement st1 = con.prepareStatement(selectQuerySearch);
			st1.setString(1, Id);
			ResultSet rs1 = st1.executeQuery();
					
			while(rs1.next()) {
				seqNum.add(rs1.getString(1));
			    reqId.add(rs1.getString(5));
			    searchForm.add(rs1.getString(6));
			    searchField.add(rs1.getString(7));
			    fieldFormat.add(rs1.getString(8));
			    dataType.add(rs1.getString(9));
			    dataRetrieval.add(rs1.getString(10));
			    requiredField.add(rs1.getString(11));
			    additionalInfo.add(rs1.getString(12));
			}
	         ArrayList<String> searchFormReqIdList = new ArrayList<String>();	
			for(int i = 0;i<fromSeqNum-1;i++)
			{
				seqNumRes.add(seqNum.get(i));
				reqIdRes.add(reqId.get(i));
				searchFormRes.add(searchForm.get(i));
				searchFieldRes.add(searchField.get(i));
				fieldFormatRes.add(fieldFormat.get(i));
				dataTypeRes.add(dataType.get(i));
				dataRetrievalRes.add(dataRetrieval.get(i));
				requiredFieldRes.add(requiredField.get(i));
				additionalInfoRes.add(additionalInfo.get(i));

			}
			String lastReqId = "";
			for(int j = toseqNum;j<seqNum.size();j++)
			{
				int seq_no =Integer.parseInt(seqNum.get(j))-RowCount;
				seqNumRes.add(String.valueOf(seq_no));
				if(!searchFormReqIdList.contains(reqId.get(j)))
					searchFormReqIdList.add(reqId.get(j));   
				
				reqIdRes.add((!isParent)?searchFormReqIdList.get(searchFormReqIdList.size()-1):"SDR-"+getSeqNum(Integer.parseInt(searchFormReqIdList.get(searchFormReqIdList.size()-1).split("-")[1])-1));
				searchFormRes.add(searchForm.get(j));
				searchFieldRes.add(searchField.get(j));
				fieldFormatRes.add(fieldFormat.get(j));
				dataTypeRes.add(dataType.get(j));
				dataRetrievalRes.add(dataRetrieval.get(j));
				requiredFieldRes.add(requiredField.get(j));
				additionalInfoRes.add(additionalInfo.get(j));
			}
			
			String deleteQuery ="delete from archive_screenreq_searchform where OppId=?;";
			PreparedStatement st2 = con.prepareStatement(deleteQuery);
			st2.setString(1,Id);
			st2.executeUpdate();	
			st2.close();
			
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+reqIdRes.get(i)+" ");	
			  String InsertQuery = "insert into Archive_ScreenReq_SearchForm (seq_no, oppId, oppName, prjname, reqId, searchForm, searchField, fieldFormat, dataType, dataRetrieval, requiredField, additionalInfo)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNumRes.get(i)));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, OppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, reqIdRes.get(i));
	          prestmt.setString(6, searchFormRes.get(i));
	          prestmt.setString(7, searchFieldRes.get(i));
	          prestmt.setString(8, fieldFormatRes.get(i));
	          prestmt.setString(9, dataTypeRes.get(i));
	          prestmt.setString(10, dataRetrievalRes.get(i));
	          prestmt.setString(11, requiredFieldRes.get(i));
	          prestmt.setString(12, additionalInfoRes.get(i));
	          prestmt.execute();
	          prestmt.close();
	          
			}
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
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}
}

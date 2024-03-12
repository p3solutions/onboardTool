package NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service;

import java.lang.reflect.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveScreenReqSearchFormAddService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	String OppName;
	String searchFormName;
	int seqNum;
	String ReqId;
	public archiveScreenReqSearchFormAddService(String Id, String OppName, String searchFormName, int seqNum, String ReqId) throws ClassNotFoundException, SQLException {
	
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id =Id;
		this.OppName = OppName;	
		this.searchFormName = searchFormName;
		this.seqNum = seqNum;
		this.ReqId = ReqId;
	}
	
	public JsonObject secreenReqSeachFormAdd() {
		
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag = false;
		try{
			ArrayList<Integer> seq_no = new ArrayList<Integer>();
			ArrayList<String> reqId = new ArrayList<String>();
			ArrayList<String> searchFormNames = new ArrayList<String>();
			ArrayList<String> searchFieldNames = new ArrayList<String>();
			ArrayList<String> fieldFormat = new ArrayList<String>();
			ArrayList<String> dataType = new ArrayList<String>();
			ArrayList<String> dataRetrieval = new ArrayList<String>();
			ArrayList<String> requiredField = new ArrayList<String>();
			ArrayList<String> additionalInfo = new ArrayList<String>();


			ArrayList<Integer> seq_noRes = new ArrayList<Integer>();
			ArrayList<String> reqIdRes = new ArrayList<String>();
			ArrayList<String> searchFormNamesRes = new ArrayList<String>();
			ArrayList<String> searchFieldNamesRes = new ArrayList<String>();
			ArrayList<String> fieldFormatRes = new ArrayList<String>();
			ArrayList<String> dataTypeRes = new ArrayList<String>();
			ArrayList<String> dataRetrievalRes = new ArrayList<String>();
			ArrayList<String> requiredFieldRes = new ArrayList<String>();
			ArrayList<String> additionalInfoRes = new ArrayList<String>();

			String selectQuery = "select * from Archive_ScreenReq_SearchForm where oppId = ? order by seq_no";
			PreparedStatement st=con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				seq_no.add(rs.getInt("seq_no"));
				reqId.add(rs.getString("reqId"));
				searchFormNames.add(rs.getString("searchForm"));
				searchFieldNames.add(rs.getString("searchField"));
				fieldFormat.add(rs.getString("fieldFormat"));
				dataType.add(rs.getString("dataType"));
				dataRetrieval.add(rs.getString("dataRetrieval"));
				requiredField.add(rs.getString("requiredField"));
				additionalInfo.add(rs.getString("additionalInfo"));
			}
			
			for(int i=0;i<seqNum;i++)
			{
				
					seq_noRes.add(seq_no.get(i));
					reqIdRes.add(reqId.get(i));
					searchFormNamesRes.add(searchFormNames.get(i));
					searchFieldNamesRes.add(searchFieldNames.get(i));
					fieldFormatRes.add(fieldFormat.get(i));
					dataTypeRes.add(dataType.get(i));
					dataRetrievalRes.add(dataRetrieval.get(i));
					requiredFieldRes.add(requiredField.get(i));
					additionalInfoRes.add(additionalInfo.get(i));
				
			  }	
					seq_noRes.add(seqNum+1);
					reqIdRes.add(ReqId);
					searchFormNamesRes.add("");
					searchFieldNamesRes.add("");
					fieldFormatRes.add("");
					dataTypeRes.add("");
					dataRetrievalRes.add("");
					requiredFieldRes.add("");
					additionalInfoRes.add("");
				
			
			for(int i =seqNum;i<seq_no.size();i++)
			{
				seq_noRes.add(seq_no.get(i)+1);
				reqIdRes.add(reqId.get(i));
				searchFormNamesRes.add(searchFormNames.get(i));
				searchFieldNamesRes.add(searchFieldNames.get(i));
				fieldFormatRes.add(fieldFormat.get(i));
				dataTypeRes.add(dataType.get(i));
				dataRetrievalRes.add(dataRetrieval.get(i));
				requiredFieldRes.add(requiredField.get(i));
				additionalInfoRes.add(additionalInfo.get(i));
			}
			for(int i=0;i<seq_noRes.size();i++)
			{
			  System.out.println(seq_noRes.get(i)+" "+reqIdRes.get(i)+" "+searchFormNamesRes.get(i)+" "+searchFieldNamesRes.get(i)+" "+fieldFormatRes.get(i)+" ");	
			}
			
			String deleteQuery ="delete from  Archive_ScreenReq_SearchForm where oppId=?;";
			PreparedStatement st1=con.prepareStatement(deleteQuery);
			st1.setString(1, Id);
			st1.executeUpdate();
			st1.close();
			
			for(int i=0;i<seq_noRes.size();i++)
			{
			  System.out.println(seq_noRes.get(i)+" "+reqIdRes.get(i)+" "+searchFormNamesRes.get(i)+" "+searchFieldNamesRes.get(i)+" "+fieldFormatRes.get(i)+" ");	
			  String InsertQuery = "insert into Archive_ScreenReq_SearchForm (seq_no, oppId, oppName, prjname, reqId, searchForm, searchField, fieldFormat, dataType, dataRetrieval, requiredField, additionalInfo)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, seq_noRes.get(i));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, OppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, reqIdRes.get(i));
	          prestmt.setString(6, searchFormNamesRes.get(i));
	          prestmt.setString(7, searchFieldNamesRes.get(i));
	          prestmt.setString(8, fieldFormatRes.get(i));
	          prestmt.setString(9, dataTypeRes.get(i));
	          prestmt.setString(10, dataRetrievalRes.get(i));
	          prestmt.setString(11, requiredFieldRes.get(i));
	          prestmt.setString(12, additionalInfoRes.get(i));
	          prestmt.execute();
	          prestmt.close();
	          statusFlag =true;
			}
			jsonObject.addProperty("AddStatus", statusFlag);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		jsonObject.addProperty("reqId", ReqId);
		return jsonObject;
	}
	
private String getReqId(int seqNum){
		
		String reqId = "SDR-";
		try {
			String seq_Num = String.valueOf(seqNum); 
            int length = seq_Num.length();
            if(length<=3)
			for(int i = 0; i<3-length; i++) 
				seq_Num ="0"+seq_Num;
		  reqId+=seq_Num;	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return reqId;
	}
	
	protected void finalize() throws Throwable {
		con.close();
		 System.out.println("DB connection closed");
	}
}

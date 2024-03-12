package NewArchiveRequirements.LegacyApplicationInfo.retentionDetails.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.Connection;

import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveReqLegacyTemplateInfo;
import onboard.DBconnection;
import logger.System;

public class archiveRetentionTemplateDetailsService {

	DBconnection dBconnection;
	Connection con;
	
	
public archiveRetentionTemplateDetailsService() throws ClassNotFoundException, SQLException {
		
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 
	}

public void archiveRetentionTemplate() throws SQLException {
	PreparedStatement st=null;
	ResultSet rs=null;
	try {
		
		String selectQuery = "select * from Archive_Retention_Template_details;";
		st = con.prepareStatement(selectQuery);
		rs = st.executeQuery();
		
		if(!rs.next()) {
			
			archiveRetentionTemplateService retention[] = new archiveRetentionTemplateService[3];
			retention[0] = new archiveRetentionTemplateService(1,"false","Record Level", "Condition 1: (Retention period set to <list date: i.e. last modified date, contract date, or employment date>)", "column", "","");
			retention[1] = new archiveRetentionTemplateService(2,"false","Table Level", "Condition 2: ( No date field available)", "column", "","");
			retention[2] = new archiveRetentionTemplateService(3,"false","Application Level", "", "column", "","");
			
		
		
		for (int index = 0; index<retention.length; index++)
		{
			String Legacy_InsertQuery = "insert into Archive_Retention_Template_details (seq_no, retentionCheck, retentionLevel, conditions, dateUsedType, dateUsed, descp)"
										+ " value(?, ?, ?, ?, ?, ?, ?)";
		
				  PreparedStatement retentionSt = con.prepareStatement(Legacy_InsertQuery);
				  retentionSt.setInt(1, retention[index].seq_num);
				  retentionSt.setString(2, retention[index].retentionCheck);
				  retentionSt.setString(3, retention[index].retentionLevel);
				  retentionSt.setString(4, retention[index].condition);
				  retentionSt.setString(5, retention[index].dateUsedType);
				  retentionSt.setString(6, retention[index].dateUsed);
				  retentionSt.setString(7, retention[index].desc);
				  retentionSt.execute();
				  retentionSt.close();
		}
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally
	{
		st.close();
		rs.close();
	}
}


protected void finalize() throws Throwable {
	 con.close();
	 System.out.println("DB connection closed");
	}


}

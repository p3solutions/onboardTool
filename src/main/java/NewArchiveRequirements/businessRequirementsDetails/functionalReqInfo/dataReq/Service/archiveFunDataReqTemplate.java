package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.Connection;

import NewArchiveRequirements.LegacyApplicationInfo.retentionDetails.Service.archiveRetentionTemplateService;
import onboard.DBconnection;
import logger.System;

public class archiveFunDataReqTemplate {

	DBconnection dBconnection;
	Connection con;
	
    archiveFunDataReqTemplateDetails dataReq[];
    String column;
    String tableName;

public archiveFunDataReqTemplate(String tableName) throws ClassNotFoundException, SQLException {
		
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.tableName = tableName;
		 getTableNameInfo();
	}

public void archiveDataReqTemplate() {
	PreparedStatement st=null;
	ResultSet rs=null;
	try {
		
		String selectQuery = "select * from "+tableName+";";
		st = con.prepareStatement(selectQuery);
		rs = st.executeQuery();
		
		if(!rs.next()) {
			
			
			for (int index = 0; index<dataReq.length; index++)
			{
				String dataInsertQuery = "insert into "+tableName+" (seq_no, reqId, reqInScope, reqType, "+column+", additionInfo)"
											+ " value(?, ?, ?, ?, ?, ?)";
			
					  PreparedStatement dataSt = con.prepareStatement(dataInsertQuery);
					  dataSt.setInt(1, dataReq[index].seq_num);
					  dataSt.setString(2, dataReq[index].reqId);
					  dataSt.setString(3, dataReq[index].reqInScope);
					  dataSt.setString(4, dataReq[index].reqType);
					  dataSt.setString(5, dataReq[index].req);
					  dataSt.setString(6, dataReq[index].additionInfo);
					  dataSt.execute();
					  dataSt.close();
		
			}
			
		}
		st.close();
		rs.close();
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
}

public void getDataReqTemplate() {
	
	try {
		dataReq = new archiveFunDataReqTemplateDetails[4];
		dataReq[0] = new archiveFunDataReqTemplateDetails(1,"FR-D-001","","System Table Relationships","The system maintains table relationships","N/A");
		dataReq[1] = new archiveFunDataReqTemplateDetails(2,"FR-D-002","","Relationship to Blobs","The System supports archiving structured formats maintaining the relationship to blobs","N/A");
		dataReq[2] = new archiveFunDataReqTemplateDetails(3,"FR-D-003","","Metadata Management and Indexing","The system supports metadata management and indexing","N/A");
		dataReq[3] = new archiveFunDataReqTemplateDetails(4,"FR-D-004","","System Documentation","Records related to the design, testing, or implementation of legacy system. Includes technical specification changes, system conversions, etc.","N/A");
	
	}

	catch(Exception e) {
		e.printStackTrace();
	}
}

public void getRetentionLegcalTemplate() {
	
	try {
		dataReq = new archiveFunDataReqTemplateDetails[2];
		dataReq[0] = new archiveFunDataReqTemplateDetails(1,"FR-R-001","","Data Retention","Data from the application must be retained based on Company's Retention Policy and should be set at the:Application Level,Table Level,Record Level","N/A");
		dataReq[1] = new archiveFunDataReqTemplateDetails(2,"FR-R-002","","Legal Hold","Current Legal hold on the application data will be applied to the application's archived data to override the Retention schedule.","N/A");
		
	}

	catch(Exception e) {
		e.printStackTrace();
	}
}

public void getSecurityTemplate() {
	
	try {
		dataReq = new archiveFunDataReqTemplateDetails[6];
		dataReq[0] = new archiveFunDataReqTemplateDetails(1,"FR-S-001","","Access - Admin","Access is role based and controlled by the active directory: Admin role. Admin Role will be created for an Admin to view data, run purge jobs, and make updates to specific areas in the archive","N/A");
		dataReq[1] = new archiveFunDataReqTemplateDetails(2,"FR-S-002","","Access - End User","Access is role based and controlled by the active directory: End User role. End User Role will be created for users to view data but do not have permissions to make any administrative changes to the archive","N/A");
		dataReq[2] = new archiveFunDataReqTemplateDetails(3,"FR-S-003","","Access - Unauthorized Login","Access to the Archive is role based and controlled through Active Directory - access is denied for any unauthorized user","N/A");
		dataReq[3] = new archiveFunDataReqTemplateDetails(4,"FR-S-004","","Access - Company Code","Users will be assigned to an Active Directory (AD) group","N/A");
		dataReq[4] = new archiveFunDataReqTemplateDetails(5,"FR-S-005","","Encrypted Data: Personal/Confidential","Archived data must remain encrypted for data classified as Personal Sensitive or Personal Confidential (ie. SSN, Name, Bank Information, etc.)","N/A");
		dataReq[5] = new archiveFunDataReqTemplateDetails(6,"FR-S-006","","Data Masking","Data masking must be applied to archived data that is classified as Business Restricted (ie. Email)","N/A");
	}

	catch(Exception e) {
		e.printStackTrace();
	}
}

public void getUsabilityTemplate() {
	
	try {
		dataReq = new archiveFunDataReqTemplateDetails[7];
		dataReq[0] = new archiveFunDataReqTemplateDetails(1,"FR-U-001","","Configuration of Search Forms","The system allows for configuration of data views and provides standard and advanced search tools","N/A");
		dataReq[1] = new archiveFunDataReqTemplateDetails(2,"FR-U-002","","Data Format","Archived data maintains its field properties and formats from the source system (i.e. decimals, %, commas, YYYY-MM-DD) to display values as defined in the screen","N/A");
		dataReq[2] = new archiveFunDataReqTemplateDetails(3,"FR-U-003","","Data Field Type","Archived data maintains its field types from the source system (i.e. STRING, Integer, CHAR, VARCHAR, Date) to display values as defined in the screen","N/A");
		dataReq[3] = new archiveFunDataReqTemplateDetails(4,"FR-U-004","","Unstructured Formats","The system supports archiving unstructured formats (ie.PDF, Word, Image, etc.)	","N/A");
		dataReq[4] = new archiveFunDataReqTemplateDetails(5,"FR-U-005","","Foreign Language","The System supports archiving foreign language data and maintains the language in the archive","N/A");
		dataReq[5] = new archiveFunDataReqTemplateDetails(6,"FR-U-006","","Special or Foreign Characters","Special or foreign characters from the source system are displayed in the archive","N/A");
		dataReq[6] = new archiveFunDataReqTemplateDetails(7,"FR-U-007","","Export for Analytics","Based on search parameters, data can be exported out of the system for analysis","N/A");
	}

	catch(Exception e) {
		e.printStackTrace();
	}
}

public void getAuditTemplate() {
	
	try {
		dataReq = new archiveFunDataReqTemplateDetails[3];
		dataReq[0] = new archiveFunDataReqTemplateDetails(1,"FR-A-001","","Audit Log","The system will maintain an audit log; tracking who accessed the archive by date and time, and what search activities were performed","N/A");
		dataReq[1] = new archiveFunDataReqTemplateDetails(2,"FR-A-002","","Data Completeness Control","Complete record level check: The number of records sent from the Legacy application are compared to the number of records posted in the archive. (All records are accounted for in the archive from the legacy system)","N/A");
		dataReq[2] = new archiveFunDataReqTemplateDetails(3,"FR-A-003","","Error Handling Control","Record level check: During the load, records deemed as errors based on program logic will be written to an exception log in their entirety","N/A");
	}

	catch(Exception e) {
		e.printStackTrace();
	}
}

public void getTableNameInfo() {

	switch(tableName) {
	
	case "Archive_DataReq_Template_Details":
		getDataReqTemplate();
		column = "req";
		break;
		
	case "Archive_RetentionLegalReq_Template_Details":
		getRetentionLegcalTemplate();
		column = "descp";
		break;
	
	case "Archive_SecurityReq_Template_Details":
		getSecurityTemplate();
		column = "descp";
		break;
		
	case "Archive_UsabilityReq_Template_Details":
		getUsabilityTemplate();
		column = "descp";
		break;
		
	case "Archive_AuditlReq_Template_Details":
		getAuditTemplate();
		column = "descp";
		break;
	}
}

protected void finalize() throws Throwable {
	 con.close();
	 System.out.println("DB connection closed");
	}

}

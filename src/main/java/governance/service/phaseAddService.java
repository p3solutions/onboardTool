package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class phaseAddService {
	
	DBconnection dBconnection;
	Connection con;
	String Id;
	String tableName;
	String IdWhereCond;
	String IdAndCond;
	static String qry;
	
public phaseAddService(String Id,String operation) throws ClassNotFoundException, SQLException {
	 dBconnection = new DBconnection();
	 con = (Connection) dBconnection.getConnection();
     this.Id = Id;
     getTableProp(operation);
}

private void getTableProp(String operation) {
	
	switch(operation)
	{
	
	case "EditPhase":
		tableName ="phase_info";
		break;
	
	case "NewPhase":
		tableName ="phase_info_details";
		break;
	}
	
	
}

public static String getQuery(String tableName)
{
	switch(tableName)
	{
	case "phase_info":
		qry="select * from phase_info where phaseId=? order by seq_no";
		break;
	case "phase_info_details":
		qry="select * from phase_info_details where phaseId=? order by seq_no";
		break;
		
    default:
	System.out.println("Error");
	break;
	
	}
	return qry;
}

public static String getSeqNoQuery(String tableName)
{
	switch(tableName)
	{
	case "phase_info":
		qry="select max(seq_no) from phase_info where phaseId=? order by seq_no;";
		break;
	case "phase_info_details":
		qry="select max(seq_no) from phase_info_details where phaseId=? order by seq_no;";
		break;
		
    default:
	System.out.println("Error");
	break;
	
	}
	return qry;
}

public static String getChkLblQuery(String tableName)
{
	switch(tableName)
	{
	case "phase_info":
		qry="select * from phase_info where label_name = ? and phaseId=?";
		break;
	case "phase_info_details":
		qry="select * from phase_info_details where label_name = ? and phaseId=?";
		break;
		
    default:
	System.out.println("Error");
	break;
	
	}
	return qry;
}

public static String getInsQuery(String tableName)
{
	switch(tableName)
	{
	case "phase_info":
		qry="insert into phase_info (seq_no,phaseId,phaseName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		break;
	case "phase_info_details":
		qry="insert into phase_info_details (seq_no,phaseId,phaseName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		break;
		
    default:
	System.out.println("Error");
	break;
	
	}
	return qry;
}


public boolean phaseAdd(String type,String label_name,String options,String mandatory)
{
	boolean addStatus =  false;
     try
     {
    	 int max_seq_num = 0;
    	 	String select_query = getQuery(tableName);
    	 	PreparedStatement st=con.prepareStatement(select_query);
    	 	st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			System.out.println("QUERYY : "+select_query);
			String name = "phaseAddInfo";
			
			if (rs.next()) {
				max_seq_num= getSeqNum();
			}
			if (!type.equals("Text box") && !type.equals("Datepicker")) {
				options = options.substring(0, options.length() - 1);
			}
			String insert_query = getInsQuery(tableName);
			PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
			preparedStatement1.setInt(1, max_seq_num);
			preparedStatement1.setString(2,Id);
			preparedStatement1.setString(3,"");
			preparedStatement1.setString(4, "");
			preparedStatement1.setString(5, options);
			preparedStatement1.setString(6, label_name);
			preparedStatement1.setString(7, (name + max_seq_num));
			preparedStatement1.setString(8, type);
			preparedStatement1.setString(9, mandatory);
			preparedStatement1.setString(10, "");
			preparedStatement1.execute();
            preparedStatement1.close();
            addStatus =true;
            System.out.println("INSERT PHASE : "+insert_query);
     }
     catch(Exception e)
     {
    	 e.printStackTrace();
     }
	return addStatus;
}

public int getSeqNum()
{
	int max_seq_num = 0;
	try
	{
		
	String max_seqnum = getSeqNoQuery(tableName);
	PreparedStatement st1=con.prepareStatement(max_seqnum);
	st1.setString(1, Id);
	ResultSet rs1 = st1.executeQuery();
	System.out.println("SEQ NUM :: "+max_seqnum);
	if (rs1.next()) {
		max_seq_num = Integer.parseInt(rs1.getString(1));
		max_seq_num++;
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
return max_seq_num;
}
public boolean checkLabelName(String labelName)
{
	boolean checkDuplicate = false;
	try
	{
      String labelQuery = getChkLblQuery(tableName);
      PreparedStatement st = con.prepareStatement(labelQuery);
	  st.setString(1, labelName);
	  st.setString(2, Id);
	  ResultSet rs = st.executeQuery();
	  System.out.println("CHK LABEL :: "+labelQuery);
      if(rs.next())
    	  checkDuplicate = true;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return checkDuplicate;
}
protected void finalize() throws Throwable {
con.close();
System.out.println("Db connection closed.");
}

}

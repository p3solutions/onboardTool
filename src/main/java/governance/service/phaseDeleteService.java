package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class phaseDeleteService {
	DBconnection dBconnection;
	Connection con;
	int seqNum;
	String tableName;
	String idWhereCond;
	String idAndCond;
	String id;
	static String qry;
	public phaseDeleteService(int seqNum,String  id,String operation) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
	     this.seqNum = seqNum;
	     this.id = id;
	     getTableProperty(operation);
	}
	
	
	public void getTableProperty(String operation)
	{
		try
		{
			switch(operation)
			{
			case "EditPhase":
				  tableName = "phase_info";
				 break;
				
			case "NewPhase":
				tableName = "phase_info_details";
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static String getSeqnoQuery(String tableName)
	{
		switch(tableName)
		{
		case "phase_info":
			qry="select max(seq_no) from phase_info where phaseId=? order by seq_no;";
			break;
		case "phase_info_details":
			qry="select max(seq_no) from phase_info_details order by seq_no;";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public static String getQuery(String tableName)
	{
		switch(tableName)
		{
		case "phase_info":
			qry="select * from phase_info where phaseId=? order by seq_no;";
			break;
		case "phase_info_details":
			qry="select * from phase_info_details order by seq_no;";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public static String getUpdQuery(String tableName)
	{
		switch(tableName)
		{
		case "phase_info":
			qry="update phase_info set column_name =? where seq_no=? and phaseId=?;";
			break;
		case "phase_info_details":
			qry="update phase_info_details set column_name =? where seq_no=?;";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public static String getDelQuery(String tableName)
	{
		switch(tableName)
		{
		case "phase_info":
			qry="delete from phase_info where phaseId=?;";
			break;
		case "phase_info_details":
			qry="delete from phase_info_details;";
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
			qry="insert into phase_info(seq_no,phaseId,phaseName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			break;
		case "phase_info_details":
			qry="insert into phase_info_details(seq_no,phaseId,phaseName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public boolean DeleteService()
	{
		boolean deleteStatus = false;
		try
		{
		int seqmax = 0;
		ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
		ArrayList<String> arr_id = new ArrayList<String>();
		ArrayList<String> arr_phase = new ArrayList<String>();
		ArrayList<String> arr_prj = new ArrayList<String>();
		ArrayList<String> arr_options = new ArrayList<String>();
		ArrayList<String> arr_label_name = new ArrayList<String>();
		ArrayList<String> arr_column_name = new ArrayList<String>();
		ArrayList<String> arr_type = new ArrayList<String>();
		ArrayList<String> arr_mandatory = new ArrayList<String>();
		ArrayList<String> arr_value = new ArrayList<String>();

		ArrayList<Integer> arr_seqmax_split = new ArrayList<Integer>();
		ArrayList<String> arr_id_split = new ArrayList<String>();
		ArrayList<String> arr_phase_split = new ArrayList<String>();
		ArrayList<String> arr_prj_split = new ArrayList<String>();
		ArrayList<String> arr_options_split = new ArrayList<String>();
		ArrayList<String> arr_label_name_split = new ArrayList<String>();
		ArrayList<String> arr_column_name_split = new ArrayList<String>();
		ArrayList<String> arr_type_split = new ArrayList<String>();
		ArrayList<String> arr_mandatory_split = new ArrayList<String>();
		ArrayList<String> arr_value_split = new ArrayList<String>();
		if(tableName.equals("phase_info"))
		{
		String select_query = getSeqnoQuery(tableName);
		PreparedStatement st=con.prepareStatement(select_query);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		if (rs.next()) {
			seqmax = Integer.parseInt(rs.getString(1));
		}
        st.close();
        rs.close();
		}
		if(tableName.equals("phase_info_details"))
		{
		String select_query = getSeqnoQuery(tableName); 
		PreparedStatement st=con.prepareStatement(select_query);
		ResultSet rs = st.executeQuery();
		if (rs.next()) {
			seqmax = Integer.parseInt(rs.getString(1));
		}
        st.close();
        rs.close();
		}
		if(tableName.equals("phase_info"))
		{	
		String query = getQuery(tableName);
		PreparedStatement st1=con.prepareStatement(query);
		st1.setString(1, id);
		ResultSet rs1 = st1.executeQuery();
		while (rs1.next()) {
			arr_seqmax.add(rs1.getInt(1));
			arr_id.add(rs1.getString(2));
			arr_phase.add(rs1.getString(3));
			arr_prj.add(rs1.getString(4));
			arr_options.add(rs1.getString(5));
			arr_label_name.add(rs1.getString(6));
			arr_column_name.add(rs1.getString(7));
			arr_type.add(rs1.getString(8));
			arr_mandatory.add(rs1.getString(9));
			arr_value.add(rs1.getString(10));
		}
         st1.close();
         rs1.close();
		}
        
		if(tableName.equals("phase_info_details"))
		{	
		String query = getQuery(tableName);
		PreparedStatement st1=con.prepareStatement(query);
		ResultSet rs1 = st1.executeQuery();
		while (rs1.next()) {
			arr_seqmax.add(rs1.getInt(1));
			arr_id.add(rs1.getString(2));
			arr_phase.add(rs1.getString(3));
			arr_prj.add(rs1.getString(4));
			arr_options.add(rs1.getString(5));
			arr_label_name.add(rs1.getString(6));
			arr_column_name.add(rs1.getString(7));
			arr_type.add(rs1.getString(8));
			arr_mandatory.add(rs1.getString(9));
			arr_value.add(rs1.getString(10));
		}
         st1.close();
         rs1.close();
		}
		
		
		for (int i = 0; i < seqmax; i++) {
			if (arr_seqmax.get(i) < seqNum) {
				arr_seqmax_split.add(arr_seqmax.get(i));
				arr_id_split.add(arr_id.get(i));
				arr_phase_split.add(arr_phase.get(i));
				arr_prj_split.add(arr_prj.get(i));
				arr_options_split.add(arr_options.get(i));
				arr_label_name_split.add(arr_label_name.get(i));
				arr_column_name_split.add(arr_column_name.get(i));
				arr_type_split.add(arr_type.get(i));
				arr_mandatory_split.add(arr_mandatory.get(i));
				arr_value_split.add(arr_value.get(i));
			} else if (arr_seqmax.get(i) > seqNum) {
				arr_seqmax_split.add((arr_seqmax.get(i) - 1));
				arr_id_split.add(arr_id.get(i));
				arr_phase_split.add(arr_phase.get(i));
				arr_prj_split.add(arr_prj.get(i));
				arr_options_split.add(arr_options.get(i));
				arr_label_name_split.add(arr_label_name.get(i));
				arr_column_name_split.add(arr_column_name.get(i));
				arr_type_split.add(arr_type.get(i));
				arr_mandatory_split.add(arr_mandatory.get(i));
				arr_value_split.add(arr_value.get(i));
			}
		}
		if(tableName.equals("phase_info"))
		{
		String delete_query = getDelQuery(tableName);
		PreparedStatement st2=con.prepareStatement(delete_query);
		st2.setString(1, id);
		st2.executeUpdate();
		st2.close();
		}
		if(tableName.equals("phase_info_details"))
		{	String delete_query = getDelQuery(tableName);
			PreparedStatement st2 = con.prepareStatement(delete_query);
			st2.executeUpdate();
			st2.close();
		}
		for (int j = 0; j < seqmax - 1; j++) {
			String insert_query = getInsQuery(tableName);
			PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
			preparedStatement1.setInt(1, arr_seqmax_split.get(j));
			preparedStatement1.setString(2, arr_id_split.get(j));
			preparedStatement1.setString(3, arr_phase_split.get(j));
			preparedStatement1.setString(4, arr_prj_split.get(j));
			preparedStatement1.setString(5, arr_options_split.get(j));
			preparedStatement1.setString(6, arr_label_name_split.get(j));
			preparedStatement1.setString(7, arr_column_name_split.get(j));
			preparedStatement1.setString(8, arr_type_split.get(j));
			preparedStatement1.setString(9, arr_mandatory_split.get(j));
			preparedStatement1.setString(10, arr_value_split.get(j));
			preparedStatement1.execute();
			preparedStatement1.close();
		}
		OrderingColumnNameBySeq();
     	deleteStatus=true;
	  }
		catch(Exception e)
		{
			e.printStackTrace();
		}
     return deleteStatus;
	}
	
	public void OrderingColumnNameBySeq()
    {
  	  
  		  try {
  			  if(tableName.equals("phase_info"))
  			  {
     	      String SelectQuery =getQuery(tableName);
     	      PreparedStatement st=con.prepareStatement(SelectQuery);
     	      st.setString(1, id);
     	      ResultSet rs = st.executeQuery();
     	      String startStr = "phaseAddInfo";
     	      while(rs.next())
     	      {
     	    	  if(rs.getString("column_name").startsWith("phaseAddInfo"))
     	    	  {
     	    		  String seqnum = rs.getString("seq_no");
     	    		  String column_name = rs.getString("column_name");
     	    		  String append_seq_num=column_name.substring(startStr.length(),column_name.length());
     	    		  if(!seqnum.equals(append_seq_num))
     	    		  {
     	    			String updateColumnName = startStr+seqnum;
     	    			String UpdateQuery = getUpdQuery(tableName);  
     	    			PreparedStatement st1 = con.prepareStatement(UpdateQuery);
     	    			st1.setString(1, updateColumnName);
     	    			st1.setString(2, seqnum);
     	    			st1.setString(3, id);
     	    			st1.execute();
     	    			st1.close();

     	    		  }
     	    	  }
     	      }
     	      st.close();
     	      rs.close();
  			  }
  			  
  			if(tableName.equals("phase_info_details"))
			  {
   	      String SelectQuery =getQuery(tableName);
   	      PreparedStatement st=con.prepareStatement(SelectQuery);
   	      ResultSet rs = st.executeQuery();
   	      String startStr = "phaseAddInfo";
   	      while(rs.next())
   	      {
   	    	  if(rs.getString("column_name").startsWith("phaseAddInfo"))
   	    	  {
   	    		  String seqnum = rs.getString("seq_no");
   	    		  String column_name = rs.getString("column_name");
   	    		  String append_seq_num=column_name.substring(startStr.length(),column_name.length());
   	    		  if(!seqnum.equals(append_seq_num))
   	    		  {
   	    			String updateColumnName = startStr+seqnum;
   	    			String UpdateQuery = getUpdQuery(tableName);  
   	    			PreparedStatement st1 = con.prepareStatement(UpdateQuery);
   	    			st1.setString(1, updateColumnName);
   	    			st1.setString(2, seqnum);
   	    			st1.execute();
   	    			st1.close();

   	    		  }
   	    	  }
   	      }
   	      st.close();
   	      rs.close();
			  }
  			  
  			  
  	  }
  	  catch(Exception e)
  	  {
  		  e.printStackTrace();
  		  System.out.println("Exception-----------[info]-------"+e);
  	  }
    }
	protected void finalize() throws Throwable {
	 con.close();
	 System.out.println("Db connection closed.");
	}
}

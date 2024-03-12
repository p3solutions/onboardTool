package ArchiveExecutionModule.ArchiveExecutionDetails.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.cj.protocol.Resultset;

import onboard.DBconnection;
import logger.System;
public class ArchiveExecutionDetailService {
    String oppname;
    String lvl="1";
    DBconnection dBconnection =null;
        Connection con = null;
    public ArchiveExecutionDetailService() throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
    }
    public JsonArray archiveExecutionDataRetrieve(String Id, String oppName) {
        JsonArray jsonArray = new JsonArray();
        
        try {
        	JsonObject jsonObject= archiveExecutionHearderInfo(Id,oppName); 
            jsonArray.add(jsonObject);
            
            String selectQuery = "select * from Archive_Execution_Info where oppId = ? order by seq_no;";
            PreparedStatement st = con.prepareStatement(selectQuery);
            st.setString(1,Id);
            ResultSet rs = st.executeQuery();
            
            while(rs.next())
            {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("seq_no",rs.getString(1));
                jsonObj.addProperty("oppId",rs.getString(2));
                jsonObj.addProperty("oppName",rs.getString(3));
                jsonObj.addProperty("level",rs.getString(4));
                jsonObj.addProperty("taskId",rs.getString(5));
                jsonObj.addProperty("taskGroup",rs.getString(6));
                jsonObj.addProperty("taskName",rs.getString(7));
                jsonObj.addProperty("taskType",rs.getString(8));
                jsonObj.addProperty("majorDep",rs.getString(9));
                jsonObj.addProperty("assignedTo",rs.getString(10));
                jsonObj.addProperty("planStart",rs.getString(11));
                jsonObj.addProperty("planEnd",rs.getString(12));
                jsonObj.addProperty("actStart",rs.getString(13));
                jsonObj.addProperty("actEnd",rs.getString(14));
                jsonObj.addProperty("completion",rs.getString(15));
                jsonObj.addProperty("status",rs.getString(16));
                jsonObj.addProperty("remark",rs.getString(17));
                jsonArray.add(jsonObj);
            }
            st.close();
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println("Bug"+jsonArray);
        return jsonArray;
    }
    public JsonObject archiveExecutionHearderInfo(String Id,String oppName) throws SQLException {
    	PreparedStatement st=null,sds=null,eds=null,ats=null;
    	ResultSet rs=null,srs=null,ars=null,ers=null;
    	String resultDate = "";
    	String resultDate1 = "";
        JsonArray jsonArray=new JsonArray();
        JsonObject jsonObj = new JsonObject();
        try {
            String selectQuery = "select * from opportunity_info where id = ?;";
            st = con.prepareStatement(selectQuery);
            st.setString(1,Id);
            rs = st.executeQuery();
          
            int pscount=0;
            int pecount=0;
            String sd = "select planSrt from Archive_Execution_Info where oppId = ? and level=? order by seq_no";
            sds = con.prepareStatement(sd);
            sds.setString(1,Id);
            sds.setString(2, lvl);
            srs = sds.executeQuery();
            ArrayList<String> arrDate = new ArrayList<String>();
			ArrayList<Date> arrChildDate = new ArrayList<Date>();

			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");         
         
            String ed = "select planEnd from Archive_Execution_Info where oppId = ? and level=? order by seq_no";
            eds = con.prepareStatement(ed);
            eds.setString(1,Id);
            eds.setString(2,lvl);
            ers = eds.executeQuery();
            ArrayList<String> arrDate1 = new ArrayList<String>();
			ArrayList<Date> arrChildDate1 = new ArrayList<Date>();
           
            String at = "select uname from users";
            ats = con.prepareStatement(at);
            ars = ats.executeQuery();
            while(rs.next()) {
                if((rs.getString("column_name")).equals("apmid"))
                    jsonObj.addProperty("Opp_Id",rs.getString("value"));
                else if((rs.getString("column_name")).equals("appName"))
                    jsonObj.addProperty("appName",rs.getString("value"));
            }
            while(srs.next())
            {
            	pscount++;
            	String s=srs.getString("plansrt");
            	arrDate.add(s);
                
            }
            
            System.out.println("lvl count : "+pscount);
            System.out.println("Array count : "+arrDate);
            for(int i = pscount-1; i >= 0; i--) {
            if(!arrDate.get(i).equals(""))
				arrChildDate.add(simpleDateFormat.parse(arrDate.get(i)));
		}
            System.out.println("Child Array Count : "+arrChildDate);
            if(!arrChildDate.isEmpty()) {
				Date minDate = Collections.min(arrChildDate);
				resultDate = simpleDateFormat.format(minDate);

				System.out.println("Minimum Date : "+simpleDateFormat.format(minDate));
			}
            jsonObj.addProperty("startDate",resultDate);
            jsonArray.add(jsonObj);
            while(ers.next())
            {
            	pecount++;
            	String s1=ers.getString("planEnd");
            	arrDate1.add(s1);
                
        }
            System.out.println("lvl count : "+pecount);
            System.out.println("Array count : "+arrDate1);
            for(int i = pecount-1; i >= 0; i--) {
            if(!arrDate1.get(i).equals(""))
				arrChildDate1.add(simpleDateFormat.parse(arrDate1.get(i)));
		}
            System.out.println("Child Array Count : "+arrChildDate1);
            if(!arrChildDate1.isEmpty()) {
				Date maxDate = Collections.max(arrChildDate1);
				resultDate1 = simpleDateFormat.format(maxDate);

				System.out.println("Maximum Date : "+simpleDateFormat.format(maxDate));
			}

            jsonObj.addProperty("endDate",resultDate1);
            jsonArray.add(jsonObj);
            JsonArray jsonArrayUsers = new JsonArray();
            JsonObject jsonObjectUsers = new JsonObject();
            int c=0;
            String str= "Select";
           while(ars.next())
           {
				/* jsonObj.addProperty("user"+c,ars.getString("uname")); */
				/* jsonArrayUsers.add(ars.getString("uname")); */
        	   str = str+","+ars.getString("uname") ;
               System.out.println("H"+jsonObjectUsers);
               System.out.println("User Array "+ jsonArrayUsers);
               c++;
       }
		/* jsonArray.add(jsonObjectUsers); */
		/* jsonObj.put("user",(Object)jsonArrayUsers); */
           
           //System.out.println("User List "+ jsonArrayUsers.toString());
           jsonObj.addProperty("user",str);
       
            
		
        }
        
        
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
        	st.close();
        	sds.close();
        	eds.close();
        	ats.close();
        	rs.close();
        	srs.close();
        	ers.close();
        	ars.close();
        	       	
        }
        return jsonObj;
    }
    

	
    protected void finalize() throws Throwable 
    { 
        System.out.println("Db connection closed.");
        con.close();
    }
}
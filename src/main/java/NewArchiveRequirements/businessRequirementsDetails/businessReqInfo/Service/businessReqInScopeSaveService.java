package NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class businessReqInScopeSaveService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	String projname;
	JsonArray jsonArray ;
	public businessReqInScopeSaveService(String Id,String projname,JsonArray jsonArray) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.projname = projname;
		 this.jsonArray = jsonArray;
	}

	public JsonObject businessReqinscopeSave()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{	boolean statusFlag =false;
			
				JsonObject jsonObj = jsonArray.get(0).getAsJsonObject();
		  		String yes_value = jsonObj.get("Yes/Y").getAsString();
		  		String no_value =  jsonObj.get("No/N").getAsString();
		  		
		  		updatebusinessreq( "Yes/Y",  yes_value);
		  		updatebusinessreq( "No/N",  no_value);
	          statusFlag =true;
			
			jsonObject.addProperty("SaveStatus", statusFlag);
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
		
	}
	private void updatebusinessreq(String columnname, String value) {
		
		try {
			String UpdateQuery = "update BusinessReqinscope_Info set description=?  where OppId=? and req_in_scope=?";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, value);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, columnname);
	          prestmt.execute();
	          prestmt.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
	protected void finalize() throws Throwable {
      con.close();
	}

}

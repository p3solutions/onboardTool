package NewArchiveRequirements.LegacyApplicationInfo.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;
import java.sql.PreparedStatement;

import onboard.DBconnection;
import logger.System;

public class archiveLegacyAppInfoSaveService {

	public JsonArray jsonArray = new JsonArray();
	DBconnection dBconnection;
	Connection con;
	public String Id = null;
	public String oppName = null;
	public archiveLegacyAppInfoSaveService(String Id,JsonArray jsonArray, String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
		 this.oppName = oppName;
	}
	 
	public boolean save()
	{
		boolean statusFlag =  false;
		try
		{
			for(int i=0;i<jsonArray.size();i++)
			 {
			JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
			String name = jsonObj.get("Name").getAsString();
			String value = jsonObj.get("Value").getAsString();
			String SelectQuery = "select * from archivereq_legacyapp_info where id =? and column_name=?;";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, Id);
			st.setString(2, name);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				String UpdateQuery = "update archivereq_legacyapp_info set value=?, app_name = ? where id =? and column_name =?";
				 PreparedStatement st1 = con.prepareStatement(UpdateQuery);
		          st1.setString(1, value);
		          st1.setString(2, oppName);
		          st1.setString(3, Id);
		          st1.setString(4, name);
		          st1.execute();
			      st1.close();
			  }
			rs.close();
			st.close();
			}
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
		System.out.println("Db connection closed");
	}

}

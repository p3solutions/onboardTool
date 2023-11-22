package NewArchiveRequirements.LegacyApplicationInfo.ArchiveEnvironmentInfo.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class archiveEnvironmentSaveService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray;
	String tableName;
	String columnSuffix;
	static String qry;
	public archiveEnvironmentSaveService(String Id, JsonArray jsonArray, String tableName)
			throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.jsonArray = jsonArray;
		this.tableName = tableName;
		columnSuffix = getColumnSuffix(tableName);
	}

	private String getColumnSuffix(String tableName) {
		return ((tableName.equals("archive_environment_name_info")) ? "Name"
				: (tableName.equals("archive_environment_serverip_info") ? "ServerIp" : ""));
	}
	public static String getUpdQuery(String tableName)
	{
		switch(tableName)
		{
		case "archive_environment_name_info":
			qry= "update archive_environment_name_info set devName=?, testName=?, stageName=?, prodName=? where OppId=? and seq_no=?";
			break;
		case "archive_environment_serverip_info":
			qry="update archive_environment_serverip_info set devServerIp=?, testServerIp=?, stageServerIp=?, prodServerIp=? where OppId=? and seq_no=?";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	public JsonObject archiveEnvironmentSave() {
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag = false;
		try {

			for (int i = 0; i < jsonArray.size(); i++) {
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
				String seqNum = jsonObj.get("seq_no").getAsString();
				String dev = jsonObj.get("dev").getAsString();
				String test = jsonObj.get("test").getAsString();
				String stage = jsonObj.get("stage").getAsString();
				String prod = jsonObj.get("prod").getAsString();

				String UpdateQuery = getUpdQuery(tableName);
				PreparedStatement st = con.prepareStatement(UpdateQuery);
				st.setString(1, dev);
		        st.setString(2, test);
		        st.setString(3, stage);
		        st.setString(4, prod);
				st.setString(5, Id);
				st.setString(6, seqNum);
				st.execute();
				
				/*
				 * PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
				 * prestmt.setString(1, dev); prestmt.setString(2, test); prestmt.setString(3,
				 * stage); prestmt.setString(4, prod); prestmt.execute();
				 */
				 
			}
			statusFlag = true;

		}

		catch (Exception e) {
			statusFlag = false;
			e.printStackTrace();
		}
		jsonObject.addProperty("SaveStatus", statusFlag);
		return jsonObject;

	}

	protected void finalize() throws Throwable {
		con.close();
	}

}

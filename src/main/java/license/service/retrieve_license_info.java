package license.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;
import org.json.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class retrieve_license_info {
	public JsonArray retrieve_license_details() {
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonArray jsonArray = new JsonArray();
		try {
			String lic_info="";
			//String random_id = generateRandomApprovalId();
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
			EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
			config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
			config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
			encryptor.setConfig(config);
			encryptor.setKeyObtentionIterations(1000);
			String selectQuery = "select license_info from license ORDER BY id DESC LIMIT 1";
			st = connection.prepareStatement(selectQuery);
			rs = st.executeQuery();
			if(rs.next())
			{
				lic_info=rs.getString("license_info");
			}
			String enc=encryptor.decrypt(lic_info);
			JSONObject jsonObj = new JSONObject(enc.toString());
			String issue_date=jsonObj.getString("Issue Date");
			String issue_to=jsonObj.getString("Issue To");
			String valid_till=jsonObj.getString("Valid Till");
			JsonObject jsonObj1 = new JsonObject();
			jsonObj1.addProperty("issue_to",issue_to);
			jsonObj1.addProperty("issue_date",issue_date);
			jsonObj1.addProperty("valid_till", valid_till);
			jsonArray.add(jsonObj1);
			st.close();
			rs.close();

		}
		catch(Exception e)
		{
			System.out.println("Execption Occurs");
		}
		System.out.println("JSON"+jsonArray);
		return jsonArray;
	}
}
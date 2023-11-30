package FinanceDetails.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class FinanceDetailsValidationService {



public static JsonObject TableDetailValidation(String AppName,JsonArray jsonArray,boolean checkMandatory)
	{
	PreparedStatement st=null,st1=null;
	ResultSet rs=null,rs1=null;
	JsonObject jsonObject = new JsonObject();
	try
	{String Name=AppName;
		boolean checkExistance=false;
		boolean checkAppName = false;
		DBconnection dBconnection = new DBconnection();
		System.out.println("Connected to Validation Service");
		Connection connection = (Connection) dBconnection.getConnection();
		String ToFetchId = "SELECT Id FROM Finance_Informations WHERE COLUMN_NAME = 'appName' and value='"+Name+"';";
		st1 = connection.prepareStatement(ToFetchId);
		rs1 = st.executeQuery();
		String Id=null;
		if(rs1.next()) {
			Id=rs1.getNString(Id);
		System.out.println("Id value"+Id);
		}
		
		String CheckQueryExist = "SELECT * FROM Finance_Informations WHERE COLUMN_NAME = 'appName';";
		st = connection.prepareStatement(CheckQueryExist);
		rs = st.executeQuery();
		while(rs.next()) {
			if(rs.getString("value").equals(AppName))
				
			{
				checkExistance =true;
				
			}
		}
		String CheckQueryAppName = "SELECT * FROM Opportunity_info WHERE COLUMN_NAME = 'appName';";
		st1 = connection.prepareStatement(CheckQueryAppName);
		rs1 = st1.executeQuery();
		while(rs1.next()) {
			if(rs1.getString("value").equals(AppName))
				
			{
				checkAppName =true;
				
			}
		}
		jsonObject.addProperty("Details_VALIDATION",checkExistance);
		jsonObject.addProperty("AppName_VALIDATION",checkAppName);
		
		if(checkMandatory==true &&checkExistance==false&&  checkAppName == true)
			
		{
			
			FinanceDetailsValidationService.UpdatedDetailsSave(jsonArray,Id);
			
		
				
				}
			
		
		st.close();
		st.close();
		st1.close();
		rs1.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println("Exception----------[info]--------"+e);
	}
	return jsonObject;
}
	public static void UpdatedDetailsSave(JsonArray jsonArr,String id) {
		try {

			DBconnection con = new DBconnection();
			Connection connection = (Connection) con.getConnection();

			for(int i=0;i<jsonArr.size();i++)
			{
				JsonObject jsonObj = jsonArr.get(i).getAsJsonObject();
				String name = jsonObj.get("Name").getAsString();
				String value = jsonObj.get("Value").getAsString();
				String SelectQuery = "select * from Finance_Informations where id =? and column_name=?;";
				PreparedStatement st = connection.prepareStatement(SelectQuery);
				st.setString(1, id);
				st.setString(2, name);
				ResultSet rs = st.executeQuery();
				
				if(rs.next())
				{
					String UpdateQuery = "update Finance_Informations set value=? where id =? and column_name =?";
					System.out.println("2");
					PreparedStatement st1 = connection.prepareStatement(UpdateQuery);
					st1.setString(1, value);
					st1.setString(2, id);
					st1.setString(3, name);
					st1.executeUpdate();					
				

				}
			}
			connection.close();

		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception----------[info]--------"+e);
		}}
	}
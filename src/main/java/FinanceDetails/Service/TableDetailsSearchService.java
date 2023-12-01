package FinanceDetails.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class TableDetailsSearchService {

    public JsonObject columnname() throws SQLException{
        JsonArray jsonArray = new JsonArray();

        try {
        	DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected now...");

            String query = "DESC FinanceDetails ";
            
            try (PreparedStatement st = connection.prepareStatement(query);
                 ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    JsonObject jsonObj = new JsonObject();
                    jsonObj.addProperty("Field", rs.getString(1));
                    jsonArray.add(jsonObj);
                }
                rs.close();
                st.close();
            } 

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        JsonObject result = new JsonObject();
        result.add("data", jsonArray);

        System.out.println("JSON Service Pagination: " + result);
        return result;
    }

	public static JsonObject fetchData(String page, String maxRows, String searchValue, String columnName) throws SQLException {
		PreparedStatement st = null, st1 =null;
        ResultSet rs = null, rs1 = null;
        int totalCount = 0;
        int Page = Integer.parseInt(page);
        int MaxRows = Integer.parseInt(maxRows);
        JsonArray jsonArray = new JsonArray();
     
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            
            int start = (Page - 1) * MaxRows;
            
            String query = "SELECT * FROM decom3sixtytool.FinanceDetails where "+columnName+" like ? LIMIT ?,?;";
            st = connection.prepareStatement(query);
            st.setString(1, "%"+searchValue+"%");
            st.setInt(2, start);
            st.setInt(3, MaxRows);
            rs = st.executeQuery();

            while (rs.next()) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("Project_Number",rs.getString(1));
                jsonObj.addProperty("Phase",rs.getString(2));
                jsonObj.addProperty("Application_Name",rs.getString(3));
                jsonObj.addProperty("Software_and_Licensing",rs.getString(4));
                jsonObj.addProperty("Contract_Date",rs.getString(5));
                jsonObj.addProperty("scope_of_infrastructure",rs.getString(6));
                jsonObj.addProperty("InfraStructure_Cost_Savings",rs.getString(7));
                jsonObj.addProperty("Cost_Avoidance",rs.getString(8));
                jsonObj.addProperty("Cost_of_Archive",rs.getString(9));
                jsonObj.addProperty("CBA",rs.getString(10));
                
                jsonObj.addProperty("Funding_approval",rs.getString(11));
                jsonObj.addProperty("Funding_type",rs.getString(12));
                jsonObj.addProperty("Status",rs.getString(13));
                jsonObj.addProperty("Id",rs.getString(14));
               
                jsonArray.add(jsonObj);
            }
          
            String countQuery = "SELECT COUNT("+columnName+") AS total FROM decom3sixtytool.FinanceDetails Where "+columnName+" Like ?";
            st1 = connection.prepareStatement(countQuery);
            st1.setString(1, "%"+searchValue+"%");
            rs1 = st1.executeQuery();
            if (rs1.next()) {
                totalCount = rs1.getInt("total");
            }
            rs1.close();
            st1.close();
            rs.close();
            st.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);

        System.out.println("JSON Search Service Pagination : " + result);
        return result;
	}

	
	
}

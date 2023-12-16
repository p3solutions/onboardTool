package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import onboard.DBconnection;
public class FinanceDetailsUpdateService {
   
    
    
   
   
    
    
   
	public static JsonObject UpdateDetails( String Id, JsonArray jsonArray, boolean checkMandatory) {
	    Connection connection = null;
	   
	    JsonObject jsonObject = new JsonObject();
	    boolean checkmandatory=checkMandatory;

	    try {
	       
	        
	        DBconnection dBconnection = new DBconnection();
	        System.out.println("Connected to Validation Service");
	        connection = (Connection) dBconnection.getConnection();

	


	        jsonObject.addProperty("Mandatory_Validation",checkmandatory );

	        if (checkMandatory ) {
	        	System.out.println("Hello Boss");
	            FinanceDetailsUpdateService.FinanceDetailsSave(jsonArray,Id);
	        }

	    } catch (Exception mainException) {
	        mainException.printStackTrace();
	        System.out.println("Main Exception: " + mainException);
	    } finally {
	        
	        try {
	            if (connection != null && !connection.isClosed()) {
	                connection.close();
	            }
	        } catch (SQLException mainCloseException) {
	            // Handle main close exception
	            mainCloseException.printStackTrace();
	            System.out.println("Main Close Exception: " + mainCloseException);
	        }
	    }

	    return jsonObject;
	}
    public static void FinanceDetailsSave(JsonArray jsonArray,String Id) throws ClassNotFoundException, SQLException {
        PreparedStatement st = null, st1 = null;
        ResultSet rs = null;
        Connection connection = null;

        try {
            DBconnection con = new DBconnection();
            connection = (Connection) con.getConnection();

            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();

                String name = jsonObj.get("Name").getAsString();
                String value = jsonObj.get("Value").getAsString();
                String SelectQuery = "select * from Finance_Informations where column_name='" + name + "';";

                try {
                    st = connection.prepareStatement(SelectQuery);
                    rs = st.executeQuery();
                    if (rs.next()) {
                        String UpdateQuery = "update Finance_Informations set value='" + value + "' where column_name ='"
                                + name + "'and Id='"+Id+"'";
                        try {
                            st1 = connection.prepareStatement(UpdateQuery);
                            st1.executeUpdate();
                        } catch (SQLException updateException) {
                            // Handle update exception
                            updateException.printStackTrace();
                            System.out.println("Update Exception: " + updateException);
                        } finally {
                            if (st1 != null) st1.close();
                        }
                    }
                } catch (SQLException selectException) {
                    // Handle select exception
                    selectException.printStackTrace();
                    System.out.println("Select Exception: " + selectException);
                } finally {
                    if (rs != null)
						try {
							rs.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                    if (st != null)
						try {
							st.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                }
            }

           
           
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException mainCloseException) {
                // Handle main close exception
                mainCloseException.printStackTrace();
                System.out.println("Main Close Exception: " + mainCloseException);
            }
        }
    }

	
   
}
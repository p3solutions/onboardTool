package FinanceDetails.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class FinanceInputValidationService {

	public static JsonObject InputDetailsValidation(String Id, String AppName, JsonArray jsonArray,
			boolean checkMandatory) {
		Connection connection = null;
		PreparedStatement st = null, st1 = null;
		ResultSet rs = null, rs1 = null;
		JsonObject jsonObject = new JsonObject();
		String App = AppName;
		String id = Id;
		System.out.println("The value Of Id++++++++++" + id);
		try {
			boolean checkExistance = false;
			boolean checkAppName = false;

			DBconnection dBconnection = new DBconnection();
			System.out.println("Connected to Validation Service");
			connection = (Connection) dBconnection.getConnection();

			// Check existence in Finance_Informations table
			String CheckQueryExist = "SELECT * FROM Finance_Informations WHERE COLUMN_NAME = 'appName'and value='" + App
					+ "';";
			try {
				st = connection.prepareStatement(CheckQueryExist);
				rs = st.executeQuery();
				while (rs.next()) {

					checkExistance = true;
				}

			} catch (SQLException existException) {
				// Handle existence check exception
				existException.printStackTrace();
				System.out.println("Existence Check Exception: " + existException);
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (st != null)
						st.close();
				} catch (SQLException closeException) {
					// Handle close exception
					closeException.printStackTrace();
					System.out.println("Close Exception: " + closeException);
				}
			}

			// Check appName in Opportunity_info table
			String CheckQueryAppName = "SELECT * FROM Opportunity_info WHERE COLUMN_NAME = 'appName' and value='" + App
					+ "';";
			try {
				st1 = connection.prepareStatement(CheckQueryAppName);
				rs1 = st1.executeQuery();
				while (rs1.next()) {

					checkAppName = true;
				}

			} catch (SQLException appNameException) {
				// Handle appName check exception
				appNameException.printStackTrace();
				System.out.println("AppName Check Exception: " + appNameException);
			} finally {
				try {
					if (rs1 != null)
						rs1.close();
					if (st1 != null)
						st1.close();
				} catch (SQLException closeException) {
					// Handle close exception
					closeException.printStackTrace();
					System.out.println("Close Exception: " + closeException);
				}
			}

			jsonObject.addProperty("Details_VALIDATION", checkExistance);
			jsonObject.addProperty("AppName_VALIDATION", checkAppName);

			if (checkMandatory && !checkExistance && checkAppName) {
				FinanceInputValidationService.FinanceDetailsSave(Id, jsonArray);
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

	public static void FinanceDetailsSave(String Id, JsonArray jsonArray) {
		PreparedStatement st = null, st1 = null, st2 = null;
		ResultSet rs = null, rs2 = null;
		Connection connection = null;
		String Name = Id;
		System.out.println("The value----------" + Name);
		System.out.println("The value of Array"+jsonArray);
		try {
			DBconnection con = new DBconnection();
			connection = (Connection) con.getConnection();

			for (int i = 0; i < jsonArray.size(); i++) {
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();

				String name = jsonObj.get("Name").getAsString();
				System.out.println("Name value"+name);
				String value = jsonObj.get("Value").getAsString();
				System.out.println(" value"+value);
				String SelectQuery = "select * from Finance_Informations_Details where column_name='" + name + "';";

				try {
					st = connection.prepareStatement(SelectQuery);
					rs = st.executeQuery();
					if (rs.next()) {
						String UpdateQuery = "update Finance_Informations_Details set value='" + value
								+ "'where column_name ='" + name + "'";
						try {
							st1 = connection.prepareStatement(UpdateQuery);
							st1.executeUpdate();
						} catch (SQLException updateException) {
							// Handle update exception
							updateException.printStackTrace();
							System.out.println("Update Exception: " + updateException);
						}
						String UpdateQuery1 = "update Finance_Informations_Details set Id='" + Name
								+ "'where column_name ='" + name + "'";
						try {
							st1 = connection.prepareStatement(UpdateQuery1);
							st1.executeUpdate();
						} catch (SQLException updateException) {
							// Handle update exception
							updateException.printStackTrace();
							System.out.println("Update Exception in Id: " + updateException);
						} finally {
							if (st1 != null)
								st1.close();
						}
					}
				} catch (SQLException selectException) {
					// Handle select exception
					selectException.printStackTrace();
					System.out.println("Select Exception: " + selectException);
				} finally {
					if (rs != null)
						rs.close();
					if (st != null)
						st.close();
				}

			}

			String SelectTableQuery = "select * from Finance_Informations_Details order by seq_no;";

			try {
				st2 = connection.prepareStatement(SelectTableQuery);
				rs2 = st2.executeQuery();

				while (rs2.next()) {
					String Finance_InsertQuery = "insert into Finance_Informations (seq_no,Id, prj_name, app_name, options, label_name, column_name, type, mandatory, value,usermandatoryflag)"
							+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

					try {
						PreparedStatement prestmt = connection.prepareStatement(Finance_InsertQuery);
						prestmt.setInt(1, rs2.getInt("seq_no"));
						prestmt.setString(2, rs2.getString("Id"));
						prestmt.setString(3, rs2.getString("prj_name"));
						prestmt.setString(4, rs2.getString("app_name"));
						prestmt.setString(5, rs2.getString("options"));
						prestmt.setString(6, rs2.getString("label_name"));
						prestmt.setString(7, rs2.getString("column_name"));
						prestmt.setString(8, rs2.getString("type"));
						prestmt.setString(9, rs2.getString("mandatory"));
						prestmt.setString(10, rs2.getString("value"));
						prestmt.setString(11, rs2.getString("usermandatoryflag"));
						prestmt.execute();
					} catch (SQLException insertException) {
						// Handle insert exception
						insertException.printStackTrace();
						System.out.println("Insert Exception: " + insertException);
					}
				}
			} catch (SQLException tableQueryException) {
				// Handle table query exception
				tableQueryException.printStackTrace();
				System.out.println("Table Query Exception: " + tableQueryException);
			} finally {
				try {
					if (rs2 != null)
						rs2.close();
					if (st2 != null)
						st2.close();
				} catch (SQLException closeException) {
					// Handle close exception
					closeException.printStackTrace();
					System.out.println("Close Exception: " + closeException);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception----------[info]--------" + e);
		} finally {
			try {
				if (connection != null)
					connection.close();
			} catch (SQLException mainCloseException) {
				// Handle main close exception
				mainCloseException.printStackTrace();
				System.out.println("Main Close Exception: " + mainCloseException);
			}
		}
	}

}
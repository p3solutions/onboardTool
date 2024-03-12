package IntakeDetails.IntakeAssessment.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class IntakeAssessmentSaveFunctionalityService {

	DBconnection dBconnection = null;

	Connection con = null;

	public static String SectionName;

	public static String SectionTemplateTable;

	public static String SectionInfoTable;

	public static String id;

	public static boolean checkContractInfo;

	public static boolean checkThirdParty;

	public IntakeAssessmentSaveFunctionalityService(String Section, String id)
			throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.id = id;
		SetTableName(Section);
	}

	private void SetTableName(String section) {

		SectionName = section;

		switch (section) {
		case "ComplianceCharacteristics":
			SectionTemplateTable = "assessment_compliance_char_info_template_details";
			SectionInfoTable = "Assessment_Compliance_Char_Info";
			break;

		case "ApplicationInformation":
			SectionTemplateTable = "Assessment_Application_Info_Template_Details";
			SectionInfoTable = "Assessment_Application_Info";
			break;
		case "ContractInformation":
			SectionTemplateTable = "Assessment_Contract_Info_Template_Details";
			SectionInfoTable = "Assessment_Contract_Info";
			break;
		case "DataCharacteristics":
			SectionTemplateTable = "assessment_data_char_info_template_details";
			SectionInfoTable = "assessment_data_char_info";
			break;
		case "ArchivalConsumption":
			SectionTemplateTable = "Assessment_Archival_Consumption_Info_Template_Details";
			SectionInfoTable = "Assessment_Archival_Consumption_Info";
			break;
		}

	}

	public void Save(JsonArray jsonArr, String id) {

		try {
			DBconnection con = new DBconnection();
			Connection connection = (Connection) con.getConnection();
			for (int i = 0; i < jsonArr.size(); i++) {
				JsonObject jsonObj = jsonArr.get(i).getAsJsonObject();
				String name = jsonObj.get("Name").getAsString();
				String value = jsonObj.get("Value").getAsString();

				String SelectQuery = "select * from " + SectionInfoTable + " where id =? and column_name=? and section = ?;";
				PreparedStatement st=connection.prepareStatement(SelectQuery);
				st.setString(1, id);
				st.setString(2, name);
				st.setString(3, SectionName);
				ResultSet rs = st.executeQuery();
				String UpdateQuery = "";
				if (rs.next()) {
					if (SectionInfoTable.equals("Assessment_Archival_Consumption_Info")) {

						if (rs.getString("isCompleted").isEmpty() || rs.getString("isCompleted").equals("No")) {
							UpdateQuery = "update " + SectionInfoTable + " set isCompleted ='No' ,value=? where id =? and column_name =? and section = ?;";

						} else {
							UpdateQuery = "update " + SectionInfoTable + " set isCompleted ='Yes' ,value=? where id =? and column_name =? and section = ?;";

						}
					} else {
						UpdateQuery = "update " + SectionInfoTable + " set value=? where id =? and column_name =? and section = ?;";

					}
					PreparedStatement st1=connection.prepareStatement(UpdateQuery);
					st1.setString(1, value);
					st1.setString(2, id);
					st1.setString(3, name);
					st1.setString(4, SectionName);
					st1.execute();
				}
			}
			connection.close();

		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception----------[info]--------" + e);
		}

	}

}
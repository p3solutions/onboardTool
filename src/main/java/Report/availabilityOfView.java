package Report;

import onboard.DBconnection;

import java.sql.*;

public class availabilityOfView {
    private DBconnection dBconnection;
    private Connection connection;
    public availabilityOfView() throws SQLException, ClassNotFoundException {
        try {
            dBconnection = new DBconnection();
            connection = (Connection) dBconnection.getConnection();
            Report();
        } finally {
            // Close the connection in a finally block to ensure it's always closed
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("DB connection is closed");
            }
        }
    }
    private void Report() throws SQLException {
        String[] reportNames = {"applicationdataview1", "applicationdataview2", "applicationdataview3"};

        for (String reportName : reportNames) {
            boolean flag = ReportAvailability(reportName);
            if (!flag) {
                System.out.println("Viewing " + reportName);
                ReportView(reportName);
            } else {
                System.out.println(reportName + " is already available");
            }
        }
    }
    private boolean ReportAvailability(String ReportName) throws SQLException {
        boolean flag = false;
        String viewName = ReportName;
        String schemaName = "decom3sixtytool";

        String sql = "SELECT COUNT(*) as view_count FROM information_schema.views WHERE table_name = ? AND table_schema = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, viewName);
        statement.setString(2, schemaName);
        ResultSet resultSet = statement.executeQuery(sql);
        if (resultSet.next()) {
            int viewCount = resultSet.getInt("view_count");
            if (viewCount > 0) {
                System.out.println("<===================="+"View " + viewName + " exists in the database."+"===========>");}
        } else {
            System.out.println("<===================="+"View " + viewName + " does not exist in the database."+"====================>");
            System.out.println("<===================="+"Started creating the " + viewName + " in the database."+"====================>");
        }
        return flag;
    }
        public boolean ReportView(String ReportName) throws SQLException {
                String viewName = ReportName;
                String schemaName = "decom3sixtytool";
                switch(viewName){
                    case "Report1":{
                        break;
                    }
                    case "Report2":{
                        break;
                    }
                    case "Report3":{
                        Report3();
                        break;
                    }
                }


            return false;
        }
    private void Report1() throws SQLException {
        String sqlViewCreation =
                "CREATE VIEW ApplicationDataView3 AS " +
                        "SELECT " +
                        "    t1.Id, " +
                        "    MAX(CASE WHEN t1.column_name = 'legacyappname' THEN t1.value END) AS LegacyAppName, " +
                        "    MAX(CASE WHEN t1.column_name = 'srcdb' THEN t1.value END) AS SourcePlatformDatabases, " +
                        "    MAX(CASE WHEN t1.column_name = 'legacyappdesc' THEN t1.value END) AS LegacyAppDescription, " +
                        "    MAX(CASE WHEN t1.column_name = 'readonly' THEN t1.value END) AS readonlydate, " +
                        "    MAX(CASE WHEN t1.column_name = 'onlysrcdata' THEN t1.value END) AS Isapplicationtheonlysourceoftruthforthedata, " +
                        "    MAX(CASE WHEN t1.column_name = 'thirdpartyvendor' THEN t1.value END) AS Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor, " +
                        "    MAX(CASE WHEN t1.column_name = 'totalsize' THEN t1.value END) AS totaldatasize, " +
                        "    MAX(CASE WHEN t2.column_name = 'retentionperiod' THEN t2.value END) AS RetentionPeriod " +
                        "FROM " +
                        "    (SELECT Id, label_name, column_name, value FROM decom3sixtytool.archivereq_legacyapp_info) AS t1 " +
                        "    LEFT JOIN " +
                        "    decom3sixtytool.assessment_compliance_char_info t2 ON " +
                        "    t1.Id = t2.Id " +
                        "GROUP BY " +
                        "    t1.Id;";


        Statement viewStatement = connection.createStatement();
        viewStatement.execute(sqlViewCreation);
    }



    private void Report2() throws SQLException {
        String sqlViewCreation =
                "CREATE VIEW ApplicationDataView3 AS " +
                        "SELECT " +
                        "    t1.Id, " +
                        "    MAX(CASE WHEN t1.column_name = 'legacyappname' THEN t1.value END) AS LegacyAppName, " +
                        "    MAX(CASE WHEN t1.column_name = 'srcdb' THEN t1.value END) AS SourcePlatformDatabases, " +
                        "    MAX(CASE WHEN t1.column_name = 'legacyappdesc' THEN t1.value END) AS LegacyAppDescription, " +
                        "    MAX(CASE WHEN t1.column_name = 'readonly' THEN t1.value END) AS readonlydate, " +
                        "    MAX(CASE WHEN t1.column_name = 'onlysrcdata' THEN t1.value END) AS Isapplicationtheonlysourceoftruthforthedata, " +
                        "    MAX(CASE WHEN t1.column_name = 'thirdpartyvendor' THEN t1.value END) AS Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor, " +
                        "    MAX(CASE WHEN t1.column_name = 'totalsize' THEN t1.value END) AS totaldatasize, " +
                        "    MAX(CASE WHEN t2.column_name = 'retentionperiod' THEN t2.value END) AS RetentionPeriod " +
                        "FROM " +
                        "    (SELECT Id, label_name, column_name, value FROM decom3sixtytool.archivereq_legacyapp_info) AS t1 " +
                        "    LEFT JOIN " +
                        "    decom3sixtytool.assessment_compliance_char_info t2 ON " +
                        "    t1.Id = t2.Id " +
                        "GROUP BY " +
                        "    t1.Id;";


        Statement viewStatement = connection.createStatement();
        viewStatement.execute(sqlViewCreation);
    }





    private void Report3() throws SQLException {
            String sqlViewCreation =
                    "CREATE VIEW ApplicationDataView3 AS " +
                            "SELECT " +
                            "    t1.Id, " +
                            "    MAX(CASE WHEN t1.column_name = 'legacyappname' THEN t1.value END) AS LegacyAppName, " +
                            "    MAX(CASE WHEN t1.column_name = 'srcdb' THEN t1.value END) AS SourcePlatformDatabases, " +
                            "    MAX(CASE WHEN t1.column_name = 'legacyappdesc' THEN t1.value END) AS LegacyAppDescription, " +
                            "    MAX(CASE WHEN t1.column_name = 'readonly' THEN t1.value END) AS readonlydate, " +
                            "    MAX(CASE WHEN t1.column_name = 'onlysrcdata' THEN t1.value END) AS Isapplicationtheonlysourceoftruthforthedata, " +
                            "    MAX(CASE WHEN t1.column_name = 'thirdpartyvendor' THEN t1.value END) AS Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor, " +
                            "    MAX(CASE WHEN t1.column_name = 'totalsize' THEN t1.value END) AS totaldatasize, " +
                            "    MAX(CASE WHEN t2.column_name = 'retentionperiod' THEN t2.value END) AS RetentionPeriod " +
                            "FROM " +
                            "    (SELECT Id, label_name, column_name, value FROM decom3sixtytool.archivereq_legacyapp_info) AS t1 " +
                            "    LEFT JOIN " +
                            "    decom3sixtytool.assessment_compliance_char_info t2 ON " +
                            "    t1.Id = t2.Id " +
                            "GROUP BY " +
                            "    t1.Id;";


            Statement viewStatement = connection.createStatement();
            viewStatement.execute(sqlViewCreation);
        }


    }




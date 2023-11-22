package Report;

import onboard.DBconnection;

import java.sql.*;

public class availabilityOfView {

        public boolean Report1View() {
            try {
                String viewName = "applicationdataview1";
                String schemaName = "decom3sixtytool";

                DBconnection dBconnection = new DBconnection();
                Connection connection = (Connection) dBconnection.getConnection();

                // Check if the view exists
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

                // Close resources
                resultSet.close();
                statement.close();
                connection.close();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            return false;
        }


    public boolean Report2View() {
        boolean viewExists = false;
        try {
            String viewName = "applicationdataview2";
            String schemaName = "decom3sixtytool";
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();

            // Check if the view exists
            String sql = "SELECT COUNT(*) as view_count FROM information_schema.views WHERE table_name ='"+ viewName +"'AND table_schema ='"+ schemaName +"'";
            PreparedStatement statement = connection.prepareStatement(sql);


            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                int viewCount = resultSet.getInt("view_count");
                if (viewCount > 0) {
                    System.out.println("<====================" + "View " + viewName + " exists in the database." + "===========>");
                    viewExists = true;
                }
                else {
                    System.out.println("<====================" + "View " + viewName + " does not exist in the database." + "====================>");
                    System.out.println("<====================" + "Started creating the " + viewName + " in the database." + "====================>");
                    //"use decom3sixtytool; " +
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
                    // to check whether the view is created

                    ResultSet resultSet1 = statement.executeQuery(sql);
                    if (resultSet1.next()) {
                        int viewCount1 = resultSet.getInt("view_count");
                        if (viewCount1 > 0) {
                            System.out.println("<====================" + "View " + viewName + " exists in the database." + "===========>");
                            viewExists = true;
                        }

                    } else {
                        System.out.println("<====================" + "View " + viewName + " does not exist in the database." + "====================>");
                        System.out.println("<====================" + " Error in the database view creation " + "====================>");
                        viewExists =false;
                    }

                }
            }


            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return viewExists;
    }



    public boolean Report3View() {
        boolean viewExists = false;
        try {
            String viewName = "applicationdataview3";
            String schemaName = "decom3sixtytool";
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();

            // Check if the view exists
            String sql = "SELECT COUNT(*) as view_count FROM information_schema.views WHERE table_name ='"+ viewName +"'AND table_schema ='"+ schemaName +"'";
            PreparedStatement statement = connection.prepareStatement(sql);


            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                int viewCount = resultSet.getInt("view_count");
                if (viewCount > 0) {
                    System.out.println("<====================" + "View " + viewName + " exists in the database." + "===========>");
                    viewExists = true;
                }
                else {
                    System.out.println("<====================" + "View " + viewName + " does not exist in the database." + "====================>");
                    System.out.println("<====================" + "Started creating the " + viewName + " in the database." + "====================>");
                    //"use decom3sixtytool; " +
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
                    // to check whether the view is created

                    ResultSet resultSet1 = statement.executeQuery(sql);
                    if (resultSet1.next()) {
                        int viewCount1 = resultSet.getInt("view_count");
                        if (viewCount1 > 0) {
                            System.out.println("<====================" + "View " + viewName + " exists in the database." + "===========>");
                            viewExists = true;
                        }

                    } else {
                        System.out.println("<====================" + "View " + viewName + " does not exist in the database." + "====================>");
                        System.out.println("<====================" + " Error in the database view creation " + "====================>");
                        viewExists =false;
                    }

                }
            }


            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return viewExists;
    }


    }




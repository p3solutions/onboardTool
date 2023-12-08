package Report;

import onboard.DBconnection;

import java.sql.*;

public class availabilityOfView {
    private DBconnection dBconnection;
    private Connection connection;
    public void checkAvailabilityOfView() throws SQLException, ClassNotFoundException {
        try {
            dBconnection = new DBconnection();
            connection = (Connection) dBconnection.getConnection();
            viewCheck();
        } finally {
            // Close the connection in a final block to ensure it's always closed
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("DB connection is closed");
            }
        }
    }
    private void viewCheck() throws SQLException {
        String[] viewNames = {"applicationdataview1", "applicationdataview2", "applicationdataview3","financelist", "phase"};

        for (String viewName : viewNames) {
            boolean flag = viewAvailability(viewName);
            if (!flag) {
                System.out.println("Viewing " + viewName);
                viewCreation(viewName);
            } else {
                System.out.println(viewName + " is already available");
            }
        }
    }
    private boolean viewAvailability(String viewName) {
        boolean flag = false;
        String schemaName = "decom3sixtytool";

        String sql = "SELECT COUNT(*) as view_count FROM information_schema.views WHERE table_name = ? AND table_schema = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, viewName);
            statement.setString(2, schemaName);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int viewCount = resultSet.getInt("view_count");
                    if (viewCount > 0) {
                        flag = true;
                        System.out.println("<====================" + "View " + viewName + " exists in the database." + "===========>");
                    }
                } else {
                    flag = false;
                    System.out.println("<====================" + "View " + viewName + " does not exist in the database." + "====================>");
                    System.out.println("<====================" + "Started creating the " + viewName + " in the database." + "====================>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

        public void viewCreation(String viewName) throws SQLException {
                switch(viewName){
                    case "applicationdataview1":{
                        Report1();
                        break;
                    }
                    case "applicationdataview2":{
                        Report2();
                        break;
                    }
                    case "applicationdataview3":{
                        Report3();
                        break;
                    }
                    case "financelist":{
                      financeListview();
                        break;
                    }
                    case "phase":{
                        phaseStatusView();
                        break;
                    }
                }
        }
    private void Report1() throws SQLException {
        String sqlViewCreation = "CREATE VIEW applicationdataview1 AS " +
                "WITH OpportunityInfo AS (" +
                "    SELECT" +
                "        Id," +
                "        MAX(CASE WHEN column_name = 'appName' THEN value END) AS Application_Name" +
                "    FROM opportunity_info" +
                "    WHERE column_name IN ('appName')" +
                "    GROUP BY Id" +
                ")," +
                "ApplicationStatus AS (" +
                "    SELECT" +
                "        o.Id," +
                "        MAX(CASE" +
                "            WHEN (CASE WHEN i.isCompleted = 'Yes' AND i.intakeApproval = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Intake'" +
                "            WHEN (CASE WHEN a.mail_flag = 'true' AND a.intakeApproval = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Requirements'" +
                "            ELSE 'Archive Execution'" +
                "        END) as Status" +
                "    FROM opportunity_info o" +
                "    LEFT JOIN Intake_Stake_Holder_Info i ON o.Id = i.OppId" +
                "    LEFT JOIN archivereq_roles_info a ON i.OppId = a.OppId" +
                "    GROUP BY o.Id" +
                ")," +
                "PhaseStatus AS (" +
                "    WITH SeparatedValues AS (" +
                "        SELECT" +
                "            waveName," +
                "            TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(value, ',', n.digit + 1), ',', -1)) AS separatedValue" +
                "        FROM governance_info" +
                "        JOIN (SELECT 0 AS digit UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) AS n" +
                "        ON LENGTH(REPLACE(value, ',', '')) <= LENGTH(value) - n.digit" +
                "        WHERE column_name = 'apps'" +
                "    )" +
                "    SELECT" +
                "        o.Id," +
                "        sv.separatedValue," +
                "        sv.waveName," +
                "        p.phaseName" +
                "    FROM opportunity_info o" +
                "    JOIN SeparatedValues sv ON o.value = sv.separatedValue" +
                "    JOIN phase_info p ON sv.waveName = p.value" +
                "    WHERE o.column_name = 'appname' AND p.column_name = 'waves'" +
                ")" +
                "SELECT" +
                "    COALESCE(o.Id, '') AS \"Application Id Gen\"," +
                "    COALESCE(subquery.Application_Id, '') AS \"Application Id\"," +
                "    COALESCE(o.Application_Name, '') AS \"Application Name\"," +
                "    COALESCE(s.Status, '') AS \"Workflow Status\"," +
                "    COALESCE(phs.phaseName, '') AS \"Phase\"," +
                "    COALESCE(subquery.Creation_Date, '') AS \"Creation Date\"," +
                "    COALESCE(subquery.Status, '') AS \"Status\"," +
                "    COALESCE(subquery.Request_Type, '') AS \"Request Type\"," +
                "    COALESCE(subquery.Requester, '') AS \"Requester\"," +
                "    COALESCE(subquery.Application_Owner, '') AS \"Application Owner\"," +
                "    COALESCE(subquery.Business_Segment, '') AS \"Business Segment\"," +
                "    COALESCE(subquery.Business_Unit, '') AS \"Business Unit\"," +
                "    COALESCE(triage_subquery.Preliminary_CBA, '') AS \"Preliminary CBA\"," +
                "    COALESCE(triage_subquery.Funding_Available, '') AS \"Funding Available\"," +
                "    COALESCE(triage_subquery.Program_Funder, '') AS \"Program Funder\"," +
                "    COALESCE(triage_subquery.Project_Portfolio_Information, '') AS \"Project Portfolio Information\"," +
                "    COALESCE(triage_subquery.Project_Decomission_Date, '') AS \"Project Decomission Date\"," +
                "    COALESCE(triage_subquery.Infrastructure_Impact, '') AS \"Infrastructure Impact\"," +
                "    COALESCE(triage_subquery.Number_of_Infrastructure_Components, '') AS \"Number of Infrastructure Components\"," +
                "    COALESCE(triage_subquery.Archival_Solution, '') AS \"Archival Solution\"," +
                "    COALESCE(triage_subquery.Status_Notes, '') AS \"Status Notes\"," +
                "    COALESCE(triage_subquery.EDR_Analyst, '') AS \"EDR Analyst\"," +
                "    COALESCE(triage_subquery1.Big_Rock, '') AS \"Big Rock\"," +
                "    COALESCE(Readonlydate.Data_Read_only_State, '') AS \"Read Only Date\"" +
                "FROM OpportunityInfo o " +
                " LEFT JOIN ApplicationStatus s ON o.Id = s.Id " +
                "LEFT JOIN PhaseStatus phs ON o.Id = phs.Id " +
                "LEFT JOIN (" +
                "    SELECT" +
                "        assessment_data_char_info.Id AS Id," +
                "        MAX(CASE" +
                "            WHEN assessment_data_char_info.column_name = 'ReadonlyData' THEN assessment_data_char_info.value" +
                "        END) AS ReadonlyData," +
                "        CASE" +
                "            WHEN MAX(CASE WHEN assessment_data_char_info.column_name = 'ReadonlyData' AND assessment_data_char_info.value = 'Yes' THEN 1 ELSE 0 END) = 1" +
                "                THEN MAX(CASE WHEN assessment_data_char_info.column_name = 'LastUpdateMade' THEN assessment_data_char_info.value END)" +
                "            ELSE MAX(CASE WHEN assessment_data_char_info.column_name = 'ExpectedDate' THEN assessment_data_char_info.value END)" +
                "        END AS Data_Read_only_State" +
                "    FROM assessment_data_char_info" +
                "    WHERE (assessment_data_char_info.column_name IN ('ReadonlyData', 'ExpectedDate', 'LastUpdateMade'))" +
                "    GROUP BY Id" +
                ") AS Readonlydate ON o.Id = Readonlydate.Id " +
                "LEFT JOIN (" +
                "    SELECT" +
                "        Id," +
                "        MAX(CASE WHEN column_name = 'apmid' THEN value END) AS Application_Id," +
                "        MAX(CASE WHEN column_name = 'appName' THEN value END) AS Application_Name," +
                "        MAX(CASE WHEN column_name = 'creation_date' THEN value END) AS Creation_Date," +
                "        MAX(CASE WHEN column_name = 'status' THEN value END) AS Status," +
                "        MAX(CASE WHEN column_name = 'request_type' THEN value END) AS Request_Type," +
                "        MAX(CASE WHEN column_name = 'requester' THEN value END) AS Requester," +
                "        MAX(CASE WHEN column_name = 'appowner' THEN value END) AS Application_Owner," +
                "        MAX(CASE WHEN column_name = 'businesssegment' THEN value END) AS Business_Segment," +
                "        MAX(CASE WHEN column_name = 'businessunit' THEN value END) AS Business_Unit" +
                "    FROM opportunity_info" +
                "    GROUP BY Id" +
                ") AS subquery ON o.Id = subquery.Id " +
                "LEFT JOIN (" +
                "    SELECT" +
                "        Id," +
                "        MAX(CASE WHEN column_name = 'Preliminary_CBA' THEN value END) AS Preliminary_CBA," +
                "        MAX(CASE WHEN column_name = 'funding_Avl' THEN value END) AS Funding_Available," +
                "        MAX(CASE WHEN column_name = 'prgFunder' THEN value END) AS Program_Funder," +
                "        MAX(CASE WHEN column_name = 'PrjInfo' THEN value END) AS Project_Portfolio_Information," +
                "        MAX(CASE WHEN column_name = 'Decom_date' THEN value END) AS Project_Decomission_Date," +
                "        MAX(CASE WHEN column_name = 'infrastructure_impact' THEN value END) AS Infrastructure_Impact," +
                "        MAX(CASE WHEN column_name = 'nmbr_of_infrastructure_components' THEN value END) AS Number_of_Infrastructure_Components," +
                "        MAX(CASE WHEN column_name = 'archival_Sol' THEN value END) AS Archival_Solution," +
                "        MAX(CASE WHEN column_name = 'Status' THEN value END) AS Status_Notes," +
                "        MAX(CASE WHEN column_name = 'decomAnalyst' THEN value END) AS EDR_Analyst" +
                "    FROM triage_info" +
                "    GROUP BY Id" +
                ") AS triage_subquery ON o.Id = triage_subquery.Id " +
                "LEFT JOIN (" +
                "    SELECT" +
                "        Id," +
                "        MAX(CASE WHEN column_name = 'BigrockSumm' THEN value END) AS Big_Rock" +
                "    FROM triage_summary_info" +
                "    GROUP BY Id" +
                ") AS triage_subquery1 ON o.Id = triage_subquery1.Id;";


        try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    private void Report2() throws SQLException {
        String sqlViewCreation ="CREATE VIEW ApplicationDataView2 AS " +
                "SELECT " +
                "    COALESCE(op.Application_Name, '') AS \"Application Name\"," +
                "    COALESCE(op.Application_Owner, '') AS \"Application Owner\"," +
                "    COALESCE(op.status, '') AS \"Status\"," +
                "    COALESCE(triage.Project_Portfolio_Information, '') AS \"Project Portfolio Information\"," +
                "    COALESCE(triage.Funding_Available, '') AS \"Funding Available\"," +
                "    COALESCE(assessment.Application_Details, '') AS \"Application Details\"," +
                "    COALESCE(assessment.Target_Date, '') AS \"Target Date\"," +
                "    COALESCE(assessment.Readonly_Date, '') AS \"Readonly Date\"," +
                "    COALESCE(assessment_Data.Database_type, '') AS \"Database type\"," +
                "    COALESCE(assessment_Data.Data_Type_Characteristics, '') AS \"Data Type Characteristics\"," +
                "    COALESCE(assessment_Data.Structured_Data_In_GB, '') AS \"Structured Data In GB\"," +
                "    COALESCE(assessment_Data.Structured_Data_Number_of_tables, '') AS \"Structured Data Number of tables\"," +
                "    COALESCE(assessment_Data.Unstructured_Data_In_GB, '') AS \"Unstructured Data In GB\"," +
                "    COALESCE(assessment_Data.Unstructured_Data_files, '') AS \"Unstructured Data files\"," +
                "    COALESCE(assessment_Data.Database_Server_Name, '') AS \"Database Server Name\"," +
                "    COALESCE(assessment_Data.Database_Name, '') AS \"Database Name\"," +
                "    COALESCE(assessment_Data.Table_Names, '') AS \"Table Names\"," +
                "    COALESCE(assessment_Data.DBA_Contact, '') AS \"DBA Contact\"," +
                "    COALESCE(assessment_archival.Encrytion, '') AS \"Encrytion\"," +
                "    COALESCE(assessment_archival.DataMasking, '') AS \"DataMasking\"," +
                "    COALESCE(phaseStatus.phaseName, '') AS \"Phase\" " +
                " FROM " +
                "    (SELECT Id," +
                "            MAX(CASE WHEN label_name = 'Application Name' THEN value END) AS Application_Name," +
                "            MAX(CASE WHEN label_name = 'Application Owner' THEN value END) AS Application_Owner," +
                "            MAX(CASE WHEN label_name = 'Status' THEN value END) AS status" +
                "     FROM opportunity_info" +
                "     WHERE label_name IN ('Application Name', 'Application Owner', 'status')" +
                "     GROUP BY Id) AS op " +
                " LEFT JOIN " +
                "    (SELECT Id," +
                "            MAX(CASE WHEN label_name = 'Project Portfolio Information' THEN value END) AS Project_Portfolio_Information," +
                "            MAX(CASE WHEN label_name = 'Funding Available' THEN value END) AS Funding_Available" +
                "     FROM triage_info " +
                "     WHERE label_name IN ('Project Portfolio Information', 'Funding Available')" +
                "     GROUP BY Id) AS triage ON op.Id = triage.Id " +
                " LEFT JOIN " +
                "    (SELECT Id," +
                "            MAX(CASE WHEN label_name = 'Application Details' THEN value END) AS Application_Details," +
                "            MAX(CASE WHEN label_name = 'Data Migration complete' THEN value END) AS Target_Date," +
                "            MAX(CASE WHEN label_name = 'Decommission Readiness Date' THEN value END) AS Readonly_Date" +
                "     FROM assessment_application_info " +
                "     WHERE label_name IN ('Application Details', 'Data Migration complete', 'Decommission Readiness Date')" +
                "     GROUP BY Id) AS assessment ON op.Id = assessment.Id " +
                " LEFT JOIN " +
                "    (SELECT Id," +
                "            MAX(CASE WHEN label_name = 'Database type' THEN value END) AS Database_type," +
                "            MAX(CASE WHEN label_name = 'Data Type Characteristics ' THEN value END) AS Data_Type_Characteristics," +
                "            MAX(CASE WHEN label_name = 'Structured Data - Database size of the Application (stated in GB) ' THEN value END) AS Structured_Data_In_GB," +
                "            MAX(CASE WHEN label_name = 'Structured Data - Number of tables (if known) ' THEN value END) AS Structured_Data_Number_of_tables," +
                "            MAX(CASE WHEN label_name = 'Unstructured Data - Volume of data (stated in GB) ' THEN value END) AS Unstructured_Data_In_GB," +
                "            MAX(CASE WHEN label_name = 'Unstructured Data - Number of files (E.g Attachments) ' THEN value END) AS Unstructured_Data_files," +
                "            MAX(CASE WHEN label_name = 'Database Server Name (Data Location) ' THEN value END) AS Database_Server_Name," +
                "            MAX(CASE WHEN label_name = 'Database Names ' THEN value END) AS Database_Name," +
                "            MAX(CASE WHEN label_name = 'Table Names if appropriate ' THEN value END) AS Table_Names," +
                "            MAX(CASE WHEN label_name = 'DBA Contact ' THEN value END) AS DBA_Contact" +
                "     FROM assessment_data_char_info " +
                "     WHERE label_name IN ('Database type', 'Data Type Characteristics ', 'Structured Data - Database size of the Application (stated in GB) ', 'Structured Data - Number of tables (if known) ', 'Unstructured Data - Volume of data (stated in GB) ', 'Unstructured Data - Number of files (E.g Attachments) ', 'Database Server Name (Data Location) ', 'Database Names ', 'Table Names if appropriate ', 'DBA Contact ')" +
                "     GROUP BY Id) AS assessment_Data ON op.Id = assessment_Data.Id" +
                "  LEFT JOIN " +
                "    (SELECT Id," +
                "            MAX(CASE WHEN label_name = 'Encryption?' THEN value END) AS Encrytion," +
                "            MAX(CASE WHEN label_name = 'Data Masking?' THEN value END) AS DataMasking" +
                "     FROM assessment_archival_consumption_info" +
                "     WHERE label_name IN ('Encryption?', 'Data Masking?')" +
                "     GROUP BY Id) AS assessment_archival ON op.Id = assessment_archival.Id " +
                "     LEFT JOIN " +
                "        WITH SeparatedValues AS (" +
                "            SELECT " +
                "                waveName," +
                "                TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(value, ',', n.digit + 1), ',', -1)) AS separatedValue" +
                "            FROM governance_info" +
                "            JOIN (SELECT 0 AS digit UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) AS n" +
                "                ON LENGTH(REPLACE(value, ',' , '')) <= LENGTH(value) - n.digit" +
                "            WHERE column_name = 'apps'" +
                "        )" +
                "        SELECT " +
                "            o.Id," +
                "            sv.separatedValue," +
                "            sv.waveName," +
                "            p.phaseName" +
                "        FROM opportunity_info o" +
                "        JOIN SeparatedValues sv ON o.value = sv.separatedValue" +
                "        JOIN phase_info p ON sv.waveName = p.value" +
                "        WHERE o.column_name = 'appname'" +
                "          AND p.column_name = 'waves'" +
                "    ) AS phaseStatus ON op.Id = phaseStatus.Id;";

         try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private void Report3() throws SQLException {
            String sqlViewCreation =
                   "CREATE VIEW ApplicationDataView3 AS " +
                           "SELECT " +
                           "    t1.Id, " +
                           "    MAX(CASE WHEN t1.column_name = 'legacyappname' THEN t1.value END) AS Application_Name," +
                           "    MAX(CASE WHEN t1.column_name = 'srcdb' THEN t1.value END) AS Source_Platform_Databases," +
                           "    MAX(CASE WHEN t1.column_name = 'legacyappdesc' THEN t1.value END) AS Legacy_App_Description," +
                           "    MAX(CASE WHEN t1.column_name = 'readonly' THEN t1.value END) AS Read_Only_Date," +
                           "    MAX(CASE WHEN t1.column_name = 'onlysrcdata' THEN t1.value END) AS Is_Application_The_Only_Source_Of_Truth_For_The_Data," +
                           "    MAX(CASE WHEN t1.column_name = 'thirdpartyvendor' THEN t1.value END) AS Legacy_Application_Hosted_Internally_Or_With_Third_Party_Vendor," +
                           "    MAX(CASE WHEN t1.column_name = 'totalsize' THEN t1.value END) AS Total_Data_Size," +
                           "    MAX(CASE WHEN t2.column_name = 'retentionperiod' THEN t2.value END) AS Retention_Period " +
                           "FROM " +
                           "    (SELECT Id, label_name, column_name, value FROM decom3sixtytool.archivereq_legacyapp_info) AS t1 " +
                           "LEFT JOIN " +
                           "    decom3sixtytool.assessment_compliance_char_info t2 ON " +
                           "    t1.Id = t2.Id " +
                           "WHERE " +
                           "    t1.Id IS NOT NULL " +
                           "GROUP BY" +
                           "    t1.Id;";


            Statement viewStatement = connection.createStatement();
            viewStatement.execute(sqlViewCreation);
        }

    private void financeListview(){
        String sqlViewCreation = "CREATE VIEW FinanceList AS " +
                "SELECT" +
                "    t1.Id," +
                "    MAX(CASE WHEN t1.column_name = 'financeappname' THEN t1.value END) AS \"Application Name\"," +
                "    MAX(CASE WHEN t1.column_name = 'projnum' THEN t1.value END) AS \"Project Number\"," +
                "    MAX(CASE WHEN t1.column_name = 'phase' THEN t1.value END) AS Phase," +
                "    MAX(CASE WHEN t1.column_name = 'softlicense' THEN t1.value END) AS \"Software and Licensing\"," +
                "    MAX(CASE WHEN t1.column_name = 'softlicensecost' THEN t1.value END) AS \"Software and Licensing(cost Saving)\"," +
                "    MAX(CASE WHEN t1.column_name = 'contractDate' THEN t1.value END) AS \"Contract end date\"," +
                "    MAX(CASE WHEN t1.column_name = 'contractDateComment' THEN t1.value END) AS \"Contract end date -comments\"," +
                "    MAX(CASE WHEN t1.column_name = 'scopeinfra' THEN t1.value END) AS \"Scope of infrastructure\"," +
                "    MAX(CASE WHEN t1.column_name = 'infrastructurecostsavings' THEN t1.value END) AS \"Infrastructure Cost Savings\"," +
                "    MAX(CASE WHEN t1.column_name = 'costavoidance' THEN t1.value END) AS \"Cost Avoidance\"," +
                "    MAX(CASE WHEN t1.column_name = 'costarchive' THEN t1.value END) AS \"Cost Archive\"," +
                "    MAX(CASE WHEN t1.column_name = 'cba' THEN t1.value END) AS \"Total CBA\"," +
                "    MAX(CASE WHEN t1.column_name = 'fundapprove' THEN t1.value END) AS \"Funding approved\"," +
                "    MAX(CASE WHEN t1.column_name = 'fundtype' THEN t1.value END) AS \"Funding Type\"," +
                "    MAX(CASE WHEN t1.column_name = 'status' THEN t1.value END) AS Status," +
                "    MAX(t2.File_Name) AS ScreenshotFileName " +
                "FROM" +
                "    decom3sixtytool.finance_info t1 " +
                "LEFT JOIN" +
                "    decom3sixtytool.finance_application_screenshot t2 ON t1.Id = t2.AppId " +
                "GROUP BY" +
                "    t1.Id " +
                "HAVING" +
                "    TRIM(MAX(CASE WHEN t1.column_name = 'financeappname' THEN t1.value END)) <> '';";
        try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void phaseStatusView() {
        String sqlViewCreation = "CREATE VIEW `phase` AS " +
                "WITH `OpportunityInfo` AS (" +
                "    SELECT" +
                "        `Id`," +
                "        MAX(CASE WHEN `column_name` = 'appName' THEN `value` END) AS `Application_Name`" +
                "    FROM `opportunity_info`" +
                "    WHERE `column_name` IN ('appName')" +
                "    GROUP BY `Id`" +
                "),  " +
                " `ApplicationStatus` AS (" +
                "    SELECT " +
                "        `o`.`Id`," +
                "        MAX(CASE" +
                "            WHEN (CASE WHEN `i`.`isCompleted` = 'Yes' AND `i`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Intake' " +
                "            WHEN (CASE WHEN `a`.`mail_flag`='true' AND `a`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Requirements'" +
                "            ELSE 'Archive Execution'" +
                "        END) as `Status`" +
                "    FROM `opportunity_info` `o`" +
                "    LEFT JOIN `Intake_Stake_Holder_Info` `i` ON `o`.`Id` = `i`.`OppId`" +
                "    LEFT JOIN `archivereq_roles_info` `a` ON `i`.`OppId` = `a`.`OppId`" +
                "    GROUP BY `o`.`Id` " +
                "), " +
                "`PhaseStatus` AS (" +
                "   WITH `SeparatedValues` AS (" +
                "    SELECT " +
                "        `waveName`," +
                "        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`value`, ',', n.digit + 1), ',', -1)) AS `separatedValue`" +
                "    FROM " +
                "        `governance_info`" +
                "    JOIN " +
                "        (SELECT 0 AS digit UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) AS n" +
                "        ON LENGTH(REPLACE(`value`, ',' , '')) <= LENGTH(`value`) - n.digit" +
                "    WHERE " +
                "        `column_name` = 'apps'" +
                ") " +
                "SELECT " +
                "    `o`.`Id`," +
                "    `sv`.`separatedValue`," +
                "    `sv`.`waveName`," +
                "    `p`.`phaseName` " +
                "FROM " +
                "    `opportunity_info` `o` " +
                "JOIN " +
                "    `SeparatedValues` `sv` ON `o`.`value` = `sv`.`separatedValue`" +
                "JOIN " +
                "   `phase_info` `p` ON `sv`.`waveName` = `p`.`value`" +
                "WHERE " +
                "    `o`.`column_name` = 'appname'" +
                "    AND `p`.`column_name` = 'waves'" +
                ")" +
                "SELECT" +
                "    COALESCE(`o`.`Id`, '') AS `Application_Id`," +
                "    COALESCE(`o`.`Application_Name`, '') AS `Application_Name`," +
                "    COALESCE(`s`.`Status`, '') AS `Application_Status`," +
                "    COALESCE(`phs`.`phaseName`, '') AS `Phase_Status` " +
                "FROM `OpportunityInfo` `o` " +
                "LEFT JOIN `ApplicationStatus` `s` ON `o`.`Id` = `s`.`Id` " +
                "LEFT JOIN `PhaseStatus` `phs` ON `o`.`Id` = `phs`.`Id`;    ";

        try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}




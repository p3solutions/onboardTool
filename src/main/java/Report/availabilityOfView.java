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
        String sqlViewCreation ="CREATE VIEW `applicationdataview1` AS " +
                "WITH `OpportunityInfo` AS (" +
                "    SELECT" +
                "        `Id`," +
                "        MAX(CASE WHEN `column_name` = 'appName' THEN `value` END) AS `Application_Name`" +
                "    FROM `decom3sixtytool`.`opportunity_info`" +
                "    WHERE `column_name` IN ('appName')" +
                "    GROUP BY `Id`" +
                "),  " +
                "`ApplicationStatus` AS (" +
                "    SELECT " +
                "        `o`.`Id`," +
                "        MAX(CASE" +
                "            WHEN (CASE WHEN `i`.`isCompleted` = 'Yes' AND `i`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Intake' " +
                "            WHEN (CASE WHEN `a`.`mail_flag`='true' AND `a`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Requirements'" +
                "            ELSE 'Archive Execution'" +
                "        END) as `Status`" +
                "    FROM `decom3sixtytool`.`opportunity_info` `o`" +
                "    LEFT JOIN `decom3sixtytool`.`Intake_Stake_Holder_Info` `i` ON `o`.`Id` = `i`.`OppId`" +
                "    LEFT JOIN `decom3sixtytool`.`archivereq_roles_info` `a` ON `i`.`OppId` = `a`.`OppId`" +
                "    GROUP BY `o`.`Id`" +
                ")," +
                "`PhaseStatus` AS (" +
                "   WITH `SeparatedValues` AS (" +
                "    SELECT " +
                "        `waveName`," +
                "        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`value`, ',', n.digit + 1), ',', -1)) AS `separatedValue`" +
                "    FROM " +
                "        `decom3sixtytool`.`governance_info`" +
                "    JOIN " +
                "        (SELECT 0 AS digit UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) AS n" +
                "        ON LENGTH(REPLACE(`value`, ',' , '')) <= LENGTH(`value`) - n.digit" +
                "    WHERE " +
                "        `column_name` = 'apps'" +
                ")" +
                "SELECT " +
                "    `o`.`Id`," +
                "    `sv`.`separatedValue`," +
                "    `sv`.`waveName`," +
                "    `p`.`phaseName`" +
                "FROM " +
                "    `decom3sixtytool`.`opportunity_info` `o`" +
                "JOIN " +
                "    `SeparatedValues` `sv` ON `o`.`value` = `sv`.`separatedValue`" +
                "JOIN " +
                "    `decom3sixtytool`.`phase_info` `p` ON `sv`.`waveName` = `p`.`value`" +
                "WHERE " +
                "    `o`.`column_name` = 'appname'" +
                "    AND `p`.`column_name` = 'waves'" +
                ")" +
                "SELECT" +
                "    COALESCE(`o`.`Id`, '') AS `Application_Id_Gen`," +
                "    COALESCE(`subquery`.`Application_Id`, '') AS `Application_Id`," +
                "    COALESCE(`o`.`Application_Name`, '') AS `Application_Name`," +
                "    COALESCE(`s`.`Status`, '') AS `Application_Status`," +
                "    COALESCE(`phs`.`phaseName`, '') AS `Phase_Status`," +
                "    COALESCE(`subquery`.`Creation_Date`, '') AS `Creation_Date`," +
                "    COALESCE(`subquery`.`Status`, '') AS `Status_Subquery`," +
                "    COALESCE(`subquery`.`Request_Type`, '') AS `Request_Type`," +
                "    COALESCE(`subquery`.`Requester`, '') AS `Requester`," +
                "    COALESCE(`subquery`.`Application_Owner`, '') AS `Application_Owner`," +
                "    COALESCE(`subquery`.`Business_Segment`, '') AS `Business_Segment`," +
                "    COALESCE(`subquery`.`Business_Unit`, '') AS `Business_Unit`," +
                "    COALESCE(`triage_subquery`.`Preliminary_CBA`, '') AS `Preliminary_CBA`," +
                "    COALESCE(`triage_subquery`.`Funding_Available`, '') AS `Funding_Available`," +
                "    COALESCE(`triage_subquery`.`Program_Funder`, '') AS `Program_Funder`," +
                "    COALESCE(`triage_subquery`.`Project_Portfolio_Information`, '') AS `Project_Portfolio_Information`," +
                "    COALESCE(`triage_subquery`.`Project_Decomission_Date`, '') AS `Project_Decomission_Date`," +
                "    COALESCE(`triage_subquery`.`Infrastructure_Impact`, '') AS `Infrastructure_Impact`," +
                "    COALESCE(`triage_subquery`.`Number_of_Infrastructure_Components`, '') AS `Number_of_Infrastructure_Components`," +
                "    COALESCE(`triage_subquery`.`Archival_Solution`, '') AS `Archival_Solution`," +
                "    COALESCE(`triage_subquery`.`Status_Notes`, '') AS `Status_Notes`," +
                "    COALESCE(`triage_subquery`.`EDR_Analyst`, '') AS `EDR_Analyst`," +
                "    COALESCE(`triage_subquery1`.`Big_Rock`, '') AS `Big_Rock`" +
                "FROM `OpportunityInfo` `o`" +
                "LEFT JOIN `ApplicationStatus` `s` ON `o`.`Id` = `s`.`Id`" +
                "LEFT JOIN `PhaseStatus` `phs` ON `o`.`Id` = `phs`.`Id`" +
                "LEFT JOIN (" +
                "    SELECT" +
                "        `Id`," +
                "        MAX(CASE WHEN `column_name` = 'apmid' THEN `value` END) AS `Application_Id`," +
                "        MAX(CASE WHEN `column_name` = 'appName' THEN `value` END) AS `Application_Name`," +
                "        MAX(CASE WHEN `column_name` = 'creation_date' THEN `value` END) AS `Creation_Date`," +
                "        MAX(CASE WHEN `column_name` = 'status' THEN `value` END) AS `Status`," +
                "        MAX(CASE WHEN `column_name` = 'request_type' THEN `value` END) AS `Request_Type`," +
                "        MAX(CASE WHEN `column_name` = 'requester' THEN `value` END) AS `Requester`," +
                "        MAX(CASE WHEN `column_name` = 'appowner' THEN `value` END) AS `Application_Owner`," +
                "        MAX(CASE WHEN `column_name` = 'businesssegment' THEN `value` END) AS `Business_Segment`," +
                "        MAX(CASE WHEN `column_name` = 'businessunit' THEN `value` END) AS `Business_Unit`" +
                "    FROM `decom3sixtytool`.`opportunity_info`" +
                "    GROUP BY `Id`" +
                ") AS `subquery` ON `o`.`Id` = `subquery`.`Id`" +
                "LEFT JOIN (" +
                "    SELECT" +
                "        `Id`," +
                "        MAX(CASE WHEN `column_name` = 'Preliminary_CBA' THEN `value` END) AS `Preliminary_CBA`," +
                "        MAX(CASE WHEN `column_name` = 'funding_Avl' THEN `value` END) AS `Funding_Available`," +
                "        MAX(CASE WHEN `column_name` = 'prgFunder' THEN `value` END) AS `Program_Funder`," +
                "        MAX(CASE WHEN `column_name` = 'PrjInfo' THEN `value` END) AS `Project_Portfolio_Information`," +
                "        MAX(CASE WHEN `column_name` = 'Decom_date' THEN `value` END) AS `Project_Decomission_Date`," +
                "        MAX(CASE WHEN `column_name` = 'infrastructure_impact' THEN `value` END) AS `Infrastructure_Impact`," +
                "        MAX(CASE WHEN `column_name` = 'nmbr_of_infrastructure_components' THEN `value` END) AS `Number_of_Infrastructure_Components`," +
                "        MAX(CASE WHEN `column_name` = 'archival_Sol' THEN `value` END) AS `Archival_Solution`," +
                "        MAX(CASE WHEN `column_name` = 'Status' THEN `value` END) AS `Status_Notes`," +
                "        MAX(CASE WHEN `column_name` = 'decomAnalyst' THEN `value` END) AS `EDR_Analyst`" +
                "    FROM `decom3sixtytool`.`triage_info`" +
                "    GROUP BY `Id`" +
                ") AS `triage_subquery` ON `o`.`Id` = `triage_subquery`.`Id`" +
                "LEFT JOIN (" +
                "    SELECT" +
                "        `Id`," +
                "        MAX(CASE WHEN `column_name` = 'BigrockSumm' THEN `value` END) AS `Big_Rock`" +
                "    FROM `decom3sixtytool`.`triage_summary_info`" +
                "    GROUP BY `Id`" +
                ") AS `triage_subquery1` ON `o`.`Id` = `triage_subquery1`.`Id`;";


        try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    private void Report2() throws SQLException {
        String sqlViewCreation ="CREATE VIEW decom3sixtytool.ApplicationDataView2 AS " +
                "SELECT" +
                "    op.Id AS Id," +
                "    op.Application_Name AS Application_Name," +
                "    op.Application_Owner AS Application_Owner," +
                "    op.status AS status," +
                "    triage.Project_Portfolio_Information AS Project_Portfolio_Information," +
                "    triage.Funding_Available AS Funding_Available," +
                "    assessment.Application_Details AS Application_Details," +
                "    assessment.Target_Date AS Target_Date," +
                "    assessment.Readonly_Date AS Readonly_Date," +
                "    assessment_data.Database_Type AS  Database_type," +
                "    assessment_data.Data_Type_Characteristics AS Data_Type_Characteristics," +
                "    assessment_data.Structured_Data_Database_size_of_the_Application AS Structured_Data_In_GB," +
                "    assessment_data.Structured_Data_Number_of_tables AS Structured_Data_Number_of_tables," +
                "    assessment_data.Unstructured_Data_Volume_of_data AS Unstructured_Data_In_GB," +
                "    assessment_data.Unstructured_Date_Number_of_files AS Unstructured_Data_files," +
                "    assessment_data.Database_Server_Name AS Database_Server_Name," +
                "    assessment_data.Database_Names AS Database_Names," +
                "    assessment_data.Table_Names_if_appropriate AS Table_Names," +
                "    assessment_data.DBA_Contact AS DBA_Contact," +
                "    Archival_Assesment_data.Encryption AS Encryption," +
                "       Archival_Assesment_data.Data_Masking AS Data_Masking " +
                "FROM" +
                "    (SELECT " +
                "    Id, " +
                "    MAX(CASE WHEN o.column_name = 'appName' THEN o.value END) AS Application_Name," +
                "    MAX(CASE WHEN o.column_name = 'appowner' THEN o.value END) AS Application_Owner, " +
                "    MAX(CASE WHEN o.column_name = 'status' THEN o.value END) AS status" +
                "     FROM  (SELECT Id, column_name, value FROM decom3sixtytool.opportunity_info b" +
                "    ) AS o" +
                "    GROUP BY o.Id" +
                "    ) AS op " +
                "LEFT JOIN" +
                "    (SELECT " +
                "    Id, " +
                "    MAX(CASE WHEN t.column_name = 'PrjInfo' THEN t.value END) AS Project_Portfolio_Information," +
                "    MAX(CASE WHEN t.column_name = 'funding_Avl' THEN t.value END) AS Funding_Available" +
                "     FROM (SELECT Id, column_name, value FROM decom3sixtytool.triage_info" +
                "    ) AS t" +
                "    GROUP BY t.Id" +
                "     ) AS triage ON op.Id = triage.Id " +
                "LEFT JOIN" +
                "    (SELECT Id," +
                "    MAX(CASE WHEN aai.column_name = 'AppDetails' THEN aai.value END) AS Application_Details," +
                "    MAX(CASE WHEN aai.column_name = 'DataMigrationComplete' THEN aai.value END) AS Target_Date," +
                "MAX(CASE WHEN aai.column_name = 'DecomReadiness' THEN aai.value END) AS Readonly_Date" +
                "     FROM (SELECT Id, column_name, value FROM decom3sixtytool.assessment_application_info" +
                "     ) AS aai" +
                "     GROUP BY aai.Id" +
                "     ) AS assessment ON triage.Id = assessment.Id " +
                "LEFT JOIN" +
                "    (SELECT Id," +
                "    MAX(CASE WHEN adci.column_name = 'DatabaseType' THEN adci.value END) AS Database_Type," +
                "    MAX(CASE WHEN adci.column_name = 'DataTypeCharacteristics' THEN adci.value END) AS Data_Type_Characteristics," +
                "MAX(CASE WHEN adci.column_name = 'StrucDBsize' THEN adci.value END) AS Structured_Data_Database_size_of_the_Application," +
                "    MAX(CASE WHEN adci.column_name = 'StrucNoofTables' THEN adci.value END) AS Structured_Data_Number_of_tables," +
                "    MAX(CASE WHEN adci.column_name = 'UnstrucDataVolume' THEN adci.value END) AS Unstructured_Data_Volume_of_data," +
                "MAX(CASE WHEN adci.column_name = 'UnstrucNoofFiles' THEN adci.value END) AS Unstructured_Date_Number_of_files," +
                "    MAX(CASE WHEN adci.column_name = 'DBServerName' THEN adci.value END) AS Database_Server_Name," +
                "    MAX(CASE WHEN adci.column_name = 'DBNames' THEN adci.value END) AS Database_Names," +
                "MAX(CASE WHEN adci.column_name = 'TableNames' THEN adci.value END) AS Table_Names_if_appropriate," +
                "    MAX(CASE WHEN adci.column_name = 'DBAContact' THEN adci.value END) AS DBA_Contact" +
                "     FROM (SELECT Id, column_name, value FROM decom3sixtytool.assessment_data_char_info" +
                "     ) AS adci" +
                "     GROUP BY adci.Id" +
                "     ) AS assessment_data ON assessment.Id = assessment_data.Id" +
                "     LEFT JOIN " +
                "     (SELECT Id," +
                "   MAX(CASE WHEN aaci.column_name = 'enc' THEN aaci.value END) AS Encryption," +
                "  MAX(CASE WHEN aaci.column_name = 'datamask' THEN aaci.value END) AS Data_Masking" +
                "        FROM (SELECT Id, column_name, value FROM decom3sixtytool.assessment_archival_consumption_info" +
                "        ) AS aaci" +
                "        GROUP BY aaci.Id" +
                "        ) AS  Archival_Assesment_data ON assessment_data.Id = Archival_Assesment_data.Id;";


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

    private void financeListview(){
        String sqlViewCreation = "CREATE VIEW FinanceList AS " +
                "SELECT" +
                "    t1.Id," +
                "    MAX(CASE WHEN t1.column_name = 'financeappname' THEN t1.value END) AS financeAppName," +
                "    MAX(CASE WHEN t1.column_name = 'softlicense' THEN t1.value END) AS SoftLicense," +
                "    MAX(CASE WHEN t1.column_name = 'contractDate' THEN t1.value END) AS ContractDate," +
                "    MAX(CASE WHEN t1.column_name = 'scopeinfra' THEN t1.value END) AS ScopeInfra," +
                "    MAX(CASE WHEN t1.column_name = 'costavoidance' THEN t1.value END) AS CostAvoidance," +
                "    MAX(CASE WHEN t1.column_name = 'costarchive' THEN t1.value END) AS CostArchive," +
                "    MAX(CASE WHEN t1.column_name = 'cba' THEN t1.value END) AS CBA," +
                "    MAX(CASE WHEN t1.column_name = 'archivetarget' THEN t1.value END) AS ArchiveTarget," +
                "    MAX(CASE WHEN t1.column_name = 'fundapprove' THEN t1.value END) AS FundApprove," +
                "    MAX(CASE WHEN t1.column_name = 'fundtype' THEN t1.value END) AS FundType," +
                "    MAX(CASE WHEN t1.column_name = 'projnum' THEN t1.value END) AS ProjectNumber," +
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
                "    FROM `decom3sixtytool`.`opportunity_info`" +
                "    WHERE `column_name` IN ('appName')" +
                "    GROUP BY `Id`" +
                "),  " +
                "`ApplicationStatus` AS (" +
                "    SELECT " +
                "        `o`.`Id`," +
                "        MAX(CASE" +
                "            WHEN (CASE WHEN `i`.`isCompleted` = 'Yes' AND `i`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Intake' " +
                "            WHEN (CASE WHEN `a`.`mail_flag`='true' AND `a`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Requirements'" +
                "            ELSE 'Archive Execution'" +
                "        END) as `Status`" +
                "    FROM `decom3sixtytool`.`opportunity_info` `o`" +
                "    LEFT JOIN `decom3sixtytool`.`Intake_Stake_Holder_Info` `i` ON `o`.`Id` = `i`.`OppId`" +
                "    LEFT JOIN `decom3sixtytool`.`archivereq_roles_info` `a` ON `i`.`OppId` = `a`.`OppId`" +
                "    GROUP BY `o`.`Id` " +
                "), " +
                "`PhaseStatus` AS (" +
                "   WITH `SeparatedValues` AS (" +
                "    SELECT " +
                "        `waveName`," +
                "        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`value`, ',', n.digit + 1), ',', -1)) AS `separatedValue`" +
                "    FROM " +
                "        `decom3sixtytool`.`governance_info`" +
                "    JOIN " +
                "        (SELECT 0 AS digit UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) AS n" +
                "        ON LENGTH(REPLACE(`value`, ',' , '')) <= LENGTH(`value`) - n.digit" +
                "    WHERE " +
                "        `column_name` = 'apps'" +
                ")" +
                "SELECT " +
                "    `o`.`Id`," +
                "    `sv`.`separatedValue`," +
                "    `sv`.`waveName`," +
                "    `p`.`phaseName`" +
                "FROM " +
                "    `decom3sixtytool`.`opportunity_info` `o`" +
                "JOIN " +
                "    `SeparatedValues` `sv` ON `o`.`value` = `sv`.`separatedValue`" +
                "JOIN " +
                "    `decom3sixtytool`.`phase_info` `p` ON `sv`.`waveName` = `p`.`value`" +
                "WHERE " +
                "    `o`.`column_name` = 'appname'" +
                "    AND `p`.`column_name` = 'waves'" +
                ")" +
                "SELECT" +
                "    COALESCE(`o`.`Id`, '') AS `Application_Id`," +
                "    COALESCE(`o`.`Application_Name`, '') AS `Application_Name`," +
                "    COALESCE(`s`.`Status`, '') AS `Application_Status`," +
                "    COALESCE(`phs`.`phaseName`, '') AS `Phase_Status`" +
                "FROM `OpportunityInfo` `o`" +
                "LEFT JOIN `ApplicationStatus` `s` ON `o`.`Id` = `s`.`Id`" +
                "LEFT JOIN `PhaseStatus` `phs` ON `o`.`Id` = `phs`.`Id`;";

        try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}




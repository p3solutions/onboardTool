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
//

        String sql = "SELECT COUNT(*) as view_count FROM information_schema.views WHERE table_name = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, viewName);


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
        String sqlViewCreation ="CREATE VIEW applicationdataview1 AS "  +
        		"WITH `submodules` AS("
        		+ "	select "
        		+ "    distinct(`Id`) as `AppId`, "
        		+ "    value from `opportunity_info` where `Id` not "
        		+ "	in(select `OppId` from `intake_stake_holder_info` where `intakeApproval` = 'Approved') and `column_name`='appName'"
        		+ ") ,"
        		+ "`OpportunityInfo` AS ("
        		+ "    SELECT"
        		+ "        `Id`,"
        		+ "        MAX(CASE WHEN `column_name` = 'apmid' THEN `value` END) AS `Application_Id`,"
        		+ "        MAX(CASE WHEN `column_name` = 'appName' THEN `value` END) AS `Application_Name`,"
        		+ "        MAX(CASE WHEN `column_name` = 'creation_date' THEN `value` END) AS `Creation_Date`,"
        		+ "        MAX(CASE WHEN `column_name` = 'status' THEN `value` END) AS `Status`,"
        		+ "        MAX(CASE WHEN `column_name` = 'request_type' THEN `value` END) AS `Request_Type`,"
        		+ "        MAX(CASE WHEN `column_name` = 'requester' THEN `value` END) AS `Requester`,"
        		+ "        MAX(CASE WHEN `column_name` = 'appowner' THEN `value` END) AS `Application_Owner`,"
        		+ "        MAX(CASE WHEN `column_name` = 'businesssegment' THEN `value` END) AS `Business_Segment`,"
        		+ "        MAX(CASE WHEN `column_name` = 'businessunit' THEN value END) AS `Business_Unit`"
        		+ "    FROM `opportunity_info`"
        		+ "    WHERE `column_name` IN ('apmid', 'appName', 'creation_date', 'status', 'request_type', 'requester', 'appowner', 'businesssegment', 'businessunit')"
        		+ "    GROUP BY `Id`"
        		+ "),"
        		+ "`TriageInfo` AS ("
        		+ "    SELECT"
        		+ "        `Id`,"
        		+ "        count(Id),"
        		+ "        MAX(CASE WHEN `column_name` = 'Preliminary_CBA' THEN `value` END) AS `Preliminary_CBA`,"
        		+ "        MAX(CASE WHEN `column_name` = 'funding_Avl' THEN `value` END) AS `Funding_Available`,"
        		+ "        MAX(CASE WHEN `column_name` = 'prgFunder' THEN value END) AS `Program_Funder`,"
        		+ "        MAX(CASE WHEN `column_name` = 'PrjInfo' THEN `value` END) AS `Project_Portfolio_Information`,"
        		+ "        MAX(CASE WHEN `column_name` = 'Decom_date' THEN `value` END) AS `Project_Decomission_Date`,"
        		+ "        MAX(CASE WHEN `column_name` = 'infrastructure_impact' THEN `value` END) AS `Infrastructure_Impact`,"
        		+ "        MAX(CASE WHEN `column_name` = 'nmbr_of_infrastructure_components' THEN `value` END) AS `Number_of_Infrastructure_Components`,"
        		+ "        MAX(CASE WHEN `column_name` = 'archival_Sol' THEN `value` END) AS `Archival_Solution`,"
        		+ "        MAX(CASE WHEN `column_name` = 'Status' THEN `value` END) AS `Status_Notes`,"
        		+ "        MAX(CASE WHEN `column_name` = 'decomAnalyst' THEN `value` END) AS `EDR_Analyst`,"
        		+ "        MAX(CASE WHEN `column_name` = 'Bigrock' THEN value END) AS `Big_Rock`"
        		+ "    FROM `triage_info`"
        		+ "    WHERE `column_name` IN ('Preliminary_CBA', 'funding_Avl', 'prgFunder', 'PrjInfo', 'Decom_date', 'infrastructure_impact', 'nmbr_of_infrastructure_components', 'archival_Sol', 'Status', 'decomAnalyst', 'Bigrock')"
        		+ "    GROUP BY `Id`"
        		+ "),"
        		+ "`AssessmentData` AS ("
        		+ "    SELECT"
        		+ "        `Id`,"
        		+ "        MAX(CASE"
        		+ "            WHEN `column_name` = 'LastUpdateMade' THEN `value`"
        		+ "            WHEN `column_name` = 'ExpectedDate' THEN `value`"
        		+ "        END) AS `Data_Read_only_State`"
        		+ "    FROM `assessment_data_char_info`"
        		+ "    WHERE `column_name` IN ('LastUpdateMade', 'ExpectedDate')"
        		+ "    GROUP BY `Id`"
        		+ "),"
        		+ "`ApplicationStatus` AS ("
        		+ "    SELECT "
        		+ "        `o`.`Id`,"
        		+ "        MAX(CASE"
        		+ "            WHEN (CASE WHEN `i`.`isCompleted`= 'Yes' AND `i`.`intakeApproval`= 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Intake' "
        		+ "            WHEN (CASE WHEN `a`.`isCompleted`='Yes' AND `a`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Requirements'"
        		+ "            ELSE 'Archive Execution'"
        		+ "        END) as `Status`"
        		+ "    FROM `opportunity_info` `o`"
        		+ "    LEFT JOIN `Intake_Stake_Holder_Info` `i` ON `o`.`Id` = `i`.`OppId`"
        		+ "    LEFT JOIN `archivereq_roles_info` `a` ON `i`.`OppId` = `a`.`OppId`"
        		+ "    GROUP BY `o`.`Id`"
        		+ "),"
        		+ "`PhaseStatus` AS (  "
        		+ "  WITH separatedvalues AS ("
        		+ "    SELECT"
        		+ "        `governance_info`.`waveName` AS `waveName`,"
        		+ "        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`governance_info`.`value`, ',', (`n`.`digit` + 1)), ',', - (1))) AS `separatedValue`"
        		+ "    FROM"
        		+ "        (`governance_info`"
        		+ "        JOIN (SELECT 0 AS `digit` UNION ALL SELECT 1 AS `1` UNION ALL SELECT 2 AS `2` UNION ALL SELECT 3 AS `3`) `n`"
        		+ "        ON (LENGTH(REPLACE(`governance_info`.`value`, ',', '')) <= (LENGTH(`governance_info`.`value`) - `n`.`digit`)))"
        		+ "    WHERE"
        		+ "        (`governance_info`.`column_name` = 'apps')"
        		+ ")"
        		+ "SELECT"
        		+ "    `o`.`Id` AS `Id`,"
        		+ "    `sv`.`waveName` AS `waveName`,"
        		+ "    `sv`.`separatedValue` AS `separatedValue`,"
        		+ "    `p`.`phaseName` AS `phaseName`"
        		+ "FROM"
        		+ "    `opportunity_info` `o`"
        		+ "    JOIN `separatedvalues` `sv` ON TRIM(BOTH ' ' FROM `o`.`value`) = TRIM(BOTH ' ' FROM `sv`.`separatedValue`)"
        		+ "    LEFT JOIN `phase_info` `p` ON TRIM(BOTH ' ' FROM `sv`.`waveName`) = TRIM(BOTH ' ' FROM `p`.`value`)"
        		+ "WHERE"
        		+ "    (`o`.`column_name` = 'appname' AND `p`.`column_name` = 'waves')"
        		+ "),"
        		+ "`Intakemodules` AS("
        		+ "	SELECT "
        		+ "    `o`.`Id`,"
        		+ "    MAX(CASE WHEN `o`.`column_name` = 'appName' THEN `o`.`value`END) as `Application_Name`,"
        		+ "    MAX(CASE WHEN `ts`.`isCompleted` = 'Yes' THEN 1 ELSE 0 END) as `Triage_Summary`,"
        		+ "    MAX(CASE WHEN `a`.`isCompleted` = 'Yes' THEN 1 ELSE 0 END) as `Assessment`,"
        		+ "    MAX(CASE WHEN `i`.`isCompleted` = 'Yes' THEN 1 ELSE 0 END) as `StakeHolder`,"
        		+ "    MAX(CASE WHEN `i`.`isCompleted` = 'Yes' AND `i`.`mail_flag` = 'true' THEN 1 ELSE 0 END) as `Intake_Approved`,"
        		+ "    CASE"
        		+ "        WHEN MAX(CASE WHEN `ts`.`isCompleted` = 'Yes' THEN 1 ELSE 0 END) = 0 THEN 'Triage Summary'"
        		+ "        WHEN MAX(CASE WHEN `a`.`isCompleted` = 'yes' THEN 1 ELSE 0 END) = 0 THEN 'Assessment'"
        		+ "        WHEN MAX(CASE WHEN `i`.`isCompleted` = 'Yes' THEN 1 ELSE 0 END) = 0 THEN 'StakeHolder'"
        		+ "        WHEN MAX(CASE WHEN `i`.`isCompleted` = 'Yes' AND `i`.`mail_flag` = 'true' THEN 1 ELSE 0 END) = 0 THEN 'Intake Approved'"
        		+ "        ELSE 'Intake Approved'"
        		+ "    END AS `Intake_status`"
        		+ "FROM "
        		+ "    `opportunity_info` `o`"
        		+ "    LEFT JOIN `triage_summary_info` `ts` ON `o`.`Id` = `ts`.`Id`"
        		+ "    LEFT JOIN `Assessment_Archival_Consumption_Info` `a` ON `o`.`Id` = `a`.`Id`"
        		+ "    LEFT JOIN `Intake_Stake_Holder_Info` `i` ON `o`.`Id` = `i`.`OppId`"
        		+ "GROUP BY"
        		+ "    `o`.`Id`"
        		+ ")"
        		+ "SELECT"
        		+ "    COALESCE(`o`.`Id`, '') AS \"Application Id Gen\","
        		+ "    COALESCE(`o`.`Application_Id`, '') AS \"Application Id\","
        		+ "    COALESCE(`o`.`Application_Name`, '') AS \"Application Name\","
        		+ "    COALESCE(`Intakemodules`.`Intake_status`, '') AS \"Workflow Status\","
        		+ "    COALESCE(`phs`.`phaseName`, '') AS \"Phase\","
        		+ "    COALESCE(`o`.`Creation_Date`, '') AS \"Creation Date\","
        		+ "    COALESCE(`o`.`Status`, '') AS \"Status\","
        		+ "    COALESCE(`o`.`Request_Type`, '') AS \"Request Type\","
        		+ "    COALESCE(`o`.`Requester`, '') AS \"Requester\","
        		+ "    COALESCE(`o`.`Application_Owner`, '') AS \"Application Owner\","
        		+ "    COALESCE(`o`.`Business_Segment`, '') AS \"Business Segment\","
        		+ "    COALESCE(`o`.`Business_Unit`, '') AS \"Business Unit\","
        		+ "    COALESCE(`t`.`Preliminary_CBA`, '') AS \"Preliminary CBA\","
        		+ "    COALESCE(`t`.`Funding_Available`, '') AS \"Funding Available\","
        		+ "    COALESCE(`t`.`Program_Funder`, '') AS \"Program Funder\","
        		+ "    COALESCE(`t`.`Project_Portfolio_Information`, '') AS \"Project Portfolio Information\","
        		+ "    COALESCE(`t`.`Project_Decomission_Date`, '') AS \"Project Decommission Date\","
        		+ "    COALESCE(`t`.`Infrastructure_Impact`, '') AS \"Infrastructure Impact\","
        		+ "    COALESCE(`t`.`Number_of_Infrastructure_Components`, '') AS \"Number of Infrastructure Components\","
        		+ "    COALESCE(`t`.`Archival_Solution`, '') AS \"Archival Solution\","
        		+ "    COALESCE(`t`.`Status_Notes`, '') AS \"Status Notes\","
        		+ "    COALESCE(`t`.`EDR_Analyst`, '') AS \"EDR Analyst\","
        		+ "    COALESCE(`t`.`Big_Rock`, '') AS \"Big Rock\","
        		+ "    COALESCE(`a`.`Data_Read_only_State`, '') AS \"Read Only Date\""
        		+ "FROM `submodules` `sub` "
        		+ " LEFT JOIN `OpportunityInfo` `o` ON `sub`.`AppId` = `o`.`Id`"
        		+ "LEFT JOIN `TriageInfo` `t` ON  `sub`.`AppId` = `t`.`Id`"
        		+ "LEFT JOIN `AssessmentData` `a` ON  `sub`.`AppId` = `a`.`Id`"
        		+ "LEFT JOIN `ApplicationStatus` `s` ON  `sub`.`AppId` = `s`.`Id`"
        		+ "LEFT JOIN `PhaseStatus` `phs` ON  `sub`.`AppId` =`phs`.`Id`"
        		+ "LEFT JOIN `Intakemodules`  ON  `sub`.`AppId`=`Intakemodules`.`Id`;";

        try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    private void Report2() throws SQLException {
        String sqlViewCreation ="CREATE VIEW applicationdataview2 AS " +
                "WITH `submodules` AS(" +
				"select " +
				"    distinct(`Id`) as `AppId`, " +
				"    value from `opportunity_info` where `Id` not " +
				"in(select `OppId` from `intake_stake_holder_info` where `intakeApproval` = 'Approved') and `column_name`='appName'" +
				")," +
				"`Oppinfo` AS(" +
				"SELECT " +
				"            `opportunity_info`.`Id` AS `Id`," +
				"                MAX((CASE" +
				"                    WHEN (`opportunity_info`.`column_name` = 'appName') THEN `opportunity_info`.`value`" +
				"                END)) AS `Application_Name`," +
				"                MAX((CASE" +
				"                    WHEN (`opportunity_info`.`column_name` = 'appowner') THEN `opportunity_info`.`value`" +
				"                END)) AS `Application_Owner`," +
				"                MAX((CASE" +
				"                    WHEN (`opportunity_info`.`column_name` = 'status') THEN `opportunity_info`.`value`" +
				"                END)) AS `status`" +
				"        FROM" +
				"            `opportunity_info`" +
				"        WHERE" +
				"            (`opportunity_info`.`column_name` IN ('appName' , 'appowner', 'status'))" +
				"        GROUP BY `opportunity_info`.`Id`" +
				")," +
				"`TriageInfo` AS(SELECT " +
				"            `triage_info`.`Id` AS `Id`," +
				"                MAX((CASE" +
				"                    WHEN (`triage_info`.`column_name` = 'PrjInfo') THEN `triage_info`.`value`" +
				"                END)) AS `Project_Portfolio_Information`," +
				"                MAX((CASE" +
				"                    WHEN (`triage_info`.`column_name` = 'funding_Avl') THEN `triage_info`.`value`" +
				"                END)) AS `Funding_Available`" +
				"        FROM" +
				"            `triage_info`" +
				"        WHERE" +
				"            (`triage_info`.`column_name` IN ('PrjInfo' , 'funding_Avl'))" +
				"        GROUP BY `triage_info`.`Id`" +
				")," +
				"`assessmentinfo` as (" +
				"SELECT " +
				"            `assessment_application_info`.`Id` AS `Id`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_application_info`.`column_name` = 'AppDetails') THEN `assessment_application_info`.`value`" +
				"                END)) AS `Application_Details`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_application_info`.`column_name` = 'DataMigrationComplete') THEN `assessment_application_info`.`value`" +
				"                END)) AS `Target_Date`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_application_info`.`column_name` = 'DecomReadiness') THEN `assessment_application_info`.`value`" +
				"                END)) AS `Readonly_Date`" +
				"        FROM" +
				"            `assessment_application_info`" +
				"        WHERE" +
				"            (`assessment_application_info`.`column_name` IN ('AppDetails' , 'DataMigrationComplete', 'DecomReadiness'))" +
				"        GROUP BY `assessment_application_info`.`Id`" +
				")," +
				"`assessmentdatainfo` AS (" +
				"SELECT " +
				"            `assessment_data_char_info`.`Id` AS `Id`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'DatabaseType') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Database_type`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'DataTypeCharacteristics') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Data_Type_Characteristics`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'StrucDBsize') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Structured_Data_In_GB`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'StrucNoofTables') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Structured_Data_Number_of_tables`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'UnstrucDataVolume') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Unstructured_Data_In_GB`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'UnstrucNoofFiles') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Unstructured_Data_files`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'DBServerName') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Database_Server_Name`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'DBNames') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Database_Name`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'TableNames') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `Table_Names`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_data_char_info`.`column_name` = 'DBAContact') THEN `assessment_data_char_info`.`value`" +
				"                END)) AS `DBA_Contact`" +
				"        FROM" +
				"            `assessment_data_char_info`" +
				"        WHERE" +
				"            (`assessment_data_char_info`.`column_name` IN ('DatabaseType' , 'DataTypeCharacteristics', 'StrucDBsize', 'StrucNoofTables', 'UnstrucDataVolume', 'UnstrucNoofFiles', 'DBServerName', 'DBNames', 'TableNames', 'DBAContact'))" +
				"        GROUP BY `assessment_data_char_info`.`Id`" +
				")," +
				"`assarchconsinfo` AS(" +
				"SELECT " +
				"            `assessment_archival_consumption_info`.`Id` AS `Id`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_archival_consumption_info`.`column_name` = 'enc') THEN `assessment_archival_consumption_info`.`value`" +
				"                END)) AS `Encryption`," +
				"                MAX((CASE" +
				"                    WHEN (`assessment_archival_consumption_info`.`column_name` = 'datamask') THEN `assessment_archival_consumption_info`.`value`" +
				"                END)) AS `Data_Masking`" +
				"        FROM" +
				"            `assessment_archival_consumption_info`" +
				"        WHERE" +
				"            (`assessment_archival_consumption_info`.`column_name` IN ('enc' , 'datamask'))" +
				"        GROUP BY `assessment_archival_consumption_info`.`Id`" +
				")," +
				"`phaseinfo` AS (" +
				"  (WITH separatedvalues AS (" +
				"    SELECT" +
				"        `governance_info`.`waveName` AS `waveName`," +
				"        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`governance_info`.`value`, ',', (`n`.`digit` + 1)), ',', - (1))) AS `separatedValue`" +
				"    FROM" +
				"        (`governance_info`" +
				"        JOIN (SELECT 0 AS `digit` UNION ALL SELECT 1 AS `1` UNION ALL SELECT 2 AS `2` UNION ALL SELECT 3 AS `3`) `n`" +
				"        ON (LENGTH(REPLACE(`governance_info`.`value`, ',', '')) <= (LENGTH(`governance_info`.`value`) - `n`.`digit`)))" +
				"    WHERE" +
				"        (`governance_info`.`column_name` = 'apps')" +
				")" +
				"SELECT" +
				"    `o`.`Id` AS `Id`," +
				"    `sv`.`waveName` AS `waveName`," +
				"    `sv`.`separatedValue` AS `separatedValue`," +
				"    `p`.`phaseName` AS `phaseName`" +
				"FROM" +
				"    `opportunity_info` `o`" +
				"    JOIN `separatedvalues` `sv` ON TRIM(BOTH ' ' FROM `o`.`value`) = TRIM(BOTH ' ' FROM `sv`.`separatedValue`)" +
				"    LEFT JOIN `phase_info` `p` ON TRIM(BOTH ' ' FROM `sv`.`waveName`) = TRIM(BOTH ' ' FROM `p`.`value`)" +
				"WHERE" +
				"    (`o`.`column_name` = 'appname' AND `p`.`column_name` = 'waves'))" +
				")" +
				"SELECT " +
				"        COALESCE(`o`.`Application_Name`, '') AS \"Application Name\"," +
				"        COALESCE(`o`.`Application_Owner`, '') AS \"Application Owner\"," +
				"        COALESCE(`o`.`status`, '') AS \"Status\"," +
				"        COALESCE(`t`.`Project_Portfolio_Information`,'') AS \"Project Portfolio Information\"," +
				"        COALESCE(`t`.`Funding_Available`, '') AS \"Funding Available\"," +
				"        COALESCE(`ai`.`Application_Details`, '') AS \"Application Details\"," +
				"        COALESCE(`ai`.`Target_Date`, '') AS \"Target Date\"," +
				"        COALESCE(`ai`.`Readonly_Date`, '') AS \"Readonly Date\"," +
				"        COALESCE(`ad`.`Database_type`, '') AS \"Database type\"," +
				"        COALESCE(`ad`.`Data_Type_Characteristics`,'') AS \"Data Type Characteristics\"," +
				"        COALESCE(`ad`.`Structured_Data_In_GB`,'') AS \"Structured Data In GB\"," +
				"        COALESCE(`ad`.`Structured_Data_Number_of_tables`,'') AS \"Structured Data Number of tables\"," +
				"        COALESCE(`ad`.`Unstructured_Data_In_GB`,'') AS \"Unstructured Data In GB\"," +
				"        COALESCE(`ad`.`Unstructured_Data_files`,'') AS \"Unstructured Data files\"," +
				"        COALESCE(`ad`.`Database_Server_Name`,'') AS \"Database Server Name\"," +
				"        COALESCE(`ad`.`Database_Name`, '') AS \"Database Name\"," +
				"        COALESCE(`ad`.`Table_Names`, '') AS \"Table Names\"," +
				"        COALESCE(`ad`.`DBA_Contact`, '') AS \"DBA Contact\"," +
				"        COALESCE(`ac`.`Encryption`, '') AS \"Encryption\"," +
				"        COALESCE(`ac`.`Data_Masking`, '') AS \"Data Masking\"," +
				"        COALESCE(`ph`.`phaseName`, '') AS \"Phase\"" +
				"FROM `submodules` `s`" +
				"LEFT JOIN `Oppinfo` `o` ON `s`.`AppId` = `o`.`Id`" +
				"LEFT JOIN  `TriageInfo` `t` ON `s`.`AppId` = `t`.`Id`" +
				"LEFT JOIN  `assessmentinfo` `ai` ON `s`.`AppId`=`ai`.`Id`" +
				"LEFT JOIN  `assessmentdatainfo` `ad` ON `s`.`AppId` = `ad`.`Id`" +
				"LEFT JOIN  `assarchconsinfo` `ac` ON `s`.`AppId`=`ac`.`Id`" +
				"LEFT JOIN `phaseinfo` `ph` ON `s`.`AppId`=`ph`.`Id`;";

         try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private void Report3() throws SQLException {
            String sqlViewCreation ="CREATE VIEW applicationdataview3 AS " +
                    "WITH " +
                    "  `opportunityinfo` AS (" +
                    "SELECT " +
                    "  `opportunity_info`.`Id` AS `Id`" +
                    "FROM " +
                    "  `opportunity_info`" +
                    "GROUP BY " +
                    "  `opportunity_info`.`Id`" +
                    "  )," +
                    "`arqreqdetails` AS( " +
                    "SELECT" +
                    "  `archivereq_legacyapp_info`.`Id` AS `Id`," +
                    "  MAX((CASE WHEN (`archivereq_legacyapp_info`.`column_name` = 'legacyappname') THEN `archivereq_legacyapp_info`.`value` END)) AS `Legacy_Application_Name`," +
                    "  MAX((CASE WHEN (`archivereq_legacyapp_info`.`column_name` = 'srcdb') THEN `archivereq_legacyapp_info`.`value` END)) AS `SourcePlatform_Databases`," +
                    "  MAX((CASE WHEN (`archivereq_legacyapp_info`.`column_name` = 'legacyappdesc') THEN `archivereq_legacyapp_info`.`value` END)) AS `Legacy_Application_Description`," +
                    "  MAX((CASE WHEN (`archivereq_legacyapp_info`.`column_name` = 'readonly') THEN `archivereq_legacyapp_info`.`value` END)) AS `What_is_the_read_only_date`," +
                    "  MAX((CASE WHEN (`archivereq_legacyapp_info`.`column_name` = 'onlysrcdata') THEN `archivereq_legacyapp_info`.`value` END)) AS `Is_this_application_the_only_source_of_truth_for_the_data`," +
                    "  MAX((CASE WHEN (`archivereq_legacyapp_info`.`column_name` = 'thirdpartyvendor') THEN `archivereq_legacyapp_info`.`value` END)) AS `Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor`," +
                    "  MAX((CASE WHEN (`archivereq_legacyapp_info`.`column_name` = 'totalsize') THEN `archivereq_legacyapp_info`.`value` END)) AS `What_is_the_total_data_size`" +
                    " FROM  `archivereq_legacyapp_info`" +
                    "WHERE " +
                    "  (`archivereq_legacyapp_info`.`column_name` IN ('legacyappname','srcdb','legacyappdesc','readonly','onlysrcdata','thirdpartyvendor','totalsize'))" +
                    "GROUP BY " +
                    "  `archivereq_legacyapp_info`.`Id`" +
                    ")," +
                    "`retentiondata` AS(" +
                    "SELECT  " +
                    "`assessment_compliance_char_info`.`Id` AS `Id`," +
                    "MAX((CASE WHEN (`assessment_compliance_char_info`.`column_name` = 'retentionperiod') THEN `assessment_compliance_char_info`.`value` END)) AS `Retention_Period`" +
                    "FROM  `assessment_compliance_char_info`" +
                    "WHERE (`assessment_compliance_char_info`.`column_name` IN ('retentionperiod'))" +
                    "GROUP BY " +
                    "  `assessment_compliance_char_info`.`Id`" +
                    ")," +
                    "`phasestatus` AS (" +
                    "  WITH separatedvalues AS (" +
                    "    SELECT" +
                    "        `governance_info`.`waveName` AS `waveName`," +
                    "        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`governance_info`.`value`, ',', (`n`.`digit` + 1)), ',', - (1))) AS `separatedValue`" +
                    "    FROM" +
                    "        (`governance_info`" +
                    "        JOIN (SELECT 0 AS `digit` UNION ALL SELECT 1 AS `1` UNION ALL SELECT 2 AS `2` UNION ALL SELECT 3 AS `3`) `n`" +
                    "        ON (LENGTH(REPLACE(`governance_info`.`value`, ',', '')) <= (LENGTH(`governance_info`.`value`) - `n`.`digit`)))" +
                    "    WHERE" +
                    "        (`governance_info`.`column_name` = 'apps')" +
                    ")" +
                    "SELECT" +
                    "    `o`.`Id` AS `Id`," +
                    "    `sv`.`waveName` AS `waveName`," +
                    "    `sv`.`separatedValue` AS `separatedValue`," +
                    "    `p`.`phaseName` AS `phaseName`" +
                    "FROM" +
                    "    `opportunity_info` `o`" +
                    "    JOIN `separatedvalues` `sv` ON TRIM(BOTH ' ' FROM `o`.`value`) = TRIM(BOTH ' ' FROM `sv`.`separatedValue`)" +
                    "    LEFT JOIN `phase_info` `p` ON TRIM(BOTH ' ' FROM `sv`.`waveName`) = TRIM(BOTH ' ' FROM `p`.`value`)" +
                    "WHERE" +
                    "    (`o`.`column_name` = 'appname' AND `p`.`column_name` = 'waves'))" +
                    "  SELECT " +
                    "  COALESCE(`a`.`Legacy_Application_Name`,'') AS \"Application Name\"," +
                    "      COALESCE(`phs`.`phaseName`,'') AS \"Phase\"," +
                    "  COALESCE(`a`.`SourcePlatform_Databases`,'') AS \"Source Platform Databases\"," +
                    "  COALESCE(`a`.`Legacy_Application_Description`,'') AS \"Legacy App Description\"," +
                    "  COALESCE(`a`.`What_is_the_read_only_date`,'') AS \"Read Only Date\"," +
                    "  COALESCE(`a`.`Is_this_application_the_only_source_of_truth_for_the_data`,'') AS \"Is Application The Only Source Of Truth For The Data\"," +
                    "  COALESCE(`a`.`Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor`,'') AS \"Legacy Application Hosted Internally Or With Third Party Vendor\"," +
                    "  COALESCE(`a`.`What_is_the_total_data_size`,'') AS \"Total Data Size\"," +
                    "  COALESCE(`r`.`Retention_Period`,'') AS \"Retention Period\"" +
                    "  " +
                    "FROM " +
                    "(" +
                    "  (" +
                    "(`opportunityinfo` `o`" +
                    "  LEFT JOIN `arqreqdetails` `a` ON (`o`.`Id` = `a`.`Id`))" +
                    "  LEFT JOIN `retentiondata` `r` ON (`o`.`Id` = `r`.`Id`))" +
                    "  LEFT JOIN `phasestatus` `phs` ON (`o`.`Id` = `phs`.`Id`)" +
                    "  )" +
                    "      WHERE NOT (" +
                    "    (`a`.`Legacy_Application_Name` IS NULL OR `a`.`Legacy_Application_Name` = '')" +
                    "  );";

            Statement viewStatement = connection.createStatement();
            viewStatement.execute(sqlViewCreation);
        }

    private void financeListview(){
        String sqlViewCreation = "CREATE VIEW financelist AS " +
                "WITH `financeInfodetails` AS(" +
                "SELECT " +
                "t1.Id," +
                "MAX(CASE WHEN t1.column_name = 'financeappname' THEN t1.value END) AS `Application_Name`," +
                "MAX(CASE WHEN t1.column_name = 'projnum' THEN t1.value END) AS `Project_Number`," +
                "MAX(CASE WHEN t1.column_name = 'softlicense' THEN t1.value END) AS `Software_and_Licensing`," +
                "MAX(CASE WHEN t1.column_name = 'softlicensecost' THEN t1.value END) AS `Software`," +
                "MAX(CASE WHEN t1.column_name = 'contractDate' THEN t1.value END) AS `Contract_end_date`," +
                "MAX(CASE WHEN t1.column_name = 'contractDateComment' THEN t1.value END) AS `Contract_end_date_comments`," +
                "MAX(CASE WHEN t1.column_name = 'scopeinfra' THEN t1.value END) AS `Scope_of_infrastructure`," +
                "MAX(CASE WHEN t1.column_name = 'infrastructurecostsavings' THEN t1.value END) AS `Infrastructure_Cost_Savings`," +
                "MAX(CASE WHEN t1.column_name = 'costavoidance' THEN t1.value END) AS `Cost_Avoidance`," +
                "MAX(CASE WHEN t1.column_name = 'costarchive' THEN t1.value END) AS `Cost_Archive`," +
                "MAX(CASE WHEN t1.column_name = 'cba' THEN t1.value END) AS `Total_CBA`," +
                "MAX(CASE WHEN t1.column_name = 'fundapprove' THEN t1.value END) AS `Funding_approved`," +
                "MAX(CASE WHEN t1.column_name = 'fundtype' THEN t1.value END) AS `Funding_Type`" +
                " FROM " +
                " finance_info t1 " +
                " WHERE " +
                "(t1.column_name IN ('financeappname','projnum','softlicense','softlicensecost','contractDate','contractDateComment','scopeinfra','infrastructurecostsavings','costavoidance','costarchive','cba','fundapprove','fundtype'))" +
                " GROUP BY " +
                "t1.Id " +
                "), `applicationstatus` AS (" +
                "    SELECT " +
                "      `o`.`Id` AS `Id`," +
                "      MAX(" +
                "        (CASE WHEN (" +
                "              (CASE WHEN (`i`.`isCompleted` = 'Yes' AND `i`.`intakeApproval` = 'Approved') THEN 1 ELSE 0 END) = 0" +
                "            ) THEN 'Intake'" +
                "              WHEN (" +
                "              (CASE WHEN (`a`.`isCompleted` = 'Yes' AND `a`.`intakeApproval` = 'Approved') THEN 1 ELSE 0 END) = 0" +
                "            ) THEN 'Requirements'" +
                "              ELSE 'Archive Execution'" +
                "          END)" +
                "      ) AS `Status`" +
                "    FROM " +
                "      ((`opportunity_info` `o`" +
                "        LEFT JOIN `intake_stake_holder_info` `i` ON (`o`.`Id` = `i`.`OppId`))" +
                "        LEFT JOIN `archivereq_roles_info` `a` ON (`i`.`OppId` = `a`.`OppId`))" +
                "    GROUP BY " +
                "      `o`.`Id`" +
                "  )," +
                "  `phasestatus` AS (" +
                "     WITH separatedvalues AS (" +
                "    SELECT" +
                "        `governance_info`.`waveName` AS `waveName`," +
                "        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`governance_info`.`value`, ',', (`n`.`digit` + 1)), ',', - (1))) AS `separatedValue`" +
                "    FROM" +
                "        (`governance_info`" +
                "        JOIN (SELECT 0 AS `digit` UNION ALL SELECT 1 AS `1` UNION ALL SELECT 2 AS `2` UNION ALL SELECT 3 AS `3`) `n`" +
                "        ON (LENGTH(REPLACE(`governance_info`.`value`, ',', '')) <= (LENGTH(`governance_info`.`value`) - `n`.`digit`)))" +
                "    WHERE" +
                "        (`governance_info`.`column_name` = 'apps')" +
                ")" +
                "SELECT" +
                "    `o`.`Id` AS `Id`," +
                "    `sv`.`waveName` AS `waveName`," +
                "    `sv`.`separatedValue` AS `separatedValue`," +
                "    `p`.`phaseName` AS `phaseName`" +
                "FROM" +
                "    `opportunity_info` `o`" +
                "    JOIN `separatedvalues` `sv` ON TRIM(BOTH ' ' FROM `o`.`value`) = TRIM(BOTH ' ' FROM `sv`.`separatedValue`)" +
                "    LEFT JOIN `phase_info` `p` ON TRIM(BOTH ' ' FROM `sv`.`waveName`) = TRIM(BOTH ' ' FROM `p`.`value`) " +
                "WHERE " +
                "    (`o`.`column_name` = 'appname' AND `p`.`column_name` = 'waves')" +
                "  )" +
                "SELECT " +
                "  COALESCE(`f`.`Id`,'') AS \"ID\"," +
                "  COALESCE(`f`.`Application_Name`,'') AS \"Application Name\"," +
                "  COALESCE(`f`.`Project_Number`,'') AS \"Project Number\"," +
                "  COALESCE(`f`.`Software_and_Licensing`,'') AS \"Software and Licensing\"," +
                "  COALESCE(`f`.`Software`,'') AS \"Software and Licensing(cost Saving)\"," +
                "  COALESCE(`f`.`Contract_end_date`,'') AS \"Contract end date\"," +
                "  COALESCE(`f`.`Contract_end_date_comments`,'') AS \"Contract end date -comments\"," +
                "  COALESCE(`f`.`Scope_of_infrastructure`,'') AS \"Scope of infrastructure\"," +
                "  COALESCE(`f`.`Infrastructure_Cost_Savings`,'') AS \"Infrastructure Cost Savings\"," +
                "  COALESCE(`f`.`Cost_Avoidance`,'') AS \"Cost Avoidance\"," +
                "  COALESCE(`f`.`Cost_Archive`,'') AS \"Cost Archive\"," +
                "  COALESCE(`f`.`Total_CBA`,'') AS \"Total CBA\"," +
                "  COALESCE(`f`.`Funding_approved`,'') AS \"Funding approved\"," +
                "  COALESCE(`f`.`Funding_Type`,'') AS \"Funding Type\"," +
                "  COALESCE(`s`.`Status`,'') AS \"Status\"," +
                "  COALESCE(`phs`.`phaseName`,'') AS \"Phase\"" +
                "FROM " +
                "(  " +
                "(`financeInfodetails` `f`" +
                "LEFT JOIN `applicationstatus` `s` ON (`f`.`Id` = `s`.`Id`))" +
                "LEFT JOIN `phasestatus` `phs` ON (`f`.`Id` = `phs`.`Id`)) WHERE NOT (" +
                "(`f`.`Application_Name` IS NULL OR `f`.`Application_Name` = ''));";
        try (Statement viewStatement = connection.createStatement()) {
            viewStatement.execute(sqlViewCreation);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void phaseStatusView() {
        String sqlViewCreation = "CREATE VIEW `phase` AS " +
                "WITH `OpportunityInfo` AS (" +
                "   SELECT" +
                "       `Id`," +
                "       MAX(CASE WHEN `column_name` = 'appName' THEN `value` END) AS `Application_Name`" +
                "   FROM `opportunity_info`" +
                "   WHERE `column_name` IN ('appName')" +
                "   GROUP BY `Id`" +
                ")," +
                "`ApplicationStatus` AS (" +
                "   SELECT " +
                "       `o`.`Id`," +
                "       MAX(CASE" +
                "           WHEN (CASE WHEN `i`.`isCompleted` = 'Yes' AND `i`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Intake' " +
                "           WHEN (CASE WHEN `a`.`mail_flag`='true' AND `a`.`intakeApproval` = 'Approved' THEN 1 ELSE 0 END) = 0 THEN 'Requirements'" +
                "           ELSE 'Archive Execution'" +
                "       END) as `Status`" +
                "   FROM `opportunity_info` `o`" +
                "   LEFT JOIN `Intake_Stake_Holder_Info` `i` ON `o`.`Id` = `i`.`OppId`" +
                "   LEFT JOIN `archivereq_roles_info` `a` ON `i`.`OppId` = `a`.`OppId`" +
                "   GROUP BY `o`.`Id`" +
                ")," +
                "`PhaseStatus` AS (" +
                "  WITH separatedvalues AS (" +
                "    SELECT" +
                "        `governance_info`.`waveName` AS `waveName`," +
                "        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(`governance_info`.`value`, ',', (`n`.`digit` + 1)), ',', - (1))) AS `separatedValue`" +
                "    FROM" +
                "        (`governance_info`" +
                "        JOIN (SELECT 0 AS `digit` UNION ALL SELECT 1 AS `1` UNION ALL SELECT 2 AS `2` UNION ALL SELECT 3 AS `3`) `n`" +
                "        ON (LENGTH(REPLACE(`governance_info`.`value`, ',', '')) <= (LENGTH(`governance_info`.`value`) - `n`.`digit`)))" +
                "    WHERE" +
                "        (`governance_info`.`column_name` = 'apps')" +
                ")" +
                "SELECT" +
                "    `o`.`Id` AS `Id`," +
                "    `sv`.`waveName` AS `waveName`," +
                "    `sv`.`separatedValue` AS `separatedValue`," +
                "    `p`.`phaseName` AS `phaseName`" +
                "FROM" +
                "    `opportunity_info` `o`" +
                "    JOIN `separatedvalues` `sv` ON TRIM(BOTH ' ' FROM `o`.`value`) = TRIM(BOTH ' ' FROM `sv`.`separatedValue`)" +
                "    LEFT JOIN `phase_info` `p` ON TRIM(BOTH ' ' FROM `sv`.`waveName`) = TRIM(BOTH ' ' FROM `p`.`value`)" +
                "WHERE" +
                "    (`o`.`column_name` = 'appname' AND `p`.`column_name` = 'waves')" +
                ")" +
                "SELECT" +
                "   COALESCE(`o`.`Id`, '') AS `Application_Id`," +
                "   COALESCE(`o`.`Application_Name`, '') AS `Application_Name`," +
                "   COALESCE(`s`.`Status`, '') AS `Application_Status`," +
                "   COALESCE(`phs`.`phaseName`, '') AS `Phase_Status`" +
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




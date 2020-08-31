package reports.projectmanager_dashboard.service;

import ArchiveExecution.Service.Weekday;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class Project_Manager_Dashboard {
    final static Logger logger = Logger.getLogger(Project_Manager_Dashboard.class);

    public JsonObject project_manager_dashboard(String uname, String projectname, String applicationname) {
        JsonObject infoJson = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String project_count = "SELECT \n" +
                    "  projects, \n" +
                    "  (CHAR_LENGTH(projects) - CHAR_LENGTH(REPLACE(projects, ',', '')) + 1) as total \n" +
                    "FROM admin_userdetails where uname='" + uname + "'";
            Statement project_count_statement = connection.createStatement();
            ResultSet project_count_resultset = project_count_statement.executeQuery(project_count);
            while (project_count_resultset.next()) {
                String key = "project_count";
                String value = project_count_resultset.getString(2);
                infoJson.addProperty(key, value);
            }
            String app_count = "SELECT \n" +
                    "  application, \n" +
                    "  (CHAR_LENGTH(application) - CHAR_LENGTH(REPLACE(application, ',', '')) + 1) as total \n" +
                    "FROM admin_userdetails where uname='" + uname + "'";
            Statement app_count_stat = connection.createStatement();
            ResultSet app_count_resultset = app_count_stat.executeQuery(app_count);
            while (app_count_resultset.next()) {
                String key = "app_count";
                String value = app_count_resultset.getString(2);
                infoJson.addProperty(key, value);
            }

            String[] apps = applicationname.split(",");
            int applive_count = 0;
            int appindev_count = 0;
            for (int i = 0; i < apps.length; i++) {
                String live_app_count = "select * from archiveexecution_details where projects='" + projectname + "' and act_srt_date!='' and act_end_date!='' and pln_srt_date!='' and pln_end_date!='' and name ='" + apps[i] + "';";
                System.out.println("sssss\t" + live_app_count);
                Statement live_app_count_stat = connection.createStatement();
                ResultSet live_app_count_resultset = live_app_count_stat.executeQuery(live_app_count);
                if (live_app_count_resultset.next()) {
                    applive_count++;
                }
            }
            String ApplicationDevelopment = "select * from archiveexecution_details where projects='" + projectname + "' and act_srt_date!='' and act_end_date='' and pln_srt_date!='' and pln_end_date!='' and name='Build and Test';";
            Statement ApplicationDevelopmentStatement = connection.createStatement();
            ResultSet ApplicationDevelopmentResultset = ApplicationDevelopmentStatement.executeQuery(ApplicationDevelopment);
            while (ApplicationDevelopmentResultset.next()) {
                appindev_count++;
            }
            String key = "live_app_count";
            infoJson.addProperty(key, applive_count);
            logger.info("json obj----->" + infoJson);
            infoJson.addProperty("AppInDevelopmentCount", appindev_count);
            String ProjectQuery = "select * from appemphazize_applicationinfo where prjname= '" + projectname + "';";
            Statement st1 = connection.createStatement();
            ResultSet rs1 = st1.executeQuery(ProjectQuery);
            String app_in_appem = "";
            while (rs1.next()) {
                app_in_appem += rs1.getString(1) + ",";

            }
            String[] app_in_appem_arr = app_in_appem.substring(0, app_in_appem.length() - 1).split(",");
            String apps_in_drop_down = "";
            for (int j = 0; j < app_in_appem_arr.length; j++) {
                if (applicationname.contains(app_in_appem_arr[j])) {
                    apps_in_drop_down += app_in_appem_arr[j] + ",";
                }
            }
            apps_in_drop_down = apps_in_drop_down.substring(0, apps_in_drop_down.length() - 1);
            infoJson.addProperty("AppDropdown", apps_in_drop_down);
            connection.close();
            app_count_stat.close();
            app_count_resultset.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;

    }

    public static JsonArray ProjectManagerDashboardTeamMembers(String projectname, String Applicationname, String Role) {
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            JsonObject json = new JsonObject();
            json.addProperty("Roles", Role);
            jsonArray.add(json);
            if (Role.equals("All")) {
                JsonObject json1 = new JsonObject();
                String[] Roles = {"ArchivalProjectManager", "ArchivalProgramManager", "LegacyProgramManager", "ArchivalAdmin", "LegacyTechnicalSME", "LegacyBusinessSME", "ArchivalBusinessAnalyst", "ArchivalTechnicalLead", "ArchivalDeveloper", "TestLead"};
                for (int i = 0; i < Roles.length; i++) {
                    String AllRoles = "select * from Admin_UserDetails where projects like '%" + projectname + "%' and application like '%" + Applicationname + "%' and roles='" + Roles[i] + "'";
                    Statement st = connection.createStatement();
                    ResultSet rs = st.executeQuery(AllRoles);
                    if (rs.next()) {
                        JsonObject jsonrole = new JsonObject();
                        int j = 1;
                        json1.addProperty(rs.getString("roles") + j, rs.getString("uname"));
                        j++;
                        while (rs.next()) {
                            json1.addProperty(rs.getString("roles") + j, rs.getString("uname"));
                            j++;
                        }
                    }
                }
                jsonArray.add(json1);
            } else {
                JsonObject json1 = new JsonObject();
                String SelectedRole = "select * from Admin_UserDetails where projects like '%" + projectname + "%' and application like '%" + Applicationname + "%' and roles='" + Role + "'";
                Statement st1 = connection.createStatement();
                ResultSet rs1 = st1.executeQuery(SelectedRole);
                JsonObject json2 = new JsonObject();
                if (rs1.next()) {
                    int j = 1;
                    json2.addProperty(rs1.getString("roles") + j, rs1.getString("uname"));
                    j++;
                    while (rs1.next()) {
                        json2.addProperty(rs1.getString("roles") + j, rs1.getString("uname"));
                        j++;
                    }
                }
                jsonArray.add(json2);
                System.out.println("sample---->" + jsonArray);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception---------[info]--------" + e);
        }
        return jsonArray;
    }


    public static JsonArray ProjectManagerDashBoardAppDetails(String project){
        JsonArray jsonarray = new JsonArray();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String select_query = "select * from appemphazize_applicationinfo where prjname='"+project+"' ";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(select_query);
            String value = "";
            String readonly_value = "";
            while(rs.next()){
                value+= rs.getString(1)+",";

            }
            String select_query1 = "select * from appemphazize_applicationprioritization where prj_name='"+project+"' ";
            Statement st1 = connection.createStatement();
            ResultSet rs1 = st.executeQuery(select_query1);
            while(rs1.next()) {
                readonly_value+= rs1.getString("read_date")+",";
            }
            value = value.substring(0,value.length()-1);
            readonly_value=readonly_value.substring(0,readonly_value.length()-1);
            String ReadOnlyDate[]=readonly_value.split(",");
            String arr_value[] = value.split(",");
            String srt_date[] = new String[arr_value.length];
            String end_date[] = new String[arr_value.length];
            int percentage[] = new int[arr_value.length];
            int resourcesCount[]=new int[arr_value.length];
            String AppState[]=new String[arr_value.length];
            int sequence_number=0;
            for(int i = 0; i < arr_value.length; i++){
                String select_query2 = "select * from archiveexecution_details where projects = '"+project+"' and name = '"+arr_value[i]+"'";
                Statement st2 = connection.createStatement();
                ResultSet rs2 = st2.executeQuery(select_query2);
                if(rs2.next()){
                    srt_date[i]= rs2.getString("act_srt_date");
                    end_date[i]= rs2.getString("act_end_date");
                    percentage[i]=rs2.getInt("progressbar");
                }
                String ApplicationResourcequery="select count(*) from admin_userdetails where projects like'%"+project+"%' and application like'%"+arr_value[i]+"%'";
                Statement st3 = connection.createStatement();
                ResultSet rs3 = st3.executeQuery(ApplicationResourcequery);
                if(rs3.next())
                {
                    resourcesCount[i]=rs3.getInt(1);
                }
                String ApplicationStatequery="select * from appemphazize_applicationprioritization where prj_name='"+project+"' and proj_name='"+arr_value[i]+"'";
                Statement st4 = connection.createStatement();
                ResultSet rs4 = st4.executeQuery(ApplicationStatequery);
                if(rs4.next())
                {
                    String App_state="";
                    String Archive=rs4.getString("data_retained");
                    String Decomm=rs4.getString("Decommission");
                    if(Archive.equals("false"))
                    {
                        App_state="Decommission";
                    }
                    else if(Archive.equals("true")&&Decomm.equals("true"))
                    {
                        App_state="Archival & Decommission";
                    }
                    else if(Archive.equals("true")&&Decomm.equals("false"))
                    {
                        App_state="Archival";
                    }
                    AppState[i]=App_state;
                }
            }
            ArrayList<Integer> sequence_num=new ArrayList<Integer>();
            for(int k=0;k<arr_value.length;k++)
            {
                String SequenceNumber_Query="select * from archiveexecution_details where projects='"+project+"' and name='"+arr_value[k]+"';";
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery(SequenceNumber_Query);
                if(resultSet.next()) {
                    sequence_num.add(Integer.parseInt(resultSet.getString(1)));
                }
            }
            String ClosureIndex="select * from archiveexecution_details where projects='"+project+"' and name='Closure';";
            Statement statement1=connection.createStatement();
            ResultSet resultSet1=statement1.executeQuery(ClosureIndex);
            if(resultSet1.next())
            {
                sequence_num.add(Integer.parseInt(resultSet1.getString(1)));
            }
            HashMap<String,String> ApplicationDetails_ActualStartDate=new HashMap<String, String>();
            HashMap<String,String> ApplicationDetails_ActualEndDate=new HashMap<String, String>();
            for(int m=0;m<sequence_num.size();m++)
            {

                if(m+1!=sequence_num.size())
                {
                    int current_seqnum=sequence_num.get(m);
                    int next_sequencenum=sequence_num.get(m+1);
                    String Requirements_Query="select * from ArchiveExecution_details where projects='"+project+"' and name='Requirements' and seq_num>'"+current_seqnum+"' and seq_num<'"+next_sequencenum+"';";
                    Statement Requirements_Query_statement=connection.createStatement();
                    ResultSet resultSet_Requirements=Requirements_Query_statement.executeQuery(Requirements_Query);
                    if(resultSet_Requirements.next())
                    {
                        ApplicationDetails_ActualStartDate.put(arr_value[m]+"RequirementsActSrt",resultSet_Requirements.getString("act_srt_date"));
                        ApplicationDetails_ActualEndDate.put(arr_value[m]+"RequirementsActEnd",resultSet_Requirements.getString("act_end_date"));
                    }
                    String Dev_stage1_Query="select * from ArchiveExecution_details where projects='"+project +"' and name='Cycle 1 (Dev)' and seq_num>'"+current_seqnum+"' and seq_num<'"+next_sequencenum+"';";
                    Statement Dev_stage1_statement=connection.createStatement();
                    ResultSet Dev_stage1_resultSet=Dev_stage1_statement.executeQuery(Dev_stage1_Query);
                    if(Dev_stage1_resultSet.next())
                    {
                        ApplicationDetails_ActualStartDate.put(arr_value[m]+"Dev1ActSrt",Dev_stage1_resultSet.getString("act_srt_date"));
                        ApplicationDetails_ActualEndDate.put(arr_value[m]+"Dev1ActEnd",Dev_stage1_resultSet.getString("act_end_date"));
                    }
                    String Dev_stage2_Query="select * from ArchiveExecution_details where projects='"+project +"' and name='Cycle 2 (Stage)' and seq_num>'"+current_seqnum+"' and seq_num<'"+next_sequencenum+"';";
                    Statement Dev_stage2_statement=connection.createStatement();
                    ResultSet Dev_stage2_resultSet=Dev_stage2_statement.executeQuery(Dev_stage2_Query);
                    if(Dev_stage2_resultSet.next()) {
                        ApplicationDetails_ActualStartDate.put(arr_value[m]+"Dev2ActSrt",Dev_stage2_resultSet.getString("act_srt_date"));
                        ApplicationDetails_ActualEndDate.put(arr_value[m]+"Dev2ActEnd",Dev_stage2_resultSet.getString("act_end_date"));
                    }
                    String UAT_setup_Query="select * from archiveexecution_details where projects='"+project+"' and name='UAT setup (Stage)' and seq_num>'"+current_seqnum+"' and seq_num<'"+next_sequencenum+"';";
                    Statement UAT_setup_statement=connection.createStatement();
                    ResultSet UAT_setup_resultset=UAT_setup_statement.executeQuery(UAT_setup_Query);
                    if(UAT_setup_resultset.next())
                    {
                        ApplicationDetails_ActualStartDate.put(arr_value[m]+"UATsetupActSrt",UAT_setup_resultset.getString("act_srt_date"));
                        ApplicationDetails_ActualEndDate.put(arr_value[m]+"UATsetupActEnd",UAT_setup_resultset.getString("act_end_date"));
                    }
                    String UAT_Query="select * from archiveexecution_details where projects='"+project+"' and name='UAT setup (Stage)' and seq_num>'"+current_seqnum+"' and seq_num<'"+next_sequencenum+"';";
                    Statement UAT_statement=connection.createStatement();
                    ResultSet UAT_resultset=UAT_setup_statement.executeQuery(UAT_Query);
                    if(UAT_resultset.next())
                    {
                        ApplicationDetails_ActualStartDate.put(arr_value[m]+"UATActSrt",UAT_resultset.getString("act_srt_date"));
                        ApplicationDetails_ActualEndDate.put(arr_value[m]+"UATActEnd",UAT_resultset.getString("act_end_date"));
                    }
                    String Implement_Query="select * from archiveexecution_details where projects='"+project+"' and name='UAT setup (Stage)' and seq_num>'"+current_seqnum+"' and seq_num<'"+next_sequencenum+"';";
                    Statement Implement_statement=connection.createStatement();
                    ResultSet Implement_resultset=Implement_statement.executeQuery(Implement_Query);
                    if(Implement_resultset.next())
                    {
                        ApplicationDetails_ActualStartDate.put(arr_value[m]+"ImplementActSrt",Implement_resultset.getString("act_srt_date"));
                        ApplicationDetails_ActualEndDate.put(arr_value[m]+"ImplementActEnd",Implement_resultset.getString("act_end_date"));
                    }
                }
            }
            JsonObject jsonappstatus=new JsonObject();
            ArrayList<String> AppStatus=new ArrayList<String>();
            for(int index=0;index<arr_value.length;index++)
            {
                String RequirementsActSrt= ApplicationDetails_ActualStartDate.get(arr_value[index]+"RequirementsActSrt");
                String RequirementsActEnd=ApplicationDetails_ActualEndDate.get(arr_value[index]+"RequirementsActEnd");
                String dev1ActSrt=ApplicationDetails_ActualStartDate.get(arr_value[index]+"Dev1ActSrt");
                String dev1ActEnd=ApplicationDetails_ActualEndDate.get(arr_value[index]+"Dev1ActEnd");
                String dev2ActSrt=ApplicationDetails_ActualStartDate.get(arr_value[index]+"Dev2ActSrt");
                String dev2ActEnd=ApplicationDetails_ActualEndDate.get(arr_value[index]+"Dev2ActEnd");
                String UATsetupActSrt=ApplicationDetails_ActualStartDate.get(arr_value[index]+"UATsetupActSrt");
                String UATsetupActEnd=ApplicationDetails_ActualEndDate.get(arr_value[index]+"UATsetupActEnd");
                String UATActSrt=ApplicationDetails_ActualStartDate.get(arr_value[index]+"UATActSrt");
                String UATActEnd=ApplicationDetails_ActualEndDate.get(arr_value[index]+"UATActEnd");
                String Implementation_Actsrt=ApplicationDetails_ActualStartDate.get(arr_value[index]+"ImplementActSrt");
                String Iplementation_ACtEnd=ApplicationDetails_ActualEndDate.get(arr_value[index]+"ImplementActEnd");
                String ApplicationStatus="";
                String ApplicationLivestatusQuery="select * from archiveexecution_details where projects='"+project+"' and name='"+arr_value[index]+"';";
                Statement LiveStatement=connection.createStatement();
                ResultSet LiveResultSet=LiveStatement.executeQuery(ApplicationLivestatusQuery);
                if(LiveResultSet.next())
                {
                    if(Integer.parseInt(LiveResultSet.getString("progressbar"))==100)
                        ApplicationStatus="Live";
                    else if((RequirementsActSrt.equals("")&&RequirementsActEnd.equals(""))&&(dev1ActSrt.equals("")&&dev1ActEnd.equals(""))&&(dev2ActSrt.equals("")&&dev2ActEnd.equals(""))&&(UATsetupActSrt.equals("")&&UATsetupActEnd.equals(""))&&(UATActSrt.equals("")&&UATActEnd.equals(""))&&(Implementation_Actsrt.equals("")&&Iplementation_ACtEnd.equals("")))
                    {
                        ApplicationStatus="Application Not yet started";
                    }
                    else
                if((RequirementsActSrt.equals("")&&RequirementsActEnd.equals(""))||(!RequirementsActSrt.equals("")&&RequirementsActEnd.equals("")))
                {
                    ApplicationStatus="Plan in progress";
                }
                else if((dev1ActSrt.equals("")&&dev1ActEnd.equals(""))||(!dev1ActSrt.equals("")&&dev1ActEnd.equals("")))
                {
                    ApplicationStatus="Development in progress";
                }
                else if((dev2ActSrt.equals("")&&dev2ActEnd.equals(""))||(!dev2ActSrt.equals("")&&dev2ActEnd.equals("")))
                {
                    ApplicationStatus="Development in progress";
                }else if((UATsetupActSrt.equals("")&&UATsetupActEnd.equals(""))||(!UATsetupActSrt.equals("")&&UATsetupActEnd.equals("")))
                {
                    ApplicationStatus="Testing in progress";
                }else if((UATActSrt.equals("")&&UATActEnd.equals(""))||(!UATActSrt.equals("")&&UATActEnd.equals("")))
                {
                    ApplicationStatus="Testing in progress";
                }else if((Implementation_Actsrt.equals("")&&Iplementation_ACtEnd.equals(""))||(!Implementation_Actsrt.equals("")&&Iplementation_ACtEnd.equals("")))
                {
                    ApplicationStatus="Deployment in progress";
                }
                }
                AppStatus.add(ApplicationStatus);
            }
            /*for(int m=0;m<arr_value.length+1;m++)
            {
                String ActualStartDate="";
                String ActualEndDate="";
                String status="";
                int nextindex=m+1;
                if(m+1==arr_value.length) {
                    String SelectQuery = "select * from archiveexecution_details where projects='" + project + "' and seq_num>'"+sequence_num.get(m)+"' and seq_num<'"+sequence_num.get(m+1)+"' and name='Requirements' or name='Cycle 1 (Dev)' and projects='"+project+"' and seq_num>'"+sequence_num.get(m)+"' and seq_num<'"+sequence_num.get(m+1)+"'  or name='Cycle 2 (Stage)' and projects='" + project + "' and seq_num>'"+sequence_num.get(m)+"' and seq_num<'"+sequence_num.get(m+1)+"'  or name='UAT setup (Stage)' and projects='" + project + "' and seq_num>'"+sequence_num.get(m)+"' and seq_num<'"+sequence_num.get(m+1)+"' or name=''";
                    Statement statement2 = connection.createStatement();
                    ResultSet resultSet2 = statement2.executeQuery(SelectQuery);
                    if(resultSet1.next())
                    {
                        ActualStartDate=resultSet1.getString("act_srt_date");

                        ActualEndDate=resultSet1.getString("act_end_date");

                        if(!ActualStartDate.equals("")&&!ActualEndDate.equals(""))
                        {
                        }
                        else if(!ActualStartDate.equals("")&&!ActualEndDate.equals(""))
                        {
                        }
                    }
                }
                else {

                }
            }*/


            for(int j=0;j<arr_value.length;j++)
            {
                JsonObject jsonObject=new JsonObject();
                jsonObject.addProperty("AppName",arr_value[j]);
                jsonObject.addProperty("ReadOnlyDate",ReadOnlyDate[j]);
                jsonObject.addProperty("StartDate",srt_date[j]);
                jsonObject.addProperty("EndDate",end_date[j]);
                jsonObject.addProperty("Percentage",percentage[j]);
                jsonObject.addProperty("ResourceCount",resourcesCount[j]);
                jsonObject.addProperty("ApplicationState",AppState[j]);
                jsonObject.addProperty(arr_value[j]+"status",AppStatus.get(j));
                jsonarray.add(jsonObject);
            }

        }
        catch(Exception e){
            e.printStackTrace();
            System.out.println("Exception---->>>"+e);
        }
        return jsonarray;
    }
    public static JsonArray GanttChartDetails(String projectName)
    {
        JsonArray jsonArray =new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy");
            String GantchartDetailsQuery="select * from archiveexecution_details where projects='"+projectName+"' and level=1 and level=2 order by seq_num";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(GantchartDetailsQuery);
            while(rs.next())
            {
                JsonObject jsonObject1=new JsonObject();
                jsonObject1.addProperty("TaskName",rs.getString("name"));
                jsonObject1.addProperty("ActualStartDate",rs.getString("act_srt_date"));
                jsonObject1.addProperty("ActualEndDate",rs.getString("act_end_date"));
                int count= Weekday.splittingoperation(rs.getString("act_srt_date"),rs.getString("act_end_date"));
                jsonObject1.addProperty("DaysCount",count);
                jsonArray.add(jsonObject1);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Exception------[info]--------"+e);
        }
        return jsonArray;
    }
}

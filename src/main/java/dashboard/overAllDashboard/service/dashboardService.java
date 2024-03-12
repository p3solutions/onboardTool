package dashboard.overAllDashboard.service;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.itextpdf.styledxmlparser.jsoup.nodes.Entities;
import onboard.DBconnection;
import logger.System;
public class dashboardService {
        List<String> mainList = new LinkedList<String>();
    DBconnection dBconnection = null;
    Connection con = null;
    int intakeCount = 0;
    int reqCount = 0;
    int archiveExeCount = 0;
    int decomExeCount = 0;
    int totalCount = 0;
    public JsonArray GanttChartJsonArray = new JsonArray();
    public dashboardService() throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
    }
    //      public JsonObject dashboardCardDetails() {
    //          
    //          JsonObject jsonObject = new JsonObject();
    //          try {
    //              
    //              //Opportunity Count 
    //              String oppQuery = "select count(*) from opportunity_info where column_name = 'appName';";
    //              Statement st = con.createStatement();
    //              ResultSet rs = st.executeQuery(oppQuery);
    //              
    //              if(rs.next()) 
    //                  jsonObject.addProperty("opportunityCount", rs.getInt(1));
    //              
    //              rs.close();
    //              st.close();
    //              
    //              //Decommission Count 
    //              String decommQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'Decommission';";
    //              Statement st1 = con.createStatement();
    //              ResultSet rs1 = st1.executeQuery(decommQuery);
    //              
    //              if(rs1.next()) 
    //                  jsonObject.addProperty("decommissionCount", rs1.getInt(1));
    //              
    //              rs1.close();
    //              st1.close();
    //              
    //              
    //              //Archive Count 
    //              String archiveQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'Archive';";
    //              Statement st2 = con.createStatement();
    //              ResultSet rs2 = st2.executeQuery(archiveQuery);
    //              
    //              if(rs2.next()) 
    //                  jsonObject.addProperty("archiveCount", rs2.getInt(1));
    //              
    //              rs2.close();
    //              st2.close();
    //              
    //              //To be retire Count 
    //              String retireQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'To be retire';";
    //              Statement st3 = con.createStatement();
    //              ResultSet rs3 = st3.executeQuery(retireQuery);
    //              
    //              if(rs3.next()) 
    //                  jsonObject.addProperty("retireCount", rs3.getInt(1));
    //              
    //              rs3.close();
    //              st3.close();
    //              
    //          }
    //          catch(Exception e) {
    //              e.printStackTrace();
    //          }
    //          
    //          return jsonObject;
    //      }
    public JsonArray getApplicationFromPhaseDataTable(String phaseFilter,String waveFilter) {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        ArrayList<String> waves = new ArrayList<String>();
        try {
			if(phaseFilter.equals("All"))
			{     	       		
				String selectPhases = "select * from phase_info";
				st = con.prepareStatement(selectPhases);
				rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    String waveArray[] = rs.getString("value").split(",");
                    
                    for (String string : waveArray) {
                        waves.add(string);
                    }
                }
            }
            String[] allWave = new String[waves.size()];
            allWave = waves.toArray(allWave);
            jsonArray = (getWaveDetails(allWave, waveFilter));
				System.out.println("ALL PHASE");
			}

			if(!phaseFilter.equals("All"))
			{     	       		
				String selectPhases = "select * from phase_info where phasename like ?";
				st = con.prepareStatement(selectPhases);
				st.setString(1, "%"+phaseFilter+"%");
				rs = st.executeQuery();
				while (rs.next()) {
					if (rs.getString("column_name").equals("waves")) {
						String waveArray[] = rs.getString("value").split(",");
						for (String string : waveArray) {
							waves.add(string);
						}
					}
				}
				String[] allWave = new String[waves.size()];
				allWave = waves.toArray(allWave);
				jsonArray = (getWaveDetails(allWave, waveFilter));

				System.out.println("Phase Name is : "+phaseFilter);
			}
			st.close();
			rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    /*
     * public JsonArray getAppDetails() { JsonArray jsonArray = new JsonArray(); try
     * { ArrayList<String> app = new ArrayList<String>(); String selectApp =
     * "select * from opportunity_info where column_name='appName'"; Statement st =
     * con.createStatement(); ResultSet rs = st.executeQuery(selectApp); while
     * (rs.next()) { app.add(rs.getString("value")); } String[] apps = new
     * String[app.size()]; apps = app.toArray(apps);
     * jsonArray.addAll(getApplicationApprovalDataTable(apps)); rs.close();
     * st.close(); } catch (Exception e) { e.printStackTrace(); } return jsonArray;
     * }
     */
    
    private JsonArray getApplicationApprovalDataTable(String[] apps) {
        JsonArray jsonArray = new JsonArray();
        int i=0;
        
        try {
             List<String> list  = getphasewaveinfo( "All");

            for (String app : apps) {
                JsonObject jsonObject = new JsonObject();
                String selectApp = "select distinct ar.app_name,OppId from opportunity_info o inner join ArchiveReq_Roles_Info ar on o.Id=ar.oppId where column_name='appName' and value = ?";
                PreparedStatement st = con.prepareStatement(selectApp);
                         st.setString(1, app);
                         ResultSet rs = st.executeQuery();
                
                while (rs.next()) {
                 
                   for (String value: list) {
                                                
                                                if(value.equals(app)) {
                                                        
                                                        i++;
                                                        continue;
                                                        }
                                                if(i==1) {
                                                
                                    jsonObject.addProperty("phaseName", value);
                            
                            i++;
                            continue;
                                                        
                                                }
                                                
                                                if(i==2) {
                                                        
                                    jsonObject.addProperty("waveName", value);
                            
                            i++;
                                                }
                                                
                                                if(i==3) {
                                                        i=0;
                                                        break;
                                                }
                                                
                                        }
                    
                 
                    jsonObject.addProperty("app_name", rs.getString("app_name"));
                    String Id = rs.getString("OppId");

                    
                    String completionDateQuerry =    "select  * from decom3sixtytool.Archive_Execution_Info where oppId=? and level='1';";
                    PreparedStatement st01 = con.prepareStatement(completionDateQuerry);
                         st01.setString(1, Id);
                         ResultSet rs01 = st01.executeQuery();
                    if (rs01.next())
                        jsonObject.addProperty("targetCompletionDate", rs01.getString("planEnd"));
                    rs01.close();
                    st01.close();
 
                    
                    jsonObject.addProperty("DesignApproval", "No");
                    jsonObject.addProperty("Nanda", rs.getString("OppId"));
                    // System.out.println("OppId: " + Id);
                    String selectAppdetail = "select * from ArchiveReq_Roles_Info where OppId = ? and priority_order_num!=''";
                    PreparedStatement st11 = con.prepareStatement(selectAppdetail);
                         st11.setString(1, Id);
                         ResultSet rs11 = st11.executeQuery();
                    boolean flag = rs11.next();
                    if (!rs11.next())
                        jsonObject.addProperty("status", "0%");
                    rs11.close();
                    st11.close();
                    String selectCreationDate = "select value from opportunity_info where column_name='creation_date' and  Id = ?";
                    PreparedStatement st2 = con.prepareStatement(selectCreationDate);
                         st2.setString(1, Id);
                         ResultSet rs2 = st2.executeQuery();
                    if (rs2.next())
                        jsonObject.addProperty("craetionDate", rs2.getString("value"));
                    rs2.close();
                    st2.close();
                    if (flag == true) {
                         String selectStatusLI = "select * from `decom3sixtytool`.`ArchiveReq_LegacyApp_Info` where mandatory='YES' and Id= ? and value =''";
                        PreparedStatement st9 = con.prepareStatement(selectStatusLI);
                                 st9.setString(1, Id);
                                 ResultSet rs9 = st9.executeQuery();
                        boolean Li = rs9.next();
                        rs9.close();
                        st9.close();
                        if (Li == true) {
                            jsonObject.addProperty("status", "0%");
                        } else {
                            jsonObject.addProperty("status", "25%");
                            if (Li == false) {
                                 String selectStatusRC = "select * from `decom3sixtytool`.`Archive_Retention_Info`   where OppId= ? and retentionCheck='true'";
                                PreparedStatement st8 = con.prepareStatement(selectStatusRC);
                                         st8.setString(1, Id);
                                         ResultSet rs8 = st8.executeQuery();
                                boolean Rc = rs8.next();
                                rs8.close();
                                st8.close();
                                if (Rc == true) {
                                    jsonObject.addProperty("status", "50%");
                                    String selectStatusBR1 = "select  * from `decom3sixtytool`.`Archive_DataReq_Info`  where OppId= ? and reqInScope=''";
                                    PreparedStatement st4 = con.prepareStatement(selectStatusBR1);
                                         st4.setString(1, Id);
                                         ResultSet rs4 = st4.executeQuery();
                                    boolean Br1 = rs4.next();
                                    rs4.close();
                                    st4.close();
                                    String selectStatusBR2 = "select  * from `decom3sixtytool`.`Archive_RetentionLegalReq_Info`  where OppId= ? and reqInScope=''";
                                    PreparedStatement st5 = con.prepareStatement(selectStatusBR2);
                                         st5.setString(1, Id);
                                         ResultSet rs5 = st5.executeQuery();
                                    boolean Br2 = rs5.next();
                                    rs5.close();
                                    st5.close();
                                    String selectStatusBR3 = "select  * from `decom3sixtytool`.`Archive_SecurityReq_Info`  where OppId= ? and reqInScope=''";
                                    PreparedStatement st6 = con.prepareStatement(selectStatusBR3);
                                         st6.setString(1, Id);
                                         ResultSet rs6 = st6.executeQuery();
                                    boolean Br3 = rs6.next();
                                    rs6.close();
                                    st6.close();
                                    String selectStatusBR4 = "select  * from `decom3sixtytool`.`Archive_UsabilityReq_Info`  where OppId= ? and reqInScope=''";
                                    PreparedStatement st7 = con.prepareStatement(selectStatusBR4);
                                         st7.setString(1, Id);
                                         ResultSet rs7 = st7.executeQuery();
                                    boolean Br4 = rs7.next();
                                    rs7.close();
                                    st7.close();
                                    String selectStatusBR5 = "select  * from `decom3sixtytool`.`Archive_AuditReq_Info`  where OppId= ? and reqInScope=''";
                                    PreparedStatement st12 = con.prepareStatement(selectStatusBR5);
                                         st12.setString(1, Id);
                                         ResultSet rs12 = st12.executeQuery();
                                    boolean Br5 = rs12.next();
                                    rs12.close();
                                    st12.close();
                                    if (Br1 == false && Br2 == false && Br3 == false && Br4 == false && Br5 == false) {
                                        jsonObject.addProperty("status", "75%");
                                        String selectStatus = "select intakeApproval from ArchiveReq_Roles_Info where  OppId = ? and priority_order_num is not null and priority_order_num!='' and intakeApproval in ('Decision pending','Rejected')";
                                        PreparedStatement st3 = con.prepareStatement(selectStatus);
                                                 st3.setString(1, Id);
                                                 ResultSet rs3 = st3.executeQuery();
                                        boolean approvalstatus = rs3.next();
                                        rs3.close();
                                        st3.close();
                                        String selectStatusApproved = "select intakeApproval from ArchiveReq_Roles_Info where  OppId = ? and priority_order_num is not null and priority_order_num!='' and intakeApproval='Approved'";
                                        PreparedStatement st10 = con.prepareStatement(selectStatusApproved);
                                                 st10.setString(1, Id);
                                                 ResultSet rs10 = st10.executeQuery();
                                        boolean approvalstatusApproved = rs10.next();
                                        rs3.close();
                                        st3.close();
                                        if (approvalstatus == false && approvalstatusApproved == true) {
                                            jsonObject.addProperty("status", "100%");
                                            jsonObject.addProperty("DesignApproval", "Yes");
                                        }
                                    }
                                }
                            }
                        }
                    }
                    jsonArray.add(jsonObject);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    public List<String> getphasewaveinfo(String  phaseFilter) {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
              List<String> list = new LinkedList<String>();

        try {
			if(phaseFilter.equals("All"))
			{
				String selectPhases = "select * from phase_info";
				st = con.prepareStatement(selectPhases);
				rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    String waves[] = rs.getString("value").split(",");
                    if(waves[0].equals(""))
                    {
                         continue;
                    }
                    list=(getWaveinfo(waves, rs.getString("phaseName")));
                }
            }
            }
			if(!phaseFilter.equals("All"))
			{
				String selectPhases = "select * from phase_info where phaseName like ? ";
				st=con.prepareStatement(selectPhases);
				st.setString(1, "%"+phaseFilter+"%");
				rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    String waves[] = rs.getString("value").split(",");
                    if(waves[0].equals(""))
                    {
                         continue;
                    }
                    list=(getWaveinfo(waves, rs.getString("phaseName")));
                }
            }
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println();
        return list;
         
}
    
    private  List<String> getWaveinfo(String[] waves, String phase) {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        List<String> list = new LinkedList<String>();

        try {
            for (String wave : waves) {
				String selectWaves = "select * from governance_info where waveName=?";
				st = con.prepareStatement(selectWaves);
				st.setString(1, wave);
				rs = st.executeQuery();
                while (rs.next()) {
                    if (rs.getString("column_name").equals("apps")) {
                        String apps[] = rs.getString("value").split(",");
                        list=(getApplicationinfo(apps, rs.getString("waveName"), phase));
                    }
                }
                }
                rs.close();
                st.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    private  List<String> getApplicationinfo(String[] apps, String wave, String phase) {
        JsonArray jsonArray = new JsonArray();
      
        try {
            for (String app : apps) {
                JsonObject jsonObject = new JsonObject();
//                String selectApp = "select * from opportunity_info where column_name='appName' and value = '" + app
//                        + "'";
//                Statement st = con.createStatement();
//                ResultSet rs = st.executeQuery(selectApp);
//                while (rs.next()) {
                mainList.add( app);
                mainList.add( phase);
                mainList.add( wave);
                    

                }
//                rs.close();
//                st.close();
//            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return mainList;
        
 }
    
    private JsonArray getWaveDetails(String[] waves, String wavestatus) {
        JsonArray jsonArray = new JsonArray();
        ArrayList<String> allappsList = new ArrayList<String>();
        String apps[] = {};
        String[] allapp = {};
        try {
            if (wavestatus.equals("All")) {
                for (String wave : waves) {
                  String selectWaves = "select * from governance_info where waveName=?";
                     PreparedStatement st = con.prepareStatement(selectWaves);
                                  st.setString(1, wave);
                                  ResultSet rs = st.executeQuery();
                    while (rs.next()) {
                        if (rs.getString("column_name").equals("apps")) {
                            if (rs.getString("value").isEmpty() == false) {
                                apps = rs.getString("value").split(",");
                                System.out.println("app length: " + apps.length);
                                for (String string : apps) {
                                    allappsList.add(string);
                                }
                            }
                        }
                    }
                    System.out.println("All apps: " + allappsList);
                    allapp = new String[allappsList.size()];
                    allapp = allappsList.toArray(allapp);
                    rs.close();
                    st.close();
                }
                if (allapp.length > 0) {
                    jsonArray = getApplicationDetails(allapp);
                } 
            } else {
                 String selectWaves = "select * from governance_info where waveName=?";
                PreparedStatement st = con.prepareStatement(selectWaves);
                          st.setString(1, wavestatus);
                          ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    if (rs.getString("column_name").equals("apps")) {
                        if (rs.getString("value").isEmpty() == false) {
                            apps = rs.getString("value").split(",");
                        }
                    }
                }
                if (apps.length > 0) {
                    jsonArray = getApplicationDetails(apps);
                } 
                rs.close();
                st.close();
            }

    } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    
    private JsonArray getApplicationDetails(String[] apps) {
        boolean check1 = false;
        boolean check2 = false;
        boolean check3 = false;
        boolean check4 = false;
                int i=0;

        JsonArray jsonArray = new JsonArray();
        
        
        try {
              
             List<String> list  = getphasewaveinfo( "All");
         

            for (String app : apps) {
                 
                JsonObject jsonObject = new JsonObject();
                String selectApp = "select * from opportunity_info where column_name='appName' and value = ?";
                PreparedStatement st = con.prepareStatement(selectApp);
                         st.setString(1, app);
                         ResultSet rs = st.executeQuery();
                while (rs.next()) {
                 for (String value: list) {
                                                
                                                if(value.equals(app)) {
                                                        check3=true;
                                                        
                                                        i++;
                                                        continue;
                                                        }
                                                if(check3==true) {
                                                
                                    jsonObject.addProperty("phaseName", value);
                            check3=false;
                            i++;
                                                        
                                                }if(i==2) {
                                                        i=0;
                                                        break;
                                                }
                                                
                                        }
                    jsonObject.addProperty("appName", app);
                    String Id = rs.getString("Id");

                    String completionDateQuerry =    "select  * from decom3sixtytool.Archive_Execution_Info where oppId=? and level='1';";
                    PreparedStatement st01 = con.prepareStatement(completionDateQuerry);
                         st01.setString(1, Id);
                         ResultSet rs01 = st01.executeQuery();
                    if (rs01.next())
                        jsonObject.addProperty("completionTarget", rs01.getString("planEnd"));
                    rs01.close();
                    st01.close();
 
                    // jsonObject.addProperty("waveName", wave);
                    // jsonObject.addProperty("endDate", "14-02-2022");
                    // System.out.println("OppId: " + Id);
                    String selectAppType = "select * from opportunity_info where column_name='request_type' and  Id = ?";
                    
                    PreparedStatement st1 = con.prepareStatement(selectAppType);
                         st1.setString(1, Id);
                         ResultSet rs1 = st1.executeQuery();
                    if (rs1.next())
                        jsonObject.addProperty("appType", rs1.getString("value"));
                    rs1.close();
                    st1.close();
                /*  String selectAppOwner = "select * from opportunity_info where column_name='appowner' and  Id = '"
                            + Id + "'";
                    Statement st2 = con.createStatement();
                    ResultSet rs2 = st2.executeQuery(selectAppOwner);
                    if (rs2.next())
                        jsonObject.addProperty("owner", rs2.getString("value"));
                    rs2.close();
                    st2.close();
                    String selectStatus = "select intakeApproval from Intake_Stake_Holder_Info where  OppId = '" + Id
                            + "' and priority_order_num is not null";
                    Statement st3 = con.createStatement();
                    ResultSet rs3 = st3.executeQuery(selectStatus);
                    boolean intakestatus = rs3.next();
                    while (rs3.next()) {
                        if (rs3.getString("intakeApproval").equals("Decision pending")) {
                            jsonObject.addProperty("appStatus", "Intake");
                            jsonObject.addProperty("progress", "25%");
                            check1 = true;
                            break;
                        }
                    }
                    rs3.close();
                    st3.close();
                    if (intakestatus == false) {
                        jsonObject.addProperty("appStatus", "Yet To Start");
                        jsonObject.addProperty("progress", "0%");
                    }
                    boolean archiverequirementstatus = false;
                    if (check1 == false) {
                        System.out.println("Id kya hai :"+Id);
                        String selectStatus1 = "select intakeApproval from ArchiveReq_Roles_Info where  OppId = '" + Id
                                + "' and priority_order_num!='' and intakeApproval is not null";
                        Statement st4 = con.createStatement();
                        ResultSet rs4 = st4.executeQuery(selectStatus1);
                        archiverequirementstatus = rs4.next();
                        while (rs4.next()) {
                            if (rs4.getString("intakeApproval").equals("Decision pending")) {
                                jsonObject.addProperty("appStatus", "Archieve Requirements");
                                jsonObject.addProperty("progress", "50%");
                                check2 = true;
                                break;
                            }
                        }
                        rs4.close();
                        st4.close();
                    }
                    if (check1 == false && check2 == false && intakestatus == true
                            && archiverequirementstatus == true) {
                        String selectStatus2 = "select * from archive_execution_info where  OppId = '" + Id + "'";
                        Statement st5 = con.createStatement();
                        ResultSet rs5 = st5.executeQuery(selectStatus2);
                        if (rs5.next()) {
                            jsonObject.addProperty("appStatus", "Archieve Execution");
                            jsonObject.addProperty("progress", "75%");
                        }
                        rs5.close();
                        st5.close();
                    } */
                    String selectSubmittedDate = "select distinct submittedDate from Intake_Stake_Holder_Info where  OppId = ? and priority_order_num is not null";
                    PreparedStatement st6 = con.prepareStatement(selectSubmittedDate);
                         st6.setString(1, Id);
                         ResultSet rs6 = st6.executeQuery();
                    while (rs6.next()) {
                        jsonObject.addProperty("submittedDate", rs6.getString("submittedDate"));
                    }
                    rs6.close();
                    st6.close();
                    String selectDecomAnalyst = "select value from Triage_Info where  Id = ? and column_name='decomAnalyst'";
                    PreparedStatement st7 = con.prepareStatement(selectDecomAnalyst);
                         st7.setString(1, Id);
                         ResultSet rs7 = st7.executeQuery();
                    while (rs7.next()) {
                        jsonObject.addProperty("decomAnalyst", rs7.getString("value"));
                    }
                    rs7.close();
                    st7.close();
                    String ArchiveRequired = "Yes";
                    String selectArchiveRequired = "select value from Assessment_Compliance_Char_Info where  Id = ? and column_name='archivalrequired'";
                    PreparedStatement st8 = con.prepareStatement(selectArchiveRequired);
                         st8.setString(1, Id);
                         ResultSet rs8 = st8.executeQuery();
                    while (rs8.next()) {
                        if (!rs8.getString("value").equals("")) {
                            ArchiveRequired = rs8.getString("value");
                        }
                        jsonObject.addProperty("ArchiveRequired", ArchiveRequired);
                    }
                    rs8.close();
                    st8.close();
                    jsonArray.add(jsonObject);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        mainList.clear();
        return jsonArray;
    }
    
    
    public JsonObject dashboardCardDetails() {
		PreparedStatement st=null,st1=null,st2=null;
		ResultSet rs=null,rs1=null,rs2=null;
        JsonObject jsonObject = new JsonObject();
        try {
            String selectQuery = "select count(*) from phase_info where column_name = 'phaseName';";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
            int countPhase = 0;
            if (rs.next())
                countPhase = rs.getInt(1);
            rs.close();
            st.close();
            String selectQuery1 = "select count(*) from governance_info where column_name = 'waveName';";
			st1 = con.prepareStatement(selectQuery1);
			rs1 = st1.executeQuery();
            int countWave = 0;
            if (rs1.next())
                countWave = rs1.getInt(1);
            rs1.close();
            st1.close();
            // String selectQuery2 = "select count(*) from opportunity_info where
            // column_name = 'appName';";
            int countIntake = 0;
            String selectQuery2 = "select distinct Id from decom3sixtytool.Opportunity_Info oi left join decom3sixtytool.Intake_Stake_Holder_Info ish on ish.OppId=oi.Id ;";
			st2 = con.prepareStatement(selectQuery2);
			rs2 = st2.executeQuery();
            int countOpportunity = 0;
            while (rs2.next()) {
                String Id = rs2.getString("Id");
                String selectIntakeCount = "select * from decom3sixtytool.Intake_Stake_Holder_Info where intakeApproval='Approved' and priority_order_num=(select Max(priority_order_num) from decom3sixtytool.Intake_Stake_Holder_Info where OppId=?)and OppId=?;";
                PreparedStatement statement = con.prepareStatement(selectIntakeCount);
                statement.setString(1, Id);
                statement.setString(2, Id);
                         ResultSet rset = statement.executeQuery();
                if (rset.next()) {
                    countOpportunity++;
                } else
                    countIntake++;
                //countOpportunity = rs2.getInt(1);
            }
            rs2.close();
            st2.close();
            /*   String selectQuery3 = "select count(distinct oi.Id) from decom3sixtytool.Opportunity_Info oi left join decom3sixtytool.Intake_Stake_Holder_Info ish on ish.OppId=oi.Id "
                        + "where column_name='appName' and oi.Id not in (select OppId from decom3sixtytool.Intake_Stake_Holder_Info where intakeApproval='Approved');";
                Statement st3 = con.createStatement();
                ResultSet rs3 = st3.executeQuery(selectQuery3);
                if (rs3.next())
                    countIntake = rs3.getInt(1);
                rs3.close();
                st3.close();*/
            System.out.println("-===========================----------=------------countPhase : "+countPhase );
            System.out.println("-===========================----------=------------waveCount : "+countWave );
            System.out.println("-===========================----------=------------countOpportunity : "+countOpportunity );
            System.out.println("-===========================----------=------------countIntake : "+countIntake );
            jsonObject.addProperty("phaseCount", countPhase);
            jsonObject.addProperty("waveCount", countWave);
            jsonObject.addProperty("appCount", countOpportunity);
            jsonObject.addProperty("intakeCount", countIntake);
			rs.close();
			st.close();
			rs1.close();
			st1.close();
			rs2.close();
			st2.close();			
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    
    
    public JsonObject donetChartDetails() {
		PreparedStatement st=null,st1=null,st2=null;
		ResultSet rs=null,rs1=null,rs2=null;
        JsonObject jsonObject = new JsonObject();
        try {
            String Query = "select distinct(Id) from opportunity_info;";
			st = con.prepareStatement(Query);
			rs = st.executeQuery();
            while (rs.next()) {
                String oppId = rs.getString(1);
                String moduleNames[] = { "Intake", "Requirments", "ArchiveExecution", "DecommissionExecution" };
                for (String moduleName : moduleNames) {
                    boolean checkCurrentPhase = true;
                    if (!moduleName.equals("Requirments")) {
                         String selectQuery = "select * from module_approval_info where moduleName = ? and OppId = ?";
						st1 = con.prepareStatement(selectQuery);
                                 st1.setString(1, moduleName);
                                 st1.setString(2, oppId);
						rs1 = st1.executeQuery();
                        if (rs1.next()) {
                            if (rs1.getBoolean(4))
                                checkCurrentPhase = false;
                        }
                    } else {
                         String selectQuery1 = "select * from opportunity_info where Id = ? and column_name = 'request_type';";
						st2 = con.prepareStatement(selectQuery1);
                                 st2.setString(1, oppId);
						rs2 = st2.executeQuery();
                        if (rs2.next())
                            checkCurrentPhase = getReqApproval(rs2.getString("value"), oppId);
                    }
                    if (checkCurrentPhase) {
                        setModuleCount(moduleName);
                        break;
                    }
                }
                totalCount++;
				rs1.close();
				st1.close();
            }
            rs.close();
            st.close();
            jsonObject = getPhasePercentage();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    
    
    private void setModuleCount(String moduleName) {
        try {
            switch (moduleName) {
                case "Intake":
                    intakeCount++;
                    break;
                case "Requirments":
                    reqCount++;
                    break;
                case "ArchiveExecution":
                    archiveExeCount++;
                    break;
                case "DecommissionExecution":
                    decomExeCount++;
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private boolean getReqApproval(String reqType, String oppId) {
        boolean checkPhase = true;
        try {
            switch (reqType) {
                case "Archive":
                    checkPhase = getReqInfo("Archive_Requirement", oppId);
                    break;
                case "Decommission":
                    checkPhase = getReqInfo("Decommission_Requirement", oppId);
                    break;
                case "Archive+Decommission":
                    if (!getReqInfo("Archive_Requirement", oppId) && !getReqInfo("Decommission_Requirement", oppId))
                        checkPhase = false;
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return checkPhase;
    }
    private boolean getReqInfo(String phaseName, String oppId) {
        boolean checkPhase = true;
        try {
            String selectQuery = "select * from module_approval_info where moduleName = ? and OppId = ?";
            PreparedStatement st = con.prepareStatement(selectQuery);
                        st.setString(1, phaseName);
                        st.setString(2, oppId);
                        ResultSet rs = st.executeQuery();
            if (rs.next())
                if (rs.getBoolean(4))
                    checkPhase = false;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return checkPhase;
    }
    private JsonObject getPhasePercentage() {
        JsonObject jsonObject = new JsonObject();
        try {
            /*
             * float oppPercentage = (totalCount != 0)? (100/(float)totalCount) : 0; float
             * intakePercentage = intakeCount * oppPercentage; float reqPercentage =
             * reqCount * oppPercentage; float archiveExePercentage = archiveExeCount *
             * oppPercentage; float decomExePercentage = decomExeCount * oppPercentage;
             */
            jsonObject.addProperty("intakeCount", intakeCount);
            jsonObject.addProperty("reqCount", reqCount);
            jsonObject.addProperty("archiveExeCount", archiveExeCount);
            jsonObject.addProperty("decomExeCount", decomExeCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    public JsonArray getOppNameList() {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        try {
            boolean checkFirstOpportunity = true;
            String selectQuery = "select * from opportunity_info where column_name = 'appName'";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
            while (rs.next()) {
                if (checkFirstOpportunity) {
                    dashboardGanttChartService ganttChart = new dashboardGanttChartService(rs.getString("value"));
                    GanttChartJsonArray = ganttChart.getArchiveExecution();
                    ganttChart = null;
                    checkFirstOpportunity = false;
                }
                jsonArray.add(rs.getString("value"));
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonObject getPieChartDetails() {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            int archiveCount = 0, decomissionCount = 0, retiredCount = 0;
            String selectQuery = "SELECT * FROM opportunity_info where column_name='request_type';";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
            while (rs.next()) {
                String value = rs.getString("value");
                if (value.equals("Archive")) {
                    archiveCount++;
                }
                if (value.equals("Decommission")) {
                    decomissionCount++;
                }
                if (value.equals("Archive+Decommission")) {
                    retiredCount++;
                }
            }
            jsonObject.addProperty("archiveCount", archiveCount);
            jsonObject.addProperty("decommissionCount", decomissionCount);
            jsonObject.addProperty("retiredCount", retiredCount);
            jsonArray.add(jsonObject);
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    protected void finalize() throws Throwable {
        con.close();
    }
    public JsonArray getAppIssueCount() {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            String todaysdate = sdf.format(date);
            int issueCount = 0, riskCount = 0, deadlineCount = 0;
            String selectQuery = "SELECT * FROM ArchiveExe_Issue_Info;";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
            while (rs.next()) {
                String type = rs.getString("type");
                String resolved = rs.getString("resolved");
                String expDtae = rs.getString("exp_date");
                if (type.equals("ISSUE") && !resolved.equals("COMPLETED") && !resolved.equals("CANCELLED")) {
                    issueCount++;
                }
                if (type.equals("RISK") && !resolved.equals("COMPLETED") && !resolved.equals("CANCELLED")) {
                    riskCount++;
                }
                if (!expDtae.equals("")) {
                    if (sdf.parse(expDtae).before(sdf.parse(todaysdate)) && !resolved.equals("COMPLETED") &&
                        !resolved.equals("CANCELLED") && rs.getString("end_date") != null && expDtae != null) {
                        deadlineCount++;
                    }
                }
            }
            if (issueCount < 10) {
                String issue = String.format("%02d", issueCount);
                jsonObject.addProperty("issueCount", issue);
            } else {
                jsonObject.addProperty("issueCount", issueCount);
            }
            if (riskCount < 10) {
                String risk = String.format("%02d", riskCount);
                jsonObject.addProperty("riskCount", risk);
            } else {
                jsonObject.addProperty("riskCount", riskCount);
            }
            if (deadlineCount < 10) {
                String deadline = String.format("%02d", deadlineCount);
                jsonObject.addProperty("deadlineCount", deadline);
            } else {
                jsonObject.addProperty("deadlineCount", deadlineCount);
            }
            jsonArray.add(jsonObject);
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    /*
     * public JsonArray getDataCharDetails() { JsonArray jsonArray = new
     * JsonArray(); try { ArrayList<String> app = new ArrayList<String>(); String
     * selectApp = "select * from opportunity_info where column_name='appName'";
     * Statement st = con.createStatement(); ResultSet rs =
     * st.executeQuery(selectApp); while (rs.next()) {
     * app.add(rs.getString("value")); } String[] apps = new String[app.size()];
     * apps = app.toArray(apps); jsonArray.addAll(getDataCharDataTable(apps));
     * rs.close(); st.close(); } catch (Exception e) { e.printStackTrace(); } return
     * jsonArray; }
     */
    public JsonArray getDataCharDataTable() {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            int DB2Count = 0, MSSQLCount = 0, MySqlCount = 0, OracleCount = 0, SybaseCount = 0, OtherCount = 0;
            String selectQuery = "SELECT * FROM decom3sixtytool.assessment_data_char_info where column_name='DatabaseType' and value!='';";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
            while (rs.next()) {
                String value = rs.getString("value");
                if (value.equals("DB2")) {
                    DB2Count++;
                }
                if (value.equals("MS SQL")) {
                    MSSQLCount++;
                }
                if (value.equals("MySQL")) {
                    MySqlCount++;
                }
                if (value.equals("Oracle")) {
                    OracleCount++;
                }
                if (value.equals("Sybase")) {
                    SybaseCount++;
                }
                if (value.equals("Other")) {
                    OtherCount++;
                }
            }
            double totalCount = DB2Count + MSSQLCount + MySqlCount + OracleCount + OtherCount + SybaseCount;
            DecimalFormat f = new DecimalFormat("##.##");
            String Db2Percent = String.valueOf(f.format((DB2Count * 50) / totalCount)) + "%";
            String msSqlPercent = String.valueOf(f.format((MSSQLCount * 50) / totalCount)) + "%";
            String mySqlPercent = String.valueOf(f.format((MySqlCount * 50) / totalCount)) + "%";
            String oraclePercent = String.valueOf(f.format((OracleCount * 50) / totalCount)) + "%";
            String sybasePercent = String.valueOf(f.format((SybaseCount * 50) / totalCount)) + "%";
            String OtherPercent = String.valueOf(f.format((OtherCount * 50) / totalCount)) + "%";
            jsonObject.addProperty("db2Percent", Db2Percent);
            jsonObject.addProperty("msSqlPercent", msSqlPercent);
            jsonObject.addProperty("mySqlPercent", mySqlPercent);
            jsonObject.addProperty("oraclePercent", oraclePercent);
            jsonObject.addProperty("sybasePercent", sybasePercent);
            jsonObject.addProperty("otherPercent", OtherPercent);
            jsonArray.add(jsonObject);
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonArray getApplicationArchiveReqDataFromPhase(String phaseFilter,String waveFilter) {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        ArrayList<String> waves = new ArrayList<String>();
        try {
			if(phaseFilter.equals("All"))
			{
				String selectPhases = "select * from phase_info";
				st = con.prepareStatement(selectPhases);
				rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    if (rs.getString("value").isEmpty() == false) {
                        String waveArray[] = rs.getString("value").split(",");
                        for (String string : waveArray) {
                            waves.add(string);
                        }
                    }
                }
            }
            
            String[] allWave = new String[waves.size()];
            allWave = waves.toArray(allWave);
            jsonArray = (getArchiveReqWaveDetails(allWave, waveFilter));
            rs.close();
            st.close();
			}
			if(!phaseFilter.equals("All"))
			{
				String selectPhases = "select * from phase_info where phaseName like ?";
				st = con.prepareStatement(selectPhases);
				st.setString(1, "%"+phaseFilter+"%");
				rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    if (rs.getString("value").isEmpty() == false) {
                        String waveArray[] = rs.getString("value").split(",");
                        for (String string : waveArray) {
                            waves.add(string);
                        }
                    }
                }
            }
            
            String[] allWave = new String[waves.size()];
            allWave = waves.toArray(allWave);
            jsonArray = (getArchiveReqWaveDetails(allWave, waveFilter));
            rs.close();
            st.close();
			}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    

    private JsonArray getArchiveReqWaveDetails(String[] waves, String wavestatus) {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
      ArrayList<String> allappsList = new ArrayList<String>();
      String apps[] = {};
      String[] allapp = {};
      try {
          if (wavestatus.equals("All")) {
              for (String wave : waves) {
                   String selectWaves = "select * from governance_info where waveName=?";
					st = con.prepareStatement(selectWaves);
                         st.setString(1, wave);
					rs = st.executeQuery();
                  while (rs.next()) {
                      if (rs.getString("column_name").equals("apps")) {
                          if (rs.getString("value").isEmpty() == false) {
                              apps = rs.getString("value").split(",");
                              System.out.println("app length: " + apps.length);
                              for (String string : apps) {
                                  allappsList.add(string);
                              }
                          }
                      }
                  }
                  System.out.println("All apps: " + allappsList);
                  allapp = new String[allappsList.size()];
                  allapp = allappsList.toArray(allapp);
                  rs.close();
                  st.close();
              }
              if (allapp.length > 0) {
                  jsonArray = getApplicationApprovalDataTable(allapp);
              } 
          } else {
				String selectWaves = "select * from governance_info where waveName=?";
				st=con.prepareStatement(selectWaves);
				st.setString(1, wavestatus);
				rs = st.executeQuery();
              while (rs.next()) {
                  if (rs.getString("column_name").equals("apps")) {
                      if (rs.getString("value").isEmpty() == false) {
                          apps = rs.getString("value").split(",");
                      }
                  }
              }
              if (apps.length > 0) {
                  jsonArray = getApplicationApprovalDataTable(apps);
              } 
              rs.close();
              st.close();
          }

  } catch (Exception e) {
          e.printStackTrace();
      }
      return jsonArray;
  }
    
    public JsonArray getDoughnutIntakeDetail() {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        try {
            ArrayList<String> app = new ArrayList<String>();
            String selectApp = "select * from opportunity_info where column_name='appName'";
			st = con.prepareStatement(selectApp);
			rs = st.executeQuery();
            while (rs.next()) {
                app.add(rs.getString("value"));
            }
            String[] apps = new String[app.size()];
            apps = app.toArray(apps);
            jsonArray.addAll(getIntakeDetail(apps));
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    
    public JsonArray getIntakeDetail(String apps[]) {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            int triageCount = 0, assesmentCount = 0, completedCount = 0, newOpp = 0, pendApproval = 0;
            for (String app : apps) {
                 String selectApp = "select * from opportunity_info where column_name='appName' and value = ?";
                PreparedStatement st = con.prepareStatement(selectApp);
                         st.setString(1, app);
                         ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    String Id = rs.getString("Id");
                    System.out.println("OppId :"+Id);
                    String selectNewOppInTriQuery = "select * from decom3sixtytool.Triage_Info where Id=?;";
                    PreparedStatement st21 = con.prepareStatement(selectNewOppInTriQuery);
                         st21.setString(1, Id);
                         ResultSet rs21 = st21.executeQuery();
                    if(rs21.next()) {
                         String selectNewOppQuery = "select * from decom3sixtytool.Triage_Info where mandatory='yes' and value='' and Id=?;";
                        PreparedStatement st17 = con.prepareStatement(selectNewOppQuery);
                                 st17.setString(1, Id);
                                 ResultSet rs17 = st17.executeQuery();
                    if (rs17.next()) {
                         newOpp++;
                    }
                    else {
                    String selectTriagedetail = "select * from decom3sixtytool.triage_summary_info where isCompleted='No' and Id=?;";
                    PreparedStatement st12 = con.prepareStatement(selectTriagedetail);
                         st12.setString(1, Id);
                         ResultSet rs12 = st12.executeQuery();
                    boolean triage = rs12.next();
                    rs12.close();
                    st12.close();
                    if (triage) {
                         triageCount++;
                    } else {
//                        String assappInfoQuery = "select * from decom3sixtytool.Assessment_Application_Info where mandatory='Yes' and value='' and Id='"
//                                + Id + "';";
//                        Statement st13 = con.createStatement();
//                        ResultSet rs13 = st13.executeQuery(assappInfoQuery);
//                        boolean assappIn = rs13.next();
//                        rs13.close();
//                        st13.close();
                        String assappArchConsQuery = "select * from decom3sixtytool.Assessment_Archival_Consumption_Info where mandatory='Yes' and value='' and isCompleted='No' and Id=?;";
                        PreparedStatement st14 = con.prepareStatement(assappArchConsQuery);
                                 st14.setString(1, Id);
                                 ResultSet rs14 = st14.executeQuery();
                        boolean assappArchCon = rs14.next();
                        rs14.close();
                        st14.close();
//                        String assappArchCompCharQuery = "select * from decom3sixtytool.Assessment_Compliance_Char_Info where mandatory='Yes' and value= '' and Id='"
//                                + Id + "';";
//                        Statement st15 = con.createStatement();
//                        ResultSet rs15 = st15.executeQuery(assappArchCompCharQuery);
//                        boolean assappArchComCha = rs15.next();
//                        rs15.close();
//                        st15.close();
//                        String assDataCharacterQuery = "select * from decom3sixtytool.Assessment_Data_Char_Info where mandatory='Yes' and value= '' and Id='"
//                                + Id + "';";
//                        Statement st16 = con.createStatement();
//                        ResultSet rs116 = st16.executeQuery(assDataCharacterQuery);
//                        boolean assDataChar = rs116.next();
//                        rs116.close();
//                        st16.close();
//                        System.out.println(assappIn+" "+assappArchCon+" "+assappArchComCha+" "+assDataChar);
//                        if (assappIn == true || assappArchCon == true || assappArchComCha == true
//                                || assDataChar == true) {
                        if(assappArchCon) {
                            System.out.println("Asscess m ayaa");
                            assesmentCount++;
                        } else  {
                         String selectAppdetail = "select intakeApproval,max(priority_order_num) pr,OppId from Intake_Stake_Holder_Info where priority_order_num!='' and intakeApproval is not null and OppId = ? group by intakeApproval,OppId";
                            PreparedStatement st11 = con.prepareStatement(selectAppdetail);
                                 st11.setString(1, Id);
                                 ResultSet rs11 = st11.executeQuery();
                            while (rs11.next()) {
                                String value = rs11.getString("intakeApproval");
                                System.out.println("I approval :"+value);
                                if (value.equals("Decision pending") || value.equals("Rejected")) {
                                    System.out.println("pending m aaya");
                                    pendApproval++;
                                } else if (value.equals("Approved")) {
                                    
                                    String selectCompleted = "select * from Intake_Stake_Holder_Info where isCompleted='Yes' and OppId = ?;";
                                    PreparedStatement st20 = con.prepareStatement(selectCompleted);
                                         st20.setString(1, Id);
                                         ResultSet rs20 = st20.executeQuery();
                                    boolean completed=rs20.next();
                                    if(completed) {
                                         completedCount++;
                                    }                                    
                                    rs20.close();
                                    st20.close();
                                }
                            }
                            rs11.close();
                            st11.close();
                        }
                    }
                    /*
                     * if(checkData==false) { yestoStartCount++; }
                     */
                }
                    rs17.close();
                st17.close();  
                
                }
                else {
                 newOpp++;
                }
                
                rs21.close();
                st21.close();
                }
                rs.close();
                st.close();
            }
              double totalCount = newOpp + triageCount + assesmentCount + pendApproval + completedCount;
            DecimalFormat f = new DecimalFormat("##.##");
             double newOpportunity = Double.parseDouble(f.format((newOpp * 100) / totalCount));
            double triage = Double.parseDouble(f.format((triageCount * 100) / totalCount));
            double assesment = Double.parseDouble(f.format((assesmentCount * 100) / totalCount));
            double pendingApproval = Double.parseDouble(f.format((pendApproval * 100) / totalCount));
            double completed = Double.parseDouble(f.format((completedCount * 100) / totalCount));
            jsonObject.addProperty("newOpportunity", newOpportunity);
            jsonObject.addProperty("triage", triage);
            jsonObject.addProperty("assesment", assesment);
            jsonObject.addProperty("pendingApproval", pendingApproval);
            jsonObject.addProperty("completed", completed);
            jsonArray.add(jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    
    
    public JsonArray getArchiveExeDataFromPhase(String phaseFilter,String waveFilter) {
		PreparedStatement st=null;
		ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        ArrayList<String> waves = new ArrayList<String>();

        try {
			if(phaseFilter.equals("All"))
			{
				String selectPhases = "select * from phase_info";
				st = con.prepareStatement(selectPhases);
				rs = st.executeQuery();
            
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    if (rs.getString("value").isEmpty() == false) {
                        String waveArray[] = rs.getString("value").split(",");
                        for (String string : waveArray) {
                            waves.add(string);
                        }
                    }
                }
            }
            
            String[] allWave = new String[waves.size()];
            allWave = waves.toArray(allWave);
            jsonArray = (getArchiveExeWaveDetails(allWave, waveFilter));
            rs.close();
            st.close();
			}
			if(!phaseFilter.equals("All"))
			{
				String selectPhases = "select * from phase_info where phaseName like ?";
				st = con.prepareStatement(selectPhases);
				st.setString(1, "%"+phaseFilter+"%");
				rs = st.executeQuery();
            
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    if (rs.getString("value").isEmpty() == false) {
                        String waveArray[] = rs.getString("value").split(",");
                        for (String string : waveArray) {
                            waves.add(string);
                        }
                    }
                }
            }
            
            String[] allWave = new String[waves.size()];
            allWave = waves.toArray(allWave);
            jsonArray = (getArchiveExeWaveDetails(allWave, waveFilter));
            rs.close();
            st.close();
			}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    
    private JsonArray getArchiveExeWaveDetails(String[] waves, String wavestatus) {
        JsonArray jsonArray = new JsonArray();
        ArrayList<String> allappsList = new ArrayList<String>();
        String apps[] = {};
        String[] allapp = {};
        try {
            if (wavestatus.equals("All")) {
                for (String wave : waves) {
                 String selectWaves = "select * from governance_info where waveName=?";
                    PreparedStatement st = con.prepareStatement(selectWaves);
                         st.setString(1, wave);
                         ResultSet rs = st.executeQuery();
                    while (rs.next()) {
                        if (rs.getString("column_name").equals("apps")) {
                            if (rs.getString("value").isEmpty() == false) {
                                apps = rs.getString("value").split(",");
                                System.out.println("app length: " + apps.length);
                                for (String string : apps) {
                                    allappsList.add(string);
                                }
                            }
                        }
                    }
                    System.out.println("All apps: " + allappsList);
                    allapp = new String[allappsList.size()];
                    allapp = allappsList.toArray(allapp);
                    rs.close();
                    st.close();
                }
                if (allapp.length > 0) {
                    jsonArray = getArchiveExeDetail(allapp);
                } 
            } else {
                 String selectWaves = "select * from governance_info where waveName=?";
                PreparedStatement st = con.prepareStatement(selectWaves);
                         st.setString(1, wavestatus);
                         ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    if (rs.getString("column_name").equals("apps")) {
                        if (rs.getString("value").isEmpty() == false) {
                            apps = rs.getString("value").split(",");
                        }
                    }
                }
                if (apps.length > 0) {
                    jsonArray = getArchiveExeDetail(apps);
                } 
                rs.close();
                st.close();
            }

    } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    
    private JsonArray getArchiveExeDetail(String[] apps) {
        JsonArray jsonArray = new JsonArray();
        try {
            for (String app : apps) {
                JsonObject jsonObject = new JsonObject();
                String selectApp = "select distinct ar.oppName,OppId from opportunity_info o inner join archive_execution_info ar on o.Id=ar.OppId where column_name='appName' and value =?;";
                PreparedStatement st = con.prepareStatement(selectApp);
                         st.setString(1, app);
                         ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    jsonObject.addProperty("app_name", rs.getString("ar.oppName"));
                    String Id = rs.getString("OppId");
                    String crdate = "select value from opportunity_info where column_name='creation_date' and Id=?;";
                    PreparedStatement st13 = con.prepareStatement(crdate);
                         st13.setString(1, Id);
                         ResultSet rs13 = st13.executeQuery();
                    if (rs13.next()) {
                        jsonObject.addProperty("startDate", rs13.getString("value"));
                    }
                    // System.out.println("OppId: " + Id);
                    String selectAppdetail = "select * from `archive_execution_info` where taskGroup='Archive Implementation' and level='1' and OppId = ?;";
                    PreparedStatement st12 = con.prepareStatement(selectAppdetail);
                         st12.setString(1, Id);
                         ResultSet rs12 = st12.executeQuery();
                    if (rs12.next()) {
                        String completion = rs12.getString("completion");
                        if(completion.equals(""))
                        {
                            completion="0";
                        }
                        jsonObject.addProperty("status", completion+"%");
                        rs12.close();
                        st12.close();
                        jsonArray.add(jsonObject);
                    }
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
}

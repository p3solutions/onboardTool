package DecommManager.servlet;

import DecommManager.service.DecommManageExecutionInfoTableUpdate;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import servlet.LegacyRetentionTableUpdate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/DecommManageServiceCategotiesDynamicTableServlet")
public class DecommManageServiceCategotiesDynamicTableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ProjectName=request.getParameter("ProjectName");
        String ApplicationName=request.getParameter("ApplicationName");
        JsonObject jsonObject=new JsonObject();
        try
        {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            DecommManageExecutionInfoTableUpdate tableupdate[]=new DecommManageExecutionInfoTableUpdate[9];
            tableupdate[0]=new DecommManageExecutionInfoTableUpdate(1,ProjectName,ApplicationName,"UNIX / Linux Server,Windows Server","Service Categories","ServiceCategories1","Dropdown","No","");
            tableupdate[1]=new DecommManageExecutionInfoTableUpdate(2,ProjectName,ApplicationName,"DB2,MS SQL,MySQL,Oracle,Sybase","Data Bases","ServiceCategories2","Dropdown","No","");
            tableupdate[2]=new DecommManageExecutionInfoTableUpdate(3,ProjectName,ApplicationName,"Storage - SAN,Storage - NAS,Storage - NAS Mounts","Storage","ServiceCategories3","Dropdown","No","");
            tableupdate[3]=new DecommManageExecutionInfoTableUpdate(4,ProjectName,ApplicationName,"AWS,Azure,Backups,Citrix,DataStage (ETL),Desktop Software","Products","ServiceCategories4","Dropdown","No","");
            tableupdate[4]=new DecommManageExecutionInfoTableUpdate(5,ProjectName,ApplicationName,"DNS Entries,ECG - Electronic Customer Gateway (File Transfer),F5 / Load Balancing,Firewall Rules,HA (High Availability),IIS,Job Control,SharePoint,SQL Analysis Services,SQL Reporting Services  (SRS),SQL Server Integration Services  (SSIS),SSL Certificates,Team Foundation Server (TFS),URLs,Vignette (Web Content Management),Web Analytics,WebSphere,WMB,WMQ","Services","ServiceCategories5","Dropdown","No","");
            tableupdate[5]=new DecommManageExecutionInfoTableUpdate(6,ProjectName,ApplicationName,"Mainframe,Support Readiness,Desktop Software,Disaster Recovery,Citrix,Application Security,Final Backups","Others","ServiceCategories6","Others","No","");

            String CheckQuery="select * from decomm_manage_service_categories_checklist where prj_name = '"+ProjectName+"' and app_name = '"+ApplicationName+"'";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(CheckQuery);
            if(!rs.next())
            {
                jsonObject.addProperty("Updatetable", true);
                for(int i=0;i<6;i++) {
                    String InserQuery = "insert into decomm_manage_service_categories_checklist (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
                    PreparedStatement preparedStatement = connection.prepareStatement(InserQuery);
                    preparedStatement.setInt(1, tableupdate[i].seq_num);
                    preparedStatement.setString(2, tableupdate[i].ProjectName);
                    preparedStatement.setString(3, tableupdate[i].ApplicationName);
                    preparedStatement.setString(4,tableupdate[i].options);
                    preparedStatement.setString(5,tableupdate[i].LabelName);
                    preparedStatement.setString(6,tableupdate[i].ColumnName);
                    preparedStatement.setString(7,tableupdate[i].Type);
                    preparedStatement.setString(8,tableupdate[i].Mandatory);
                    preparedStatement.setString(9,tableupdate[i].value);
                    preparedStatement.execute();

                }
            }
            else
            {
                jsonObject.addProperty("Updatetable", false);
            }

        }
        catch(Exception e)
        {
            System.out.println("Exception----[info]-------"+e);
        }
        try
        {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            DecommManageExecutionInfoTableUpdate tableupdate1[]=new DecommManageExecutionInfoTableUpdate[9];
            tableupdate1[0]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Mainframe","Mainframe","Dropdown","",1,0);
            tableupdate1[1]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Support Readiness","Is the application supported by the United Support Center (Help Desk) and/or IT Service Management (service/infrastructure performance monitoring)?","Radio box","",1,0);
            tableupdate1[2]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Desktop Software","Is there any desktop or supporting desktop software?","Radio box","",1,0);
            tableupdate1[3]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Disaster Recovery","Disaster Recovery","Dropdown","",1,0);
            tableupdate1[4]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Citrix","Does the application utilize any Citrix environments?","Radio box","",1,0);
            tableupdate1[5]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Application Security","Does the application utilize Global Groups?","Radio box","",1,1);
            tableupdate1[6]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Application Security","Is the application in SECURE?","Radio box","",2,2);
            tableupdate1[7]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Application Security","Does the application have an Internally supported access mechanism or other not listed above ( e.g., your own directory)?","Radio box","",3,3);
            tableupdate1[8]=new DecommManageExecutionInfoTableUpdate(ProjectName,ApplicationName,"Final Backups","Are Final Backups Required?","Radio box","",1,0);


            String CheckQuery="select * from decomm_manage_service_categories_checklist_others where prj_name = '"+ProjectName+"' and app_name = '"+ApplicationName+"'";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(CheckQuery);
            if(!rs.next())
            {
                jsonObject.addProperty("Updatetable", true);
                for(int i=0;i<9;i++) {
                    String InserQuery = "insert into decomm_manage_service_categories_checklist_others (prj_name,app_name,others,questions,type,value,level,sub_seq) values(?,?,?,?,?,?,?,?);";
                    PreparedStatement preparedStatement = connection.prepareStatement(InserQuery);
                    preparedStatement.setString(1, tableupdate1[i].prj_name);
                    preparedStatement.setString(2, tableupdate1[i].app_name);
                    preparedStatement.setString(3, tableupdate1[i].others);
                    preparedStatement.setString(4,tableupdate1[i].questions);
                    preparedStatement.setString(5,tableupdate1[i].type);
                    preparedStatement.setString(6,tableupdate1[i].value);
                    preparedStatement.setInt(7,tableupdate1[i].level);
                    preparedStatement.setInt(8,tableupdate1[i].sub_seq);
                    preparedStatement.execute();

                }
            }
            else
            {
                jsonObject.addProperty("Updatetable", false);
            }

        }
        catch(Exception e)
        {
            System.out.println("Exception----[info]-------"+e);
        }

        response.sendRedirect("DecommManageServiceCategoriesChecklist.jsp");


    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

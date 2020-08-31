package DecommManager.servlet;

import DecommManager.service.DecommManageExecutionInfoTableUpdate;
import com.google.gson.JsonObject;
import onboard.DBconnection;

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

@WebServlet("/DecommManageKeyMileStoneTableServlet")
public class DecommManageKeyMileStoneTableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ProjectName=request.getParameter("ProjectName");
        String ApplicationName=request.getParameter("ApplicationName");
        JsonObject jsonObject=new JsonObject();
        try
        {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            DecommManageExecutionInfoTableUpdate objectArray[]=new DecommManageExecutionInfoTableUpdate[27];
            objectArray[0]=new DecommManageExecutionInfoTableUpdate(1,ProjectName,ApplicationName,"CAPM","Status is Targeted for Decommission ?","");
            objectArray[1]=new DecommManageExecutionInfoTableUpdate(2,ProjectName,ApplicationName,"CAPM","Service currently in Production ?","");
            objectArray[2]=new DecommManageExecutionInfoTableUpdate(3,ProjectName,ApplicationName,"CAPM","Change service priority needed ?","");
            objectArray[3]=new DecommManageExecutionInfoTableUpdate(4,ProjectName,ApplicationName,"CAPM","CI Relationships exists?","");
            objectArray[4]=new DecommManageExecutionInfoTableUpdate(5,ProjectName,ApplicationName,"CAPM","Item will be retired?","");
            objectArray[5]=new DecommManageExecutionInfoTableUpdate(6,ProjectName,ApplicationName,"CAPM","SLO has made Appropriate updates ?","");
            objectArray[6]=new DecommManageExecutionInfoTableUpdate(7,ProjectName,ApplicationName,"CAPM","Application part of EDR list?","");
            objectArray[7]=new DecommManageExecutionInfoTableUpdate(1,ProjectName,ApplicationName,"ETPM","Final Artifact- Review and Approval","");
            objectArray[8]=new DecommManageExecutionInfoTableUpdate(2,ProjectName,ApplicationName,"ETPM","Provide Chargeback Validation Report","");
            objectArray[9]=new DecommManageExecutionInfoTableUpdate(3,ProjectName,ApplicationName,"ETPM","Provided Date","");
            objectArray[10]=new DecommManageExecutionInfoTableUpdate(4,ProjectName,ApplicationName,"ETPM","Submit Decommission requests: Use ITG/Service Catalog for components / services listed in the Final Artifact","");
            objectArray[11]=new DecommManageExecutionInfoTableUpdate(5,ProjectName,ApplicationName,"ETPM","Submission Date","");
            objectArray[12]=new DecommManageExecutionInfoTableUpdate(1,ProjectName,ApplicationName,"APP TEAM","Final Artifact (Decommission List) Review and Approval","");
            objectArray[13]=new DecommManageExecutionInfoTableUpdate(2,ProjectName,ApplicationName,"APP TEAM","Stop/Remove Jobs/Application Interfaces/SSIS Jobs etc., to impacted applications Stopping jobs and interaction with the app.","");
            objectArray[14]=new DecommManageExecutionInfoTableUpdate(3,ProjectName,ApplicationName,"APP TEAM","Submission Date","");
            objectArray[15]=new DecommManageExecutionInfoTableUpdate(4,ProjectName,ApplicationName,"APP TEAM","(Optional) Impact Analysis of Application Decommission","");
            objectArray[16]=new DecommManageExecutionInfoTableUpdate(5,ProjectName,ApplicationName,"APP TEAM","Submission Date","");
            objectArray[17]=new DecommManageExecutionInfoTableUpdate(6,ProjectName,ApplicationName,"APP TEAM","ServiceNow: Change Request","");
            objectArray[18]=new DecommManageExecutionInfoTableUpdate(7,ProjectName,ApplicationName,"APP TEAM","Submission Date","");
            objectArray[19]=new DecommManageExecutionInfoTableUpdate(8,ProjectName,ApplicationName,"APP TEAM","Secure: Remove Application","");
            objectArray[20]=new DecommManageExecutionInfoTableUpdate(9,ProjectName,ApplicationName,"APP TEAM","Submission Date","");
            objectArray[21]=new DecommManageExecutionInfoTableUpdate(10,ProjectName,ApplicationName,"APP TEAM","Global Groups: Remove","");
            objectArray[22]=new DecommManageExecutionInfoTableUpdate(11,ProjectName,ApplicationName,"APP TEAM","Master Unique Identifier (MUI): Remove","");
            objectArray[23]=new DecommManageExecutionInfoTableUpdate(1,ProjectName,ApplicationName,"APP SLO","Submit request to change the apps status","");
            objectArray[24]=new DecommManageExecutionInfoTableUpdate(2,ProjectName,ApplicationName,"APP SLO","Submission Date","");
            objectArray[25]=new DecommManageExecutionInfoTableUpdate(3,ProjectName,ApplicationName,"APP SLO","Request submitted to Retire the Service or Service is Retired","");
            objectArray[26]=new DecommManageExecutionInfoTableUpdate(4,ProjectName,ApplicationName,"APP SLO","Submission Date","");

            String CheckQuery="select * from decomm_manage_key_mile_stone where prj_name = '"+ProjectName+"' and app_name = '"+ApplicationName+"'";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(CheckQuery);
            if(!rs.next()) {
                jsonObject.addProperty("Updatetable", true);
                for (int i = 0; i < 27; i++) {
                        String InserQuery = "insert into decomm_manage_key_mile_stone (seq_num,prj_name,app_name,tab_name,tab_name_question,tab_name_value) values(?,?,?,?,?,?);";
                        PreparedStatement preparedStatement = connection.prepareStatement(InserQuery);
                        preparedStatement.setInt(1, objectArray[i].key_seq_num);
                        preparedStatement.setString(2, objectArray[i].key_prj_name);
                        preparedStatement.setString(3, objectArray[i].key_app_name);
                        preparedStatement.setString(4, objectArray[i].tab_name);
                        preparedStatement.setString(5, objectArray[i].tab_name_question);
                        preparedStatement.setString(6, objectArray[i].tab_name_value);
                        preparedStatement.execute();
                }
            }
            else
            {
                jsonObject.addProperty("Updatetable", false);
            }
        }
        catch(Exception e){
            System.out.println("Exception---->>>"+e);
        }
        response.sendRedirect("DecommManageKeyMileStone.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

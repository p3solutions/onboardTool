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

@WebServlet("/DecommManageExecutionInfoServlet")
public class DecommManageExecutionInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String ProjectName = request.getParameter("projectname");
            String ApplicationName = request.getParameter("appname");
        JsonObject jsonobject = new JsonObject();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            DecommManageExecutionInfoTableUpdate tableUpdate[] = new DecommManageExecutionInfoTableUpdate[30];
            tableUpdate[0]=new DecommManageExecutionInfoTableUpdate(1,ProjectName,ApplicationName,"","Decommission Target ID","ExecuteInfo1","Text box","No","");
            tableUpdate[1]=new DecommManageExecutionInfoTableUpdate(2,ProjectName,ApplicationName,"Opportunity,Active,Complete,Cancelled,","Decommission Status","ExecuteInfo2","Dropdown","No","");
            tableUpdate[2]=new DecommManageExecutionInfoTableUpdate(3,ProjectName,ApplicationName,"","Project Number","ExecuteInfo3","Text box","No","");
            tableUpdate[3]=new DecommManageExecutionInfoTableUpdate(4,ProjectName,ApplicationName,"","Project Name","ExecuteInfo4","Text box","No","");
            tableUpdate[4]=new DecommManageExecutionInfoTableUpdate(5,ProjectName,ApplicationName,"","Application Name","ExecuteInfo5","Text box","No","");
            tableUpdate[5]=new DecommManageExecutionInfoTableUpdate(6,ProjectName,ApplicationName,"","Application ID","ExecuteInfo6","Text box","No","");
            tableUpdate[6]=new DecommManageExecutionInfoTableUpdate(7,ProjectName,ApplicationName,"","Service Name","ExecuteInfo7","Text box","No","");
            tableUpdate[7]=new DecommManageExecutionInfoTableUpdate(8,ProjectName,ApplicationName,"","Service ID","ExecuteInfo8","Text box","No","");
            tableUpdate[8]=new DecommManageExecutionInfoTableUpdate(9,ProjectName,ApplicationName,"","Version","ExecuteInfo9","Text box","No","");
            tableUpdate[9]=new DecommManageExecutionInfoTableUpdate(10,ProjectName,ApplicationName,"","Manufacturer","ExecuteInfo10","Text box","No","");
            tableUpdate[10]=new DecommManageExecutionInfoTableUpdate(11,ProjectName,ApplicationName,"","Tier Level","ExecuteInfo11","Text box","No","");
            tableUpdate[11]=new DecommManageExecutionInfoTableUpdate(12,ProjectName,ApplicationName,"","Segment","ExecuteInfo12","Text box","No","");
            tableUpdate[12]=new DecommManageExecutionInfoTableUpdate(13,ProjectName,ApplicationName,"","GL Code","ExecuteInfo13","Text box","No","");
            tableUpdate[13]=new DecommManageExecutionInfoTableUpdate(14,ProjectName,ApplicationName,"Local,Cloud,Server,Web,Internal,External,Private Cloud IAAS,Private Cloud PAAS,Public Cloud IAAS,Public Cloud PAAS,Public Cloud SAAS,","Hosting Method","ExecuteInfo14","Dropdown","No","");
            tableUpdate[14]=new DecommManageExecutionInfoTableUpdate(15,ProjectName,ApplicationName,"","Business Owner","ExecuteInfo15","Text box","No","");
            tableUpdate[15]=new DecommManageExecutionInfoTableUpdate(16,ProjectName,ApplicationName,"","Application Owner","ExecuteInfo16","Text box","No","");
            tableUpdate[16]=new DecommManageExecutionInfoTableUpdate(17,ProjectName,ApplicationName,"","Service Owner","ExecuteInfo17","Text box","No","");
            tableUpdate[17]=new DecommManageExecutionInfoTableUpdate(18,ProjectName,ApplicationName,"","IT Development Owner","ExecuteInfo18","Text box","No","");
            tableUpdate[18]=new DecommManageExecutionInfoTableUpdate(19,ProjectName,ApplicationName,"","Operational Support Owner","ExecuteInfo19","Text box","No","");
            tableUpdate[19]=new DecommManageExecutionInfoTableUpdate(20,ProjectName,ApplicationName,"","Lead","ExecuteInfo20","Text box","No","");
            tableUpdate[20]=new DecommManageExecutionInfoTableUpdate(21,ProjectName,ApplicationName,"","Other Contacts","ExecuteInfo21","Text box","No","");
            tableUpdate[21]=new DecommManageExecutionInfoTableUpdate(22,ProjectName,ApplicationName,"","Production Deployed Date","ExecuteInfo22","Datepicker","No","");
            tableUpdate[22]=new DecommManageExecutionInfoTableUpdate(23,ProjectName,ApplicationName,"ABC,DEF,","Retention Review Status","ExecuteInfo23","Dropdown","No","");
            tableUpdate[23]=new DecommManageExecutionInfoTableUpdate(24,ProjectName,ApplicationName,"","Content/Data Owner","ExecuteInfo24","Text box","No","");
            tableUpdate[24]=new DecommManageExecutionInfoTableUpdate(25,ProjectName,ApplicationName,"","Migration Completion Date","ExecuteInfo25","Datepicker","No","");
            tableUpdate[25]=new DecommManageExecutionInfoTableUpdate(26,ProjectName,ApplicationName,"ABC,DEF,","Data Classification Type","ExecuteInfo26","Dropdown","No","");
            tableUpdate[26]=new DecommManageExecutionInfoTableUpdate(27,ProjectName,ApplicationName,"ABC,DEF,","Legal Review Status","ExecuteInfo27","Dropdown","No","");
            tableUpdate[27]=new DecommManageExecutionInfoTableUpdate(28,ProjectName,ApplicationName,"","Reviewer","ExecuteInfo28","Text box","No","");
            tableUpdate[28]=new DecommManageExecutionInfoTableUpdate(29,ProjectName,ApplicationName,"","Legal Hold if Any","ExecuteInfo29","Text box","No","");
            tableUpdate[29]=new DecommManageExecutionInfoTableUpdate(30,ProjectName,ApplicationName,"","Brief Description","ExecuteInfo30","Text area","No","");
            String CheckQuery="select * from decomm_manage_execution_info where prj_name = '"+ProjectName+"' and app_name = '"+ApplicationName+"'";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(CheckQuery);
            if(!rs.next())
            {
                jsonobject.addProperty("Updatetable", true);
                for(int i=0;i<30;i++) {
                    String InserQuery = "insert into decomm_manage_execution_info (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
                    PreparedStatement preparedStatement = connection.prepareStatement(InserQuery);
                    preparedStatement.setInt(1, tableUpdate[i].seq_num);
                    preparedStatement.setString(2, tableUpdate[i].ProjectName);
                    preparedStatement.setString(3, tableUpdate[i].ApplicationName);
                    preparedStatement.setString(4,tableUpdate[i].options);
                    preparedStatement.setString(5,tableUpdate[i].LabelName);
                    preparedStatement.setString(6,tableUpdate[i].ColumnName);
                    preparedStatement.setString(7,tableUpdate[i].Type);
                    preparedStatement.setString(8,tableUpdate[i].Mandatory);
                    preparedStatement.setString(9,tableUpdate[i].value);
                    preparedStatement.execute();

                }
            }
            else
            {
                jsonobject.addProperty("Updatetable", false);
            }
        }
    catch(Exception e){
            System.out.println("Exception---->>>"+e);
    }
        response.sendRedirect("DecommManageExecutionInfo.jsp?appname="+ApplicationName+"&projectname="+ProjectName);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package servlet;

import com.google.gson.Gson;
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

@WebServlet("/DecommIntakeLegacyRetentionTableUpdateServlet")
public class DecommIntakeLegacyRetentionTableUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String ProjectName=request.getParameter("ProjectName");
     String ApplicationName=request.getParameter("ApplicationName");
     JsonObject jsonObject=new JsonObject();
     try
     {
         DBconnection dBconnection = new DBconnection();
         Connection connection = (Connection) dBconnection.getConnection();
         LegacyRetentionTableUpdate tableupdate[]=new LegacyRetentionTableUpdate[9];
         tableupdate[0]=new LegacyRetentionTableUpdate(1,ProjectName,ApplicationName,"","Retention Code","LegacyRetention1","Text box","Yes","");
         tableupdate[1]=new LegacyRetentionTableUpdate(2,ProjectName,ApplicationName,"","Trigger Date Field","LegacyRetention2","Datepicker","Yes","");
         tableupdate[2]=new LegacyRetentionTableUpdate(3,ProjectName,ApplicationName,"","Period Of Retention","LegacyRetention3","Text box","Yes","");
         tableupdate[3]=new LegacyRetentionTableUpdate(4,ProjectName,ApplicationName,"","Table Name/Is Retention need to apply","LegacyRetention4","file","Yes","");
         tableupdate[4]=new LegacyRetentionTableUpdate(5,ProjectName,ApplicationName,"","Name the Legacy Retention & E-Discovery SME","LegacyRetention5","Text box","Yes","");
         tableupdate[5]=new LegacyRetentionTableUpdate(6,ProjectName,ApplicationName,"Yes,No,","Does any Records Have Legal Holds/Tax Holds or Any Indication","LegacyRetention6","Dropdown","No","");
         tableupdate[6]=new LegacyRetentionTableUpdate(7,ProjectName,ApplicationName,"","Who or What entity provided legal or tax hold identification","LegacyRetention7","Text box","Yes","");
         tableupdate[7]=new LegacyRetentionTableUpdate(8,ProjectName,ApplicationName,"Yes,No,","Should this Application's Data to be Archived?","LegacyRetention8","Dropdown","No","");
         tableupdate[8]=new LegacyRetentionTableUpdate(9,ProjectName,ApplicationName,"","Brief Explanation","LegacyRetention9","Text box","No","");
         String CheckQuery="select * from decomm_legacy_add_table where prj_name = '"+ProjectName+"' and app_name = '"+ApplicationName+"'";
         Statement st=connection.createStatement();
         ResultSet rs=st.executeQuery(CheckQuery);
         if(!rs.next())
         {
             jsonObject.addProperty("Updatetable", true);
             for(int i=0;i<9;i++) {
                 String InserQuery = "insert into decomm_legacy_add_table (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
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
     response.sendRedirect("legency_retention.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

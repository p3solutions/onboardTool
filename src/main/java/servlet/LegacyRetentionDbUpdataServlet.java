package servlet;

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

@WebServlet("/LegacyRetentionDbUpdataServlet")
public class LegacyRetentionDbUpdataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectname=request.getParameter("prjname");
        String appname=request.getParameter("appname");
        try{
                DBconnection dBconnection = new DBconnection();
                Connection connection = (Connection) dBconnection.getConnection();
                System.out.println("I'm in Db");
                int classlength=Integer.parseInt(request.getParameter("classlength"));
                for (int i = 1; i <= classlength; i++){
                    String value = request.getParameter("LegacyRetention"+i);
                    String Updatequery="update decomm_legacy_add_table set value=? where prj_name = ? and app_name = ? and column_name=?";
                    String s="LegacyRetention"+i;
                    PreparedStatement preparedStmt1 = connection.prepareStatement(Updatequery);
                    preparedStmt1.setString(1, value);
                    preparedStmt1.setString(2, projectname);
                    preparedStmt1.setString(3, appname);
                    preparedStmt1.setString(4, s);
                    System.out.println("Hello");
                    preparedStmt1.execute();
                }
        }
        catch(Exception e){
            System.out.println("Exception....."+e);
        }
                /*String retention_code = request.getParameter("retention_code");
                String trigger_date_field = request.getParameter("trigger_date_field");
                String period_of_retention = request.getParameter("period_of_retention");
                String sme = request.getParameter("e_dicovery");
                String legal_tax_holds = request.getParameter("legal_tax_holds");
                String tax_holds = request.getParameter("tax_holds");
                String data_archived = request.getParameter("data_archived");
                String brief = request.getParameter("brief");*/

                /*try {
                    DBconnection dBconnection = new DBconnection();
                    Connection connection = (Connection) dBconnection.getConnection();
                    String query = "select * from decomm_legacy_retention_info where prj_name = '" + projectname + "' and app_name = '" + appname + "'";
                    Statement statementforcheck = connection.createStatement();
                    ResultSet Resultset = statementforcheck.executeQuery(query);

                    if(Resultset.next()) {
                        String update_query = "update decomm_legacy_retention_info set retention_code=?,tigger_date=?,period_retention=?, e_discovery_SME=?,legal_tax_holds=?, legal_tax_identification=?,app_data_archived=?, brief_explain=? where prj_name = '" + projectname + "' and app_name = '" + appname + "'";
                        PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
                      *//*  preparedStmt1.setString(1, retention_code);
                        preparedStmt1.setString(2, trigger_date_field);
                        preparedStmt1.setString(3, period_of_retention);
                        preparedStmt1.setString(4, sme);
                        preparedStmt1.setString(5, legal_tax_holds);
                        preparedStmt1.setString(6, tax_holds);
                        preparedStmt1.setString(7, data_archived);
                        preparedStmt1.setString(8, brief);*//*
                        preparedStmt1.execute();
                    }
                    else{
                        String insert_query="insert into decomm_legacy_retention_info (prj_name,app_name,retention_code,tigger_date,period_retention,e_discovery_SME,legal_tax_holds,legal_tax_identification,app_data_archived,brief_explain)" +
                                "values(?,?,?,?,?,?,?,?,?,?);";
                        PreparedStatement preparedStmt = connection.prepareStatement(insert_query);
                        preparedStmt.setString(1,projectname);
                        preparedStmt.setString(2,appname);
                       *//* preparedStmt.setString(3,retention_code);
                        preparedStmt.setString(4,trigger_date_field);
                        preparedStmt.setString(5,period_of_retention);
                        preparedStmt.setString(6,sme);
                        preparedStmt.setString(7,legal_tax_holds);
                        preparedStmt.setString(8,tax_holds);
                        preparedStmt.setString(9,data_archived);
                        preparedStmt.setString(10,brief);*//*
                        preparedStmt.execute();
                    }
                }
                catch(Exception e){
                    System.out.println("Exception....."+e);
                }*/
                response.sendRedirect("DecommRequirementsPreviewPage.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
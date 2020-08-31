package DecommManager.servlet;

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
import java.util.Arrays;

@WebServlet("/DecommManageExecuteDbUpdateServlet")
public class DecommManageExecuteDbUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectname=request.getParameter("prjname");
        String appname=request.getParameter("appname");
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("I'm in Db");
            int classlength=Integer.parseInt(request.getParameter("classlength"));
            for (int i = 1; i <= classlength; i++){
                String value = "";
                String type="";
                String selectQuery="select * from decomm_manage_execution_info where prj_name='"+projectname+"' and app_name='"+appname+"' and seq_num='"+i+"';";
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery(selectQuery);
                if(resultSet.next())
                {
                    type=resultSet.getString("type");
                }
                if(type.equals("Check box"))
                {
                    String values[]=request.getParameterValues("ExecuteInfo"+i);
                    value= (((Arrays.toString(values)).replace("[","")).replace("]","")).replace(" ","");
                }
                else
                {
                   value=request.getParameter("ExecuteInfo"+i);
                }
                String Updatequery="update decomm_manage_execution_info set value=? where prj_name = '" + projectname + "' and app_name = '" + appname + "' and column_name='"+"ExecuteInfo"+i+"'";
                PreparedStatement preparedStmt1 = connection.prepareStatement(Updatequery);
                preparedStmt1.setString(1, value);
                //System.out.println("Hello");
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
        response.sendRedirect("DecommManageInfraComp.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

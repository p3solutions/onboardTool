package DecommManager.servlet;

import DecommManager.service.DecommManageExecuteInfoService;
import onboard.DBconnection;

import javax.servlet.RequestDispatcher;
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
import java.util.HashMap;

@WebServlet("/DecommManageSerivceCategoriesDBUpdateServlet")
public class DecommManageSerivceCategoriesDBUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectname=request.getParameter("prjname");
        String appname=request.getParameter("appname");
        /*String others=request.getParameter("others");
        String question=request.getParameter("question");   `q
        String type=request.getParameter("type");
        String value_others=request.getParameter("value");*/
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("I'm in Db save servlet");
            int classlength=Integer.parseInt(request.getParameter("classlength"));
            for (int i = 1; i <= classlength; i++){
                String type="";
                String value = "";
                String checkbox_value[];
                String name_type_Query="select * from decomm_manage_service_categories_checklist where prj_name='"+projectname+"' and app_name='"+appname+"' and column_name='ServiceCategories"+i+"';";
                Statement check_type_statement=connection.createStatement();
                ResultSet check_type_resultSet=check_type_statement.executeQuery(name_type_Query);
                if(check_type_resultSet.next())
                {
                    type=check_type_resultSet.getString("type");
                }
                if(type.equals("Others"))
                {
                   checkbox_value=request.getParameterValues("ServiceCategories"+i);
                   System.out.println("check box values : "+checkbox_value[1]);
                   String checkbox_values="";
                    HashMap<String,String> others_table_name_attribute=new HashMap<String, String>();
                    others_table_name_attribute.put("Mainframe","Mainframe");
                    others_table_name_attribute.put("Support Readiness","SupportReadiness");
                    others_table_name_attribute.put("Desktop Software","DesktopSoftware");
                    others_table_name_attribute.put("Disaster Recovery","DisasterRecovery");
                    others_table_name_attribute.put("Citrix","Citrix");
                    others_table_name_attribute.put("Application Security","ApplicationSecurity");
                    others_table_name_attribute.put("Final Backups","FinalBackups");
                    for(int j=0;j<checkbox_value.length;j++)
                   {
                       String CheckBoxvalue=checkbox_value[j];
                       String currentname=others_table_name_attribute.get(CheckBoxvalue);
                       if(!CheckBoxvalue.equals("Application Security"))
                       {
                           String OtherTableValue=(Arrays.toString(request.getParameterValues(currentname)).replace("[","")).replace("]","");
                           String OthersUpdateQuery="update decomm_manage_service_categories_checklist_others set value=? where prj_name='"+projectname+"'and app_name='"+appname+"' and others='"+CheckBoxvalue+"'";
                           PreparedStatement preparedStmtotherstable = connection.prepareStatement(OthersUpdateQuery);
                           preparedStmtotherstable.setString(1,OtherTableValue);
                           preparedStmtotherstable.execute();
                       }
                       else
                       {
                          String ApplicationSecurityValue1=request.getParameter("ApplicationSecurity1");
                           String UpdateQueryAppSecVal1="update decomm_manage_service_categories_checklist_others set value=? where prj_name='"+projectname+"' and app_name='"+appname+"' and others='Application Security' and sub_seq='1'";
                           PreparedStatement preparedStmtAppSerVal1 = connection.prepareStatement(UpdateQueryAppSecVal1);
                           preparedStmtAppSerVal1.setString(1,ApplicationSecurityValue1);
                           preparedStmtAppSerVal1.execute();
                          if(ApplicationSecurityValue1.equals("Yes"))
                          {
                              String ApplicationSecurityValue2=request.getParameter("ApplicationSecurity2");
                              String UpdateQueryAppSecVal2="update decomm_manage_service_categories_checklist_others set value=? where prj_name='"+projectname+"' and app_name='"+appname+"' and others='Application Security' and sub_seq='2'";
                              PreparedStatement preparedStmtAppSerVal2 = connection.prepareStatement(UpdateQueryAppSecVal2);
                              preparedStmtAppSerVal2.setString(1,ApplicationSecurityValue2);
                              preparedStmtAppSerVal2.execute();
                              if(ApplicationSecurityValue2.equals("Yes"))
                              {
                                  String ApplicationSecurityValue3=request.getParameter("ApplicationSecurity3");
                                  String UpdateQueryAppSecVal3="update decomm_manage_service_categories_checklist_others set value=? where prj_name='"+projectname+"' and app_name='"+appname+"' and others='Application Security' and sub_seq='3'";
                                  PreparedStatement preparedStmtAppSerVal3 = connection.prepareStatement(UpdateQueryAppSecVal3);
                                  preparedStmtAppSerVal3.setString(1,ApplicationSecurityValue3);
                                  preparedStmtAppSerVal3.execute();
                              }
                          }


                       }
                       /*String check_others_query="select * from decomm_manage_service_categories_checklist_others where prj_name='"+projectname+"' and app_name='"+appname+"' and others='"+checkbox_value[j]+"';";
                       Statement check_others_statement=connection.createStatement();
                       ResultSet check_others_Resultset=check_others_statement.executeQuery(check_others_query);
                       if (check_others_Resultset.next())
                       {

                       }
                       else
                       {

                       }*/
                       checkbox_values+=checkbox_value[j]+",";
                   }
                   value=checkbox_values;
                }
                else if(type.equals("Dropdown"))
                {
                    String[] values=request.getParameterValues("ServiceCategories"+i);
                    value= (Arrays.toString(values).replace("[","")).replace("]","");
                }
                else if(type.equals("Check box"))
                {
                    String checkbox_values[]=request.getParameterValues("ServiceCategories"+i);
                    value= (Arrays.toString(checkbox_values).replace("[","")).replace("]","");
                }
                else
                {
                    value=request.getParameter("ServiceCategories"+i);
                    System.out.println("values-------->"+value);
                }

                String Updatequery="update decomm_manage_service_categories_checklist set value=? where prj_name = '" + projectname + "' and app_name = '" + appname + "' and column_name='"+"ServiceCategories"+i+"'";
                PreparedStatement preparedStmt1 = connection.prepareStatement(Updatequery);
                preparedStmt1.setString(1, value);
                preparedStmt1.execute();
            }

                //DecommManageExecuteInfoService.DecommManageServiceCategoriesOthersSaveService(projectname,appname,others,question,type,value_others);

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
        /*RequestDispatcher rd = request.getRequestDispatcher("DecommManageKeyMileStoneTableServlet");
        rd.forward(request,response);*/
        response.sendRedirect("DecommManageServiceCategoriesChecklistDataRetrieve.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}


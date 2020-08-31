package DecommManager.servlet;

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
import java.util.ArrayList;
import java.util.Collections;

@WebServlet("/DecommManageSerCatCheckDtRetrieveSaveServlet")
public class DecommManageSerCatCheckDtRetrieveSaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationname = request.getParameter("ApplicationName");
        String projectname = request.getParameter("ProjectName");
        String others_value = "";
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String arr_type[]={"Dropdown","Text box","Datepicker"};
            ArrayList<String> arrayList = new ArrayList<String>();
            ArrayList<String> arraylabel = new ArrayList<String>();
            ArrayList<String> arraycolumn = new ArrayList<String>();
            ArrayList<Integer> arrayseq = new ArrayList<Integer>();
            int seq_num = 1;
            for(int i=0; i<arr_type.length;i++) {
                String query = "select * from Decomm_Manage_Service_Categories_Checklist where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and type = '" + arr_type[i]+"' order by seq_num";
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(query);
                    while(rs.next()){
                        String value = rs.getString("value");
                        String label = rs.getString("label_name");
                        String split_value[] = value.split(",");

                        for(int j=0;j<split_value.length;j++){
                            arrayList.add(split_value[j]);
                            arraylabel.add(label);
                            arrayseq.add(seq_num++);
                        }
                    }
                }
            int max_num = Collections.max(arrayseq);

            for (int k=0; k<max_num;k++){
                String space_label = (arraylabel.get(k)).replace(" ","");
                String Dev = request.getParameter(space_label+"_dev"+k);
                String Test = request.getParameter(space_label+"_test"+k);
                String Stage = request.getParameter(space_label+"_stage"+k);
                String Prod = request.getParameter(space_label+"_prod"+k);
                String Comment = request.getParameter(space_label+"_comment"+k);
                String checkquery="select * from decomm_manage_service_categories_checklist_server where prj_name='"+projectname+"' and app_name='"+applicationname+"' and seq_num='"+arrayseq.get(k)+"' and column_name='"+space_label+(arrayseq.get(k))+"'";
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery(checkquery);
                if(resultSet.next())
                {
                    String update_query = "update decomm_manage_service_categories_checklist_server set dev=?, test=?, stage=?, prod=?, comments=? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and seq_num='"+arrayseq.get(k)+"'";
                    PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
                    preparedStmt1.setString(1, Dev);
                    preparedStmt1.setString(2, Test);
                    preparedStmt1.setString(3, Stage);
                    preparedStmt1.setString(4, Prod);
                    preparedStmt1.setString(5, Comment);
                    preparedStmt1.execute();
                }
                else {
                    String insertquery="Insert into decomm_manage_service_categories_checklist_server (seq_num,prj_name,app_name,label_name,column_name,value,dev,test,stage,prod,comments) values(?,?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement preparedStmt1 = connection.prepareStatement(insertquery);
                    preparedStmt1.setInt(1, arrayseq.get(k));
                    preparedStmt1.setString(2, projectname);
                    preparedStmt1.setString(3, applicationname);
                    preparedStmt1.setString(4, arraylabel.get(k));
                    preparedStmt1.setString(5,space_label+(arrayseq.get(k)));
                    preparedStmt1.setString(6,arrayList.get(k));
                    preparedStmt1.setString(7,Dev);
                    preparedStmt1.setString(8,Test);
                    preparedStmt1.setString(9,Stage);
                    preparedStmt1.setString(10,Prod);
                    preparedStmt1.setString(11,Comment);
                    preparedStmt1.execute();
                }
             }
            }
        catch(Exception e){
            System.out.println("Exception--->>>"+e);
        }
        try {
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        String select_query = "select * from decomm_manage_service_categories_checklist where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and type = 'Others' ";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(select_query);
        if(rs.next()){
            others_value = rs.getString("value");
        }
        String arr_value[] = others_value.split(",");
        for (int i=0; i<arr_value.length; i++){
            String remove_space = arr_value[i].replace(" ","");
            String dev_value = request.getParameter(remove_space+"_dev");
            String test_value = request.getParameter(remove_space+"_test");
            String stage_value = request.getParameter(remove_space+"_stage");
            String prod_value = request.getParameter(remove_space+"_prod");
            String comment_value = request.getParameter(remove_space+"_comment");

            String update_query = "update decomm_manage_service_categories_checklist_others set dev=?, test=?, stage=?, prod=?, comments=? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and others = '"+arr_value[i]+"' ";
            PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
            preparedStmt1.setString(1, dev_value);
            preparedStmt1.setString(2, test_value);
            preparedStmt1.setString(3, stage_value);
            preparedStmt1.setString(4, prod_value);
            preparedStmt1.setString(5, comment_value);
            preparedStmt1.execute();
        }

    }
    catch(Exception e){
        System.out.println("Exception--->>>"+e);
    }
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String type_arr[]={"Radio box","Check box"};
            ArrayList<String> values=new ArrayList<String>();
            ArrayList<String> label=new ArrayList<String>();
            ArrayList<String> column=new ArrayList<String>();
            ArrayList<Integer> seq_num=new ArrayList<Integer>();
            int maxseqnum=0;
            String maxseq_num_Query="select max(seq_num) from Decomm_Manage_Service_Categories_Checklist_Server where prj_name='"+projectname+"' and app_name='"+applicationname+"'";
            Statement statement1=connection.createStatement();
            ResultSet resultSet1=statement1.executeQuery(maxseq_num_Query);
            if(resultSet1.next()) {
                maxseqnum = Integer.parseInt(resultSet1.getString(1));
            }
            for(int i=0;i<type_arr.length;i++) {
                String selectquery = "select * from Decomm_Manage_Service_Categories_Checklist where prj_name='" + projectname + "' and app_name='" + applicationname + "' and type='" + type_arr[i]+"'";
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery(selectquery);
                while(resultSet.next())
                {
                    String secondtablevalue=resultSet.getString("value");
                    String secondtablelabel=resultSet.getString("label_name");
                    values.add(secondtablevalue);
                    label.add(secondtablelabel);
                    seq_num.add(++maxseqnum);
                    /*String[] second_table_values=secontablevalue.split(",");
                    for(int j=0;j<second_table_values.length;j++)
                    {
                        values.add(second_table_values[j]);
                    }*/

                }
            }
            for(int j=0;j<seq_num.size();j++)
            {
                String space_label = (label.get(j)).replace(" ","");
                String Dev = request.getParameter("ServiceCategoriesSecondTable_dev"+j);
                String Test = request.getParameter("ServiceCategoriesSecondTable_test"+j);
                String Stage = request.getParameter("ServiceCategoriesSecondTable_stage"+j);
                String Prod = request.getParameter("ServiceCategoriesSecondTable_prod"+j);
                String Comment = request.getParameter("ServiceCategoriesSecondTable_comment"+j);
                String checkquery="select * from decomm_manage_service_categories_checklist_server where prj_name='"+projectname+"' and app_name='"+applicationname+"'and label_name='"+label.get(j)+"'";
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery(checkquery);
                if(resultSet.next())
                {
                    String update_query = "update decomm_manage_service_categories_checklist_server set dev=?, test=?, stage=?, prod=?, comments=? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and label_name='"+label.get(j)+"'";
                    PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
                    preparedStmt1.setString(1, Dev);
                    preparedStmt1.setString(2, Test);
                    preparedStmt1.setString(3, Stage);
                    preparedStmt1.setString(4, Prod);
                    preparedStmt1.setString(5, Comment);
                    preparedStmt1.execute();
                }
                else
                {
                    String insertquery="Insert into decomm_manage_service_categories_checklist_server (seq_num,prj_name,app_name,label_name,column_name,value,dev,test,stage,prod,comments) values(?,?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement preparedStmt1 = connection.prepareStatement(insertquery);
                    preparedStmt1.setInt(1, seq_num.get(j));
                    preparedStmt1.setString(2, projectname);
                    preparedStmt1.setString(3, applicationname);
                    preparedStmt1.setString(4, label.get(j));
                    preparedStmt1.setString(5,space_label+(seq_num.get(j)));
                    preparedStmt1.setString(6,values.get(j));
                    preparedStmt1.setString(7,Dev);
                    preparedStmt1.setString(8,Test);
                    preparedStmt1.setString(9,Stage);
                    preparedStmt1.setString(10,Prod);
                    preparedStmt1.setString(11,Comment);
                    preparedStmt1.execute();
                }
            }

            }
        catch(Exception e) {
            System.out.println("Exception-------[info]-----" + e);
        }



        /*
        try
        {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            *//*String type_arr[]={"Radio box","Check box"};
            Arra
            for(int i=0;i<type_arr.length;i++) {
                String select_query = "select * from Decomm_Manage_Service_Categories_Checklist where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and type = '"+type_arr[i]+"' order by seq_num";
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery(select_query);
                while(resultSet.next())
                {
                }
            }*//*
            String arr_type[]={"Radio box","Check box"};
            ArrayList<String> arrayList = new ArrayList<String>();
            ArrayList<String> arraylabel = new ArrayList<String>();
            ArrayList<String> arraycolumn = new ArrayList<String>();
            ArrayList<Integer> arrayseq = new ArrayList<Integer>();
            int seq_num = 1;
            for(int i=0; i<arr_type.length;i++) {
                String query = "select * from Decomm_Manage_Service_Categories_Checklist where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and type = '" + arr_type[i]+"' order by seq_num";
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(query);
                while(rs.next()){
                    String value = rs.getString("value");
                    String label = rs.getString("label_name");
                    String split_value[] = value.split(",");

                    for(int j=0;j<split_value.length;j++){
                        arrayList.add(split_value[j]);
                        arraylabel.add(label);
                        arrayseq.add(seq_num++);
                    }
                }
            }
            int max_num = Collections.max(arrayseq);

            for (int k=0; k<max_num;k++){
                String space_label = (arraylabel.get(k)).replace(" ","");
                String Dev = request.getParameter(space_label+"_dev"+k);
                String Test = request.getParameter(space_label+"_test"+k);
                String Stage = request.getParameter(space_label+"_stage"+k);
                String Prod = request.getParameter(space_label+"_prod"+k);
                String Comment = request.getParameter(space_label+"_comment"+k);
                String checkquery="select * from decomm_manage_service_categories_checklist_server where prj_name='"+projectname+"' and app_name='"+applicationname+"' and seq_num='"+arrayseq.get(k)+"'";
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery(checkquery);
                if(resultSet.next())
                {
                    String update_query = "update decomm_manage_service_categories_checklist_server set dev=?, test=?, stage=?, prod=?, comments=? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and seq_num='"+arrayseq.get(k)+"'";
                    PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
                    preparedStmt1.setString(1, Dev);
                    preparedStmt1.setString(2, Test);
                    preparedStmt1.setString(3, Stage);
                    preparedStmt1.setString(4, Prod);
                    preparedStmt1.setString(5, Comment);
                    preparedStmt1.execute();
                }
                else {
                    String insertquery="Insert into decomm_manage_service_categories_checklist_server (seq_num,prj_name,app_name,label_name,column_name,value,dev,test,stage,prod,comments) values(?,?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement preparedStmt1 = connection.prepareStatement(insertquery);
                    preparedStmt1.setInt(1, arrayseq.get(k));
                    preparedStmt1.setString(2, projectname);
                    preparedStmt1.setString(3, applicationname);
                    preparedStmt1.setString(4, arraylabel.get(k));
                    preparedStmt1.setString(5,space_label+(arrayseq.get(k)));
                    preparedStmt1.setString(6,arrayList.get(k));
                    preparedStmt1.setString(7,Dev);
                    preparedStmt1.setString(8,Test);
                    preparedStmt1.setString(9,Stage);
                    preparedStmt1.setString(10,Prod);
                    preparedStmt1.setString(11,Comment);
                    preparedStmt1.execute();
                }
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception--->>>"+e);
        }*/
        //response.sendRedirect("DecommManageKeyMileStone.jsp?appname="+applicationname+"&projectname="+projectname);
        RequestDispatcher rd = request.getRequestDispatcher("DecommManageKeyMileStoneTableServlet");
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

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

@WebServlet("/DecommManageKeyMileStoneDbUpdateServlet")
public class DecommManageKeyMileStoneDbUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectname=request.getParameter("prjname");
        String appname=request.getParameter("appname");
            try{
                DBconnection dBconnection = new DBconnection();
                Connection connection = (Connection) dBconnection.getConnection();
                System.out.println("I'm in Db");
                int arr_size[] = {7,5,11,4};
                String arr_tab_size[] = {"CAPM","ETPM","APP TEAM","APP SLO"};
                for(int j=0; j<arr_size.length; j++){
                    int size = arr_size[j];
                    String tab_name = arr_tab_size[j];
                    String tab_name_underscore = tab_name.replace(" ","_");
                for (int i = 1; i <= size; i++){
                    String vaule = request.getParameter(tab_name_underscore+i);
                        String Updatequery = "update decomm_manage_key_mile_stone set tab_name_value=? where prj_name = '" + projectname + "' and app_name = '" + appname + "' and seq_num = '" + i + "' and tab_name = '" + tab_name + "';";
                        PreparedStatement preparedStmt1 = connection.prepareStatement(Updatequery);
                        preparedStmt1.setString(1, vaule);
                        preparedStmt1.execute();
                }
                }
            }
            catch (Exception e){
                System.out.println("Exception---->>>>"+e);
            }
            response.sendRedirect("DecommManagePreview.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package servlet;

import onboard.DBconnection;
import service.IntakeInformationService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/ContactInfoDbUpdateServlet")
public class ContactInfoDbUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String roles[]=request.getParameterValues("RoleName");
    String roles1[]=roles[0].split(",");
    String rowlength[]=request.getParameterValues("RowLength");
        String rowlength1[]=rowlength[0].split(",");
    String project=request.getParameter("ProjectName");
    //String applicationname=request.getParameter("ProjectName");
    String application=request.getParameter("ApplicationName");
    System.out.println("Roles "+roles[0]+"RowLength "+rowlength[0]+"role length"+roles.length);
    /*String[] roleselected=roles.split(",");*/
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            for (int i = 0; i < roles1.length; i++) {
                String rolename = roles1[i].replace("-", "").replace(" ", "").replace("/", "");
                String actualrolename = roles1[i];
                System.out.println("Roles "+roles1[i]+"RowLength "+rowlength1[i]+"role length"+roles1.length+"Row length "+rowlength1[i]);
                int RowLength = Integer.parseInt(rowlength1[i]);
                for (int j = 0; j < RowLength; j++) {
                    String username = request.getParameter(rolename + "UserName" + j);
                    String email = request.getParameter(rolename + "Email" + j);
                    String userid = request.getParameter(rolename + "UserId" + j);
                    String contactnumber = request.getParameter(rolename + "ContactNumber" + j);
                    IntakeInformationService.ContactInfotableUpdate(project, application, actualrolename, username, email, contactnumber, userid, j,RowLength);
                }
                String check_query="select max(seq_num) from Decomm_Intake_Contact_Info where prj_name='"+project+"' and app_name='"+application+"' and role='"+actualrolename+"';";
                Statement st=connection.createStatement();
                ResultSet rs=st.executeQuery(check_query);
                int max_seq=0;
                if(rs.next())
                {
                    max_seq=Integer.parseInt(rs.getString(1));
                }
                if(RowLength<max_seq)
                {
                    String delete_query="delete from Decomm_Intake_Contact_Info where prj_name='"+project+"'and app_name='"+application+"' and seq_num >"+RowLength+";";
                    Statement st1=connection.createStatement();
                    st1.executeUpdate(delete_query);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Exception-----[info]------"+e);
        }
        RequestDispatcher rd = request.getRequestDispatcher("DecommIntakeLegacyRetentionTableUpdateServlet");
        rd.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

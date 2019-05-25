import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ArchiveUserList")
public class ArchiveUserList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String projectname=request.getParameter("projectname");
        String UserList=Archive_execution_db_update.user_name(projectname);
        response.setContentType("text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(UserList);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

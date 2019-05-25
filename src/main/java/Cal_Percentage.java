import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Cal_Percentage")
public class Cal_Percentage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //System.out.println("test in servlet");
        int sequence=Integer.parseInt(request.getParameter("sequence"));
        String selectedproject=request.getParameter("ProjectName");
        String percent=Float.toString(Archive_execution_db_update.percent(sequence,selectedproject));
        //System.out.println("percentage :"+percent);
        response.setContentType("text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(percent);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

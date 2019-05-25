import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Countplan")
public class Countplan extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Weekday weekday=new Weekday();
    String fromd=request.getParameter("fromD");
    String tod=request.getParameter("toD");
    String plancount= String.valueOf(weekday.splittingoperation(fromd,tod));
    System.out.println("plancount"+plancount);
        response.setContentType("text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(plancount);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

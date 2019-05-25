import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Countactual")
public class Countactual extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in post");
        Weekday w = new Weekday();
        String fromd = request.getParameter("fromD");
        String actualcount = Integer.toString(w.actualhours(fromd));
        System.out.println("test1 " + actualcount);
        response.setContentType("text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(actualcount);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

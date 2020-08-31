package authorization.servlet;

import authorization.service.Role_Details_Service;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Edit_Intake
 */
@WebServlet("/Role_Details_Servlet")
public class Role_Details_Servlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(Role_Details_Servlet.class);

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        /*String project_name = (String) httpSession.getAttribute("nameofproject");
        String admin_module = (String) httpSession.getAttribute("admin");*/
        try {

            JsonArray infojson = new Role_Details_Service().role_details();
            String json = new Gson().toJson(infojson);
            logger.info("json----->" + json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}

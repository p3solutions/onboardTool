package adminmodule.servlet;

import adminmodule.service.Admin_Module_Service;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;
import service.IntakeInformationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Admin_Module_Send_Invites")
public class Admin_Module_Send_Invites extends HttpServlet {
    final static Logger logger = Logger.getLogger(Admin_Module_Send_Invites.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        try {
            String project_name = (String) httpSession.getAttribute("nameofproject");
            String admin_module = (String) httpSession.getAttribute("admin");
            JsonObject infojson = new Admin_Module_Service().getproject_details();
            String json = new Gson().toJson(infojson);
            logger.info("json--->" + json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}

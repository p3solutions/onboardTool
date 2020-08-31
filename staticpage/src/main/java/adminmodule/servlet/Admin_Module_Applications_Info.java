package adminmodule.servlet;

import admin_module_modify.servlet.Modify_List_Users_Table;
import adminmodule.service.Admin_Module_Service;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Admin_Module_Applications_Info")
public class Admin_Module_Applications_Info extends HttpServlet {
    final static Logger logger = Logger.getLogger(Admin_Module_Applications_Info.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String proj = request.getParameter("proj");
        System.out.println("sample--->"+proj);
        try {
            HttpSession session = request.getSession();
            logger.info("project---- >" + proj);
            proj=proj.replaceAll("\"","'").replaceAll("\\[", "").replaceAll("\\]","");
            JsonObject infojson = new Admin_Module_Service().applications_info(proj);
            String json = new Gson().toJson(infojson);
            logger.info("json--->" + json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            logger.info("json data--->" + json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}

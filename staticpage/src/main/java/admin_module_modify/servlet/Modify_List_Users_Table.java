package admin_module_modify.servlet;

import admin_module_modify.service.Modify_List_User_Service;
import admin_module_modify.service.Update_User_Registration_Service;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import service.ListUserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Modify_List_Users_Table")
public class Modify_List_Users_Table extends HttpServlet {
    final static Logger logger = Logger.getLogger(Modify_List_Users_Table.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         try {
            JsonArray infojson = new Modify_List_User_Service().getModify_List_of_User();
            String json = new Gson().toJson(infojson);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            logger.info("json data----->" + json);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

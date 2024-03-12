package admin_module_modify.servlet;


import com.google.gson.JsonObject;

import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import logger.System;

/**
 * Servlet implementation class user_registration
 */
@WebServlet("/Update_User_registration")

public class Update_User_registration extends HttpServlet {
    private static final long serialVersionUID = 1L;
    final static Logger logger = Logger.getLogger(Update_User_registration.class);


    public Update_User_registration() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String uname = request.getParameter("uname");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email_val = request.getParameter("email_val");
            String project_id = request.getParameter("project_id");
            String application_id = request.getParameter("application_id");
            String id = request.getParameter("id");
            //Update_User_Registration_Service update_user_registration_service = new Update_User_Registration_Service().Update_Service_Registration(uname, fname, lname, email_val, project_id, application_id, id);
            //logger.info("queryyyy" + update_user_registration_service);
            
            response.sendRedirect("Modify_Admin_Users_list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("[ERROR]-----Got an exception!" + e + "----[ERROR]");
        }
    }

}

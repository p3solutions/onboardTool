package admin_module_modify.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import admin_module_modify.service.Add_users_service;
import admin_module_modify.service.Update_users_service;
import logger.System;
/**
 * Servlet implementation class Update_users_servlet
 */
@WebServlet("/Update_users_servlet")
public class Update_users_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_users_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String id=request.getParameter("id");
        String uname_modify=request.getParameter("uname_modify");
        String ufname_modify=request.getParameter("ufname_modify");
        String ulname_modify=request.getParameter("ulname_modify");
        String u_email_modify=request.getParameter("u_email_modify");
        String u_role_modify=request.getParameter("u_role_modify");
        String random_id_modify=request.getParameter("random_id_modify");
       
        //String seq_num = request.getParameter("seq_num");
        System.out.println("ID"+id);
        System.out.println("User Name : "+uname_modify);
        System.out.println("User First Name: "+ufname_modify);
        System.out.println("User Last Name: "+ulname_modify);
        System.out.println("User Email: "+u_email_modify);
        System.out.println("User Role: "+u_role_modify);
        System.out.println("Random ID: "+random_id_modify);
        
        JsonObject jsonObj =Update_users_service.update_users(uname_modify, ufname_modify, ulname_modify, u_email_modify, u_role_modify, random_id_modify);
         String json = new Gson().toJson(jsonObj);
         System.out.println("JSON"+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
       
    }
}
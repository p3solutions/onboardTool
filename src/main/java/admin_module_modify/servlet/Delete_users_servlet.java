package admin_module_modify.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import admin_module_modify.service.Delete_users_service;
import admin_module_modify.service.Update_users_service;
import logger.System;
/**
 * Servlet implementation class Delete_users_servlet
 */
@WebServlet("/Delete_users_servlet")
public class Delete_users_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_users_servlet() {
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
        HttpSession details = request.getSession();
        //int seq_num = Integer.parseInt(request.getParameter("seq_num"))+1;
        String random_id=request.getParameter("random_id");
        System.out.println("Random ID : "+random_id);
        JsonObject jsonObj =Delete_users_service.delete_users(random_id);
         String json = new Gson().toJson(jsonObj);
         System.out.println("JSON"+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        doGet(request, response);
    }
}

package Finance.FinanceScreenshot.servlet;

import Finance.FinanceScreenshot.service.Finance_Screen_Retrieve;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import logger.System;

@WebServlet("/Finance_Scr_Retrieve_Servlet")
public class Finance_Scr_Retrieve_Servlet  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Finance_Scr_Retrieve_Servlet() {
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

        HttpSession details = request.getSession();
        String sessionId = (String) details.getAttribute("APPID");
        String sessionOppName = (String) details.getAttribute("APPNAME");
        System.out.println("The ID for screenshot retrieval "+ sessionId +" The Name of the application "+sessionOppName);
        String File_Name=request.getParameter("File_Name");
        JsonArray jsonArray = null;
        Finance_Screen_Retrieve scr_retrive=new Finance_Screen_Retrieve();
        jsonArray=scr_retrive.screenshot_retrieve(sessionId);
        scr_retrive =null;
        //calling finalize method and garabage collector
        System.gc();
        System.out.println("Finance SCREENSHOT JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);


    }
}

package Finance.FinanceScreenshot.servlet;

import Finance.FinanceScreenshot.service.Finance_App_Scr_Delete;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Finance_App_Scr_DeleteServlet")
public class Finance_App_Scr_DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Finance_App_Scr_DeleteServlet() {
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
        System.out.println("The ID for screenshot Delete "+ sessionId +" The Name of the application "+sessionOppName);
        String File_Name=request.getParameter("File_Name");
        JsonObject jsonObj = Finance_App_Scr_Delete.delete_screenshots(sessionId,File_Name);
        String json = new Gson().toJson(jsonObj);
        System.out.println("FINANCE SCREENSHOT DELETE JSON : "+json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

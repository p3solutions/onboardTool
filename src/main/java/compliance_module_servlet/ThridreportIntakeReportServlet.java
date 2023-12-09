package compliance_module_servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import compliance_module_service.IntakeReport3Service;

@WebServlet("/IntakeReport3Servlet")
public class ThridreportIntakeReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ThridreportIntakeReportServlet() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession details = request.getSession();
        JsonArray jsonArray = null;
        IntakeReport3Service Report =  new IntakeReport3Service();
        jsonArray = Report.getReportDetails();

 

        Report=null;
        //calling finalize method and garabage collector
        System.gc();
        System.out.println("JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(json);
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
    
}
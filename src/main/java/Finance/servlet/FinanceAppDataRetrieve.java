package Finance.servlet;

import Finance.service.FinanaceAppDataRetriveService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/FinanceAppDataRetrieve")
public class FinanceAppDataRetrieve extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceAppDataRetrieve() {
        super();

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession details = request.getSession();
         String Id;
         String oppName;
         String sessionId = (String) details.getAttribute("seId");
         String sessionOppName = (String) details.getAttribute("seName");
         if (sessionId != null && sessionOppName!=null){
            Id =sessionId;
            oppName = sessionOppName;
         }
         else {
             Id=request.getParameter("ID");
             oppName=request.getParameter("Opportunity");
         }

        JsonArray jsonArray = null;
        FinanaceAppDataRetriveService Appinfo;
        try {
            Appinfo = new FinanaceAppDataRetriveService(Id, oppName);
            jsonArray = Appinfo.financeTemplateToFinanceInfo();
            Appinfo =null;
            //calling finalize method and garbage collector
            System.gc();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        System.out.println("JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

}

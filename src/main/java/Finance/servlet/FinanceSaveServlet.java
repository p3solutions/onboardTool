package Finance.servlet;

import Finance.service.FinanceSaveService;
import com.google.gson.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/FinanceSaveServlet")
public class FinanceSaveServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
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
        String JsonString= (String)request.getParameter("JsonString");
        JsonParser parser = new JsonParser();
        JsonElement tradeElement = parser.parse(JsonString);
        JsonArray jsonArray = tradeElement.getAsJsonArray();
        JsonObject jsonObject = new JsonObject();
            FinanceSaveService AppInfo = new FinanceSaveService( );
            AppInfo.CreateNewFinanceSave(jsonArray,Id,oppName);
            AppInfo = null;
            System.gc();

        String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

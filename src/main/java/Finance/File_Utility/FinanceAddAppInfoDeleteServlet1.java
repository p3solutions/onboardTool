package Finance.File_Utility;

import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveLegacyAppInfoDeleteService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/FinanceAddAppInfoDeleteServlet1")
public class FinanceAddAppInfoDeleteServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceAddAppInfoDeleteServlet1() {
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
        JsonObject jsonobj = new JsonObject();
        HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("APPID");
        System.out.println("Opportunity Id "+Id);
        int seq_num = Integer.parseInt(request.getParameter("seq_num"))+1;

        try {
            FinanceAddAppInfoDeleteService1 AppInfo = new FinanceAddAppInfoDeleteService1(Id, seq_num);
            jsonobj = AppInfo.Delete();
            jsonobj.addProperty("index",seq_num-1);
            AppInfo =null;
            System.gc();
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        String json = new Gson().toJson(jsonobj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

}

package Finance.servlet;

import Finance.service.FinanceFieldEditService;
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


@WebServlet("/FinanceFieldEditServlet")
public class FinanceFieldEditServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceFieldEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("ID");
        System.out.println("Opportunity Id "+Id);
        String label_name = request.getParameter("label");
        int sequencenumber = Integer.parseInt(request.getParameter("seq_num"))+1;
        JsonObject jsonObj = new JsonObject();
        try {

            FinanceFieldEditService AppInfo = new FinanceFieldEditService(Id, sequencenumber, label_name);
            boolean checkDuplicate = AppInfo.checkDuplicateLabelName();
            boolean statusFlag =false;
            jsonObj.addProperty("checkDuplicate",checkDuplicate);
            if(checkDuplicate)
            {
                jsonObj.addProperty("previous_label_name",AppInfo.getPreviousLabelName());
                statusFlag = AppInfo.Edit();

            }
            jsonObj.addProperty("checkEditStatus",statusFlag);
            jsonObj.addProperty("seq_no",sequencenumber);
            jsonObj.addProperty("label_name",label_name);
            AppInfo = null;
            System.gc();
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        String json = new Gson().toJson(jsonObj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

}

package Finance.servlet;

import Finance.service.FinanceFieldAddFeatureService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/FinanceAppAddServlet")
public class FinanceAppAddServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceAppAddServlet() {
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
        String Id = (String) details.getAttribute("APPID");
        System.out.println("appid :"+Id);
        JsonObject jsonobject = new JsonObject();

        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String label_name = request.getParameter("LabelName");
            // String column_name = request.getParameter("ColumnName");
            String mandatory = request.getParameter("Mandatory");
            String umandatory = request.getParameter("umandatory");
            String type = request.getParameter("Type");
            String option=request.getParameter("Options");
            System.out.println("UMANDATORY : "+umandatory);
            int NumberofInputfields=Integer.parseInt(request.getParameter("Number"));
            jsonobject.addProperty("LabelName", label_name);
            jsonobject.addProperty("ColumnName","LegacyAddInfo");
            jsonobject.addProperty("Mandatory", mandatory);
            jsonobject.addProperty("UMandatory", umandatory);
            jsonobject.addProperty("Type", type);
            jsonobject.addProperty("Options",option);
            if (type.equals("Text box") || type.equals("Datepicker")) {
                jsonobject.addProperty("CheckExistance", true);
            } else if (type.equals("Check box")) {
                jsonobject.addProperty("CheckboxExistance", true);
            } else if (type.equals("Radio box")) {
                jsonobject.addProperty("RadioCheckExistance", true);
            } else if (type.equals("Dropdown")) {
                jsonobject.addProperty("OptionCheckExistance", true);
            }

            String select_lab = "select * from finance_info where Id = ? and  label_name = ? ";
            PreparedStatement st1 = connection.prepareStatement(select_lab);
            st1.setString(1, Id);
            st1.setString(2, label_name);
            ResultSet rs1 = st1.executeQuery();

            boolean labelcheck=false;

            if(rs1.next()){
                labelcheck = true;
                jsonobject.addProperty("LabelDuplicateCheck", "true");
            }

            if(!labelcheck)
            {
                int seq_num = FinanceFieldAddFeatureService.FinanceAddOperationService(Id, label_name, mandatory,umandatory, type, NumberofInputfields, option);
                jsonobject.addProperty("Seq_Num",seq_num);
            }

        }
        catch(Exception e)
        {
            System.out.println("Exception----------[info]-----"+e);
        }
        String json = new Gson().toJson(jsonobject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);


    }
}

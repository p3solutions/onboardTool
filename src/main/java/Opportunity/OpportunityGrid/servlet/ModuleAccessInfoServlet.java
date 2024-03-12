package Opportunity.OpportunityGrid.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
/**
 * Servlet implementation class ModuleAccessInfoServlet
 */
@WebServlet("/ModuleAccessInfoServlet")
public class ModuleAccessInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModuleAccessInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession details = request.getSession();
        String id = (String) details.getAttribute("ID");
        DBconnection dBconnection = null;
        Connection con = null;
        JsonArray jsonArray = new JsonArray();
        try {
            dBconnection = new DBconnection();
            con = (Connection) dBconnection.getConnection();
            String ModuleNames[] = { "Intake" };
            for (int i = 0; i < ModuleNames.length; i++) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("ModuleName", ModuleNames[i]);
                String SelectCompleteStatusTriage = "select distinct ifnull(IsCompleted,'No')IsCompleted from decom3sixtytool.triage_summary_info where Id = ?";
                PreparedStatement st1 = con.prepareStatement(SelectCompleteStatusTriage);
    			st1.setString(1, id);
    			ResultSet rs1 = st1.executeQuery();
                if (rs1.next()) {
                    if (rs1.getString("IsCompleted").equals("Yes")) {
                        jsonObj.addProperty("completeStatus", rs1.getString("IsCompleted"));
                        jsonObj.addProperty("cuurrentModule", "TriageSummary");
                        String SelectCompleteStatusAssesment = "select distinct ifnull(IsCompleted,'No')IsCompleted from decom3sixtytool.assessment_archival_consumption_info where Id = ?";
                        PreparedStatement st2 = con.prepareStatement(SelectCompleteStatusAssesment);
            			st2.setString(1, id);
            			ResultSet rs2 = st2.executeQuery();
                        if (rs2.next()) {
                            if (rs2.getString("IsCompleted").equals("Yes")) {
                                jsonObj.addProperty("completeStatus", rs2.getString("IsCompleted"));
                                jsonObj.addProperty("cuurrentModule", "Assesment");
                                String SelectCompleteStatusStakeHolder = "select distinct ifnull(IsCompleted,'No')IsCompleted from decom3sixtytool.intake_stake_holder_info where OppId = ?";
                                PreparedStatement st3 = con.prepareStatement(SelectCompleteStatusStakeHolder);
                    			st3.setString(1, id);
                    			ResultSet rs3 = st3.executeQuery();
                                if (rs3.next()) {
                                    if (rs3.getString("IsCompleted").equals("Yes")) {
                                        jsonObj.addProperty("completeStatus", rs3.getString("IsCompleted"));
                                        jsonObj.addProperty("cuurrentModule", "StakeHolder");
                                    }
                                }
                                else {
                                    jsonObj.addProperty("completeStatus", "Yes");
                                    jsonObj.addProperty("cuurrentModule", "Assesment");
                                }
                            }
                        }
                        else {
                            jsonObj.addProperty("completeStatus", "Yes");
                            jsonObj.addProperty("cuurrentModule", "TriageSummary");
                        }
                    }
                    else {
                        jsonObj.addProperty("completeStatus", "No");
                        jsonObj.addProperty("cuurrentModule", "Triage");
                    }
                } else {
                    jsonObj.addProperty("completeStatus", "No");
                    jsonObj.addProperty("cuurrentModule", "Triage");
                }
                String SelectModuleInfo = "select * from Module_Approval_Info where oppid = ? and modulename = 'Intake'";
                PreparedStatement st = con.prepareStatement(SelectModuleInfo);
    			st.setString(1, id);
    			ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    jsonObj.addProperty("checkExistence", true);
                    jsonObj.addProperty("OverallApproval", rs.getString("overallapproval"));
                } else {
                    jsonObj.addProperty("checkExistence", false);
                }
                jsonArray.add(jsonObj);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null)
                    con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
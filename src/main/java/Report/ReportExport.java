package Report;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import logger.System;

@WebServlet("/ReportExport")
public class ReportExport extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportExport() {
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
        JsonArray jsonArray = new JsonArray();
        String selectedOption = request.getParameter("selectedOption");
        ReportExportService reportExportServiceService = new ReportExportService();
        try {
            switch (selectedOption) {

                case "intakeReport1":
                    jsonArray = reportExportServiceService.getIntakeReport1();
                    break;
                case "intakeReport2":
                    jsonArray = reportExportServiceService.getIntakeReport2();
                    break;
                case "intakeReport3":
                    jsonArray = reportExportServiceService.getIntakeReport3();
                    break;
                default:
                    // Handle the default case or return an error message
                    reportExportServiceService = null;
                    jsonArray = null;
                    break;

            }
        }
        catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        System.gc();
        String json = new Gson().toJson(jsonArray);
        System.out.println("JSON OBJECT "+json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(json);
    }
}

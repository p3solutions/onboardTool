package compliance_module_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;



import compliance_module_service.IntakeExportReportService;

/**
 * Servlet implementation class IntakeReportExportServlet
 */
@WebServlet("/Intake_report_export_servlet")
public class Intake_report_export_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Intake_report_export_servlet() {
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
        JsonArray jsonArray = null;
        

        String category = request.getParameter("reportname");
        System.out.println("<<selectedOption>>"+category);
        IntakeExportReportService Report = new IntakeExportReportService();
        switch (category) {
            case "Intake":
                try {
                    jsonArray= Report.fetchReportDetails1();
                } catch (Exception e) {
                    e.printStackTrace();
                    
                }
                break;
            case "Intake-Triage":
                try {
                    jsonArray = Report.fetchReportDetails2();
                } catch (Exception e) {
                	e.printStackTrace();
                	 
                }
                break;
            case "Requirements":
                try {
                    jsonArray = Report.fetchReportDetails3();
                } catch (Exception e) {
                    e.printStackTrace();
                   
                }
                break;
            default:
                throw new IllegalArgumentException("Invalid report name: " + category);
        }

        System.gc();
        System.out.println("JSON ARRAY Servlet _+_+_+_+_+_+_+_ : :  "+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(json);
        
    }
	}
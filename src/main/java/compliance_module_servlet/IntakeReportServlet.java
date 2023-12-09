package compliance_module_servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import compliance_module_service.IntakeReportService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import java.io.IOException;
import java.sql.SQLException;

/**
     * Servlet implementation class Retrieve_users_servlet
     */
    @WebServlet("/IntakeReportServlet")
    public class IntakeReportServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
        /**
         * @see HttpServlet#HttpServlet()
         */
        public IntakeReportServlet() {
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
            JsonObject result = new JsonObject();
            JsonArray jsonArray = null;
            

            String selectedOption = request.getParameter("category");
            System.out.println("<<selectedOption>>"+selectedOption);
            IntakeReportService Report = new IntakeReportService();
            switch (selectedOption) {
                case "Intake":
                    try {
                        jsonArray= Report.getReportDetails1();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case "Intake-Triage":
                    try {
                        jsonArray = Report.getReportDetails2();
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "Requirements":
                    try {
                        jsonArray = Report.getReportDetails3();
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                    break;
                
                default:
                    // Handle the default case or return an error message
                    result.addProperty("error", "Invalid option");
                    break;
            }

            System.gc();
            System.out.println("JSON ARRAY "+jsonArray);
            String json = new Gson().toJson(jsonArray);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            response.getWriter().write(json);
        }
    }
    

 
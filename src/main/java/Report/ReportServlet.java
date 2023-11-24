package Report;

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

    @WebServlet("/ReportServlet")
    public class ReportServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
        /**
         * @see HttpServlet#HttpServlet()
         */
        public ReportServlet() {
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
            int page = Integer.parseInt(request.getParameter("page"));
            int maxRows = Integer.parseInt(request.getParameter("maxRows"));

            String selectedOption = request.getParameter("selectedOption");
            IntakeReportService intakeReportService = new IntakeReportService();
            switch (selectedOption) {
                case "intakeReport1":
                    try {
                        result = intakeReportService.getIntakeReport1(page, maxRows);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "intakeReport2":
                    try {
                        result = intakeReportService.getIntakeReport2(page, maxRows);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "intakeReport3":
                    try {
                        result = intakeReportService.getIntakeReport3(page, maxRows);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "intakeReport4":
                    try {
                        result = intakeReportService.getIntakeReport4(page, maxRows);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                default:
                    // Handle the default case or return an error message
                    intakeReportService = null;
                    break;
            }

            System.gc();
            String json = new Gson().toJson(result);
            System.out.println("JSON OBJECT "+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            response.getWriter().write(json);
        }
    }


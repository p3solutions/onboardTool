package Finance.servlet;

import Finance.service.FinanceAppInfoSaveService;
import com.google.gson.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
    @WebServlet("/FinanceAppInfoSaveServlet")
    public class FinanceAppInfoSaveServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        /**
         * @see HttpServlet#HttpServlet()
         */
        public FinanceAppInfoSaveServlet() {
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
            String id = (String)details.getAttribute("APPID");
            String oppName =(String)details.getAttribute("APPNAME");
            String JsonString= (String)request.getParameter("JsonString");
            JsonParser parser = new JsonParser();
            JsonElement tradeElement = parser.parse(JsonString);
            JsonArray jsonArray = tradeElement.getAsJsonArray();
            JsonObject jsonObject = new JsonObject();
            try {
                FinanceAppInfoSaveService AppInfo = new FinanceAppInfoSaveService(id, jsonArray, oppName);
                boolean statusFlag = AppInfo.save();
                jsonObject.addProperty("checkSaveStatus", statusFlag);
                AppInfo = null;
                System.gc();
            } catch (ClassNotFoundException | SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            String json = new Gson().toJson(jsonObject);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }

    }


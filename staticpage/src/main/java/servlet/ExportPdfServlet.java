/*
package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Intake_Export_PDF")
public class ExportPdfServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("Testing Sample");

        HttpSession details = request.getSession();
        HttpSession session = request.getSession();
        String app_Name = request.getParameter("appname");
        if (app_Name != null && !app_Name.isEmpty()) {
            session.setAttribute("appidd", app_Name);
        }
        app_Name = (String) session.getAttribute("appidd");
        */
/*JsonObject infojson = new ExportPdfService().getExportInformation(app_Name);
        String json = new Gson().toJson(infojson);
        System.out.println("json 123--->" + json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);*//*

    }
}
*/

package Finance.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/FinanceSetSessionAttributeServlet")
public class FinanceSetSessionAttributeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String origin = request.getHeader("Origin");
        // Get the selected ID from the AJAX request
        String selectedId = request.getParameter("selectedId");
        String selectedName = request.getParameter("selectedName");

        // Set the session attribute
        HttpSession session = request.getSession();
        session.setAttribute("APPID", selectedId);
        session.setAttribute("APPNAME", selectedName);
        response.setHeader("Access-Control-Allow-Origin", origin);
        // Respond to the client if needed
        response.getWriter().write("Session attribute set successfully");


    }
}

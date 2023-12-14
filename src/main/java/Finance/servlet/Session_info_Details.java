package Finance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class clear_Session_details
 */
@WebServlet("/Session_info_Details")
public class Session_info_Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Session_info_Details() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	        HttpSession session = request.getSession();
	        session.removeAttribute("APPID");
	        session.removeAttribute("APPNAME");
	        response.getWriter().write("Session attribute removed successfully");
	       }

}

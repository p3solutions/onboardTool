package governance.wave.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
@WebServlet("/selectWaveServlet")
public class selectWaveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String waveName =  request.getParameter("selectedWaveName");
       String waveId = request.getParameter("selectedWaveId");
       HttpSession details = request.getSession();
       details.setAttribute("selectedWaveName",waveName);
       details.setAttribute("selectedWaveId",waveId);
       response.sendRedirect("waveGrid.jsp");
	}

}

package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logger.System;
@WebServlet("/setPhaseId")

public class setPhaseId extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession details = request.getSession();
      String phaseId = request.getParameter("phaseId");
      String phaseName =  request.getParameter("phaseName");
      
      details.setAttribute("phaseId",phaseId);
      details.setAttribute("phaseName",phaseName);
      
      response.sendRedirect("waveList.jsp");
	}

}

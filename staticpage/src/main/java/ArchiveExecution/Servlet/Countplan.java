package ArchiveExecution.Servlet;

import ArchiveExecution.Service.Weekday;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Countplan")
public class Countplan extends HttpServlet {
    final static Logger logger = Logger.getLogger(Countplan.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Weekday weekday = new Weekday();
        String from_date = request.getParameter("fromD");
        String todate = request.getParameter("toD");
        String plancount = String.valueOf(weekday.splittingoperation(from_date, todate));
        logger.info("plancount" + plancount);
        response.setContentType("text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(plancount);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

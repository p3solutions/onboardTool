package ArchiveExecution.Servlet;

import ArchiveExecution.Service.Weekday;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Countactual")
public class Countactual extends HttpServlet {
    final static Logger logger = Logger.getLogger(Countactual.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Weekday w = new Weekday();
        String fromd = request.getParameter("fromD");
        String actualcount = Integer.toString(w.actual_hours(fromd));
        logger.info("actual count :" + actualcount);
        response.setContentType("text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(actualcount);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

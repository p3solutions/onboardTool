package ArchiveExecution.Servlet;

import ArchiveExecution.Service.Weekday;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("/Count")
public class Count extends HttpServlet {
    private static final long serialVersionUID = 1L;
    final static Logger logger = Logger.getLogger(Count.class);


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        String fromdate = request.getParameter("field1");
        String todate = request.getParameter("field2");
        String actual_date = request.getParameter("field3");
        String actual_enddate = request.getParameter("field4");
        Weekday wk = new Weekday();
        int count = wk.splittingoperation(fromdate, todate);
        int actual_count = wk.splittingoperation(actual_date, actual_enddate);
        String result = Integer.toString(count) + "," + Integer.toString(actual_count);
        logger.info(" result--->: " + result);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(result);
    }

}

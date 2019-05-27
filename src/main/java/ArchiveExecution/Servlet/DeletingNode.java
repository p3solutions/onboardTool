package ArchiveExecution.Servlet;

import ArchiveExecution.Service.Archive_Execution_Pop_Up_Operation;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Adding_Node
 */
@WebServlet("/DeletingNode")
public class DeletingNode extends HttpServlet {
    private static final long serialVersionUID = 1L;
    final static Logger logger = Logger.getLogger(DeletingNode.class);


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String seq = request.getParameter("seq");
        int sequence = Integer.parseInt(seq);
        String projectname = request.getParameter("projectname");
        Archive_Execution_Pop_Up_Operation.Delete_Task_Name(sequence, projectname);
        response.sendRedirect("Archive_Execution.jsp");
    }

}

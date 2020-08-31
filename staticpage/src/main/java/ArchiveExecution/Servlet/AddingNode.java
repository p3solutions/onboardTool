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
@WebServlet("/AddingNode")
public class AddingNode extends HttpServlet {
    final static Logger logger = Logger.getLogger(AddingNode.class);

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String seq_num = request.getParameter("sequence");
        logger.info("sequence number: "+seq_num);
        int seq = Integer.parseInt(seq_num.substring(seq_num.lastIndexOf('n') + 1, seq_num.length()));
        String taskname = request.getParameter("task_name");
        String selected_project = request.getParameter("project_name");
        boolean typeofnode = Boolean.parseBoolean(request.getParameter("type_of_node"));
        logger.info("sequence:" + seq + " taskname :" + taskname + " selected project" + selected_project + " type of node : " + typeofnode);
        Archive_Execution_Pop_Up_Operation.Adding_Task_Name(seq, taskname, selected_project, typeofnode);
        response.sendRedirect("Archive_Execution.jsp");
    }

}

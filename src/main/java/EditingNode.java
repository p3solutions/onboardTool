

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Adding_Node
 */
@WebServlet("/EditingNode")
public class EditingNode extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public EditingNode() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //System.out.println("delete node");
        String seq=request.getParameter("seq");
        int sequence=Integer.parseInt(seq);
        String projectname=request.getParameter("projectname");
        String taskname=request.getParameter("taskname");
        Archive_Execution_Pop_Up_Operation.EditTaskName(sequence,projectname,taskname);
        response.sendRedirect("Archive_Execution.jsp");
    }

}

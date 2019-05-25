

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Adding_Node
 */
@WebServlet("/AddingNode")
public class AddingNode extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public AddingNode() {
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
        System.out.println("in post");
        String seq_num=request.getParameter("sequence");
        int seq=Integer.parseInt(seq_num.substring(seq_num.lastIndexOf('n')+1,seq_num.length()));
        String taskname=request.getParameter("task_name");
        System.out.println("task");
        String selected_project=request.getParameter("project_name");
        System.out.println("project");
        boolean typeofnode=Boolean.parseBoolean(request.getParameter("type_of_node"));
        System.out.println("sequence:"+seq+" taskname :"+taskname+" selected project"+selected_project+" type of node : "+typeofnode );
        Archive_Execution_Pop_Up_Operation.AddingTaskName(seq,taskname,selected_project,typeofnode);
        response.sendRedirect("Archive_Execution.jsp");
        //response.setIntHeader("Refresh",300);
    }

}

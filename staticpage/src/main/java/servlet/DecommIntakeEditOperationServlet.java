package servlet;

import service.DecommIntakeServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DecommIntakeEditOperationServlet")
public class DecommIntakeEditOperationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationname=request.getParameter("ApplicationName");
        String projectname=request.getParameter("ProjectName");
        String label_name =request.getParameter("Label");
        /*String type =request.getParameter("Type");
        String mandatory =request.getParameter("Mandatory");
        String[] options =request.getParameterValues("Options");*/
        int SequenceNumber=Integer.parseInt(request.getParameter("Seq_num"));
       DecommIntakeServices.DecommIntakeEditOperation(projectname,applicationname,label_name,SequenceNumber);
        response.sendRedirect("legency_retention.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

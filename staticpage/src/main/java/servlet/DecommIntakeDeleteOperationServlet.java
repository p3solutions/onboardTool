package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import service.DecommIntakeServices;
import service.IntakeInformationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DecommIntakeDeleteOperationServlet")
public class DecommIntakeDeleteOperationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationname=request.getParameter("ApplicationName");
        String projectname=request.getParameter("ProjectName");
        int deleteseqnum=Integer.parseInt(request.getParameter("DeleteNumber"));
        DecommIntakeServices.DecommIntakeDeleteOperation(projectname,applicationname,deleteseqnum);
        response.sendRedirect("legency_retention.jsp?appname="+applicationname+"&prjname="+projectname);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

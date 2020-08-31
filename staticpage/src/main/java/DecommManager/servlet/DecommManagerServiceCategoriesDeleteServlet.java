package DecommManager.servlet;

import DecommManager.service.DecommManageExecuteInfoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DecommManagerServiceCategoriesDeleteServlet")
public class DecommManagerServiceCategoriesDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationname=request.getParameter("ApplicationName");
        String projectname=request.getParameter("ProjectName");
        int deleteseqnum=Integer.parseInt(request.getParameter("DeleteNumber"));
        //DecommIntakeServices.DecommIntakeDeleteOperation(projectname,applicationname,deleteseqnum);
        DecommManageExecuteInfoService.DecommManagerServiceCategoriesDeleteService(projectname,applicationname,deleteseqnum);
        response.sendRedirect("DecommManageServiceCategoriesChecklist.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package DecommManager.servlet;

import DecommManager.service.DecommManageExecuteInfoService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DecommManageInfraCompSaveServlet")
public class DecommManageInfraCompSaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationname = request.getParameter("ApplicationName");
        String projectname = request.getParameter("ProjectName");
        int rowlength = Integer.parseInt(request.getParameter("RowLength"));
        for (int i = 1; i<=rowlength; i++){
            String Infra_Comp_Type = request.getParameter("infra_comp"+i);
            String Comp_Name = request.getParameter("comp_name"+i);
            String Manage_Legacy = request.getParameter("manage_legacy"+i);
            String Server_App = request.getParameter("server_app"+i);
            String Dev = request.getParameter("dev"+i);
            String Test = request.getParameter("test"+i);
            String Stage = request.getParameter("stage"+i);
            String Prod = request.getParameter("prod"+i);
            String Retired = request.getParameter("retired"+i);
            String Textarea = request.getParameter("textarea"+i);
            DecommManageExecuteInfoService.DecommManageInfraCompSaveService(projectname,applicationname,i,Infra_Comp_Type,Comp_Name,Manage_Legacy,Server_App,Dev,Test,Stage,Prod,Retired,Textarea);
        }
        RequestDispatcher rd = request.getRequestDispatcher("DecommManageServiceCategotiesDynamicTableServlet");
        rd.forward(request,response);
        //response.sendRedirect("DecommManageServiceCategoriesChecklist.jsp?appname="+applicationname+"&projectname="+projectname);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

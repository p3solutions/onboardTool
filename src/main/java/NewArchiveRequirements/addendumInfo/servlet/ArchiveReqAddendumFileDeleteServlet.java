package NewArchiveRequirements.addendumInfo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.service.Legacy_App_Scr_Delete;
import NewArchiveRequirements.addendumInfo.service.archiveReqAddendumFileDeleteService;
import logger.System;

/**
 * Servlet implementation class Legacy_App_Scr_DeleteServlet
 */
@WebServlet("/ArchiveReqAddendumFileDeleteServlet")
public class ArchiveReqAddendumFileDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchiveReqAddendumFileDeleteServlet() {
        super();
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
		HttpSession details = request.getSession();
	    String Id=(String)details.getAttribute("ID");
	    String Seq_no=request.getParameter("Delete_Seq_Number");
	    String Section_no=request.getParameter("Delete_Section_Number");
	    String File_Name=request.getParameter("Delete_File_Name");
	    JsonObject jsonObj =archiveReqAddendumFileDeleteService.delete_uploaded_files(Id,Seq_no,Section_no,File_Name);
        String json = new Gson().toJson(jsonObj);
        System.out.println("Addendum File Delete JSON : "+json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

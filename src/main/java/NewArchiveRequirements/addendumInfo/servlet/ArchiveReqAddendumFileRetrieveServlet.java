package NewArchiveRequirements.addendumInfo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.service.Legacy_App_Scr_Retrieve;
import NewArchiveRequirements.addendumInfo.service.ArchiveReqAddendumFileRetrieveService;
import logger.System;

/**
 * Servlet implementation class Legacy_App_Scr_Retrieve_Servlet
 */
@WebServlet("/ArchiveReqAddendumFileRetrieveServlet")
public class ArchiveReqAddendumFileRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchiveReqAddendumFileRetrieveServlet() {
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
	    String Section_no=request.getParameter("section_no");
	    String File_Name=request.getParameter("File_Name");
	    JsonArray jsonArray = null;
	    ArchiveReqAddendumFileRetrieveService file_retrive=new ArchiveReqAddendumFileRetrieveService();
	    jsonArray=file_retrive.file_retrieve(Id,Section_no);
        file_retrive =null;
        //calling finalize method and garabage collector
        System.gc();
        System.out.println("Addendum Files JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);	
		
		
	}

}

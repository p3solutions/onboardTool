package documentUpload.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import documentUpload.service.documentUploadService;
import onboard.DBconnection;

import java.util.List;
import java.util.Properties;
import logger.System;
@WebServlet("/documentUploadServlet")
public class documentUploadServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	JsonObject jsonObj = new JsonObject();
    try
	{
	HttpSession details = request.getSession();
    String Id=(String)details.getAttribute("ID"); 
    String sectionName = request.getParameter("sectionName");
	ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
	 List<FileItem> multiFiles = sf.parseRequest(request);
	 documentUploadService service = new documentUploadService(Id, "APPLICATION_INFORMATION");
	 jsonObj.addProperty("checkFilesUpload",service.uploadDocuments(multiFiles));
	 service.retrieveBlob();
	 service = null;
	 System.gc();
	 System.out.println("File uploaded");
	}
	catch(Exception e)
	{
		e.printStackTrace();
		jsonObj.addProperty("checkFilesUpload",false);
	}
    String json = new Gson().toJson(jsonObj);
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
	}
	
}

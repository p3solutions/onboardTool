package exportPdf.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import File_Utility.FileUtils;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import logger.System;

@WebServlet("/deletePDFservlet")
public class deletePDFservlet extends HttpServlet {
	private final int ARBITARY_SIZE = 1048;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonObject jsonObject = new JsonObject();
		String path = request.getParameter("path");
		File file = FileUtils.createFile(path);
		boolean flag = false;
		if(file.exists()) {
			file.delete();
			//System.out.println("delete PDF:"+path);
			flag = true;
		}
		jsonObject.addProperty("statusFlag", flag);
		String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

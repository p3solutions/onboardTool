package governance.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import governance.service.dynamicCreationService;
import logger.System;

@WebServlet("/dynamicWaveCreationServlet")
public class dynamicWaveCreationServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String waveName = request.getParameter("waveName"); 
			String creationType = request.getParameter("creationType");
			JsonObject jsonObject = new JsonObject();
			try {
				 dynamicCreationService service = new dynamicCreationService(waveName, creationType);
				 jsonObject= service.save();
				 service = null;
				 System.gc();
				 
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				String json = new Gson().toJson(jsonObject);
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(json);
	}

}

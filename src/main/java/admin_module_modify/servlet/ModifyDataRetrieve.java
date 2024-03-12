package admin_module_modify.servlet;


import admin_module_modify.service.Modify_List_User_Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import logger.System;

@WebServlet("/ModifyDataRetrieve")
public class ModifyDataRetrieve extends HttpServlet {
    final static Logger logger = Logger.getLogger(ModifyDataRetrieve.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
			/*
			 * JsonArray infojson = new
			 * ModifyDataRetrieve_Serice().getModify_List_of_User_Service(id); String json =
			 * new Gson().toJson(infojson); response.setContentType("application/json");
			 * response.setCharacterEncoding("UTF-8"); response.getWriter().write(json);
			 * logger.info("json data----->" + json);
			 */
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

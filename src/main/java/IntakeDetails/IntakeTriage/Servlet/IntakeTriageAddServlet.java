package IntakeDetails.IntakeTriage.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import onboard.DBconnection;
import logger.System;

/**
 * Servlet implementation class IntakeTriageAddServlet
 */
@WebServlet("/IntakeTriageAddServlet")
public class IntakeTriageAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeTriageAddServlet() {
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
		String ID = (String) details.getAttribute("ID");
		JsonObject jsonobject = new JsonObject();
        
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String label_name = request.getParameter("LabelName");
            //String column_name = request.getParameter("ColumnName");
            String mandatory = request.getParameter("Mandatory");
            String umandatory = request.getParameter("umandatory");
            String type = request.getParameter("Type");
            String option=request.getParameter("Options");
            System.out.println("U Mandatory : "+umandatory);
            /*String Field_Name=request.getParameter("FieldName");*/
            int NumberofInputfields=Integer.parseInt(request.getParameter("Number"));
            jsonobject.addProperty("LabelName", label_name);
            jsonobject.addProperty("ColumnName","TriageAddInfo");
            jsonobject.addProperty("Mandatory", mandatory);
            jsonobject.addProperty("umandatory", umandatory);
            jsonobject.addProperty("Type", type);
            jsonobject.addProperty("Options",option);
            if (type.equals("Text box") || type.equals("Datepicker")) {
                jsonobject.addProperty("CheckExistance", true);
            } else if (type.equals("Check box")) {
                jsonobject.addProperty("CheckboxExistance", true);
            } else if (type.equals("Radio box")) {
                jsonobject.addProperty("RadioCheckExistance", true);
            } else if (type.equals("Dropdown")) {
                jsonobject.addProperty("OptionCheckExistance", true);
            }
            /*if (type.equals("Check box")) {
                for (int i = 1; i < NumberofInputfields; i++) {
                    options[i] = request.getParameter("label" + i);
                    jsonobject.addProperty("Option" + i, options[i]);
                }
            } else if (type.equals("Radio box")) {
                for (int i = 0; i < NumberofInputfields; i++) {
                    options[i] = request.getParameter("label"+i);
                    jsonobject.addProperty("Option" + i, options[i]);
                }
            } else if (type.equals("Dropdown")) {
                for (int i = 0; i < NumberofInputfields; i++) {
                    options[i] = request.getParameter("drp_label" + i);
                    jsonobject.addProperty("Option" + i, options[i]);
                }
            }*/

            String select_lab = "select * from Triage_Info where Id = ? and label_name = ? ";
            PreparedStatement st1 = connection.prepareStatement(select_lab);
			st1.setString(1, ID);
			st1.setString(2, label_name);
			ResultSet rs1 = st1.executeQuery();
           //String select_col = "select * from Triage_Info where Id = '"+ID+"' and column_name = '"+column_name+"' ";
            //Statement st2=connection.createStatement();
            //ResultSet rs2=st2.executeQuery(select_col);
            boolean labelcheck=false;
            //boolean columncheck=false;
            if(rs1.next()){
                labelcheck = true;
                jsonobject.addProperty("LabelDuplicateCheck", "true");
            }
			/*
			 * if(rs2.next()){ columncheck = true;
			 * jsonobject.addProperty("ColumnDuplicateCheck", "true");
			 * 
			 * }
			 */
            if(!labelcheck)
            {
            int seq_num =new IntakeTriageService().Add(ID,label_name, mandatory,umandatory, type, NumberofInputfields, option);
            jsonobject.addProperty("Seq_Num",seq_num);
            }

        }
        catch(Exception e)
        {
        	e.printStackTrace();
            System.out.println("Exception----------[info]-----"+e);
        }
        String json = new Gson().toJson(jsonobject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
        //response.sendRedirect("DecommManageExecutionInfo.jsp?appname="+applicationname+"&projectname="+projectname);

	}
	}




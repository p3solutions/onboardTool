package Opportunity.Servlet;

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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Opportunity.Service.NewOpportunityService;
import onboard.DBconnection;
import logger.System;

/**
 * Servlet implementation class NewOpportunityAddServlet
 */
@WebServlet("/NewOpportunityAddServlet")
public class NewOpportunityAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewOpportunityAddServlet() {
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
		JsonObject jsonobject = new JsonObject();
        String applicationname = request.getParameter("ApplicationName");
        String projectname = request.getParameter("ProjectName");
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String label_name = request.getParameter("LabelName");
            String column_name = request.getParameter("ColumnName");
            String mandatory = request.getParameter("Mandatory");
            String umandatory = request.getParameter("umandatory");
            String type = request.getParameter("Type");
            String option=request.getParameter("Options");

            /*String Field_Name=request.getParameter("FieldName");*/
            int NumberofInputfields=Integer.parseInt(request.getParameter("Number"));
            jsonobject.addProperty("ProjectName", projectname);
            jsonobject.addProperty("ApplicationName", applicationname);
            jsonobject.addProperty("LabelName", label_name);
            jsonobject.addProperty("ColumnName","OpportunityAddInfo");
            jsonobject.addProperty("Mandatory", mandatory);
            jsonobject.addProperty("UMandatory", umandatory);
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

            String select_lab = "select * from Opportunity_Info_Details where  label_name = ? ";
            PreparedStatement st1=connection.prepareStatement(select_lab);
            st1.setString(1, label_name);
            ResultSet rs1=st1.executeQuery();
            String select_col = "select * from Opportunity_Info_Details where  column_name = ? ";
            PreparedStatement st2=connection.prepareStatement(select_col);
            st2.setString(1, column_name);
            ResultSet rs2=st2.executeQuery();
            boolean labelcheck=false;
            boolean columncheck=false;
            if(rs1.next()){
                labelcheck = true;
                jsonobject.addProperty("LabelDuplicateCheck", "true");
            }
            if(rs2.next()){
                columncheck = true;
                jsonobject.addProperty("ColumnDuplicateCheck", "true");

            }
            if(!labelcheck && !columncheck)
            {
            	//DecommIntakeServices.DecommIntakeAddOperation(projectname, applicationname, label_name, column_name, mandatory, type, NumberofInputfields, option);
            //DecommManageExecuteInfoService.DecommManagserAddOperationService(projectname, applicationname, label_name, column_name, mandatory, type, NumberofInputfields, option);
            int seq_num = NewOpportunityService.NewOpportunityAddOperationService(applicationname, label_name, column_name, mandatory,umandatory, type, NumberofInputfields, option);
            jsonobject.addProperty("Seq_Num", seq_num);
            }

        }
        catch(Exception e)
        {
            System.out.println("Exception----------[info]-----"+e);
        }
        String json = new Gson().toJson(jsonobject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
        //response.sendRedirect("DecommManageExecutionInfo.jsp?appname="+applicationname+"&projectname="+projectname);

	}

}

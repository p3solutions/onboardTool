package IntakeDetails.IntakeTriageSummary.servlet;

import java.io.IOException;
import java.sql.Connection;
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

import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import onboard.DBconnection;

/**
 * Servlet implementation class IntakeTriageSummaryAddFeatureServlet
 */
@WebServlet("/IntakeTriageSummaryAddFeatureServlet")
public class IntakeTriageSummaryAddFeatureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeTriageSummaryAddFeatureServlet() {
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
            String column_name = request.getParameter("ColumnName");
            String mandatory = request.getParameter("Mandatory");
            String type = request.getParameter("Type");
            String option=request.getParameter("Options");
            //String id = (String) request.getParameter("ID");
            /*String Field_Name=request.getParameter("FieldName");*/
            int NumberofInputfields=Integer.parseInt(request.getParameter("Number"));
            jsonobject.addProperty("LabelName", label_name);
            jsonobject.addProperty("ColumnName","TriageSummaryAddInfo");
            jsonobject.addProperty("Mandatory", mandatory);
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

            String select_lab = "select * from Triage_Summary_Info where Id = '"+ID+"' and label_name = '"+label_name+"' ";
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(select_lab);
            boolean labelcheck=false;
           // boolean columncheck=false;
            if(rs1.next()){
                labelcheck = true;
                jsonobject.addProperty("LabelDuplicateCheck", "true");
            }
            if(!labelcheck)
            {
            int seq_num =new IntakeTriageSummaryService().Add(ID, label_name, mandatory, type, NumberofInputfields, option);
            jsonobject.addProperty("Seq_Num",seq_num);
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

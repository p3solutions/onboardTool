package DecommManager.servlet;

import DecommManager.service.DecommManageExecuteInfoService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/DecommManageServiceCategoriesAddServlet")
public class DecommManageServiceCategoriesAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonObject jsonobject = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String applicationname = request.getParameter("ApplicationName");
            String projectname = request.getParameter("ProjectName");
            String label_name = request.getParameter("LabelName");
            String column_name = request.getParameter("ColumnName");
            String mandatory = request.getParameter("Mandatory");
            String type = request.getParameter("Type");
            String option=request.getParameter("Options");

            /*String Field_Name=request.getParameter("FieldName");*/
            int NumberofInputfields=Integer.parseInt(request.getParameter("Number"));
            jsonobject.addProperty("ProjectName", projectname);
            jsonobject.addProperty("ApplicationName", applicationname);
            jsonobject.addProperty("LabelName", label_name);
            jsonobject.addProperty("ColumnName","ServiceCategories");
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

            String select_lab = "select * from decomm_manage_service_categories_checklist where prj_name='"+projectname+"' and app_name='"+applicationname+"' and label_name = '"+label_name+"' ";
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(select_lab);
            String select_col = "select * from decomm_manage_service_categories_checklist where prj_name='"+projectname+"' and app_name='"+applicationname+"' and column_name = '"+column_name+"' ";
            Statement st2=connection.createStatement();
            ResultSet rs2=st2.executeQuery(select_col);
            boolean labelcheck=false;
            boolean columncheck=false;
            if(rs1.next()){
                labelcheck = true;
            }
            if(rs2.next()){
                columncheck = true;
            }
            if(labelcheck&&columncheck){
                jsonobject.addProperty("CheckExistance", true);
            }
            else{
                jsonobject.addProperty("CheckExistance", false);
                //DecommIntakeServices.DecommIntakeAddOperation(projectname, applicationname, label_name, column_name, mandatory, type, NumberofInputfields, option);
                DecommManageExecuteInfoService.DecommManageServiceCategoriesAddService(projectname, applicationname, label_name, column_name, mandatory, type, NumberofInputfields, option);
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
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}


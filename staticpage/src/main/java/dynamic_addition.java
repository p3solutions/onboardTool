

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dynamic_addition
 */
@WebServlet("/dynamic_addition")
public class dynamic_addition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dynamic_addition() {
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
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Dynamic_addition servlet-----[INFO]");  
		// TODO Auto-generated method stub
		doGet(request, response);
		String servlet_name=request.getParameter("servlet_name");
		//System.out.println(servlet_name);
		
		String project_name=request.getParameter("project_name");
		String appln_name = request.getParameter("appln_name");
		String Pid=request.getParameter("panel");
		String panel_name = "P" + request.getParameter("panel");
		String c_labels="",r_labels="",d_labels="";
		String label = request.getParameter("label"+Pid);
		String type = request.getParameter("types"+Pid);
		String mandatory = request.getParameter("mandatory"+Pid);
		String col_name= request.getParameter("idname"+Pid);
		
		String number = request.getParameter("number"+Pid);
		
		if(number==null || number=="")
			number="0";
		String Rnumber = request.getParameter("radio_number"+Pid);
		if(Rnumber==null || Rnumber=="")
			Rnumber="0";
		String Dnumber = request.getParameter("drop_number"+Pid);
		if(Dnumber==null || Dnumber=="")
			Dnumber="0";
		
		for(int i=1;i<=Integer.parseInt(number);i++)
			c_labels+=request.getParameter("label"+i)+"/";
		for(int i=1;i<=Integer.parseInt(Rnumber);i++)
			r_labels+=request.getParameter("Rlabel"+i)+"/";
		for(int i=1;i<=Integer.parseInt(Dnumber);i++)
			d_labels+=request.getParameter("drp_label"+i)+"/";
		
	
		
		  try
	        {
	          // create a mysql database connection
	          String myDriver = "org.gjt.mm.mysql.Driver";
	          String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
	          Class.forName(myDriver);
	          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	          String query="";
	        
	         
	          // the mysql insert statement
	          if(servlet_name.equals("Business")){
	           query = " insert into Intake_BuisnessCustomization (label,type_of_box,mandatory,no_of_box,checkbox_labels,no_of_Rbox,radiobox_labels,no_of_drpdwn,dropdown_labels,idname,panels,projectname,appname)"
	            + " values (? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	          }
	          if(servlet_name.equals("Technical")){
		           query = " insert into Intake_TechnicalCustomization (label,type_of_box,mandatory,no_of_box,checkbox_labels,no_of_Rbox,radiobox_labels,no_of_drpdwn,dropdown_labels,idname,panels,projectname,appname)"
		            + " values (? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		          }
	          if(servlet_name.equals("Requirements")){
		           query = " insert into Intake_ArchivalRequirementCustomization (label,type_of_box,mandatory,no_of_box,checkbox_labels,no_of_Rbox,radiobox_labels,no_of_drpdwn,dropdown_labels,idname,panels,projectname,appname)"
		            + " values (? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		          }
	          PreparedStatement preparedStmt = conn.prepareStatement(query);
	          preparedStmt.setString (1, label);
	          preparedStmt.setString (2, type);
	          preparedStmt.setString (3, mandatory);
	          preparedStmt.setString (4, number);
	          preparedStmt.setString (5, c_labels);
	          preparedStmt.setString (6, Rnumber);
	          preparedStmt.setString (7, r_labels);
	          preparedStmt.setString (8, Dnumber);
	          preparedStmt.setString (9, d_labels);
	         preparedStmt.setString (10, col_name);
	         preparedStmt.setString (11, panel_name);
	         preparedStmt.setString (12, project_name);
	         preparedStmt.setString (13, appln_name);
	          preparedStmt.execute();
	          conn.close();
	        }
	        catch (Exception e)
	        {
	        	
	        	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
	        }
	          
		  if(servlet_name.equals("Business")){
		response.sendRedirect("Intake_Business.jsp");
		  }
		  if(servlet_name.equals("Technical")){
				response.sendRedirect("Intake_TechnicalDetails.jsp");
				  }
		  if(servlet_name.equals("Requirements")){
				response.sendRedirect("Intake_ArchiveRequirements.jsp");
				  }
	}

}

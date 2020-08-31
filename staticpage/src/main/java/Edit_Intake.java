

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
 * Servlet implementation class Edit_Intake
 */
@WebServlet("/Edit_Intake")
public class Edit_Intake extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit_Intake() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Edit_Intake servlet-----[INFO]");  
		String servlet_name=request.getParameter("servlet_name");
		String c_labels="",r_labels="",d_labels="";
		String label = request.getParameter("label");
		String type = request.getParameter("types");
		String mandatory = request.getParameter("mandatory");
		String panel= request.getParameter("pan_value");
		String col_name= request.getParameter("idname");
		
		String number = request.getParameter("number");
		if(number==null || number=="")
			number="0";
		String Rnumber = request.getParameter("radio_number");
		if(Rnumber==null || Rnumber=="")
			Rnumber="0";
		String Dnumber = request.getParameter("drop_number");
		if(Dnumber==null || Dnumber=="")
			Dnumber="0";
		
		for(int i=1;i<=Integer.parseInt(number);i++)
			c_labels+=request.getParameter("label"+i)+"/";
		for(int i=1;i<=Integer.parseInt(Rnumber);i++)
			r_labels+=request.getParameter("Rlabel"+i)+"/";
		for(int i=1;i<=Integer.parseInt(Dnumber);i++)
			d_labels+=request.getParameter("drp_label"+i)+"/";
		
		//System.out.println("servlet_name is "+servlet_name);
			
		
		   try
	        {
	          // create a mysql database connection
	          String myDriver = "org.gjt.mm.mysql.Driver";
	          String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
	          Class.forName(myDriver);
	          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	        
	         String query="";
	          // the mysql insert statement
	          if(servlet_name.equals("Business"))
	          {
	        	   query="update Intake_BuisnessCustomization set label='"+label+"',type_of_box='"+type+"',mandatory='"+mandatory+"',no_of_box='"+number+"',checkbox_labels='"+c_labels+"',no_of_Rbox='"+Rnumber+"',radiobox_labels='"+r_labels+"',no_of_drpdwn='"+Dnumber+"',dropdown_labels='"+d_labels+"' where idname='"+col_name+"'";
	        	   PreparedStatement preparedStmt = conn.prepareStatement(query);
	 	          preparedStmt.execute();
	 	          conn.close();
	 	         response.sendRedirect("Intake_Business.jsp");
	          }
	          if(servlet_name.equals("'Technical'"))
	          {
	        	   query="update Intake_TechnicalCustomization set label='"+label+"',type_of_box='"+type+"',mandatory='"+mandatory+"',no_of_box='"+number+"',checkbox_labels='"+c_labels+"',no_of_Rbox='"+Rnumber+"',radiobox_labels='"+r_labels+"',no_of_drpdwn='"+Dnumber+"',dropdown_labels='"+d_labels+"' where idname='"+col_name+"'";  
	        	   PreparedStatement preparedStmt = conn.prepareStatement(query);
	 	          preparedStmt.execute();
	 	          conn.close();
	 	        response.sendRedirect("Intake_TechnicalDetails.jsp");
	          }
	          if(servlet_name.equals("'Requirements'"))
	          {
	        	   query="update Intake_ArchivalRequirementCustomization set label='"+label+"',type_of_box='"+type+"',mandatory='"+mandatory+"',no_of_box='"+number+"',checkbox_labels='"+c_labels+"',no_of_Rbox='"+Rnumber+"',radiobox_labels='"+r_labels+"',no_of_drpdwn='"+Dnumber+"',dropdown_labels='"+d_labels+"' where idname='"+col_name+"'";
	        	   PreparedStatement preparedStmt = conn.prepareStatement(query);
	 	          preparedStmt.execute();
	 	          conn.close();
	 	         response.sendRedirect("Intake_ArchiveRequirements.jsp");
	          }
	          
	         // System.out.println("update query is "+query);
	         
	        }
	        catch (Exception e)
	        {
	        	 System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
	        }
		 
	}

}

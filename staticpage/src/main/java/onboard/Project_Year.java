package onboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Project_Year
 */
@WebServlet("/Project_Year")
public class Project_Year extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project_Year() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Project_Year servlet-----[INFO]");  
		String Year = request.getParameter("year");
		//System.out.println("Selected Year :" + Year);
		
		String month=Db_Connection(Year);
		
		
		response.setContentType("text/plain"); // Set content type of the response so that jQuery knows what it can// expect.
		response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		response.getWriter().write(month);
	}

	private String Db_Connection(String Year) {
		// TODO Auto-generated method stub
		String month="";
		try {
			DBconnection d;
			Connection con;
			
			d = new DBconnection();
			con = (Connection) d.getConnection();
			Statement week = con.createStatement();
			
			ResultSet rs = week.executeQuery("select projectname from appemphazize_projectdetails ");
			while (rs.next()) {
				
				String prjname = rs.getString(1);
				
			String query11 = "select count(*) from appemphazize_applicationinfo where prjname='"+rs.getString(1)+"'";
		        Statement st11 = con.createStatement();
		        ResultSet rs11 = st11.executeQuery(query11);
		        if(rs11.next()){
		        	
		        	int appCount =Integer.parseInt(rs11.getString(1));
		        	System.out.println("Application Count :" + appCount);
		        	String query12 = "select * from archiveexecution_details where seq_num=1 and level=1 and projects='"+rs.getString(1)+"' and substr(archiveexecution_details.pln_srt_date,7,4)='"+Year+"'";                          
		            Statement st12 = con.createStatement();
		            ResultSet rs12 = st12.executeQuery(query12);
		            while(rs12.next()){
		        	   String dates=rs12.getString("pln_srt_date");
		        	   System.out.println(" " + dates);
		        	   int mnth=Integer.parseInt(dates.substring(0,2));
		        	   month=String.valueOf(mnth);
		        	   
		        
			}
		           month=month+","+appCount+":";
		        }
			}
			con.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return month;
	}

}

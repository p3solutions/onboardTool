
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Retrive
 */
@WebServlet("/Retrive")
public class Retrive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Retrive() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Retrieve servlet-----[INFO]");  
		PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html><body>");
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "root");
            // Here dsnname- mydsn,user id- system(for oracle 10g),password is pintu.
            Statement stmt = (Statement) con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from appdetails");
           
          
            while (rs.next()) {
                String n = rs.getString("appname");
                String nm = rs.getString("ref");
                out.println("<textbox" +n  ); 
                out.print(">");
            }
           
            con.close();
           }
            catch (Exception e) {
            out.println("error");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

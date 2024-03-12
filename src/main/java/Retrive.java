
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.owasp.encoder.Encode;

import onboard.DBconnection;

import java.sql.Statement;
import logger.System;

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
        	PreparedStatement stmt=null;
        	ResultSet rs=null;
        	DBconnection dBconnection = new DBconnection();
	        Connection con = (Connection) dBconnection.getConnection();
            stmt = con.prepareStatement("select * from appdetails");
            rs = stmt.executeQuery();
           
          
            while (rs.next()) {
                String n = rs.getString("appname");
                String nm = rs.getString("ref");
                out.println("<textbox" +Encode.forHtml(n)); 
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

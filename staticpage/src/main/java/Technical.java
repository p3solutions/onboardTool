import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.BasicConfigurator;

import org.apache.log4j.Logger;

import org.apache.log4j.MDC;
import javax.servlet.ServletConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class comp
 */
@WebServlet("/Technical")
public class Technical extends HttpServlet {
private static final long serialVersionUID = 1L;
private Logger logger = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Technical() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException

    {

              logger=Logger.getRootLogger();

              BasicConfigurator.configure();
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
    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Technical servlet-----[INFO]"); 
	String project_name=request.getParameter("project_name");
	String app_name=request.getParameter("appln_name");
	//System.out.println(project_name+" "+app_name);
	int DEL_count=0;
try{
    String myDriver = "org.gjt.mm.mysql.Driver";
    String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
    Class.forName(myDriver);
    Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	
	/*String query = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA. COLUMNS WHERE TABLE_NAME = 'Intake_BuisnessDetails' ORDER BY ORDINAL_POSITION";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(query);*/
    for(int i=1;i<=3;i++){
   String query21 = "SELECT * from Intake_TechnicalCustomization where panels='P"+i+"'";
    Statement st21 = conn.createStatement();
    ResultSet rs21 = st21.executeQuery(query21);
    while(rs21.next())
    {
    	String val=request.getParameter(rs21.getString("idname")+"1");
    	String Idname=rs21.getString("idname");
    	if(val != null)
    	{
    		String query4 = "delete from Intake_TechnicalCustomization where idname='"+Idname+"' and projectname='"+project_name+"' and appname='"+app_name+"'";
        	PreparedStatement preparedStmt4 = conn.prepareStatement(query4);
        	 preparedStmt4.execute();
        	 DEL_count++;
     		String query5 = "alter table Intake_TechnicalDetails drop "+Idname+" where projectname='"+project_name+"' and appname='"+app_name+"'";
         	PreparedStatement preparedStmt5 = conn.prepareStatement(query5);
         	 preparedStmt5.execute();
         	// System.out.println("*********Deletion quey**********");
         	 //System.out.println(query4+"\n"+query5);
         	
         	 
    	}
    		
    }
    }
    if(DEL_count==0){
    String query = "SELECT * from Intake_TechnicalCustomization where appname='"+app_name+"' and projectname='"+project_name+"'";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(query);
    int cnt=0;
    String ref_id="";
    while(rs.next())
    {
    	if(cnt==0){
    	String n=request.getParameter(rs.getString("idname"));
    	cnt++;
    	String query1 = "insert into Intake_TechnicalDetails("+rs.getString("idname")+",appname,projectname) values('"+n+"','"+app_name+"','"+project_name+"')";

    	PreparedStatement preparedStmt = conn.prepareStatement(query1);
    	 preparedStmt.execute();
    	 String query10 = "SELECT max(id) from Intake_TechnicalDetails where appname='"+app_name+"'";
    	    Statement st10 = conn.createStatement();
    	    ResultSet rs10 = st10.executeQuery(query10);
    	    if(rs10.next())
    	    	ref_id=rs10.getString(1);
    	    
    	}
    	else{
    		String n=request.getParameter(rs.getString("idname"));
    		if(rs.getString("type_of_box").equals("Check box") && n == null)
    			n="no";

    
    	String query2 = "update Intake_TechnicalDetails set "+rs.getString("idname")+" = '"+n+"' where id = '"+ref_id+"'";
    	PreparedStatement preparedStmt1 = conn.prepareStatement(query2);
    	 preparedStmt1.execute();
    	}
    	
    }
    }
    conn.close();
       }
       catch (Exception e)
       {
       
    	   System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
       }
       // return response
//System.out.println("dekete count is "+DEL_count);
if(DEL_count==0){
	response.sendRedirect("Intake_ArchiveRequirements.jsp");
	}
else{
       response.sendRedirect("Intake_TechnicalDetails.jsp");
}

}

}


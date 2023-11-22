package compliance.servlet;

 

 

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

 

 

import compliance.service.IntakeReportService;

/**
* Servlet implementation class Retrieve_users_servlet
*/
@WebServlet("/Compliance")
public class Compliance extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compliance() {
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
        HttpSession details = request.getSession();
        System.out.println("Connected in intake 2 Servlet");
        String Page=request.getParameter("maxRows");
        String ReportName=request.getParameter("category");
        System.out.println("Report Name :: "+ReportName);
        String ReportPagniation = request.getParameter("direction");
      String Section=request.getParameter("section");
      System.out.println("The Value Of Section"+Section);
      int Sec=Integer.parseInt(Section);
    System.out.println("ReportPagniation : "+ReportPagniation);
    System.out.println("The value After Conversion : "+Sec);
    
      int Limit=Integer.parseInt(Page);
      System.out.println("The value of the Limit: "+Limit);
        int Offset=0;
        System.out.println("Offset : "+ Offset);
        
        try {
        
			

			if (ReportPagniation==null) {
				Limit=0;
				
			}else {

			switch (ReportPagniation) {
			case "next":
				Offset=Sec*Limit;
				System.out.println("The value in Next:"+Offset);
				
				break;
			case "prev":
				Offset=Sec*Limit;
				System.out.println("The value in prev:"+Offset);
				break;
			default:
				
			}}
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	

        
        JsonArray jsonArray = null;
        JsonArray jsonArray1=null;
        IntakeReportService ReportDetails =  new IntakeReportService();
        IntakeReportService Totalcount =  new IntakeReportService();

 

 

 

    try {
		jsonArray = ReportDetails.ReportDetails(ReportName, Limit, Offset);
		jsonArray1 = Totalcount.ReportDetails(ReportName, Limit, Offset);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
 

 

        ReportDetails=null;
        //calling finalize method and garabage collector
        System.gc();

 

        String json = new Gson().toJson(jsonArray);
       
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        System.out.println("Report details from servlet :: "+json);
        response.getWriter().write(json);
    }
}
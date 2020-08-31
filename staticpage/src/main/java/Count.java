

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import onboard.Weekday;

/**
 * Servlet implementation class Count
 */
@WebServlet("/Count")
public class Count extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Count() {
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
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Count servlet-----[INFO]");  
		String fromdate=request.getParameter("field1");
		String todate=request.getParameter("field2");
		String actual_date=request.getParameter("field3");
		//System.out.println("fromdate : "+fromdate);
		Weekday wk=new Weekday();
		int count=wk.splittingoperation(fromdate, todate);
		int actual_count=wk.actualhours(actual_date);
				String result=Integer.toString(count)+","+Integer.toString(actual_count);
				//System.out.println(" sfssf : "+result);
		//System.out.println("Count : "+count);
		//request.setAttribute("count", count);
		response.setContentType("text/plain");  
	    response.setCharacterEncoding("UTF-8"); 
	    response.getWriter().write(result);
		//doGet(request, response);
	}

}

package onboard;
import java.text.SimpleDateFormat;  
import java.util.Date; 
import java.io.IOException;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;   
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class daterange
 */
@WebServlet("/daterange")
public class daterange extends HttpServlet {
	ArrayList<String> pro_name = new ArrayList<String>();
	ArrayList<String> int_date = new ArrayList<String>();
	ArrayList<String> int_date_mod = new ArrayList<String>();
	ArrayList<String> totalDates = new ArrayList<String>();
	ArrayList<String> Range_dates = new ArrayList<String>();
	ArrayList<String> Range_dates_conv = new ArrayList<String>();
	ArrayList<String> result_projects = new ArrayList<String>();
	String Res="";
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public daterange() {
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

	public void Db_Connection() {
		//System.out.println("Inside dbconnection funtion");
		try {
			DBconnection d;
			Connection con;
			d = new DBconnection();
			con = (Connection) d.getConnection();
			Statement week = con.createStatement();
			pro_name.clear();
			int_date.clear();
			ResultSet rs = week.executeQuery("select projectname,Intdate from AppEmphazize_ProjectDetails ");
			while (rs.next()) {
				
				pro_name.add(rs.getString(1));
				int_date.add(rs.getString(2));
				
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public void project_select()
	{
		try
		{
		result_projects.clear();
		
		
		for(int i=0;i<Range_dates_conv.size();i++)
		{
			for(int j=0;j<int_date_mod.size();j++)
			{
				if(Range_dates_conv.get(i).equals(int_date_mod.get(j)))
				{
					result_projects.add(pro_name.get(j));
				}
			}
		}
		
	    Res="";
		for(int i=0;i<result_projects.size();i++)
		{
			//System.out.println("result_projecs : "+result_projects.get(i));
			Res=Res+result_projects.get(i)+",";
		}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
	}
	
	public void range_calc(String s1,String s2)
	{
	try
	{
		
	totalDates.clear();
	
	String arr[]=s1.split("/");
	String arr1[]=s2.split("/");
	if(arr[1].length()==1)
		arr[1]="0"+arr[1];
	if(arr[0].length()==1)
		arr[0]="0"+arr[0];
	if(arr1[1].length()==1)
		arr1[1]="0"+arr1[1];
	if(arr1[0].length()==1)
		arr1[0]="0"+arr1[0];
	String from=arr[2]+"-"+arr[0]+"-"+arr[1];
	String to=arr1[2]+"-"+arr1[0]+"-"+arr1[1];
	LocalDate start = LocalDate.parse(from);
	LocalDate end = LocalDate.parse(to);
	//System.out.println("Hell");
	while (!start.isAfter(end)) {
	    totalDates.add(start.toString());
	    start = start.plusDays(1);
	}
	
	}
	catch(Exception e)
	{
	System.out.println(e.getMessage());	
	}
	}
	
	public void monthToYear(ArrayList<String> range)
	{
		try
		{
		
		int_date_mod.clear();
		String delimiter ="";
		if(range.get(0).contains("/"))
				{
			delimiter = "/";
			for(int i=0;i<range.size();i++)
			{
			String arr[]=range.get(i).split(delimiter);
			if(arr[1].length()==1)
				arr[1]="0"+arr[1];
			if(arr[0].length()==1)
				arr[0]="0"+arr[0];
			String newdate=arr[0]+"/"+arr[1]+"/"+arr[2];
			
			int_date_mod.add(newdate);
			
			}
				}
		else
		{
			Range_dates_conv.clear();
			delimiter="-";
			for(int i=0;i<range.size();i++)
			{
			String arr[]=range.get(i).split(delimiter);
			String newdate=arr[1]+"/"+arr[2]+"/"+arr[0];
			
			Range_dates_conv.add(newdate);
			
			}
		}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		    Date date = new Date();  
		    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed DateRange servlet-----[INFO]");
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			   LocalDateTime now = LocalDateTime.now();  
			   System.out.println(dtf.format(now));  
			String fromDate = request.getParameter("fromD");
			String toDate = request.getParameter("toD");
			
			//System.out.println("FromDate : " + fromDate  + "TODate :" + toDate);

			
			Db_Connection();
			range_calc(fromDate,toDate);
			
			monthToYear(totalDates);
			monthToYear(int_date);
			project_select();
			//System.out.println("Result :"+Res);
			
			String text = Res.substring(0, Res.length() - 1);
			response.setContentType("text/plain"); // Set content type of the response so that jQuery knows what it can// expect.
			response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			response.getWriter().write(text);
		
		}
		catch(Exception e)
		{
			 //System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
		}
		
	}

}


import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import onboard.DBconnection;

/**
 * Servlet implementation class ajx
 */
@WebServlet("/Weekly_linechart")
public class Weekly_linechart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Integer> map = new HashMap<>();
	ArrayList<String> db_date = new ArrayList<String>();
	ArrayList<String> db_count = new ArrayList<String>();
	ArrayList<String> Xaxis = new ArrayList<String>();
	ArrayList<String> from_dates = new ArrayList<String>();
	ArrayList<String> end_dates = new ArrayList<String>();
	ArrayList<String> uname = new ArrayList<String>();
	ArrayList<Integer> final_count = new ArrayList<Integer>();
	String month = "";
	String year = "";
	String user_id="";
	DBconnection d;
	Connection con;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Weekly_linechart() {
		super();

		map.put("January", 0);
		map.put("February", 1);
		map.put("March", 2);
		map.put("April", 3);
		map.put("May", 4);
		map.put("June", 5);
		map.put("July", 6);
		map.put("August", 7);
		map.put("September", 8);
		map.put("October", 9);
		map.put("November", 10);
		map.put("December", 11);
		// System.out.println("Hi size "+map.size());
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	public void Db_Connection() {
		//System.out.println("Inside dbconnection funtion");
		try {
			db_date.clear();
			db_count.clear();
			uname.clear();
			d = new DBconnection();
			con = (Connection) d.getConnection();
			Statement week = con.createStatement();
			ResultSet rs_week = week.executeQuery("select date,count,uname from  visits ");
			while (rs_week.next()) {
				db_date.add(rs_week.getString(1));
				db_count.add(rs_week.getString(2));
				uname.add(rs_week.getString(3));
			}
			con.close();
		} catch (Exception e) {
			 System.err.println("[ERROR]-----Got an exception!-----"+e.getMessage()+"----[ERROR]");
		}
	}

	public void Date_Formation() {
		//System.out.println("inside date_formation function");
		String mon = month;
		//System.out.println(" Month " + month);
		//System.out.println(" Year " + year);
		int year_converted = Integer.parseInt(year);
		int date_from = 0;
		int date_new = 0;
		int days_in_a_week = 7;
		int start_date = 1;
		int date_dump=9;
		int actual_month_conv=1;
		Xaxis.clear();
		from_dates.clear();
		end_dates.clear();
		if (map.containsKey(mon)) {
			Integer month_value = map.get(mon);
			System.out.println("value for key " + mon + " is:- " + month_value);
			int actual_month = month_value + actual_month_conv;
			String month = (actual_month < 10 ? "0" : "") + actual_month;
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year_converted);
			cal.set(Calendar.DAY_OF_MONTH, actual_month_conv);
			cal.set(Calendar.MONTH, actual_month_conv);
			int maxWeeknumber = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
			int last_date = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			for (int i = 0; i < maxWeeknumber; i++) {
				date_new = date_from + days_in_a_week;
				date_from = date_from + start_date;
				if (date_new >= last_date) {
					date_new = last_date;
					String from_date = year + "-" + month + "-" + date_from;
					String to_date = year + "-" + month + "-" + date_new;
					Xaxis.add("From " + from_date + " To " + to_date);
					from_dates.add(from_date);
					end_dates.add(to_date);
				} else {
					if (date_new <= date_dump) {
						String from = (date_from < 10 ? "0" : "") + date_from;
						String to = (date_new < 10 ? "0" : "") + date_new;
						String from_date = year + "-" + month + "-" + from;
						String to_date = year + "-" + month + "-" + to;
						Xaxis.add("From " + from_date + " To " + to_date);
						from_dates.add(from_date);
						end_dates.add(to_date);
						date_from = date_new;
					} else {
						if (date_from <= date_dump) {
							String from = (date_from < 10 ? "0" : "") + date_from;
							String from_date = year + "-" + month + "-" + from;
							String to_date = year + "-" + month + "-" + date_new;
							Xaxis.add("From " + from_date + " To " + to_date);
							from_dates.add(from_date);
							end_dates.add(to_date);
							date_from = date_new;
						} else {
							String from_date = year + "-" + month + "-" + date_from;
							String to_date = year + "-" + month + "-" + date_new;
							Xaxis.add("From " + from_date + " To " + to_date);
							from_dates.add(from_date);
							end_dates.add(to_date);
							date_from = date_new;
						}
					}
				}

			}

		}
	}

	public void Visits_Calculation() {
		
		final_count.clear();
		
		//System.out.println("inside visits_calculation function");
		for (int i = 0; i < from_dates.size(); i++) {
			String s = from_dates.get(i);
			String e = end_dates.get(i);
			int count = 0;
			LocalDate start = LocalDate.parse(s);
			LocalDate end = LocalDate.parse(e);
			List<LocalDate> totalDates = new ArrayList<>();
			while (!start.isAfter(end)) {
				
				totalDates.add(start);
				for (int k = 0; k < db_date.size(); k++) {
					
					String s1 = start.toString();
					if (s1.equals(db_date.get(k)) && user_id.equals(uname.get(k))) {
						count = count + Integer.parseInt(db_count.get(k));
					} else {
						continue;
					}
				}
				start = start.plusDays(1);
				
			}
			final_count.add(count);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Weekly Linechart servlet-----[INFO]");  
		String text="";
		month = request.getParameter("field1");
		year = request.getParameter("field2");
		user_id=request.getParameter("field3");
		Db_Connection();
		Date_Formation();
		Visits_Calculation();
		String result = "";
		for (int i = 0; i < from_dates.size(); i++) {
			result = result + from_dates.get(i) + "," + final_count.get(i).toString() + ",";
		}
		
		//System.out.println(result.substring(0, result.length() - 1));
		text = result.substring(0, result.length() - 1);
		response.setContentType("text/plain"); // Set content type of the response so that jQuery knows what it can// expect.
		response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
		response.getWriter().write(text);

	}
}

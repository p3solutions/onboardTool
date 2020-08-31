import java.io.IOException;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.ResultSet;

import java.sql.Statement;

import java.text.DateFormat;

import java.util.ArrayList;
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

import java.text.ParseException;

import java.text.SimpleDateFormat;

import java.util.Collections;

import java.util.Date;

import java.util.List;

/**
 * 
 * Servlet implementation class date_update
 * 
 */

@WebServlet("/date_update")

public class date_update extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = null;

	/**
	 * 
	 * @see HttpServlet#HttpServlet()
	 * 
	 */

	public date_update() {

		super();

		// TODO Auto-generated constructor stub

	}

	public void init(ServletConfig config) throws ServletException

	{

		logger = Logger.getRootLogger();

		BasicConfigurator.configure();
	}

	/**
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub

		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Date_Update servlet-----[INFO]");  

		HttpSession session = request.getSession();

		String prjname = request.getParameter("prjname");

		HttpSession details = request.getSession();
		String u_name = (String) details.getAttribute("username");

		String userid = u_name;
		MDC.put("USERID", userid);
		String u_role = (String) details.getAttribute("role");
		MDC.put("USERROLE", u_role);
		String projectname = request.getParameter("project_name");
		logger.info("modified project " + projectname);

		int level1 = 0, level = 0, seq = 0;

		int sno = 0, cnt = 0, cnt1 = 0;

		Date d1, d2, d3, d4, d5, d6;

		SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy");

		// DateFormat d3 = new SimpleDateFormat("mm/dd/yyyy");

		ArrayList<Integer> seq_num = new ArrayList<Integer>();

		ArrayList<Integer> level_num = new ArrayList<Integer>();

		ArrayList<String> task_name = new ArrayList<String>();

		ArrayList<String> member_ass = new ArrayList<String>();

		ArrayList<String> plan_startdate = new ArrayList<String>();

		ArrayList<String> plan_enddate = new ArrayList<String>();

		ArrayList<String> actual_startdate = new ArrayList<String>();

		ArrayList<String> actual_enddate = new ArrayList<String>();

		ArrayList<String> planned_hours = new ArrayList<String>();

		ArrayList<String> actual_hours = new ArrayList<String>();

		ArrayList<String> progressbar = new ArrayList<String>();

		ArrayList<Date> pln_st = new ArrayList<Date>();

		ArrayList<Date> pln_ed = new ArrayList<Date>();

		ArrayList<Date> act_st = new ArrayList<Date>();

		ArrayList<Date> act_ed = new ArrayList<Date>();

		String temp;

		int i = 0, index = 0;

		String tasks_name = request.getParameter("name");
		String mem_ass=request.getParameter("mem_ass");
//System.out.println("Mem ass : "+mem_ass);
		String sequence_no = request.getParameter("sequence_no");

		String plan_start = request.getParameter("plan_start");

		String plan_end = request.getParameter("plan_end");

		String actual_start = request.getParameter("actual_start");

		String actual_end = request.getParameter("actual_end");

		String planned_hrs = request.getParameter("plan_hrs");

		String actual_hrs = request.getParameter("actual_hrs");

		String comments = request.getParameter("cmnts");

		try {

			String myDriver = "org.gjt.mm.mysql.Driver";

			String myUrl = "jdbc:mysql://localhost:3306/Onboarding";

			Class.forName(myDriver);

			Connection conn = DriverManager.getConnection(myUrl, "root", "password123");

			int db_count = 0;

			String query1 = "select count(*) from ArchiveExecution_Details where projects='" + prjname + "' order by seq_num";

			String query = "select * from ArchiveExecution_Details where projects='" + prjname + "' order by seq_num";

			Statement st = conn.createStatement();

			Statement st1 = conn.createStatement();

			ResultSet rs = st.executeQuery(query);

			ResultSet rs1 = st1.executeQuery(query1);

			while (rs1.next())

			{

				db_count = Integer.parseInt(rs1.getString(1));

			}

			while (rs.next())

			{

				seq_num.add(rs.getInt(1));

				level_num.add(rs.getInt(2));

				task_name.add(rs.getString(3));

				member_ass.add(rs.getString(4));

				plan_startdate.add(rs.getString(7));

				plan_enddate.add(rs.getString(8));

				actual_startdate.add(rs.getString(5));

				actual_enddate.add(rs.getString(6));

				planned_hours.add(rs.getString(13));

				actual_hours.add(rs.getString(9));

				progressbar.add(rs.getString(15));

				i++;

			}

			for (int j = 0; j < i; j++)

			{

				if (seq_num.get(j) == Integer.parseInt(sequence_no))

				{

					level = level_num.get(j);

					seq = seq_num.get(j);

					index = j;

					level1 = level;

					plan_startdate.set(index, plan_start);

					plan_enddate.set(index, plan_end);

					actual_startdate.set(index, actual_start);

					actual_enddate.set(index, actual_end);

					for (int k = index - 1; k >= 0; k--)

					{

						for (int w = k; w >= 0; w--)

						{

							if (level_num.get(w) == level1 - 1 || level_num.get(w) == 1)

							{

								break;

							}

							else if (level_num.get(w) == level1)

							{

								if (!plan_startdate.get(w).equals(""))

									pln_st.add(fmt.parse(plan_startdate.get(w)));

								if (!plan_enddate.get(w).equals(""))

									pln_ed.add(fmt.parse(plan_enddate.get(w)));

								if (!actual_startdate.get(w).equals(""))

									act_st.add(fmt.parse(actual_startdate.get(w)));

								if (!actual_enddate.get(w).equals(""))

									act_ed.add(fmt.parse(actual_enddate.get(w)));

								continue;

							}

						}

						for (int w = k + 1; w < db_count; w++)

						{

							//System.out.println("Level " + index);

						//	System.out.println("w " + w);

						//	System.out.println("Level " + level1);

						//	System.out.println("Level " + level_num.get(w));

							// System.out.println(plan_startdate.get(w));

							if (level_num.get(w) == level1 + 1 || level_num.get(w) == 1
									|| level_num.get(w) == level - 1)

								break;

							else if (level_num.get(w) == level1)

							{

							//	System.out.println("else");

								if (!plan_startdate.get(w).equals(""))

									pln_st.add(fmt.parse(plan_startdate.get(w)));

								if (!plan_enddate.get(w).equals(""))

									pln_ed.add(fmt.parse(plan_enddate.get(w)));

								if (!actual_startdate.get(w).equals(""))

									act_st.add(fmt.parse(actual_startdate.get(w)));

								if (!actual_enddate.get(w).equals(""))

									act_ed.add(fmt.parse(actual_enddate.get(w)));

								continue;

							}

						}

						/*
						 * for(int oi=0;oi<6;oi++){
						 * 
						 * String ww=fmt.format(pln_st.get(oi));
						 * 
						 * System.out.println(ww);
						 * 
						 * }
						 */

						Date pminDate = Collections.min(pln_st);

						String plnstart = fmt.format(pminDate);

						Date pmaxDate = Collections.max(pln_ed);

						String plnend = fmt.format(pmaxDate);

						Date aminDate = Collections.min(act_st);

						String actulstart = fmt.format(aminDate);

						Date amaxDate = Collections.min(act_st);

						String actulend = fmt.format(amaxDate);

						if (level_num.get(k) == 0)

						{

							//System.out.println("LEVEl0");

							break;

						}

						else if (level_num.get(k) >= level1)

						{

							//System.out.println("LEVE> > 0");

							continue;

						}

						else

						{

							if (plan_startdate.get(k).equals(""))

							{

								plan_startdate.set(k, plan_start);

								// System.out.println("bala murugan");

							}

							else

							{

								plan_startdate.set(k, plnstart);

							}

							if (plan_enddate.get(k).equals(""))

							{

								plan_enddate.set(k, plan_end);

							}

							else

							{

								plan_enddate.set(k, plnend);

							}

							if (actual_startdate.get(k).equals(""))

							{

								actual_startdate.set(k, actual_start);

							}

							else

							{

								actual_startdate.set(k, actulstart);

							}

							if (actual_enddate.get(k).equals(""))

							{

								actual_enddate.set(k, actual_end);

							}

							else

							{

								actual_enddate.set(k, actulend);

							}

							if (planned_hours.get(k).equals("") || actual_hours.get(k).equals(""))

							{

								planned_hours.set(k, planned_hrs);

								actual_hours.set(k, actual_hrs);

							}

							else

							{

								if (planned_hours.get(index).equals("") || actual_hours.get(index).equals(""))

								{

									planned_hours.set(k, Integer.toString(
											Integer.parseInt(planned_hrs) + Integer.parseInt(planned_hours.get(k))));

									actual_hours.set(k, String.valueOf(
											(Integer.parseInt(actual_hrs) + Integer.parseInt(actual_hours.get(k)))));

								}

								else

								{

									planned_hours.set(k,
											Integer.toString(Integer.parseInt(planned_hrs)
													+ (Integer.parseInt(planned_hours.get(k))
															- Integer.parseInt(planned_hours.get(index)))));

									actual_hours.set(k, String.valueOf(
											(Integer.parseInt(actual_hrs) + (Integer.parseInt(actual_hours.get(k))
													- Integer.parseInt(actual_hours.get(index))))));

								}
							}

							level1 = level1 - 1;

						}

					}

					planned_hours.set(index, planned_hrs);

					actual_hours.set(index, actual_hrs);

				}

			}

			for (int n = 0; n < i; n++)

			{

				int planed, actl, prog;

				if (planned_hours.get(n).equals(""))

					planed = 0;

				else

					planed = Integer.parseInt(planned_hours.get(n));

				if (actual_hours.get(n).equals(""))

					actl = 0;

				else

					actl = Integer.parseInt(actual_hours.get(n));

				if (planed == 0 || actl == 0)

					prog = 0;

				else

					prog = (actl * 100) / planed;

				if (progressbar.get(n).equals("100")) {

					//System.out.println("balaalala");

					if (seq_num.get(n) == Integer.parseInt(sequence_no))
						st.executeUpdate("update ArchiveExecution_Details set comments='" + comments
								+ "',progressbar='100', act_srt_date='" + actual_startdate.get(n) + "',act_end_date='"
								+ actual_enddate.get(n) + "',pln_srt_date='" + plan_startdate.get(n)
								+ "',pln_end_date='" + plan_enddate.get(n) + "',planned_hrs='" + planned_hours.get(n)
								+ "',mem_ass='" + mem_ass+ "',hours='" + actual_hours.get(n) + "' where seq_num=" + seq_num.get(n)
								+ " and projects='" + prjname + "'");
					else
						st.executeUpdate("update ArchiveExecution_Details set progressbar='100', act_srt_date='"
								+ actual_startdate.get(n) + "',act_end_date='" + actual_enddate.get(n)
								+ "',pln_srt_date='" + plan_startdate.get(n) + "',pln_end_date='" + plan_enddate.get(n)
								+ "',planned_hrs='" + planned_hours.get(n) + "',hours='" + actual_hours.get(n)
								+ "' where seq_num=" + seq_num.get(n) + " and projects='" + prjname + "'");

				}

				else

				{

					//System.out.println("Progressbar updating");
					if (seq_num.get(n) == Integer.parseInt(sequence_no))
						st.executeUpdate("update ArchiveExecution_Details set comments='" + comments
								+ "',progressbar='100', act_srt_date='" + actual_startdate.get(n) + "',act_end_date='"
								+ actual_enddate.get(n) + "',pln_srt_date='" + plan_startdate.get(n)
								+ "',pln_end_date='" + plan_enddate.get(n) + "',planned_hrs='" + planned_hours.get(n)
								+ "',mem_ass='" + mem_ass+ "',hours='" + actual_hours.get(n) + "' where seq_num=" + seq_num.get(n)
								+ " and projects='" + prjname + "'");
					else
						st.executeUpdate("update ArchiveExecution_Details set progressbar='" + prog + "', act_srt_date='"
								+ actual_startdate.get(n) + "',act_end_date='" + actual_enddate.get(n)
								+ "',pln_srt_date='" + plan_startdate.get(n) + "',pln_end_date='" + plan_enddate.get(n)
								+ "',planned_hrs='" + planned_hours.get(n) + "',hours='" + actual_hours.get(n)
								+ "' where seq_num=" + seq_num.get(n) + " and projects='" + prjname + "'");

				}

			}

		}

		catch (Exception e)

		{

			 System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");

		}

		try

		{
			String myDriver = "org.gjt.mm.mysql.Driver";

			String myUrl = "jdbc:mysql://localhost:3306/Onboarding";

			Class.forName(myDriver);

			Connection conn = DriverManager.getConnection(myUrl, "root", "password123");

			Statement sr = conn.createStatement();

			int seq_no = Integer.parseInt(request.getParameter("sequence_no"));

			int initiate_seqno = Integer.parseInt(request.getParameter("initiate_seqno"));

			int plan_seqno = Integer.parseInt(request.getParameter("plan_seqno"));

			int execute_seqno = Integer.parseInt(request.getParameter("execute_seqno"));

			int hypercare_seqno = Integer.parseInt(request.getParameter("hypercare_seqno"));

			int first = 0, last = 0;

			int date_count = 0;

		//	System.out.println(seq_no + "  " + initiate_seqno + " " + plan_seqno + " " + execute_seqno);

			if (seq_no > initiate_seqno)

			{

				if (seq_no > plan_seqno)

				{

					if (seq_no > execute_seqno)

					{

						if (seq_no > hypercare_seqno)

						{

							first = hypercare_seqno;

							last = hypercare_seqno + 7;

						}

						else

						{

							first = execute_seqno;

							last = hypercare_seqno;

						}

					}

					else

					{

						first = plan_seqno;

						last = execute_seqno;

					}

				}

				else

				{

					first = initiate_seqno;

					last = plan_seqno;

				}

			}

			for (int k = first; k < last - 1; k++)

			{

				if (!actual_enddate.get(k).equals(""))

					date_count++;

			}

			if (date_count == (last - 1 - first)) {

			//	System.out.println("update ArchiveExecution_Details set progressbar='100',stats_date='True' where seq_num=" + first
			//			+ " and projects='" + prjname + "'");

				sr.executeUpdate("update ArchiveExecution_Details set progressbar='100',stats_date='True' where seq_num=" + first
						+ " and projects='" + prjname + "'");

			}

			else

			{

			//	System.out.println("kjadkjakdjj");

				sr.executeUpdate("update ArchiveExecution_Details set stats_date='False' where seq_num=" + first + " and projects='"
						+ prjname + "'");

			}

		}

		catch (Exception e)

		{

			 System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
		}

		response.sendRedirect("Archive_Execution.jsp");

	}

}
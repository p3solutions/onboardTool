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

/**
 * Servlet implementation class application_graph
 */
@WebServlet("/application_graph")
public class application_graph extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public application_graph() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Application Graph servlet-----[INFO]");  
		String projects = request.getParameter("projects");
		String appname1[]=new String[10];
		String appname2[]=new String[10];
		String appname3[]=new String[10];
		String appname4[]=new String[10];
		int count=0,count1=0,count2=0,count3=0,count4=0;
		try{
		DBconnection d=new DBconnection();
		Connection con = (Connection)d.getConnection();
		//System.out.println("Projects is "+projects);
		 String db_query1="select appname from AppEmphazize_ApplicationInfo where prjname='"+projects+"'";
	        Statement db_st1 = con.createStatement();
	        ResultSet db_rs1 = db_st1.executeQuery(db_query1);
	        while(db_rs1.next()){
	         	System.out.println(db_rs1.getString(1));
		 String db_query="select seq_num from ArchiveExecution_Details where projects='"+projects+"' and name='"+db_rs1.getString(1)+"'";
	        Statement db_st = con.createStatement();
	        ResultSet db_rs = db_st.executeQuery(db_query);
	        if(db_rs.next()){
	       
	        	int seq_num=Integer.parseInt(db_rs.getString(1));
	        	 String db_query2="select * from ArchiveExecution_Details where seq_num>"+seq_num+" and seq_num<"+(seq_num+62)+" and level=3 order by seq_num";
	            // System.out.println(db_query2);
	             Statement db_st2 = con.createStatement();
	             ResultSet db_rs2 = db_st2.executeQuery(db_query2);
	             while(db_rs2.next()){
	         if(db_rs2.getString("name").equals("Requirements") && !db_rs2.getString("progressbar").equals("100")){
	        	 appname1[count1++]=db_rs1.getString(1);
	        	// System.out.println(db_rs1.getString(1));
	      		break;
	      	}
	      	else if(db_rs2.getString("name").equals("Gate 2 Approval to Build") && !db_rs2.getString("progressbar").equals("100"))
	      	{ 
	      		appname2[count2++]=db_rs1.getString(1);		
	         break;
	      	}
	      	else if(db_rs2.getString("name").equals("Build and Test") && !db_rs2.getString("progressbar").equals("100"))
	      	{ 
	      		appname3[count3++]=db_rs1.getString(1);	 
            	break;
	      	}
	      	else if(db_rs2.getString("name").equals("Gate 3 Approval to Deploy") && !db_rs2.getString("progressbar").equals("100"))
	      	{
	      		appname4[count4++]=db_rs1.getString(1);
               break;
	      	}
	                 }
	            }
	        }
	        String text1="",text2="",text3="",text4="",apps="";
	        for(int i=0;i<count1;i++)
	        	text1+=appname1[i]+",";
	        for(int i=0;i<count2;i++)
	        	text2+=appname2[i]+",";
	        for(int i=0;i<count3;i++)
	        	text3+=appname3[i]+",";
	        for(int i=0;i<count4;i++)
	        	text4+=appname4[i]+",";
	        apps=text1+"/"+text2+"/"+text3+"/"+text4;
	        String applications=apps.substring(0, apps.length() - 1);
	        
	        //System.out.println(applications);
			response.setContentType("text/plain"); // Set content type of the response so that jQuery knows what it can// expect.
			response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			response.getWriter().write(applications);
	
		}
		catch(Exception e)
		{
			System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
		}
	       
	}
	}




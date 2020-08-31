import java.io.IOException;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class sendMail
 */
@WebServlet("/sendMail")
public class sendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Sendmail servlet-----[INFO]");  
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String rol=request.getParameter("roless");
		String email=request.getParameter("mailid");
		String msg=request.getParameter("message");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String project=request.getParameter("project");
		String application=request.getParameter("application");
	//	System.out.println(msg);
		Properties props = new Properties();
		 HttpSession ses=request.getSession();  
	        ses.setAttribute("My_Roles",rol); 
	        ses.setAttribute("fname",fname); 
	        ses.setAttribute("lname",lname); 
	        ses.setAttribute("email",email); 
	        ses.setAttribute("project",project); 
	        ses.setAttribute("application",application); 
	        
				
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.office365.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getDefaultInstance(props,
		new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		//return new PasswordAuthentication("vkarun202@gmail.com","arun's@kumar");
			return new PasswordAuthentication("shankarganesh.n@platform3solutions.com","Shankarganesh94");
		}
		});

		try {
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("shankarganesh.n@platform3solutions.com"));
		
		message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(email));
		message.setSubject("Access Granted - Register into Onboarding Tool");
		message.setText("Dear "+fname+" "+lname+",\nWe are pleased to inform that you are granted access to Onboarding Tool as "+rol +" for the Project "+project+".\nPlease login to the below url for registering your account\n http://localhost:8081/Registration.jsp\n"+msg);

		Transport.send(message);
//response.sendRedirect("user_reg.jsp");
pw.println("<html><body>");  
pw.println("Registration link have been sent  \n");
pw.println("<a href=\"UserConfiguration.jsp\" style='color:blue'> Click Here </a>");
pw.println("</body></html>");  
  
pw.close();
		 
		//get the stream to write the data  
		

	}
		
		catch (Exception e)
		{
			System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}

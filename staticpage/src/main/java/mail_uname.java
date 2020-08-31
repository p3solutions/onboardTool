

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
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
 * Servlet implementation class mail_uname
 */
@WebServlet("/mail_uname")
public class mail_uname extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mail_uname() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Mail_uname servlet-----[INFO]");  
		PrintWriter pw=response.getWriter();
		HttpSession passwd=request.getSession();
		String email=(String)passwd.getAttribute("emailid");
		String uname=request.getParameter("uname");
		//System.out.println(email+" "+uname);
			Properties props = new Properties();
				
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
		//message.setFrom(new InternetAddress("arun.vk@platform3solutions.com"));
		message.setFrom(new InternetAddress("shankarganesh.n@platform3solutions.com"));

		message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(email));
		message.setSubject("UserName");
		message.setText("Your UserName is "+uname);

		Transport.send(message);
//response.sendRedirect("user_reg.jsp");
pw.println("<html><body>");  
pw.println("UserName Have been Mailed to Your Account\n");
pw.println("</body></html>");  
  
pw.close();
		 
		

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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

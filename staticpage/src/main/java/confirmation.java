

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

/**
 * Servlet implementation class confirmation
 */
@WebServlet("/confirmation")
public class confirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Confirmation servlet-----[INFO]");  
			response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		Properties props = new Properties();
	  String email=request.getParameter("email");
				
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getDefaultInstance(props,
		new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		//return new PasswordAuthentication("vkarun202@gmail.com","arun's@kumar");
			return new PasswordAuthentication("decom3sixtytool@gmail.com","Decom360");
		}
		});

		try {

		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("decom3sixtytool@gmail.com"));
		
		message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(email));
		message.setSubject("Registration Successfull");
		message.setText("Thanks for Registering...Please click on the below link\n\nhttp://localhost:8087/onboardTool/Login.jsp");
        //message.setText("Thanks for Registering...Please click on the below link\n\nhttp://18.217.95.127:8080/Decomm_Manager
		Transport.send(message);

		pw.println("<html><body>");  
		pw.println("Registration Successfull \n");
		pw.println("<a href=\"Login.jsp\" style='color:blue'> Click Here </a>");
		pw.println("</body></html>");  
		  
		pw.close();
				 

		} catch (MessagingException e) {
		throw new RuntimeException(e);
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

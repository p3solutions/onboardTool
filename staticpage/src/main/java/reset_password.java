

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
 * Servlet implementation class reset_password
 */
@WebServlet("/reset_password")
public class reset_password extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public reset_password() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub;
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Reset Password servlet-----[INFO]");
        PrintWriter pw = response.getWriter();
        HttpSession passwd = request.getSession();
        String email = request.getParameter("email");
        passwd.setAttribute("email", email);
        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        //return new PasswordAuthentication("vkarun202@gmail.com","arun's@kumar");
                        return new PasswordAuthentication("decom3sixtytool@gmail.com", "Decom360");
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("decom3sixtytool@gmail.com"));

            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            message.setSubject("Recovery Mail");
            message.setText("http://localhost:8090/onboardTool/reset_pass.jsp");
            //message.setText("http://18.217.95.127:8080/Decomm_Manager/reset_pass.jsp");
            Transport.send(message);
            pw.println("<html><body>");
            pw.println("Recovery Mail have been sent to your account\n");
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

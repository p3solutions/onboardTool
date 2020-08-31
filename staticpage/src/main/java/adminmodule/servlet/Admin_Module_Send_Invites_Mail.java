package adminmodule.servlet;

import org.apache.log4j.Logger;
import servlet.Intake_Review_Email;

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
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

/**
 * Servlet implementation class sendMail
 */
@WebServlet("/Admin_Module_Send_Invites_Mail")
public class Admin_Module_Send_Invites_Mail extends HttpServlet {
    final static Logger logger = Logger.getLogger(Admin_Module_Send_Invites_Mail.class);

    private static final long serialVersionUID = 1L;


    public Admin_Module_Send_Invites_Mail() {
        super();

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        //System.out.println("[INFO]-----" + simpleDateFormat.format(date) + "-----Accessed Sendmail servlet-----[INFO]");
        logger.info("[INFO]-----" + simpleDateFormat.format(date) + "-----Accessed Send_mail servlet-----[INFO]");
        response.setContentType("text/html");
        PrintWriter printWriter = response.getWriter();
        String role_name = request.getParameter("roless");
        String email = request.getParameter("mailid");
        String message = request.getParameter("message");
        String first_name = request.getParameter("fname");
        String last_name = request.getParameter("lname");
        String project = request.getParameter("project");
        String application = request.getParameter("application");
        //	System.out.println(msg);
        Properties properties = new Properties();
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("My_Roles", role_name);
        httpSession.setAttribute("fname", first_name);
        httpSession.setAttribute("lname", last_name);
        httpSession.setAttribute("email", email);
        httpSession.setAttribute("project", project);
        httpSession.setAttribute("application", application);


        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        Session session = Session.getDefaultInstance(properties,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        //return new PasswordAuthentication("vkarun202@gmail.com","arun's@kumar");
                        return new PasswordAuthentication("decom3sixtytool@gmail.com", "Decom360");
                    }
                });

        try {
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress("decom3sixtytool@gmail.com"));

            mimeMessage.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));
            mimeMessage.setSubject("Access Granted - Register into Decom3Sixty");
            mimeMessage.setText("Dear " + first_name + " " + last_name + ",\nWe are pleased to inform that you are granted access to Decom3Sixty Tool as " + role_name + " for the Project " + project + ".\nPlease login to the below url for registering your account\n http://localhost:8087/onboardTool/Registration.jsp\n" + message);
            //mimeMessage.setText("Dear " + first_name + " " + last_name + ",\nWe are pleased to inform that you are granted access to Onboarding Tool as " + role_name + " for the Project " + project + ".\nPlease login to the below url for registering your account\n http://18.217.95.127:8080/Decomm_Manager/Registration.jsp\n" + message);

            Transport.send(mimeMessage);
//response.sendRedirect("user_reg.jsp");
            printWriter.println("<html><body>");
            printWriter.println("Registration link have been sent  \n");
            printWriter.println("<a href=\"Admin_Module_Send_Invites.jsp\" style='color:blue'> Click Here </a>");
            printWriter.println("</body></html>");

            printWriter.close();


        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("[ERROR]-----Got an exception!" + simpleDateFormat.format(date) + "-----" + e.getMessage() + "----[ERROR]");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }

}

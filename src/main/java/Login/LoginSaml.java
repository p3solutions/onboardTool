package Login;

import onboard.DBconnection;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

@WebServlet("/Login_1")
public class LoginSaml extends HttpServlet {
    private Logger logger =  Logger.getLogger(LoginSaml.class);
    private static final long serialVersionUID = 1L;
    public LoginSaml() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("Accessed LoginSaml servlet");
        DBconnection dBconnection = null;
        Connection con = null;
        try {
            dBconnection = new DBconnection();
            con = (Connection) dBconnection.getConnection();
            logger.info("DB Connected...");

            HttpSession details = request.getSession();
            HttpSession session = request.getSession();

            String user_email = request.getParameter("user_email");
            String user_fname = request.getParameter("user_fname");
            String user_lname = request.getParameter("user_lname");
            String username = request.getParameter("username");
            String user_group = request.getParameter("user_group");
            session.setAttribute("username", username);
            logger.info("User name on request: " + username);
            logger.info("User First name request: " + user_fname);
            logger.info("User Last name request: " + user_lname);
            logger.info("User Role request: " + user_group);

            LoginService loginService = new LoginService();


            String admin_user_details = "select * from Admin_UserDetails where uname=?";
            PreparedStatement st = con.prepareStatement(admin_user_details);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            String dbuname = "";

            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE uname=?  ");
            ps.setString(1, username);
            ResultSet rs2 = ps.executeQuery();
            if (rs2.next()) {
                dbuname = rs2.getString("uname");
                String dbufname = rs2.getString("ufname");
                String dbulname = rs2.getString("ulname");
                String dbu_email = rs2.getString("u_email");
                String dbu_role = rs2.getString("u_role");

                if (username.equals(dbuname) && user_fname.equals(dbufname) && user_lname.equals(dbulname) && user_email.equals(dbu_email) && user_group.equals(dbu_role)) {
                    loginService.licenseValidation(details,response,dbu_role);
                }
            }
            else {
                String msg = "";
                if (!username.equals(dbuname)) {
                    msg = "This user not yet registered.";
                } else {
                    msg = "Password is Incorrect";
                }
                response.sendRedirect("Login_Error.jsp?ErrorMessage=" + msg);// user you have entered not registered.
            }
            String u_name = (String) details.getAttribute("username");
            String u_role = (String) details.getAttribute("role");
            String user_id = u_name;
            MDC.put("USERID", user_id);
            MDC.put("USERROLE", u_role);
            logger.info("Logged In through SAML");
            logger.info("Username : " + u_name);
            logger.info("USer Role : " + u_role);

        }
        catch(ClassNotFoundException | SQLException | ParseException e){
            logger.debug("Exception in SAML Login ", e);
                throw new RuntimeException(e);
        }
        finally {
            try {
                con.close();
                logger.info("DB Connection Closed...");
            } catch (SQLException e) {
                logger.debug("Exception in SAML Login Connection close",e);
                throw new RuntimeException(e);
            }
        }
    }
}
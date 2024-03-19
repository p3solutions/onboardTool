package Login;

import onboard.DBconnection;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static Logger logger =  Logger.getLogger(Login.class);
    private static final long serialVersionUID = 1L;
    public Login() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("Accessed Login servlet");
        DBconnection dBconnection = null;
        Connection con = null;
        try {
            dBconnection = new DBconnection();
            con = (Connection) dBconnection.getConnection();
            logger.info("DB Connected...");

            HttpSession details = request.getSession();
            HttpSession session = request.getSession();

            String userid = request.getParameter("usr");
            String pwd = request.getParameter("pwd");
            session.setAttribute("username", userid);
            logger.info("Username From request " + userid);
            logger.info("password form request " + pwd);

            LoginService loginService = new LoginService();

            String admin_user_details = "select * from Admin_UserDetails where uname=?";
            PreparedStatement st = con.prepareStatement(admin_user_details);
            st.setString(1, userid);
            ResultSet rs = st.executeQuery();
            String dbuname = "";
            String dbu_pwd = "";
            String lic_info = "";
            String p_pwd = generate_u_encrypt_pwd(pwd);

            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE uname=? AND u_pwd=?");
            ps.setString(1, userid);
            ps.setString(2, p_pwd);
            // ps.setString(3,ugroup);
            ResultSet rs2 = ps.executeQuery();
            if (rs2.next()) {
                dbuname = rs2.getString("uname");
                dbu_pwd = rs2.getString("u_pwd");
            }
            logger.info("Protected Password : " + p_pwd);
            if (userid.equals(dbuname) && p_pwd.equals(dbu_pwd)) {
                loginService.licenseValidation(details,response,"admin");
            }
            else {

                String msg = "";
                if (!userid.equals(dbuname)) {
                    msg = "This user not yet registered.";
                }

                if (userid.equals("")) {
                    String msg1 = "Please Enter a Username";

                    response.sendRedirect("Login_Error.jsp?ErrorMessage=" + msg1);
                }

                if (userid.equals("") && pwd.equals("")) {
                    String msg2 = "Please Enter a Username & Password";

                    response.sendRedirect("Login_Error.jsp?ErrorMessage=" + msg2);
                }

                if (!userid.equals(dbuname) && !pwd.equals(dbu_pwd)) {
                    String msg3 = "Please Login with Correct Credentials.";

                    response.sendRedirect("Login_Error.jsp?ErrorMessage=" + msg3);
                }

                if (pwd.equals("")) {
                    String msg4 = "Please Enter a Password";

                    response.sendRedirect("Login_Error.jsp?ErrorMessage=" + msg4);
                }

                if (!pwd.equals(dbu_pwd)) {
                    String msg5 = "Password is Incorrect";
                    response.sendRedirect("Login_Error.jsp?ErrorMessage=" + msg5); // user you have entered not registered.
                }

                if (userid.equals(dbuname) && !pwd.equals(dbu_pwd)) {
                    String msg6 = "Please Enter a Valid Password.";

                    response.sendRedirect("Login_Error.jsp?ErrorMessage=" + msg6);
                }
            }

            String u_name = (String) details.getAttribute("username");
            String u_role = (String) details.getAttribute("role");
            String user_id = u_name;
            MDC.put("USERID", user_id);
            MDC.put("USERROLE", u_role);

            logger.info("Logged In");
            logger.info("userName: " + u_name);
            logger.info("User Role: "+u_role);
        }
        catch (ClassNotFoundException | SQLException | ParseException e){
            logger.debug("Exception in Login servlet ", e);
            throw new RuntimeException(e);
        }
        finally {
            try {
                con.close();
                logger.info("DB Connection Closed...");
            } catch (SQLException e) {
                logger.debug("Exception in Login Connection close",e);
                throw new RuntimeException(e);
            }

        }
    }
    public static String generate_u_encrypt_pwd(String pwd) throws SQLException {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-512");

            md.update(pwd.getBytes());
            byte[] pwdresultarray = md.digest();
            StringBuilder psb = new StringBuilder();
            for (byte b: pwdresultarray) {
                psb.append(String.format("%02x", b));
            }
            return psb.toString();
        } catch (NoSuchAlgorithmException e) {
            logger.debug("NoSuchAlgorithmException in generate_u_encrypt_pwd method : ",e);
        }
        return "";
    }
}

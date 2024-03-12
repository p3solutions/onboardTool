package license.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;
import org.jasypt.exceptions.EncryptionOperationNotPossibleException;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import java.security.*;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class update_license {
    public static JsonObject license_update(String license_info, String last_update_date) throws EncryptionOperationNotPossibleException {
        JsonObject jsonobj = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
            EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
            config.setPassword("Decom3Sixty"); // we HAVE TO set a password
            config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
            encryptor.setConfig(config);
            encryptor.setKeyObtentionIterations(1000);
            System.out.println("LIC -- : " + license_info);
            String enc = encryptor.decrypt(license_info);
            System.out.println("D#" + encryptor.decrypt(license_info));
            if (enc.contains("Issue To") && enc.contains("Issue Date") && enc.contains("Valid Till")) {
                System.out.println("Structure IF Invokes");
                JSONObject jsonObj = new JSONObject(enc.toString());
                System.out.println("Decrypted Value is : " + jsonObj);
                String s = jsonObj.getString("Valid Till");
                System.out.println("License Valid Date From Lic File : " + s);
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
                //dates to be compare  
                String pattern = "dd-MMM-yyyy";
                String dateInString = new SimpleDateFormat(pattern).format(new Date());
                System.out.println("Date:" + dateInString);
                Date cur_date = sdf.parse(dateInString);
                Date lic_valid_date = sdf.parse(s);
                //prints dates  
                System.out.println("Current Date : " + sdf.format(cur_date));
                System.out.println("License Valid Date : " + sdf.format(lic_valid_date));
                if (cur_date.before(lic_valid_date) || cur_date.equals(lic_valid_date)) {
                    System.out.println("Valid Date License Check Invokes");
                    String insert_query = "insert into license(license_info,last_update_date)values(?,?);";
                    PreparedStatement preparedStmt1 = connection.prepareStatement(insert_query);
                    preparedStmt1.setString(1, license_info);
                    preparedStmt1.setString(2, last_update_date);
                    preparedStmt1.execute();
                    jsonobj.addProperty("license_info", license_info);
                    jsonobj.addProperty("valid_till", s);
                    jsonobj.addProperty("last_update_date", last_update_date);
                    jsonobj.addProperty("flag", "Success");
                } else {
                	
                jsonobj.addProperty("license_info", "");
                jsonobj.addProperty("flag", "Expired");
                }
            } else {
                jsonobj.addProperty("license_info", "");
                jsonobj.addProperty("flag", "Invalid");
            }
        } catch (Exception e) {
            System.out.println("Execption Occurs");
            jsonobj.addProperty("license_info", "");
            jsonobj.addProperty("flag", "Invalid");
        }
        return jsonobj;
    }
}
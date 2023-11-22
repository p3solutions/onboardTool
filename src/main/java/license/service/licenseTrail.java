package license.service;

import com.google.gson.JsonArray;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.EnvironmentStringPBEConfig;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class licenseTrail {
    public static void main(String[] args) {
        PreparedStatement st=null;
        ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        try {
            String lic_info="5+AuPudA48hRqaZ04ZM7cE/gebhIh77fEb55mFs474OVtxzLKG6GwXjgWKgRhpZ7HHEGvoo3ik4lhrh1KgY+GophMC00XnGqqH4oTus/sNgRJ8YgAhgtHXyLHnYCEckucwgK3/nfca0KrC9NHIaAjCPkwsco7CaxFAv/xw83e+Q=";
            //String random_id = generateRandomApprovalId();
            System.out.println("Connected...");
            StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
            EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
            config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
            config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
            encryptor.setConfig(config);
            encryptor.setKeyObtentionIterations(1000);
            String enc=encryptor.decrypt(lic_info);
            System.out.println(enc);




//            String lic_info="{Issue To : Platform 3 Solutions LLC, Issue Date : 30-OCT-2023, Valid Till : -DEC-2023}";
//            //String random_id = generateRandomApprovalId();
//            StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
//            EnvironmentStringPBEConfig config = new EnvironmentStringPBEConfig();
//            config.setPassword("Decom3Sixty");                        // we HAVE TO set a password
//            config.setAlgorithm("PBEWITHHMACSHA512AndAES_256");
//            encryptor.setConfig(config);
//            encryptor.setKeyObtentionIterations(1000);
//            String enc=encryptor.encrypt(lic_info);
//            System.out.println(enc);


























//            String selectQuery = "select license_info from license ORDER BY id DESC LIMIT 1";
//            st = connection.prepareStatement(selectQuery);
//            rs = st.executeQuery();
//            if(rs.next())
//            {
//                lic_info=rs.getString("license_info");
//            }
//            String enc=encryptor.decrypt(lic_info);
//            JSONObject jsonObj = new JSONObject(enc.toString());
//            String issue_date=jsonObj.getString("Issue Date");
//            String issue_to=jsonObj.getString("Issue To");
//            String valid_till=jsonObj.getString("Valid Till");
//            JsonObject jsonObj1 = new JsonObject();
//            jsonObj1.addProperty("issue_to",issue_to);
//            jsonObj1.addProperty("issue_date",issue_date);
//            jsonObj1.addProperty("valid_till", valid_till);
//            jsonArray.add(jsonObj1);
//            st.close();
//            rs.close();

        }
        catch(Exception e)
        {
            System.out.println("Execption Occurs");
        }
        System.out.println("JSON"+jsonArray);

    }
}

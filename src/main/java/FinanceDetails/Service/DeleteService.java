package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class DeleteService {
    public static JsonObject DeleteDetais(String Id) {
        JsonObject jsonobj = new JsonObject();
    try {
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("DB Connected...");
        String delete_query = "delete from Finance_Informations where Id=?;";
        PreparedStatement st2=connection.prepareStatement(delete_query);
        st2.setString(1, Id);
        st2.executeUpdate();
        System.out.println("Deleted");
        }
    catch(Exception e)
    {
    System.out.println("Execption Occurs");
    }
    return jsonobj;
    }
}
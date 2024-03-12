package NewArchiveRequirements.documentRevisions.service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;
import onboard.DBconnection;
import logger.System;
public class archiveReqDocRevDataRetrieveService {
    DBconnection dBconnection;
    Connection con;
    String Id;
    String oppName;
    public archiveReqDocRevDataRetrieveService(String Id, String oppName) throws ClassNotFoundException, SQLException{
        dBconnection = new DBconnection();
         con = (Connection) dBconnection.getConnection();
        this.Id = Id;
        this.oppName = oppName;
    }
    public JsonArray archiveReqDocDataRetrieve() {
        JsonArray jsonArray = new JsonArray();
        try {
            String selectQuery = "select * from Archive_DocumentRevision_Info where OppId = ? order by seq_no;";
            PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
            if(rs.next()) {
                JsonObject jsonObj =new JsonObject();
                jsonObj.addProperty("checkExistance",true);
                jsonObj.addProperty("date",rs.getString("date"));
                jsonObj.addProperty("version",rs.getString("version"));
                jsonObj.addProperty("documentChanges",rs.getString("documentChanges"));
                jsonObj.addProperty("changeAuthor",rs.getString("changeAuthor"));
                jsonArray.add(jsonObj);
                while(rs.next()) {
                    JsonObject jsonObj1 =new JsonObject();
                    jsonObj1.addProperty("date",rs.getString("date"));
                    jsonObj1.addProperty("version",rs.getString("version"));
                    jsonObj1.addProperty("documentChanges",rs.getString("documentChanges"));
                    jsonObj1.addProperty("changeAuthor",rs.getString("changeAuthor"));
                    jsonArray.add(jsonObj1);
                }
            }
            else
            {
                String InsertQuery = "insert into Archive_DocumentRevision_Info(seq_no, OppId, oppName, prjName, date ,version, documentChanges, changeAuthor)"
                        + " value(?, ?, ?, ?, ?, ?, ?, ?);";
              PreparedStatement prestmt = con.prepareStatement(InsertQuery);
              prestmt.setInt(1, 1);
              prestmt.setString(2, Id);
              prestmt.setString(3, oppName);
              prestmt.setString(4, "");
              prestmt.setString(5, "");
              prestmt.setString(6, "1");
              prestmt.setString(7, "");
              prestmt.setString(8, "");
              prestmt.execute();
              prestmt.close();
                JsonObject jsonObj2 = new JsonObject();
                jsonObj2.addProperty("checkExistance",false);
                jsonArray.add(jsonObj2);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    protected void finalize() throws Throwable {
          con.close();
          System.out.println("Db connection Closed");
        }
public JsonArray getRevisionVersion() {
        boolean check=false;
        JsonArray jsonArray = new JsonArray();
        try {
            String selectQuery = "select Max(version)version from Archive_DocumentRevision_Info where OppId = ? order by seq_no;";
            PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
          
                while(rs.next()) {
                    int maxVersion=Integer.parseInt(rs.getString("version"));
                    System.out.println("MaxVersion  : "+maxVersion);
                    JsonObject jsonObj1 =new JsonObject();
                    jsonObj1.addProperty("version",maxVersion);
                    jsonArray.add(jsonObj1);
                    check=true;
                }
            if(check==false)
            {
                JsonObject jsonObj1 =new JsonObject();
                jsonObj1.addProperty("version","1");
                jsonArray.add(jsonObj1);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println("Version array : "+jsonArray);
        return jsonArray;
    }
}
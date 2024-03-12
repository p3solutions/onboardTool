package ArchiveExecutionIssueRisk;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class ArchiveExeIssueSaveService {
    DBconnection dBconnection;
    Connection con;
    String Id;
    String OppId;
    JsonArray jsonArray ;
    public ArchiveExeIssueSaveService(String OppId,String Id,JsonArray jsonArray) throws ClassNotFoundException, SQLException {
         dBconnection = new DBconnection();
         con = (Connection) dBconnection.getConnection();
         this.Id = Id;
         this.OppId = OppId;
         this.jsonArray = jsonArray;
    }
    public JsonObject archiveExeIssueSave()
    {
        JsonObject jsonObject = new JsonObject();
        String UniqueId=null;
        try
        {   boolean statusFlag =false;
            for(int i=0;i<jsonArray.size();i++)
            {
                JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
                String seq_no = jsonObj.get("seq_no").getAsString();    
                String app_Id = jsonObj.get("app_Id").getAsString();
                String impact =  jsonObj.get("impact").getAsString();
                String type =  jsonObj.get("type").getAsString();
                String description =  jsonObj.get("description").getAsString();
                String start_date =  jsonObj.get("start_date").getAsString();
                String raised_by =  jsonObj.get("raised_by").getAsString();
                String status =  jsonObj.get("status").getAsString();
                String assigned_to =  jsonObj.get("assigned_to").getAsString();
                String resolved =  jsonObj.get("resolved").getAsString();
                String exp_date =  jsonObj.get("exp_date").getAsString();
                String end_date =  jsonObj.get("end_date").getAsString();
                String comments =  jsonObj.get("comments").getAsString();
                System.out.println(" ye araha"+app_Id+""+impact+""+type+""+comments+""+exp_date+" ye araha");
                String fetchUniqueId="select * from decom3sixtytool.archiveexe_issue_info where seq_no=?and oppId=?;";
                PreparedStatement pst2 = con.prepareStatement(fetchUniqueId);
    			pst2.setString(1, seq_no);
    			pst2.setString(2, OppId);
    			ResultSet rs1 = pst2.executeQuery();                             
                if(rs1.next()) {
                    UniqueId=rs1.getString("app_Id");
                }
                rs1.close();
                pst2.close();
              String UpdateQuery = "update ArchiveExe_Issue_Info set IssueId=?, impact=?,type=?,description=?,"
                    + "start_date=?,raised_by=?,status=?,assigned_to=?,resolved=?,exp_date=?,end_date=?,comments=? where app_Id=?";
              PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
             // prestmt.setString(1, seq_no);
              prestmt.setString(1, app_Id);
              prestmt.setString(2, impact);
              prestmt.setString(3, type);
              prestmt.setString(4, description);
              prestmt.setString(5, start_date);
              prestmt.setString(6, raised_by);
              prestmt.setString(7, status);
              prestmt.setString(8, assigned_to);
              prestmt.setString(9, resolved);
              prestmt.setString(10, exp_date);
              prestmt.setString(11, end_date);
              prestmt.setString(12, comments);
              prestmt.setString(13, UniqueId);
              prestmt.execute();
              statusFlag =true;
            }
            jsonObject.addProperty("SaveStatus", statusFlag);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return jsonObject;
    }
    protected void finalize() throws Throwable {
      con.close();
    }
}
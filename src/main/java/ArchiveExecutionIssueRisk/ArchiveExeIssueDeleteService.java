package ArchiveExecutionIssueRisk;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class ArchiveExeIssueDeleteService {
    DBconnection dBconnection;
    Connection con;
    int SeqNum;
    String Id;
    String app_id;
    public ArchiveExeIssueDeleteService(int SeqNum,String Id,String app_Id) throws ClassNotFoundException, SQLException {
         dBconnection = new DBconnection();
         con = (Connection) dBconnection.getConnection();
         this.SeqNum = SeqNum;
         this.Id = Id;
         this.app_id=app_Id;
    }
    public JsonObject DeleteRow()
    {
        JsonObject jsonObject = new JsonObject();
        try
        {
            boolean statusFlag = false;
            ArrayList<String> seq_no = new ArrayList<String>();
            ArrayList<String> app_Id = new ArrayList<String>();
            ArrayList<String> impact = new ArrayList<String>();
            ArrayList<String> type = new ArrayList<String>();
            ArrayList<String> description = new ArrayList<String>();
            ArrayList<String> start_date = new ArrayList<String>();
            ArrayList<String> raised_by = new ArrayList<String>();
            ArrayList<String> status = new ArrayList<String>();
            ArrayList<String> assigned_to = new ArrayList<String>();
            ArrayList<String> resolved = new ArrayList<String>();
            ArrayList<String> exp_date = new ArrayList<String>();
            ArrayList<String> end_date = new ArrayList<String>();
            ArrayList<String> comments = new ArrayList<String>();
            ArrayList<String> oppID = new ArrayList<String>();
            ArrayList<String> issueId = new ArrayList<String>();
            ArrayList<String> seq_noRes = new ArrayList<String>();
            ArrayList<String> app_IdRes = new ArrayList<String>();
            ArrayList<String> impactRes = new ArrayList<String>();
            ArrayList<String> typeRes = new ArrayList<String>();
            ArrayList<String> descriptionRes = new ArrayList<String>();
            ArrayList<String> start_dateRes = new ArrayList<String>();
            ArrayList<String> raised_byRes = new ArrayList<String>();
            ArrayList<String> statusRes = new ArrayList<String>();
            ArrayList<String> assigned_toRes = new ArrayList<String>();
            ArrayList<String> resolvedRes = new ArrayList<String>();
            ArrayList<String> exp_dateRes = new ArrayList<String>();
            ArrayList<String> end_dateRes = new ArrayList<String>();
            ArrayList<String> commentsRes = new ArrayList<String>();
            ArrayList<String> oppIdRes = new ArrayList<String>();
            ArrayList<String> issueIdRes = new ArrayList<String>();
            String appname ="";
            String UniqueId ="";
            int newSeqNum = SeqNum+1;
            String selectUniqueID = "select * from ArchiveExe_Issue_Info where  IssueId=? and seq_no=? order by seq_no;";
            PreparedStatement pst1 = con.prepareStatement(selectUniqueID);
			pst1.setString(1, app_id);
			pst1.setInt(2,SeqNum);
			ResultSet rs2 = pst1.executeQuery();
            
            if(rs2.next()) {
                UniqueId=rs2.getString("app_Id");
            }
            String selectQuery = "select * from ArchiveExe_Issue_Info where app_Id=? order by seq_no;";
            PreparedStatement pst2 = con.prepareStatement(selectQuery);
			pst2.setString(1, UniqueId);
			ResultSet rs = pst2.executeQuery();
          
            while(rs.next())
            {
                seq_no.add(rs.getString("seq_no"));
                app_Id.add(rs.getString("app_Id"));
                impact.add(rs.getString("impact"));
                type.add(rs.getString("type"));
                description.add(rs.getString("description"));
                start_date.add(rs.getString("start_date"));
                raised_by.add(rs.getString("raised_by"));
                status.add(rs.getString("status"));
                assigned_to.add(rs.getString("assigned_to"));
                resolved.add(rs.getString("resolved"));
                exp_date.add(rs.getString("exp_date"));
                end_date.add(rs.getString("end_date"));
                comments.add(rs.getString("comments"));
                oppID.add(rs.getString("oppId"));
                issueId.add(rs.getString("IssueId"));
            }
            for(int i=0;i<seq_no.size();i++)
            {
                if(SeqNum<Integer.parseInt(seq_no.get(i)))
                {
                    seq_noRes.add(seq_no.get(i));
                    app_IdRes.add(app_Id.get(i));
                    impactRes.add(impact.get(i));
                    typeRes.add(type.get(i));
                    descriptionRes.add(description.get(i));
                    start_dateRes.add(start_date.get(i));
                    raised_byRes.add(raised_by.get(i));
                    statusRes.add(status.get(i));
                    assigned_toRes.add(assigned_to.get(i));
                    resolvedRes.add(resolved.get(i));
                    exp_dateRes.add(exp_date.get(i));
                    end_dateRes.add(end_date.get(i));
                    commentsRes.add(comments.get(i));
                    commentsRes.add(oppID.get(i));
                    commentsRes.add(issueId.get(i));
                }
                else if(SeqNum>Integer.parseInt(seq_no.get(i)))
                {
                    seq_noRes.add(String.valueOf(Integer.parseInt(seq_no.get(i))-1));
                    app_IdRes.add(app_Id.get(i));
                    impactRes.add(impact.get(i));
                    typeRes.add(type.get(i));
                    descriptionRes.add(description.get(i));
                    start_dateRes.add(start_date.get(i));
                    raised_byRes.add(raised_by.get(i));
                    statusRes.add(status.get(i));
                    assigned_toRes.add(assigned_to.get(i));
                    resolvedRes.add(resolved.get(i));
                    exp_dateRes.add(exp_date.get(i));
                    end_dateRes.add(end_date.get(i));
                    commentsRes.add(comments.get(i));
                    commentsRes.add(oppID.get(i));
                    commentsRes.add(issueId.get(i));
                }
            }
            String deleteQuery ="delete from ArchiveExe_Issue_Info where app_Id=?;";
            PreparedStatement st1 = con.prepareStatement(deleteQuery);
			st1.setString(1,UniqueId);
			st1.executeUpdate();
            
            st1.close();
            for(int i=0;i<seq_noRes.size();i++)
            {
              String StakeHolderInsertQuery = "insert into ArchiveExe_Issue_Info (seq_no, app_Id,impact, type, description, start_date, raised_by, status, assigned_to, resolved, exp_date, end_date, comments,oppId,IssueId) "
                        + "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?);";
              PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
              prestmt.setInt(1, Integer.parseInt(seq_no.get(i)));
              prestmt.setString(2, app_IdRes.get(i));
              prestmt.setString(3, impactRes.get(i));
              prestmt.setString(4, typeRes.get(i));
              prestmt.setString(5, descriptionRes.get(i));
              prestmt.setString(6, start_dateRes.get(i));
              prestmt.setString(7, raised_byRes.get(i));
              prestmt.setString(8, statusRes.get(i));
              prestmt.setString(9, assigned_toRes.get(i));
              prestmt.setString(10, resolvedRes.get(i));
              prestmt.setString(11, exp_dateRes.get(i));
              prestmt.setString(12, end_dateRes.get(i));
              prestmt.setString(13, commentsRes.get(i));
              prestmt.setString(13, oppIdRes.get(i));
              prestmt.setString(13, issueIdRes.get(i));
              prestmt.execute();
              statusFlag =true;
            }
            jsonObject.addProperty("DeleteStatus", true);
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
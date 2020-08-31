package ArchiveExecution.Service;

import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

public class Archive_execution_db_update {
    final static Logger logger = Logger.getLogger(Archive_execution_db_update.class);

    public static void progress_bar_current_stage(ArrayList<Integer> level_num, ArrayList<String> actual_enddate, ArrayList<String> progressbar, String prjname, int selectedindex, int currentlevel) {
        try {
            ArrayList<Integer> checkindex = new ArrayList<Integer>();
            //DB Connection//
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement statement = connection.createStatement();
            while (currentlevel != 0) {
                int totalcount = 0;
                int node_count = 0;
                logger.info("current level " + currentlevel);
                boolean check = true;
                ArrayList<Integer> date = new ArrayList<Integer>();
                //checking actual end date before the current index
                for (int l = selectedindex - 1; l >= 0; l--) {
                    if (level_num.get(l) == 1 || level_num.get(l) == currentlevel - 1) {
                        break;
                    } else if (currentlevel == level_num.get(l)) {
                        if (actual_enddate.get(l).equals("")) {
                            check = false;
                            totalcount++;
                        } else {
                            totalcount++;
                            node_count++;
                            if (!checkindex.contains(l)) {
                                progressbar.set(l, "100");
                                statement.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (l + 1) + ";");
                            }
                        }
                    }
                }
                //checking the actual end date in and after the current index
                for (int m = selectedindex; m < actual_enddate.size(); m++) {
                    if (level_num.get(m) == 1 || level_num.get(m) == currentlevel - 1) {
                        break;
                    } else if (currentlevel == level_num.get(m)) {
                        if (actual_enddate.get(m).equals("")) {
                            check = false;
                            totalcount++;
                        } else {
                            totalcount++;
                            node_count++;
                            if (!checkindex.contains(m)) {
                                progressbar.set(m, "100");
                                statement.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (m + 1) + ";");
                            }
                        }
                    }
                }
                for (int n = selectedindex; n >= 0; n--) {
                    if (currentlevel - 1 == level_num.get(n)) {

                        if (check == true) {
                            progressbar.set(n, "100");
                            statement.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                            logger.info("level" + n + ": " + progressbar.get(n));
                            int index = n;
                            selectedindex = index;
                            break;
                        } else {
                            if (node_count != 0) {
                                float progperc = 100 / (float) totalcount;
                                float percentage = progperc * node_count;
                                checkindex.add(n);
                                logger.info("node count: " + node_count + "total count : " + totalcount + " progress bar percentage: " + progperc + "Percentage : " + percentage);
                                progressbar.set(n, Double.toString(percentage));
                                statement.executeUpdate("update archiveexecution_details set progressbar='" + Math.round(percentage) + "' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                            } else {
                                progressbar.set(n, "0");
                                statement.executeUpdate("update archiveexecution_details set progressbar='0' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                            }
                            int index = n;
                            selectedindex = index;
                            break;
                        }
                    }
                }

                currentlevel--;
            }
            logger.info("archive execution db update" + prjname);
            connection.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //return progressbar;
    }

    /* public static String user_name(String select_project)
     {
         String unames="";
         String unames1="";
         try
         {
             String myDriver = "org.gjt.mm.mysql.Driver";

             String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";

             Class.forName(myDriver);

             Connection conn = DriverManager.getConnection(myUrl, "root", "password123");

             Statement sr = conn.createStatement();
             String query1="select distinct(uname) from admin_userdetails where projects like '%"+select_project+"%';";
             Statement st1 = conn.createStatement();
             ResultSet rs1 = st1.executeQuery(query1);
             while(rs1.next())
             {
                 unames+=rs1.getString("uname")+",";
             }
             if(!unames.equals(""))
             unames1=unames.substring(0,unames.length()-1);
         }
         catch(Exception e)
         {
             System.out.println("Exception----------"+e);
         }
         return unames1;
     }*/
    public static float progress_bar_percent(int seq_num, String selected_project) {
        float progress = 0;
        logger.info("seq:" + seq_num);
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();

            //Statement statement = connection.createStatement();
            String query1 = "select * from archiveexecution_details where projects='" + selected_project + "' order by seq_num;";
            Statement statement = connection.createStatement();
            ResultSet rs1 = statement.executeQuery(query1);
            int db_count = 0;
            ArrayList<Integer> level = new ArrayList<Integer>();
            ArrayList<String> actualend = new ArrayList<String>();
            while (rs1.next()) {
                level.add(Integer.parseInt(rs1.getString("level")));
                actualend.add(rs1.getString("act_end_date"));
                db_count = Integer.parseInt(rs1.getString("seq_num"));
            }
            int totalchildcount = 0;
            int actualendcount = 0;
            int seqnum = seq_num;
            int parent_level = level.get(seq_num);
            int child_level = parent_level + 1;
            float percent = 0;
            if (!actualend.get(seq_num).equals("")) {
                progress = 100;
            } else {
                for (int i = seqnum + 1; i < db_count; i++) {
                    if (level.get(i) == parent_level) {
                        break;
                    } else {
                        if (level.get(i) == child_level) {
                            totalchildcount++;
                            if (!actualend.get(i).equals("")) {
                                actualendcount++;


                            }
                        }
                    }
                }
                percent = 100 / (float) totalchildcount;
                progress = percent * actualendcount;
            }
            logger.info("progressbar: " + progress);
            connection.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return progress;
    }

    /*public static int percent(int seq_num,String selected_project)
    {
    	int percentage = 0;
    	try
    	{
    	String myDriver = "org.gjt.mm.mysql.Driver";

        String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";

        Class.forName(myDriver);

        Connection conn = DriverManager.getConnection(myUrl, "root", "password123");

        Statement sr = conn.createStatement();
        String query1="select * from archiveexecution_details where projects='"+selected_project+"' and seq_num ='"+seq_num+"';";
        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery(query1);
        if(rs1.next())
        {
        	percentage = Integer.parseInt(rs1.getString("progressbar"));
        }
    	}
        catch(Exception e)
    	{
    	 System.out.println("Exception----------"+e);
    	}
    	return percentage;
    }*/
    public static void progress_bar_delete_task(ArrayList<Integer> level_num, ArrayList<String> actual_enddate, ArrayList<String> progressbar, String prjname, int selectedindex, int currentlevel) {
        try {
            ArrayList<Integer> checkindex = new ArrayList<Integer>();
            int deleteindex = selectedindex;
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement statement = connection.createStatement();
            while (currentlevel != 0) {
                int totalcount = 0;
                int node_count = 0;
                logger.info("current level " + currentlevel);
                boolean check = true;
                ArrayList<Integer> date = new ArrayList<Integer>();
                //checking actual end date before the current index
                for (int l = selectedindex - 1; l >= 0; l--) {
                    if (level_num.get(l) == 1 || level_num.get(l) == currentlevel - 1) {
                        break;
                    } else if (currentlevel == level_num.get(l)) {
                        if (actual_enddate.get(l).equals("")) {
                            check = false;
                            totalcount++;
                        } else {
                            totalcount++;
                            node_count++;
                            logger.info("node count :" + node_count);
                            if (!checkindex.contains(l)) {
                                progressbar.set(l, "100");
                                statement.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (l + 1) + ";");
                            }
                        }
                    }
                }
                //checking the actual end date in and after the current index
                for (int m = selectedindex; m < actual_enddate.size(); m++) {
                    if (m != deleteindex) {
                        if (level_num.get(m) == 1 || level_num.get(m) == currentlevel - 1) {
                            break;
                        } else if (currentlevel == level_num.get(m)) {
                            if (actual_enddate.get(m).equals("")) {
                                check = false;
                                totalcount++;
                            } else {
                                totalcount++;
                                node_count++;
                                logger.info("node count :" + node_count);
                                if (!checkindex.contains(m)) {
                                    progressbar.set(m, "100");
                                    statement.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (m + 1) + ";");
                                }
                            }
                        }
                    }
                }
                for (int n = selectedindex; n >= 0; n--) {
                    if (n != deleteindex) {
                        if (currentlevel - 1 == level_num.get(n)) {
                            if (node_count == 0) {
                                progressbar.set(n, "0");
                                statement.executeUpdate("update archiveexecution_details set progressbar='0' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                                break;
                            } else if (check == true) {
                                progressbar.set(n, "100");
                                statement.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                                logger.info("level" + n + ": " + progressbar.get(n));
                                int index = n;
                                selectedindex = index;
                                break;
                            } else {
                                if (node_count != 0) {
                                    float progperc = 100 / (float) totalcount;
                                    float percentage = progperc * node_count;
                                    checkindex.add(n);
                                    logger.info("node count: " + node_count + "total count : " + totalcount + " progress bar percentage: " + progperc + "Percentage : " + percentage);
                                    progressbar.set(n, Double.toString(percentage));
                                    statement.executeUpdate("update archiveexecution_details set progressbar='" + Math.round(percentage) + "' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                                } else {
                                    progressbar.set(n, "0");
                                    statement.executeUpdate("update archiveexecution_details set progressbar='0' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                                }
                                int index = n;
                                selectedindex = index;
                                break;
                            }
                        }
                    }
                }
                currentlevel--;
            }
            connection.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //return progressbar;
    }

    public static void Date_Fields_And_Hours_Update(ArrayList<Integer> seq_num, ArrayList<Integer> level_num, ArrayList<String> mem_ass, ArrayList<String> planstart_date, ArrayList<String> planend_date, ArrayList<String> actualstart_date, ArrayList<String> actualend_date, ArrayList<String> plan_hours, ArrayList<String> actual_hours, ArrayList<String> progressbar, ArrayList<String> cmnts, String selected_project, int selected_index, int selected_level, int db_count) {
        try {
            //db connection
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement statement = connection.createStatement();
            int current_index = selected_index;
            int current_level = selected_level;
            int current_level_db_update = selected_level;
            int current_index_db_update = selected_index;
            int from_index = 0;
            int to_index = 0;
            SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy");
            //traversing or iterating level by level
            while (current_level != 0) {
                ArrayList<Date> plansrt_date = new ArrayList<Date>();
                ArrayList<Date> planen_date = new ArrayList<Date>();
                ArrayList<Date> actualsrt_date = new ArrayList<Date>();
                ArrayList<Date> actualen_date = new ArrayList<Date>();
                int act_hrs = 0;
                int pln_hrs = 0;
                boolean check = true;
                ArrayList<Boolean> check_planstart = new ArrayList<Boolean>();
                ArrayList<Boolean> check_planend = new ArrayList<Boolean>();
                ArrayList<Boolean> check_actualstart = new ArrayList<Boolean>();
                //traversing the date fields of before current index of current level
                for (int i = current_index - 1; i >= 0; i--) {
                    if (level_num.get(i) == 1 || level_num.get(i) < current_level) {
                        break;
                    } else if (current_level == level_num.get(i)) {
                        if (!planstart_date.get(i).equals("")) {
                            plansrt_date.add(fmt.parse(planstart_date.get(i)));
                            check_planstart.add(true);
                        } else {
                            check_planstart.add(false);
                        }
                        if (!planend_date.get(i).equals("")) {
                            planen_date.add(fmt.parse(planend_date.get(i)));
                            check_planend.add(true);
                        } else {
                            check_planend.add(false);
                        }
                        if (!actualstart_date.get(i).equals("")) {
                            actualsrt_date.add(fmt.parse(actualstart_date.get(i)));
                            check_actualstart.add(true);
                        } else {
                            check_actualstart.add(false);
                        }
                        if (!actualend_date.get(i).equals("")) {
                            actualen_date.add(fmt.parse(actualend_date.get(i)));
                        } else {
                            check = false;
                        }
                        if (!plan_hours.get(i).equals("") && !actual_hours.get(i).equals("")) {
                            pln_hrs += Integer.parseInt(plan_hours.get(i));
                            int plannedhours = pln_hrs;
                            act_hrs += Integer.parseInt(actual_hours.get(i));
                            int actualhours = act_hrs;
                        }
                    }
                }
                //traversing date fields in and after the current index of current level
                for (int j = current_index; j < db_count; j++) {
                    if (level_num.get(j) == 1 || level_num.get(j) < current_level) {
                        break;
                    } else if (current_level == level_num.get(j)) {
                        if (!planstart_date.get(j).equals("")) {
                            plansrt_date.add(fmt.parse(planstart_date.get(j)));
                            check_planstart.add(true);
                        } else {
                            check_planstart.add(false);
                        }
                        if (!planend_date.get(j).equals("")) {
                            planen_date.add(fmt.parse(planend_date.get(j)));
                            check_planend.add(true);
                        } else {
                            check_planend.add(false);
                        }
                        if (!actualstart_date.get(j).equals("")) {
                            actualsrt_date.add(fmt.parse(actualstart_date.get(j)));
                            check_actualstart.add(true);
                        } else {
                            check_actualstart.add(false);
                        }
                        if (!actualend_date.get(j).equals("")) {
                            actualen_date.add(fmt.parse(actualend_date.get(j)));
                        } else {
                            check = false;
                        }
                        if (!plan_hours.get(j).equals("") && !actual_hours.get(j).equals("")) {
                            pln_hrs += Integer.parseInt(plan_hours.get(j));
                            int plannedhours = pln_hrs;
                            act_hrs += Integer.parseInt(actual_hours.get(j));
                            int acrualhours = act_hrs;
                        }
                    }

                }
                Date min_pln_srt = new Date();
                Date max_pln_end = new Date();
                Date min_act_srt = new Date();
                Date max_act_end = new Date();
                //finding the min date of plan start and actual start,finding the max date of plan end and act end
                if (plansrt_date.isEmpty() == false) {
                    min_pln_srt = Collections.min(plansrt_date);
                }
                if (planen_date.isEmpty() == false) {
                    max_pln_end = Collections.max(planen_date);
                }
                if (actualsrt_date.isEmpty() == false) {
                    min_act_srt = Collections.min(actualsrt_date);
                }
                if (actualen_date.isEmpty() == false) {
                    max_act_end = Collections.max(actualen_date);
                }
                //updating the date field and hours of current level to the before level
                for (int k = current_index; k >= 0; k--) {
                    if (level_num.get(k) == current_level - 1) {
                        planstart_date.set(k, fmt.format(min_pln_srt));
                        planend_date.set(k, fmt.format(max_pln_end));
                        actualstart_date.set(k, fmt.format(min_act_srt));
                        if (areAllTrue(check_planstart)) {
                            planstart_date.set(k, "");
                        }
                        if (areAllTrue(check_planend)) {
                            planend_date.set(k, "");
                        }
                        if (areAllTrue(check_actualstart)) {
                            actualstart_date.set(k, "");
                        }
                        if (check == true) {
                            actualend_date.set(k, fmt.format(max_act_end));
                        } else {
                            actualend_date.set(k, "");
                        }
                        plan_hours.set(k, Integer.toString(pln_hrs));
                        int plannedhours = pln_hrs;
                        actual_hours.set(k, Integer.toString(act_hrs));
                        int actualhours = act_hrs;
                        break;
                    }
                }
                current_level--;
            }
            //db_update of input fields

            //finding for level1 index before the selected index
            for (int l = current_index_db_update - 1; l >= 0; l--) {
                if (level_num.get(l) == 1) {
                    from_index = l;
                    break;
                }
            }

            //finding for level1 index after the selected index
            for (int m = current_index_db_update; m < db_count; m++) {
                if (level_num.get(m) == 1 || db_count - 1 == m) {
                    to_index = m;
                    break;
                }
            }
            //updating the plan start date ,plan end date,actual start date,actual end date,planned hours and actual hours.
            for (int n = from_index; n <= to_index; n++) {
                int seq = n + 1;
                String query = "update archiveexecution_details set mem_ass='" + mem_ass.get(n) + "',pln_srt_date='" + planstart_date.get(n) + "',pln_end_date='" + planend_date.get(n) + "',act_srt_date='" + actualstart_date.get(n) + "',act_end_date='" + actualend_date.get(n) + "',planned_hrs='" + plan_hours.get(n) + "',hours='" + actual_hours.get(n) + "',comments='" + cmnts.get(n) + "' where projects='" + selected_project + "' and seq_num=" + seq;
                statement.executeUpdate(query);
            }
            //progress bar for current stage
            progress_bar_current_stage(level_num, actualend_date, progressbar, selected_project, selected_index, selected_level);
            connection.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean areAllTrue(ArrayList<Boolean> array) {
        for (boolean b : array) if (b) return false;
        return true;
    }
}

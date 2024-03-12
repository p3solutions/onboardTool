package ArchiveExecutionModule.ArchiveExecutionDetails.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import com.google.gson.JsonArray;

import onboard.DBconnection;
import logger.System;

public class ArchiveExecutionDeleteService {

	DBconnection dBconnection =null;

	static Connection con = null;
	public static String Id = null;
	public String oppName = null;
	static int seqNum;
	static int indexFrom;
	static int indexTo;
	static int count;
	static boolean checkNextParent;
	static String tasktypemethod;
	static boolean subchildflag;
	static int SubchildSeqNum;
	static int SubchildSeqNum1;
	static int parentSeqNum;
	public ArchiveExecutionDeleteService(String Id, String oppName, int seqNum) throws ClassNotFoundException, SQLException{
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.seqNum = seqNum;	
		this.oppName = oppName;
	}

	public JsonArray archiveExecutionDeleteService() {

		boolean isParent;
		JsonArray jsonArray = new JsonArray();
		try {

			String selectQuery = "select * from archive_execution_info where oppId = ? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();


			ArrayList<Integer> arrSeqNum = new ArrayList<Integer>();
			ArrayList<String> arrOppId = new ArrayList<String>();
			ArrayList<String> arrOppName = new ArrayList<String>();
			ArrayList<String> arrLevel = new ArrayList<String>();
			ArrayList<String> arrTaskId = new ArrayList<String>();
			ArrayList<String> arrTaskGroup = new ArrayList<String>();
			ArrayList<String> arrTaskName = new ArrayList<String>();
			ArrayList<String> arrTaskType = new ArrayList<String>();
			ArrayList<String> arrMajorDep = new ArrayList<String>();
			ArrayList<String> arrAssignedTo = new ArrayList<String>();
			ArrayList<String> arrPlanSrt = new ArrayList<String>();
			ArrayList<String> arrPlanEnd = new ArrayList<String>();
			ArrayList<String> arrActSrt = new ArrayList<String>();
			ArrayList<String> arrActEnd = new ArrayList<String>();
			ArrayList<String> arrCompletion = new ArrayList<String>();
			ArrayList<String> arrStatus = new ArrayList<String>();
			ArrayList<String> arrRemark = new ArrayList<String>();


			ArrayList<Integer> arrSeqNumRes = new ArrayList<Integer>();
			ArrayList<String> arrOppIdRes = new ArrayList<String>();
			ArrayList<String> arrOppNameRes = new ArrayList<String>();
			ArrayList<String> arrLevelRes = new ArrayList<String>();
			ArrayList<String> arrTaskIdRes = new ArrayList<String>();
			ArrayList<String> arrTaskGroupRes = new ArrayList<String>();
			ArrayList<String> arrTaskNameRes = new ArrayList<String>();
			ArrayList<String> arrTaskTypeRes = new ArrayList<String>();
			ArrayList<String> arrMajorDepRes = new ArrayList<String>();
			ArrayList<String> arrAssignedToRes = new ArrayList<String>();
			ArrayList<String> arrPlanSrtRes = new ArrayList<String>();
			ArrayList<String> arrPlanEndRes = new ArrayList<String>();
			ArrayList<String> arrActSrtRes = new ArrayList<String>();
			ArrayList<String> arrActEndRes = new ArrayList<String>();
			ArrayList<String> arrCompletionRes = new ArrayList<String>();
			ArrayList<String> arrStatusRes = new ArrayList<String>();
			ArrayList<String> arrRemarkRes = new ArrayList<String>();


			while(rs.next()) {
				arrSeqNum.add(rs.getInt("seq_no"));
				arrOppId.add(rs.getString("oppId"));
				arrOppName.add(rs.getString("oppName"));
				arrLevel.add(rs.getString("level"));
				arrTaskId.add(rs.getString("taskId"));
				arrTaskGroup.add(rs.getString("taskGroup"));
				arrTaskName.add(rs.getString("taskName"));
				arrTaskType.add(rs.getString("taskType"));
				arrMajorDep.add(rs.getString("majorDependencies"));
				arrAssignedTo.add(rs.getString("assignedTo"));
				arrPlanSrt.add(rs.getString("planSrt"));
				arrPlanEnd.add(rs.getString("planEnd"));
				arrActSrt.add(rs.getString("actSrt"));
				arrActEnd.add(rs.getString("actEnd"));
				arrCompletion.add(rs.getString("completion"));
				arrStatus.add(rs.getString("status"));
				arrRemark.add(rs.getString("remark"));
			}

			ArrayList<Date> planSrtDate = new ArrayList<Date>();
			ArrayList<Date> planEndDate = new ArrayList<Date>();
			ArrayList<Date> ActualSrtDate = new ArrayList<Date>();
			ArrayList<Date> ActualEndDate = new ArrayList<Date>();
			tasktypemethod=tasktypeflow(seqNum,arrLevel);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			if(subchildflag)
			{
				for(int currentIndex=seqNum-1;currentIndex>=0;currentIndex--)
				{
					if(arrLevel.get(currentIndex).equals("2"))
					{
						SubchildSeqNum=currentIndex+1;
						break;
					} 
					if(!arrLevel.get(currentIndex).equals("2")&&currentIndex!=seqNum-1)
					{
						if(!arrPlanSrt.get(currentIndex).equals(""))
							planSrtDate.add(simpleDateFormat.parse(arrPlanSrt.get(currentIndex)));
						if(!arrPlanEnd.get(currentIndex).equals(""))
							planEndDate.add(simpleDateFormat.parse(arrPlanEnd.get(currentIndex)));
						if(!arrActSrt.get(currentIndex).equals(""))
							ActualSrtDate.add(simpleDateFormat.parse(arrActSrt.get(currentIndex)));
						if(!arrActEnd.get(currentIndex).equals(""))
							ActualEndDate.add(simpleDateFormat.parse(arrActEnd.get(currentIndex)));
					}
				}
				for(int currentIndex=seqNum-1;currentIndex<arrSeqNum.size();currentIndex++)
				{
					if(arrLevel.get(currentIndex).equals("2"))
						break;
					if(!arrLevel.get(currentIndex).equals("2")&&currentIndex!=seqNum-1)
					{
						if(!arrPlanSrt.get(currentIndex).equals(""))
							planSrtDate.add(simpleDateFormat.parse(arrPlanSrt.get(currentIndex)));
						if(!arrPlanEnd.get(currentIndex).equals(""))
							planEndDate.add(simpleDateFormat.parse(arrPlanEnd.get(currentIndex)));
						if(!arrActSrt.get(currentIndex).equals(""))
							ActualSrtDate.add(simpleDateFormat.parse(arrActSrt.get(currentIndex)));
						if(!arrActEnd.get(currentIndex).equals(""))
							ActualEndDate.add(simpleDateFormat.parse(arrActEnd.get(currentIndex)));
					}  
				}

			}

			if(!subchildflag)
			{
				for(int currentIndex=seqNum-1;currentIndex>=0;currentIndex--)
				{
					if(arrLevel.get(currentIndex).equals("1"))
					{
						parentSeqNum=currentIndex+1;
						break;
					} 
					if(!arrLevel.get(currentIndex).equals("1")&&currentIndex!=seqNum-1)
					{
						if(!arrLevel.get(currentIndex).equals("3")&&currentIndex!=SubchildSeqNum-1)
						{
							if(!arrPlanSrt.get(currentIndex).equals(""))
								planSrtDate.add(simpleDateFormat.parse(arrPlanSrt.get(currentIndex)));
							if(!arrPlanEnd.get(currentIndex).equals(""))
								planEndDate.add(simpleDateFormat.parse(arrPlanEnd.get(currentIndex)));
							if(!arrActSrt.get(currentIndex).equals(""))
								ActualSrtDate.add(simpleDateFormat.parse(arrActSrt.get(currentIndex)));
							if(!arrActEnd.get(currentIndex).equals(""))
								ActualEndDate.add(simpleDateFormat.parse(arrActEnd.get(currentIndex)));
						}
					}
				}
				for(int currentIndex=seqNum-1;currentIndex<arrSeqNum.size();currentIndex++)
				{
					if(arrLevel.get(currentIndex).equals("1"))
						break;
					if(!arrLevel.get(currentIndex).equals("1")&&currentIndex!=seqNum-1)
					{
						if(!arrLevel.get(currentIndex).equals("3")&&currentIndex!=seqNum-1)
						{
							if(!arrPlanSrt.get(currentIndex).equals(""))
								planSrtDate.add(simpleDateFormat.parse(arrPlanSrt.get(currentIndex)));
							if(!arrPlanEnd.get(currentIndex).equals(""))
								planEndDate.add(simpleDateFormat.parse(arrPlanEnd.get(currentIndex)));
							if(!arrActSrt.get(currentIndex).equals(""))
								ActualSrtDate.add(simpleDateFormat.parse(arrActSrt.get(currentIndex)));
							if(!arrActEnd.get(currentIndex).equals(""))
								ActualEndDate.add(simpleDateFormat.parse(arrActEnd.get(currentIndex)));
						}
					}


				}
			}
			checkNextParent = false;

			for(int i = 0; i<arrSeqNum.size(); i++) {
				if(i<indexFrom) {
					arrSeqNumRes.add(arrSeqNum.get(i));
					arrOppIdRes.add(arrOppId.get(i));
					arrOppNameRes.add(arrOppName.get(i));
					arrLevelRes.add(arrLevel.get(i));
					arrTaskIdRes.add(arrTaskId.get(i));
					arrTaskGroupRes.add(arrTaskGroup.get(i));
					arrTaskNameRes.add(arrTaskName.get(i));
					arrTaskTypeRes.add(arrTaskType.get(i));
					arrMajorDepRes.add(arrMajorDep.get(i));
					arrAssignedToRes.add(arrAssignedTo.get(i));
					arrPlanSrtRes.add(arrPlanSrt.get(i));
					arrPlanEndRes.add(arrPlanEnd.get(i));
					arrActSrtRes.add(arrActSrt.get(i));
					arrActEndRes.add(arrActEnd.get(i));
					arrCompletionRes.add(arrCompletion.get(i));
					arrStatusRes.add(arrStatus.get(i));
					arrRemarkRes.add(arrRemark.get(i));
				}
				else if(i>indexTo){
					arrSeqNumRes.add(arrSeqNum.get(i)-count);
					arrOppIdRes.add(arrOppId.get(i));
					arrOppNameRes.add(arrOppName.get(i));
					arrLevelRes.add(arrLevel.get(i));
					String taskId = arrTaskId.get(i);
					taskId = action(arrLevel.get(i), taskId);
					arrTaskIdRes.add(taskId);
					arrTaskGroupRes.add(arrTaskGroup.get(i));
					arrTaskNameRes.add(arrTaskName.get(i));
					arrTaskTypeRes.add(arrTaskType.get(i));
					arrMajorDepRes.add(arrMajorDep.get(i));
					arrAssignedToRes.add(arrAssignedTo.get(i));
					arrPlanSrtRes.add(arrPlanSrt.get(i));
					arrPlanEndRes.add(arrPlanEnd.get(i));
					arrActSrtRes.add(arrActSrt.get(i));
					arrActEndRes.add(arrActEnd.get(i));
					arrCompletionRes.add(arrCompletion.get(i));
					arrStatusRes.add(arrStatus.get(i));
					arrRemarkRes.add(arrRemark.get(i));
				}
			}

			for(int j = 0; j<arrSeqNumRes.size(); j++) {

				System.out.println(arrSeqNumRes.get(j)+" "+arrLevelRes.get(j)+" "+arrTaskIdRes.get(j)+" "+arrTaskGroupRes.get(j)+" "+arrTaskNameRes.get(j));

			}

			if(subchildflag)
			{ 					
				arrPlanSrtRes.set(SubchildSeqNum-1,(planSrtDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.min(planSrtDate)));
				arrPlanEndRes.set(SubchildSeqNum-1,(planEndDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.max(planEndDate)));
				arrActSrtRes.set(SubchildSeqNum-1,(ActualSrtDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.min(ActualSrtDate)));
				arrActEndRes.set(SubchildSeqNum-1,(ActualEndDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.max(ActualEndDate)));
				String s=UpdateSubChildParentDate(SubchildSeqNum,arrLevel,arrPlanSrt,arrPlanEnd,arrActSrt,arrActEnd,planSrtDate,planEndDate,ActualSrtDate,ActualEndDate,arrSeqNum,arrPlanSrtRes,arrPlanEndRes,arrActSrtRes,arrActEndRes);
			}


			if(!subchildflag)
			{
				arrPlanSrtRes.set(parentSeqNum-1,(planSrtDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.min(planSrtDate)));
				arrPlanEndRes.set(parentSeqNum-1,(planEndDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.max(planEndDate)));
				arrActSrtRes.set(parentSeqNum-1,(ActualSrtDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.min(ActualSrtDate)));
				arrActEndRes.set(parentSeqNum-1,(ActualEndDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.max(ActualEndDate)));
			}


			String deleteQuery = "delete from archive_execution_info where oppid=? order by seq_no;";
			PreparedStatement st1 = con.prepareStatement(deleteQuery);
			st1.setString(1, Id);
			st1.executeUpdate();

			for(int k = 0; k<arrSeqNumRes.size(); k++) {
				System.out.println(arrSeqNumRes.get(k)+" "+arrLevelRes.get(k)+" "+arrTaskIdRes.get(k)+" "+arrTaskGroupRes.get(k));

				String insertQuery = "insert into archive_execution_info(seq_no, oppId, oppName, level, taskId, taskGroup, taskName, taskType, majorDependencies, assignedTo, planSrt, planEnd, actSrt, actEnd, completion, status, remark)"
						+"values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement prepare = con.prepareStatement(insertQuery);
				prepare.setInt(1, arrSeqNumRes.get(k));
				prepare.setString(2, arrOppIdRes.get(k));
				prepare.setString(3, arrOppNameRes.get(k));
				prepare.setString(4, arrLevelRes.get(k));
				prepare.setString(5, arrTaskIdRes.get(k));
				prepare.setString(6, arrTaskGroupRes.get(k));
				prepare.setString(7, arrTaskNameRes.get(k));
				prepare.setString(8, arrTaskTypeRes.get(k));
				prepare.setString(9, arrMajorDepRes.get(k));
				prepare.setString(10, arrAssignedToRes.get(k));
				prepare.setString(11, arrPlanSrtRes.get(k));
				prepare.setString(12, arrPlanEndRes.get(k));
				prepare.setString(13, arrActSrtRes.get(k));
				prepare.setString(14, arrActEndRes.get(k));
				prepare.setString(15, arrCompletionRes.get(k));
				prepare.setString(16, arrStatusRes.get(k));
				prepare.setString(17, arrRemarkRes.get(k));
				prepare.execute();

			}

			ArchiveExecutionDetailService archiveExecution =  new ArchiveExecutionDetailService();
			jsonArray = archiveExecution.archiveExecutionDataRetrieve(Id,oppName);
			archiveExecution.con.close();



			/*
			 * archiveExecution =null; System.gc();
			 */

		}
		catch(Exception e) {
			e.printStackTrace();
		}	
		return jsonArray;

	}

	private String UpdateSubChildParentDate(int subchildSeqNum2, ArrayList<String> arrLevel, ArrayList<String> arrPlanSrt, ArrayList<String> arrPlanEnd, ArrayList<String> arrActSrt, ArrayList<String> arrActEnd, ArrayList<Date> planSrtDate, ArrayList<Date> planEndDate,
			ArrayList<Date> ActualSrtDate, ArrayList<Date> ActualEndDate, ArrayList<Integer> arrSeqNum, ArrayList<String> arrPlanSrtRes, ArrayList<String> arrPlanEndRes, ArrayList<String> arrActSrtRes, ArrayList<String> arrActEndRes) throws ParseException {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		for(int currentIndex=SubchildSeqNum-1;currentIndex>=0;currentIndex--)
		{
			if(arrLevel.get(currentIndex).equals("1"))
			{
				SubchildSeqNum1=currentIndex+1;
				break;
			} 
			if(!arrLevel.get(currentIndex).equals("1")&&currentIndex!=SubchildSeqNum-1)
			{
				if(!arrLevel.get(currentIndex).equals("3")&&currentIndex!=SubchildSeqNum-1)
				{
					if(!arrPlanSrt.get(currentIndex).equals(""))
						planSrtDate.add(simpleDateFormat.parse(arrPlanSrt.get(currentIndex)));
					if(!arrPlanEnd.get(currentIndex).equals(""))
						planEndDate.add(simpleDateFormat.parse(arrPlanEnd.get(currentIndex)));
					if(!arrActSrt.get(currentIndex).equals(""))
						ActualSrtDate.add(simpleDateFormat.parse(arrActSrt.get(currentIndex)));
					if(!arrActEnd.get(currentIndex).equals(""))
						ActualEndDate.add(simpleDateFormat.parse(arrActEnd.get(currentIndex)));
				}
			}
		}
		for(int currentIndex=SubchildSeqNum-1;currentIndex<arrSeqNum.size();currentIndex++)
		{
			if(arrLevel.get(currentIndex).equals("1"))
				break;
			if(!arrLevel.get(currentIndex).equals("1")&&currentIndex!=SubchildSeqNum-1)
			{
				if(!arrLevel.get(currentIndex).equals("3")&&currentIndex!=SubchildSeqNum-1)
				{
					if(!arrPlanSrt.get(currentIndex).equals(""))
						planSrtDate.add(simpleDateFormat.parse(arrPlanSrt.get(currentIndex)));
					if(!arrPlanEnd.get(currentIndex).equals(""))
						planEndDate.add(simpleDateFormat.parse(arrPlanEnd.get(currentIndex)));
					if(!arrActSrt.get(currentIndex).equals(""))
						ActualSrtDate.add(simpleDateFormat.parse(arrActSrt.get(currentIndex)));
					if(!arrActEnd.get(currentIndex).equals(""))
						ActualEndDate.add(simpleDateFormat.parse(arrActEnd.get(currentIndex)));
				}
			}


		}

		System.out.println("SEQ NU :"+subchildSeqNum2);
		System.out.println("SUB CHILD SEQ NUMBER : "+SubchildSeqNum1);
		System.out.println("Plan Start Date :"+planSrtDate);
		System.out.println("Plan End Date :"+planEndDate);
		System.out.println("Actual Start Date :"+ActualSrtDate);
		System.out.println("Actual End Date :"+ActualEndDate);
		arrPlanSrtRes.set(SubchildSeqNum1-1,(planSrtDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.min(planSrtDate)));
		arrPlanEndRes.set(SubchildSeqNum1-1,(planEndDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.max(planEndDate)));
		arrActSrtRes.set(SubchildSeqNum1-1,(ActualSrtDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.min(ActualSrtDate)));
		arrActEndRes.set(SubchildSeqNum1-1,(ActualEndDate.isEmpty()) ? "" : simpleDateFormat.format(Collections.max(ActualEndDate)));

		return null;
	}



	public static String getTaskIdForChild(String level, String taskId) throws SQLException {

		boolean flag=false;
		String taskID = taskId;
		String levl="";
		String deltaskID="";
		String selectQuery = "select * from archive_execution_info where seq_no=? and oppId=?;";
		PreparedStatement st=con.prepareStatement(selectQuery);
		st.setInt(1,seqNum+1);
		st.setString(2, Id);
		ResultSet rs=st.executeQuery();
		while(rs.next()) {

			levl=rs.getString("level");
			deltaskID=rs.getString("taskId");

		}
		System.out.println("NEXT LEV ::"+levl);
		System.out.println("QUERY ::"+selectQuery);
		String childVal1 = deltaskID.substring(0,1);
		String childVal2 = taskID.substring(0,1);
		if(!checkNextParent)
			if(level.equals("1")){
				checkNextParent = true;
			}
			else if(level.equals("2") && taskID.contains(".") && childVal1.equals(childVal2))
			{
				int suffixValue = Integer.parseInt(taskID.substring(taskID.lastIndexOf(".")+1));
				suffixValue--;

				int prefixValue = Integer.parseInt(taskID.substring(0,taskID.indexOf(".")));
				taskID = prefixValue+"."+((String.valueOf(suffixValue).length() == 1) ? suffixValue : ""+suffixValue);
			}

		if(level.equals("3") && taskID.contains(".") && childVal1.equals(childVal2) && !levl.equals("1"))
		{
			flag=true;
			String childValuetemp = taskID.substring(taskID.indexOf(".")+1);
			String childvalue = childValuetemp.split("\\.", 2)[0];
			int childValue = Integer.parseInt(childvalue);
			childValue--;
			String child = String.valueOf(childValue);
			taskID = taskID.substring(0, taskID.indexOf("."))+"." + child+"."+taskID.substring(taskID.lastIndexOf(".")+1);
			System.out.println("WELL COME P# Solutions");
		}

		return taskID;
	}

	public static String getTaskIdForParent(String level, String taskId) {

		String taskID = taskId;

		if(taskID.contains(".") && level.equals("2")) {
			int suffixValue = Integer.parseInt(taskID.substring(taskID.lastIndexOf(".")+1));

			int prefixValue = Integer.parseInt(taskID.substring(0,taskID.indexOf(".")));
			prefixValue--;
			taskID = prefixValue+"."+((String.valueOf(suffixValue).length() == 1) ? suffixValue : ""+suffixValue);
		}

		if(taskID.contains(".") && level.equals("3")) {
			int prefixValue = Integer.parseInt(taskID.substring(0, taskID.indexOf(".")));
			prefixValue--;
			String childValuetemp = taskID.substring(taskID.indexOf(".")+1);
			String childvalue = childValuetemp.split("\\.", 2)[0];
			taskID = prefixValue+"."+childvalue+"."+taskID.substring(taskID.lastIndexOf(".")+1);

		}


		else if(!taskID.contains(".") && level.equals("1")) {
			int value = Integer.parseInt(taskID);
			value--;
			taskID = String.valueOf(value);
		}

		return taskID;
	}

	public static String tasktypeflow(int seqNum, ArrayList<String> level) throws SQLException {

		String tasktype;
		count = 0;
		boolean checkParent = false;
		int selectedIndex = seqNum-1; 
		String nxtlevel="";
		indexFrom = 0;
		indexTo = 0;
		String selectQuery = "select * from archive_execution_info where oppId = ? and seq_no=? order by seq_no;";
		PreparedStatement st = con.prepareStatement(selectQuery);
		st.setString(1, Id);
		st.setInt(2, seqNum+1);
		ResultSet rs = st.executeQuery();
		while(rs.next())
		{
			nxtlevel=rs.getString("level");	
		}
		System.out.println("NEXTT LEVEL : : ----"+nxtlevel);
		if(level.get(seqNum-1).equals("3")) {
			tasktype="subchild";
			subchildflag=true;
			indexFrom = seqNum-1;
			indexTo = seqNum-1;
			count++;
		}

		else if(level.get(seqNum-1).equals("2"))
		{
			subchildflag=false;
			tasktype="child";
			if(nxtlevel.equals("1"))
			{
				indexFrom = seqNum-1;
				indexTo = seqNum-1;
				count++;
				System.out.println("IF LEVEL 2 CHILD");
			}
			else if(!nxtlevel.equals("1")) {
				System.out.println("ELSE IF LEVEL 2");
				indexFrom = seqNum-1;
				for(int i = selectedIndex+1; i<level.size(); i++ ) { 
					if(level.get(i).equals("2")) {
						indexTo	= i-1;
						count++;
						break;
					}
					else if(level.size()-1 == i) {
						indexTo	= i;
						count++;
						break;
					}
					count++;
				}

			}
		}
		else {
			tasktype="parent";
			checkParent = true;
			indexFrom = seqNum-1;
			for(int i = selectedIndex+1; i<level.size(); i++ ) { 
				if(level.get(i).equals("1")) {
					indexTo	= i-1;
					count++;
					break;
				}
				else if(level.size()-1 == i) {
					indexTo	= i;
					count++;
					break;
				}
				count++;
			}
		}

		return tasktype;
	}

	public static String getTaskIdForSubChild(String level, String taskId) throws SQLException {

		String taskID = taskId;
		System.out.println("T A S K I D : "+taskID);
		System.out.println("L E V E L : "+level);
		String h=String.valueOf(taskID.length());
		System.out.println("T A S K I D L E N G T H : "+h);
		String nxttaskid="";
		String nxtlvl="";
		String selectQuery = "select * from archive_execution_info where oppId = ? and seq_no=? order by seq_no;";
		PreparedStatement st = con.prepareStatement(selectQuery);
		st.setString(1, Id);
		st.setInt(2, seqNum+1);
		ResultSet rs = st.executeQuery();
		while(rs.next())
		{
			nxttaskid=rs.getString("taskId");	
			nxtlvl=rs.getString("level");
		}
		System.out.println("NEXT TASK ID : "+nxttaskid);
		System.out.println("CURRENT TASK ID : "+taskID);
		System.out.println("N E X T L E V E L : "+nxtlvl);

		String childVal = nxttaskid.substring(nxttaskid.indexOf(".")+1);
		String childVal1 = nxttaskid.substring(0,1);
		String childtaskid = childVal.split("\\.", 2)[0];
		System.out.println("C H I L D : "+childtaskid);
		System.out.println("FIRST CHILD CHAR"+childVal1);
		String curchildValuetemp = taskID.substring(taskID.indexOf(".")+1);
		String curchildValuetemp1 = taskID.substring(0,1);
		String curchildvalue = curchildValuetemp.split("\\.", 2)[0];
		System.out.println("C U R R E N T C H I L D : "+curchildvalue);
		System.out.println("CURRENT CHILD CHAR"+curchildValuetemp1);

		if(taskID.contains(".") && level.equals("3") && childtaskid.equals(curchildvalue) && childVal1.equals(curchildValuetemp1) && !nxtlvl.equals("2"))
		{
			int scval = Integer.parseInt(taskID.substring(taskID.lastIndexOf(".")+1));
			scval--;
			String childValuetemp = taskID.substring(taskID.indexOf(".")+1);
			String childvalue = childValuetemp.split("\\.", 2)[0]; 
			taskID = taskID.substring(0,taskID.indexOf("."))+"."+childvalue+"."+scval; 

		}

		return taskID;
	}

	public static String action(String level, String taskId) throws SQLException {
		String task=taskId;
		if(tasktypemethod.equals("parent")) {
			task=getTaskIdForParent(level,taskId);
		}
		else if(tasktypemethod.equals("child"))
		{
			task=getTaskIdForChild(level, taskId);
		}

		else if(tasktypemethod.equals("subchild"))
		{
			task=getTaskIdForSubChild(level, taskId);

		}

		return task;
	}


	protected void finalize() throws Throwable 
	{ 
		System.out.println("Db connection closed.");
		con.close();
	}

}

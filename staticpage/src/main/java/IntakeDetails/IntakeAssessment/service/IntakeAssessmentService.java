package IntakeDetails.IntakeAssessment.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.Common.DynamicFields;
import onboard.DBconnection;

public class IntakeAssessmentService extends DynamicFields {
	
	DBconnection dBconnection =null;
	
	Connection con = null;
	
	
	public IntakeAssessmentService() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
	}
	
	@Override
	public JsonArray DataRetrieve(String id)
	{
		JsonArray jsonArray  = new JsonArray();
		String SectionArray[] = {"APPLICATIONINFO","DATACHARACTERISTICS","COMPLIANCE","ARCHIVALCONSUMPTION","CONTRACTINFO"};
		try
		{
			 Arrays.stream(SectionArray) 
	            .forEach(Section->{
					try {
						jsonArray.add(new IntakeAssessSectionDataRetrieveService(Section,id).DataRetrieveTableInfo());
					} catch (ClassNotFoundException e1) {
						e1.printStackTrace();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}); 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception-------[error]-----"+e);
		}
        finally
        {
        	try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		return jsonArray;
	}
 
	@Override
	public JsonObject edit(String lavel_name, int sequence_number, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int seq_num, String id) {
		
	}

	@Override
	public JsonArray AddTemplateFields(int[] selected_index, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void OrderingColumnNameBySeq(String ID) {
		// TODO Auto-generated method stub
		
	}
    public JsonObject AddFeature(String ID, String label_name, String mandatory, String type, int NumberofInputfields,String options,String SectionName)
    {
    	JsonObject jsonobject = new JsonObject();
    	try
    	{
    		jsonobject.addProperty("LabelName", label_name);
            jsonobject.addProperty("ColumnName","AssessmentAddInfo");
            jsonobject.addProperty("Mandatory", mandatory);
            jsonobject.addProperty("Type", type);
            jsonobject.addProperty("Options",options);
            jsonobject.addProperty("section",SectionName);
    		IntakeAssessmentAddFeatureService add = new IntakeAssessmentAddFeatureService(dBconnection, con, SectionName,ID,label_name, mandatory, type, NumberofInputfields, options);
    		boolean labelcheck = add.CheckDuplicateAddLabel();
    		jsonobject.addProperty("LabelDuplicateCheck", labelcheck);
    		if(!labelcheck)
            {
             int seq_num =add.AddFieldsToSectionTable();
             jsonobject.addProperty("Seq_Num",seq_num);
            }
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return jsonobject;
    }
	@Override
	public int Add(String id, String label_name, String mandatory, String type, int NumberofInputfields,
			String options) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void Save(JsonArray jsonArr, String id) {
		// TODO Auto-generated method stub
		
	}
	public JsonArray ContractInfomationDataOperation(String id,String value)
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			IntakeAssessSectionDataRetrieveService DataRetrieveObj= new IntakeAssessSectionDataRetrieveService("CONTRACTINFO", id);
			if(value.equals("Third Party"))
			{
			  jsonArray = DataRetrieveObj.DataRetrieveForContractInformation(id);	
			}
			else
			{
				DataRetrieveObj.ContractInformationDelete();   
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception------[info]-----"+e);
		}
		return jsonArray;
	}
}

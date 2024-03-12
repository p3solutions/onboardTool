package IntakeDetails.Common;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import logger.System;

public abstract class DynamicFields {

	public abstract JsonObject edit(String lavel_name,int sequence_number,String id);
	
	public abstract void delete(int seq_num,String id);
	
	public abstract JsonArray AddTemplateFields(int[] selected_index,String id);
	
	public abstract void OrderingColumnNameBySeq(String ID);
	
	public abstract int Add(String id,String label_name, String mandatory, String type, int NumberofInputfields, String options );
	
	public abstract JsonArray DataRetrieve(String Id);
	
	public abstract void Save(JsonArray jsonArr,String id);

	public JsonArray AddTemplateFields(int[] selected_index, String id, String templateMandatory) {
		// TODO Auto-generated method stub
		return null;
	}

	public int Add(String id, String label_name, String mandatory, String umandatory, String type,
			int NumberofInputfields, String options) {
		// TODO Auto-generated method stub
		return 0;
	}

	public JsonArray AddTemplateFields(int[] selected_index, String id, String templateMandatory, String umandatory) {
		// TODO Auto-generated method stub
		return null;
	}
}

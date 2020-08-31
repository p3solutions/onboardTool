$('#Triagetypes').change(function()
	    {
	        var type=$('#Triagetypes').val();
	        //alert('Type--> '+type);
	        $(".TriageHideField").hide();
	        if(type=="Check box")
	        {
	            $('#TriageCheck').show();


	        }
	        else if(type=="Radio box")
	        {
	            $('#TriageRadio').show();

	        }
	        else if(type=="Dropdown")
	        {
	            $('#TriageDrop').show();
	        }
	        //alert('Triagetypes--->'+type);
	    });
	    $('#TriageRadioNumber').change(function(){
	        var count=$('#TriageRadioNumber').val();
	        var s="";
	        for(var i=1;i<=count;i++) {
	            s += '<label class="TriageHideField">Radiobox Label' + i + ':</label><input type="text" class="form-control TriageHideField TriageRadioClass" id="TriageRadioLabel'+i+'" name="TriageRadioLabel' + i + '"><br/>'; //Create one textbox as HTML
	        }
	        $('#TriageOptions').html(s);
	    });
	    $('#TriageNumber').change(function()
	    {
	        var count=$('#TriageNumber').val();
	        var s="";
	        for(var i = 1; i <=count; i++) {
	            s+= '<label class="TriageHideField">Checkbox Label'+i +':</label><input type="text" class="form-control TriageHideField TriageCheckClass" id="TriageCheckBoxLabel'+i+'" name="TriageCheckBoxLabel'+i+'"><br/>'; //Create one textbox as HTML
	        }
	        $('#TriageOptions').html(s);
	    });
	    $('#TriageDropNumber').change(function()
	    {
	        var drop=$('#TriageDropNumber').val();
	        /*console.log('drop---> '+drop);
	        alert('drop---> '+drop);*/
	        var s="";
	        for(var i=1;i<=drop;i++)
	        {
	            s+='<label class="TriageHideField">Options Label'+i +':</label><input type="text" class="form-control TriageHideField TriageDropClass" id="TriageDrodownpLabel'+i+'" name="TriageDrodownpLabel'+i+'"><br/>';
	        }
	        $('#TriageOptions').html(s);
	    });
	    
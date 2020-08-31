$('#AssessTypes').change(function()
	    {
	        var type=$('#AssessTypes').val();
	        //alert('Type--> '+type);
	        $(".AssessHideField").hide();
	        if(type=="Check box")
	        {
	            $('#AssessCheck').show();


	        }
	        else if(type=="Radio box")
	        {
	            $('#AssessRadio').show();

	        }
	        else if(type=="Dropdown")
	        {
	            $('#AssessDrop').show();
	        }
	        //alert('AssessTypes--->'+type);
	    });
	    $('#AssessRadioNumber').change(function(){
	        var count=$('#AssessRadioNumber').val();
	        var s="";
	        for(var i=1;i<=count;i++) {
	            s += '<label class="AssessHideField">Radiobox Label' + i + ':</label><input type="text" class="form-control AssessHideField AssessRadioClass" id="AssessRLabel'+i+'" name="AssessRLabel' + i + '"><br/>'; //Create one textbox as HTML
	        }
	        $('#AssessOptions').html(s);
	    });
	    $('#AssessCheckNumber').change(function()
	    {
	        var count=$('#AssessCheckNumber').val();
	        var s="";
	        for(var i = 1; i <=count; i++) {
	            s+= '<label class="AssessHideField">Checkbox Label'+i +':</label><input type="text" class="form-control AssessHideField AssessCheckClass" id="AssessCLabel'+i+'" name="AssessCLabel'+i+'"><br/>'; //Create one textbox as HTML
	        }
	        $('#AssessOptions').html(s);
	    });
	    $('#AssessDropNumber').change(function()
	    {
	        var drop=$('#AssessDropNumber').val();
	        /*console.log('drop---> '+drop);
	        alert('drop---> '+drop);*/
	        var s="";
	        for(var i=1;i<=drop;i++)
	        {
	            s+='<label class="AssessHideField">Options Label'+i +':</label><input type="text" class="form-control AssessHideField AssessDropClass" id="AssessDLabel'+i+'" name="AssessDLabel'+i+'"><br/>';
	        }
	        $('#AssessOptions').html(s);
	    });
	    
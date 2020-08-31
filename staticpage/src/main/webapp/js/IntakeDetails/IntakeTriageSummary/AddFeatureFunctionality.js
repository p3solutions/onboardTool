$('#TriSummTypes').change(function()
	    {
	        var type=$('#TriSummTypes').val();
	        //alert('Type--> '+type);
	        $(".hidefield").hide();
	        if(type=="Check box")
	        {
	            $('#TriSummCheck').show();


	        }
	        else if(type=="Radio box")
	        {
	            $('#TriSummRadio').show();

	        }
	        else if(type=="Dropdown")
	        {
	            $('#TriSummDrop').show();
	        }
	        //alert('TriSummTypes--->'+type);
	    });
	    $('#TriSummRadioNbr').change(function(){
	        var count=$('#TriSummRadioNbr').val();
	        var s="";
	        for(var i=1;i<=count;i++) {
	            s += '<label class="hidefield">Radiobox Label' + i + ':</label><input type="text" class="form-control hidefield TriSummRadioClass" id="TriSummRLabel'+i+'" name="TriSummRLabel' + i + '"><br/>'; //Create one textbox as HTML
	        }
	        $('#TriageSummaryOptions').html(s);
	    });
	    $('#TriSummNumber').change(function()
	    {
	        var count=$('#TriSummNumber').val();
	        var s="";
	        for(var i = 1; i <=count; i++) {
	            s+= '<label class="hidefield">Checkbox Label'+i +':</label><input type="text" class="form-control hidefield TriSummCheckClass" id="TriSummCLabel'+i+'" name="TriSummCLabel'+i+'"><br/>'; //Create one textbox as HTML
	        }
	        $('#TriageSummaryOptions').html(s);
	    });
	    $('#TriSummDropNbr').change(function()
	    {
	        var drop=$('#TriSummDropNbr').val();
	        /*console.log('drop---> '+drop);
	        alert('drop---> '+drop);*/
	        var s="";
	        for(var i=1;i<=drop;i++)
	        {
	            s+='<label class="hidefield">Options Label'+i +':</label><input type="text" class="form-control hidefield TriSummDropClass" id="TriSummDLabel'+i+'" name="TriSummDLabel'+i+'"><br/>';
	        }
	        $('#TriageSummaryOptions').html(s);
	    });
	    
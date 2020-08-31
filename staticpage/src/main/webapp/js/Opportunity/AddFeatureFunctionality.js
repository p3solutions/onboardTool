$('#types').change(function()
	    {
	        var type=$('#types').val();
	        //alert('Type--> '+type);
	        $(".hidefield").hide();
	        if(type=="Check box")
	        {
	            $('#check').show();


	        }
	        else if(type=="Radio box")
	        {
	            $('#rdo').show();

	        }
	        else if(type=="Dropdown")
	        {
	            $('#drop').show();
	        }
	        //alert('types--->'+type);
	    });
	    $('#radio_number').change(function(){
	        var count=$('#radio_number').val();
	        var s="";
	        for(var i=1;i<=count;i++) {
	            s += '<label class="hidefield">Radiobox Label' + i + ':</label><input type="text" class="form-control hidefield radioclass" id="Rlabel'+i+'" name="Rlabel' + i + '"><br/>'; //Create one textbox as HTML
	        }
	        $('#options').html(s);
	    });
	    $('#number').change(function()
	    {
	        var count=$('#number').val();
	        var s="";
	        for(var i = 1; i <=count; i++) {
	            s+= '<label class="hidefield">Checkbox Label'+i +':</label><input type="text" class="form-control hidefield checkclass" id="label'+i+'" name="label'+i+'"><br/>'; //Create one textbox as HTML
	        }
	        $('#options').html(s);
	    });
	    $('#drop_number').change(function()
	    {
	        var drop=$('#drop_number').val();
	        /*console.log('drop---> '+drop);
	        alert('drop---> '+drop);*/
	        var s="";
	        for(var i=1;i<=drop;i++)
	        {
	            s+='<label class="hidefield">Options Label'+i +':</label><input type="text" class="form-control hidefield dropclass" id="drp_label'+i+'" name="drp_label'+i+'"><br/>';
	        }
	        $('#options').html(s);
	    });
	    
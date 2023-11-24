$('#Legacytypes').change(function()
{
    var type=$('#Legacytypes').val();
    //alert('Type--> '+type);
    $(".Legacyhidefield").hide();
    if(type=="Check box")
    {
        $('#Legacycheck').show();


    }
    else if(type=="Radio box")
    {
        $('#Legacyradio').show();

    }
    else if(type=="Dropdown")
    {
        $('#Legacydrop').show();
    }

});
$('#Legacyradio_number').change(function(){
    var count=$('#Legacyradio_number').val();
    var s="";
    for(var i=1;i<=count;i++) {
        s += '<label class="Legacyhidefield">Radiobox Label' + i + ':</label><input type="text" class="form-control Legacyhidefield LegacyRadioClass" id="LegacyRadioLabel'+i+'" name="LegacyRadioLabel' + i + '"><br/>';
    }
    $('#Legacyoptions').html(s);
});
$('#Legacycheck_number').change(function()
{
    var count=$('#Legacycheck_number').val();
    var s="";
    for(var i = 1; i <=count; i++) {
        s+= '<label class="Legacyhidefield">Checkbox Label'+i +':</label><input type="text" class="form-control Legacyhidefield LegacyCheckClass" id="LegacyCheckBoxLabel'+i+'" name="LegacyCheckBoxLabel'+i+'"><br/>';
    }
    $('#Legacyoptions').html(s);
});
$('#Legacydrop_number').change(function()
{
    var drop=$('#Legacydrop_number').val();
    var s="";
    for(var i=1;i<=drop;i++)
    {
        s+='<label class="Legacyhidefield">Options Label'+i +':</label><input type="text" class="form-control Legacyhidefield LegacyDropClass" id="LegacyDropdownLabel'+i+'" name="LegacyDropdownLabel'+i+'"><br/>';
    }
    $('#Legacyoptions').html(s);
});

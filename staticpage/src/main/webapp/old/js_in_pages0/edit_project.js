 
    $(function() {
    $( "#Plandate" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Enddate" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Hyperdate" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Execdate" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Intdate" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    
    $(function() {
    $( "#Startdate" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    
    function checkk()
    {
     
    document.getElementById('pid').readOnly = true;
    document.getElementById('projectname').readOnly = true;
    document.getElementById('descr').readOnly = true;
    document.getElementById('appno').readOnly = true;
    document.getElementById('Startdate').readOnly = true;
    document.getElementById('Intdate').readOnly = true;
    document.getElementById('Plandate').readOnly = true;
    document.getElementById('Execdate').readOnly = true;
    document.getElementById('Hyperdate').readOnly = true;
    document.getElementById('Enddate').readOnly = true;
    }
    

    
    
   $(function () {
     // 6 create an instance when the DOM is ready
     $('#jstree').jstree();
     // 7 bind to events triggered on the tree
     $('#jstree').on("changed.jstree", function (e, data) {
       console.log(data.selected);
     });
     // 8 interact with the tree - either way is OK
     $('button').on('click', function () {
       $('#jstree').jstree(true).select_node('child_node_1');
       $('#jstree').jstree('select_node', 'child_node_1');
       $.jstree.reference('#jstree').select_node('child_node_1');
     });
   });
 
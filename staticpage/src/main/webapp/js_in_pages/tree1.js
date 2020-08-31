
    $(function() {
    $( "#RO_DATE" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#SME_DATE" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
 

    function kk2()
  {
      document.getElementById("complexity").disabled  = false;
      document.getElementById("est_archive").disabled  = false;
      document.getElementById("est_scrn").disabled  = false;
      document.getElementById("est_db_size").disabled  = false;
      document.getElementById("est_hrs").disabled  = false;
      document.getElementById("est_cst").disabled  = false;
      document.getElementById("ttl_IA_cst").disabled  = false;
      document.getElementById("ttl_infra_cst").disabled  = false;
      document.getElementById("ttl_IA_prdct_cst").disabled  = false;
      document.getElementById("ttl").disabled  = false;

  }


  function checkk()
  {
  document.getElementById('prj_name').readOnly = true;
  document.getElementById('IA_lic_cst').readOnly = true;
  document.getElementById('IA_maint_cst').readOnly = true;
  document.getElementById('Infrastrct_cst').readOnly = true;
  document.getElementById('strg_est').readOnly = true;
  document.getElementById('lab_cst').readOnly = true;
  document.getElementById('proj_name').readOnly = true;
  document.getElementById('data_size').disabled = true;
  document.getElementById('curnt_users').disabled = true;
  document.getElementById('complexity').disabled = true;
  document.getElementById('RO_DATE').readOnly = true;
  document.getElementById('SME_DATE').readOnly = true;
  document.getElementById('est_archive').readOnly = true;
  document.getElementById('est_scrn').readOnly = true;
  document.getElementById('est_db_size').readOnly = true;
  document.getElementById('est_hrs').readOnly = true;
  document.getElementById('est_cst').readOnly = true;
  document.getElementById('ttl_IA_cst').readOnly = true;
  document.getElementById('ttl_infra_cst').readOnly = true;
  document.getElementById('ttl_IA_prdct_cst').readOnly = true;
  document.getElementById('ttl').readOnly = true;
  document.getElementById('ttl_cst_fr_app').readOnly = true;
  document.getElementById('add_cst_fr_contigency').readOnly = true;
  document.getElementById('add_cst').readOnly = true;
  document.getElementById('IA_app_sprt_cst').readOnly = true;
  document.getElementById('est_archive_cst').readOnly = true;
   
  }
  /*
  function switchColors0()
  {
   
  links=document.getElementsByTagName("li") ;  
  var element=document.getElementById("xxx");
  for (var i = 0 ; i < links.length ; i ++)  
  links.item(i).style.backgroundColor = '#178ef1' ; 
  element.style.borderRadius="5px";
  element.style.marginRight = "70px";
  element.style.boxSizing = "content-box";
  element.style.borderColor = "#178ef1";
  element.style.background="#178ef1"; 
  var list = document.getElementsByTagName("OL")[0];
  var x=list.getElementsByTagName("LI");
  for (var i = 0 ; i < x.length ; i ++)  
  x.item(i).style.backgroundColor = '#178ef1' ; 
   
  }

  function switchColors()  
  {  
  links=document.getElementsByTagName("li") ;  
  var element=document.getElementById("xxz");
  for (var i = 0 ; i < links.length ; i ++)  
  links.item(i).style.backgroundColor = '#178ef1' ; 
  element.style.borderRadius="5px";
  element.style.marginRight = "85px";
  element.style.boxSizing = "content-box";
  element.style.borderColor = "#178ef1";
  element.style.background="#178ef1";
  var list = document.getElementsByTagName("UL")[0];
  var x=list.getElementsByTagName("LI");
  for (var i = 0 ; i < x.length ; i ++)  
  x.item(i).style.backgroundColor = '#178ef1' ; 


  } 
 
  function switchColors1()  
  {  
  links=document.getElementsByTagName("li") ;  
  var element=document.getElementById("xxy");
  for (var i = 0 ; i < links.length ; i ++)  
  links.item(i).style.backgroundColor = '#178ef1' ; 
  element.style.borderRadius="5px";
  element.style.marginRight = "150px";
  element.style.boxSizing = "content-box";
  element.style.borderColor = "#178ef1";
  element.style.background="#178ef1";
  var list = document.getElementsByTagName("UL")[0];
  var x=list.getElementsByTagName("LI");
  for (var i = 0 ; i < x.length ; i ++)  
  x.item(i).style.backgroundColor = '#178ef1' ; 


  } 
*/
 
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
  


   
  
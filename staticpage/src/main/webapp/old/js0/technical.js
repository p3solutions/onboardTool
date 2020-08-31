  
    
    $(function() {
        $( "#integname" ).datepicker({
            format: "dd/mm/yyyy",
            autoclose: true
        });
    });
    
        $(document).ready(function () {
            // Create jqxTree
            $('#jqxTree').jqxTree({ height: '650px', width: '0px' });
            $('#jqxTree').css('visibility', 'visible');
            var contextMenu = $("#jqxMenu").jqxMenu({ width: '120px',  height: '56px', autoOpenPopup: false, mode: 'popup' });
            var clickedItem = null;
            
            var attachContextMenu = function () {
                // open the context menu when the user presses the mouse right button.
                $("#jqxTree li").on('mousedown', function (event) {
                    var target = $(event.target).parents('li:first')[0];
                    var rightClick = isRightClick(event);
                    if (rightClick && target != null) {
                        $("#jqxTree").jqxTree('selectItem', target);
                        var scrollTop = $(window).scrollTop();
                        var scrollLeft = $(window).scrollLeft();
                        contextMenu.jqxMenu('open', parseInt(event.clientX) + 5 + scrollLeft, parseInt(event.clientY) + 5 + scrollTop);
                        return false;
                    }
                });
            }
            attachContextMenu();
            $("#jqxMenu").on('itemclick', function (event) {
                var item = $.trim($(event.args).text());
                switch (item) {
                    case "Add Item":
                        var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                        if (selectedItem != null) {
                            $('#jqxTree').jqxTree('addTo', { label: 'Item' }, selectedItem.element);
                            attachContextMenu();
                        }
                        break;
                    case "Remove Item":
                        var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                        if (selectedItem != null) {
                            $('#jqxTree').jqxTree('removeItem', selectedItem.element);
                            attachContextMenu();
                        }
                        break;
                }
            });
            // disable the default browser's context menu.
            $(document).on('contextmenu', function (e) {
                if ($(e.target).parents('.jqx-tree').length > 0) {
                    return false;
                }
                return true;
            });
            function isRightClick(event) {
                var rightclick;
                if (!event) var event = window.event;
                if (event.which) rightclick = (event.which == 3);
                else if (event.button) rightclick = (event.button == 2);
                return rightclick;
            }
        });
   
     




 
   function validateform1()
   {
   var location = document.loginForm.dataloc.value
var server = document.loginForm.servername.value
var prod = document.loginForm.prodinstance.value
    var instance = document.loginForm.prodinstanceloc.value
var reasonforaccess = document.loginForm.reasonfor.value
var database = document.loginForm.dbsize.value
var number = document.loginForm.nooftable.value
var record = document.loginForm.noofrec.value
var decommision = document.loginForm.integname.value
 

if(location == "" || server  ==  "" || prod == "" || instance == "" || reasonforaccess == "" || database == ""|| number == "" || record =="" ||  decommision == "" )
 
 
 
{
alert("Please Fill the Mandatory Field");
  }
     else{
 
toggle1();
}
   }
  
function toggle2()
{

var f=document.form;
f.method="post";
f.action="Technical"
f.submit();
}




function switchColors()  
{  
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("b");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = '#3276B1' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#3276B1";
element.style.background="#3276B1";
var list = document.getElementsByTagName("UL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = '#3276B1' ; 


} 

function switchColors1()  
{  
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("c");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = '#3276B1' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#3276B1";
element.style.background="#3276B1";
var list = document.getElementsByTagName("UL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = '#3276B1' ; 


} 


function validate() {
 
var data = document.loginForm.dataloc.value
var name = document.loginForm.servername.value
var prod = document.loginForm.prodinstance.value
var location = document.loginForm.prodinstanceloc.value
var reason = document.loginForm.reasonfor.value
var size = document.loginForm.dbsize.value
var table = document.loginForm.nooftable.value
var record = document.loginForm.noofrec.value
var decommision = document.loginForm.integname.value

if(data == "" || name == "" || prod == "" ||location == "" || reason == ""||size == "" || record == "" || decommision == "" )
{
alert("Please Fill the Mandatory Field");
  }
     else
     {
 
toggle1();
}
 
 
}

function toggle1() {
var ele = document.getElementById("collapse3");
 
if(ele.style.display == "block") {
    ele.style.display = "none";
text.innerHTML = "show";
 
  }
else {
ele.style.display = "block";
text.innerHTML = "hide";
}
} 

function switchColors0()  
{  
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("a");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = '#3276B1' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#3276B1";
element.style.background="#3276B1";
var list = document.getElementsByTagName("UL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = '#3276B1' ; 


} 

function validateform() {
 
var dataType = document.loginForm.datatype.value
var processname = document.loginForm.pname.value
var needarch = document.loginForm.archneed.value
var format1 = document.loginForm.format.value
   var multi = document.loginForm.mlang.value
   var local = document.loginForm.loclang.value

 if(((document.loginForm.datatype[0].checked == false) && (document.loginForm.datatype[1].checked == false) && (document.loginForm.datatype[2].checked == false))|| processname=="" || needarch =="" || format1 == "" ||(document.loginForm.mlang.checked == false) || (document.loginForm.loclang.checked == false))  
{
alert("Please Fill the Mandatory Field");
  }
     else{
 
toggle();
}
 
 
}

function toggle() {
var ele = document.getElementById("collapse2");
 
if(ele.style.display == "block") {
    ele.style.display = "none";
text.innerHTML = "show";
  }
else {
ele.style.display = "block";
text.innerHTML = "hide";
}
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


function checkk()
{



document.getElementById('checkbox').disabled = true;
document.getElementById('checkbox1').disabled = true;
document.getElementById('checkbox2').disabled = true;
document.getElementById('pname').readOnly = true;
document.getElementById('reason_for_access').disabled = true;
document.getElementById('format').readOnly = true;
document.getElementById('language').disabled = true;
document.getElementById('archive').disabled = true;
document.getElementById('range').disabled = true;
document.getElementById('Documentation').disabled = true;
document.getElementById('userdoc').readOnly = true;
document.getElementById('techdoc').readOnly = true;
document.getElementById('traindoc').readOnly = true;
document.getElementById('supportdoc').readOnly = true;
document.getElementById('datadic').readOnly = true;
document.getElementById('testcasedoc').readOnly = true;
document.getElementById('testrec').readOnly = true;
document.getElementById('designspec').readOnly = true;
document.getElementById('reqSpeci').readOnly = true;
document.getElementById('validityplan').readOnly = true;
document.getElementById('checkbox3').disabled = true;
document.getElementById('servername').readOnly = true;
document.getElementById('prodinstance').readOnly = true;
document.getElementById('prodinstanceloc').readOnly = true;
document.getElementById('infraengage').readOnly = true;
document.getElementById('checkbox4').disabled = true;
document.getElementById('reason_for_access1').disabled = true;
document.getElementById('retenduration').readOnly = true;
document.getElementById('clientapp').readOnly = true;
document.getElementById('extcustfacing').readOnly = true;
document.getElementById('url').readOnly = true;
document.getElementById('dbsize').readOnly = true;
document.getElementById('nooftable').readOnly = true;
document.getElementById('noofrec').readOnly = true;
document.getElementById('xmlcount').readOnly = true;
document.getElementById('anyvpn').readOnly = true;
document.getElementById('checkbox5').disabled = true;
document.getElementById('checkbox6').disabled = true;
document.getElementById('appintegrate').readOnly = true;
document.getElementById('integname').readOnly = true;
document.getElementById('btt').disabled = true;
document.getElementById('btn_new').disabled = true;
document.getElementById('file').disabled = true;
document.getElementById('file1').disabled = true;
document.getElementById('file2').disabled = true;
document.getElementById('file3').disabled = true;
}

links=document.getElementsByTagName("li") ;  
var element=document.getElementById("a");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = '#3276B1' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#3276B1";
element.style.background="#3276B1";
var list = document.getElementsByTagName("UL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = '#3276B1' ; 




if(document.getElementById('pwqej').value=="RX" || document.getElementById('pwqej').value=="R")

checkk();


     
function toggle2()
{

var f=document.form;
f.method="post";
f.action="Technical"
f.submit();
}

/*
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


} */


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
/*function switchColors0()  
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


} */
 
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
//document.getElementById('btt2').disabled = true;
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
//document.getElementById('btn_new3').disabled = true;
}

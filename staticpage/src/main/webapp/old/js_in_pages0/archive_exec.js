
	  function getID(lev,pln_srt,pln_end,act_srt,status,pln_hrs,act_hrs,progressbar,actual_enddate)
	  {
		 // window.alert(pln_srt+" "+pln_end+" "+act_srt+" "+status.id+" "+pln_hrs.id+" "+act_hrs.id+" "+progressbar.id);
		 var startDate =pln_srt;
		  var endDate =pln_end;
		  var actual_startdate =act_srt;
		  var percentage;
		  var date_count=0;

		  if (pln_srt!="" && pln_end!="" && act_srt!= "") {
		  var minDate = new Date(convertStringToDate(pln_srt));
		  var today = new Date();
		  var maxDate = new Date(convertStringToDate(pln_end));
		  var actual_minDate = new Date(convertStringToDate(act_srt));
		  var nbPastDays = Math.floor((today.getTime() - actual_minDate.getTime()) / 86400000);

		  var actual_Hours= (nbPastDays*24)/3;

		  var total_days = (minDate-maxDate)-86400000;

		  var total_hours =(Math.round(Math.abs(total_days/(60*60*1000))))/3;

		  var percent = (actual_Hours/total_hours) * 100;

		  //alert("minDate "+minDate);
		  //alert("maxDate "+maxDate);
		  percentage=100;
		  console.log("actual_Hours : "+actual_Hours);
		  console.log("total_hours : "+total_hours);
		  var first,last;
		  if(lev!=1){
		  document.getElementById(pln_hrs.id).value=total_hours;
		  document.getElementById(act_hrs.id).value=actual_Hours;
		  }
		/*  if(seq_no>initiate_seqno)
			  {
			  if(seq_no>plan_seqno)
				  {
				  if(seq_no>execute_seqno)
					  {
					  if(seq_no>hypercare_seqno)
						  {
						  first=hypercare_seqno;
						  last=hypercare_seqno+7;
						  }
					  else
						  {
						  first=execute_seqno;
						  last=hypercare_seqno;
						  }
					  }
				  else
				  {
				  first=plan_seqno;
				  last=execute_seqno;
				  }
				  }
			  else
			  {
			  first=initiate_seqno;
			  last=plan_seqno;
			  }
			  }
		  window.alert("first "+first+" last "+last);
		  for(var i=first;i<last-1;i++)
			  {
			  var q=document.getElementById("pln_srt_date"+first).value;
			  if(q!="")
				  date_count++;
			  }
		  window.alert(date_count+" "+(last-1-first));
		  
		  
		  if(date_count==(last-1-first)){
			  percent=100;
			  $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
		  }*/
		   if (percent < 0 ) {
		  percent=0;
		  $('#'+progressbar.id).reportprogress(percent);
		  } 
		  else if(percent>100)
		  {
			  percent=100;
			  $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
		  }  
		  else if (percent < 35) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'red'});
		  }
		  else if (percent > 35) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'yellow'});
		  }
		               else if (percent < 75) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'yellow'});
		  }
		               else if (percent >76 ) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'green'});
		  }
		  }
	
		  }
	
	  function getDetID(total_hours,actual_Hours,progressbar,status,actual_enddate,datecount)
	  {
		  if(datecount=="True")
			  {
			  percent=100;
			  $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
			  }
		  else{
		  var percent = (actual_Hours.value/total_hours.value) * 100; 
		  percentage=100;
		   if (percent < 0 ) {
			  percent=0;
			  $('#'+progressbar.id).reportprogress(percent);
			  } 
			  else if(percent>100)
			  {
				  percent=100;
				  $('#'+progressbar.id).reportprogress(percent);
				  $('#'+status.id).css({background:'green'});
			  }  
			  else if (percent < 35) 
			  { $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'red'});
			  }
			  else if (percent > 35) 
			  { $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'yellow'});
			  }
			               else if (percent < 75) 
			  { $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'yellow'});
			  }
			               else if (percent >76 ) 
			  { $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
			  }
		  }
		  
			  }

	  function sub(x,y,z,w)
	  {
		  var f=document.loginForm;
		    f.method="post";
		    f.action='archive_exec?s='+x+'&l='+y+'&r='+z+'&m='+w;
		    f.submit();
	  	}
	  function update()
	  {
		  
		  var f=document.loginForm;
		    f.method="post";
		    f.action='archivesummary.jsp';
		    f.submit(); 
		 // document.loginForm.action = "update_view";
	  	 // document.loginForm.submit();   
	  // document.Form1.target = "_blank";    // Open in a new window
	  //document.loginForm.submit(); 
		  
	  }
	  
	  function call_fun(name,a,b,c,d,e,g,h,i,j,k,l)
	  {
		  var comments=document.getElementById("cmnts"+(a-1)).value;
		 var f=document.loginForm;
		    f.method="post";
		    f.action='date_update?name='+name+'&sequence_no='+a+'&plan_start='+b+'&plan_end='+c+'&actual_start='+d+'&actual_hrs='+g+'&plan_hrs='+e+'&actual_end='+h+'&initiate_seqno='+i+'&plan_seqno='+j+'&execute_seqno='+k+'&hypercare_seqno='+l+"'&cmnts="+comments;
		    f.submit();  
	  }
	function remove(x)
	{
		var f=document.loginForm;
	    f.method="post";
	    f.action='remove?s='+x;
	    f.submit();
	}


	function checkk()
	{
	 	   for(var i=0;i<1000;i++){
	 	  document.getElementsByName("name"+i)[0].disabled=true;
	 	  document.getElementsByName("mem_ass"+i)[0].disabled=true;
			  document.getElementsByName("act_srt_date"+i)[0].disabled=true;
			  document.getElementsByName("act_end_date"+i)[0].disabled=true;
			  document.getElementsByName("pln_srt_date"+i)[0].disabled=true;
			  document.getElementsByName("pln_end_date"+i)[0].disabled=true;
			  document.getElementsByName("hrs"+i)[0].disabled=true;
	 	   }
	 	
	}
	function init_disable()
	{
	 	   for(var i=6;i<1000;i++){
	 	  document.getElementsByName("name"+i)[0].disabled=true;
	 	  document.getElementsByName("mem_ass"+i)[0].disabled=true;
			  document.getElementsByName("act_srt_date"+i)[0].disabled=true;
			  document.getElementsByName("act_end_date"+i)[0].disabled=true;
			  document.getElementsByName("pln_srt_date"+i)[0].disabled=true;
			  document.getElementsByName("pln_end_date"+i)[0].disabled=true;
			  document.getElementsByName("hrs"+i)[0].disabled=true;
	 	   }
	 	
	}

    function check_previous(seq_no,level,previous_level,initiate_seqno,plan_seqno,execute_seqno,hypercare_seqno,number)
    {
    	var task_number=[initiate_seqno,plan_seqno,execute_seqno,hypercare_seqno];
    	var tasks=[];
    	var count1=[];
    	var x,y,z,index,count=0,cnt=1;
//    	window.alert(seq_no+"   "+true_cnt);
    //window.alert(initiate_seqno+" "+plan_seqno+" "+execute_seqno+" "+hypercare_seqno);
     if(level==previous_level)
    		{
    	 x=document.getElementById("pln_srt_date"+(seq_no-2)).value;
    	 y=document.getElementById("pln_end_date"+(seq_no-2)).value;
    	 z=document.getElementById("act_srt_date"+(seq_no-2)).value;
    	 w=document.getElementById("act_end_date"+(seq_no-2)).value;
    	if(x=="" && y=="" && z==""){
    		cnt=0;
    		window.alert("Please fill the above text field");
    	}
    		}
     else
    	 {
    	 for(var i=0;i<4;i++){
    		if(parseInt(task_number[i])<parseInt(seq_no))
    			{
    			tasks.push(task_number[i]);
    			}
    		else
    			{
    			continue;
    			}
    	  }
    	 for(var i=tasks.length-1;i>=0;i--)
    		 {
    		    count++;
    		    if (count<=2)
    		    	{
    		    	 x=document.getElementById("pln_srt_date"+(tasks[i]-1)).value;
    		    	 y=document.getElementById("pln_end_date"+(tasks[i]-1)).value;
    		    	 z=document.getElementById("act_srt_date"+(tasks[i]-1)).value;
    		    	if(x=="" && y=="" && z==""){
    		    		count1.push("FALSE");
    		    		continue;
    		    		
    		    	}
    		    	else
    		    		{
    		    		count1.push("TRUE");
    		    		continue;
    		    		}
    		    	}
    		    else
    		    	{
    		    	break;
    		    	}
    		 }
    	 
    	 
    	 }
     if(count1[0]=="FALSE" && count1[1]=="FALSE"){
    	 window.alert("please fill the above fields");
    	 cnt=0;
     }
     if(cnt==1){
    	$( "#pln_srt_date"+(seq_no-1)).datepicker({
            format: "mm/dd/yyyy",
            autoclose: true
        });
     $( "#pln_end_date"+(seq_no-1)).datepicker({
            format: "mm/dd/yyyy",
            autoclose: true
        });
     $( "#act_srt_date"+(seq_no-1)).datepicker({
            format: "mm/dd/yyyy",
            autoclose: true
        });
     $( "#act_end_date"+(seq_no-1)).datepicker({
            format: "mm/dd/yyyy",
            autoclose: true
        });
     if(number==1)
     $( "#pln_srt_date"+(seq_no-1)).datepicker('show');
     if(number==2)
    $( "#pln_end_date"+(seq_no-1)).datepicker('show');
     if(number==3)
     $( "#act_srt_date"+(seq_no-1)).datepicker('show');
     if(number==4)
     $( "#act_end_date"+(seq_no-1)).datepicker('show');
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
 



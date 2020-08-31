
function getID(lev, pln_srt, pln_end, act_srt, status, pln_hrs, act_hrs, progressbar, actual_enddate) {
	var actual_Hours = "";
	var planned_Hours = "";
	var str_array = [];
	//alert(" "+pln_srt+" "+pln_end+" "+act_srt);
	if (pln_srt == "" || pln_end == "" || act_srt == "" || actual_enddate == "") {

		if (pln_srt == "" || pln_end == "") {
			document.getElementById(pln_hrs.id).value = "";
			if (pln_srt == "" && act_srt != "" && actual_enddate != "" || pln_end == "" && act_srt != "" && actual_enddate != "") {
				console.log("sample");

				$.ajax({
					url: "Countactual",
					type: 'post',
					data: {fromD: act_srt},
					dataType: "text",
					success: function (data) {
						console.log("data", data);
						var actualhrs=data*8;
						//alert(actualhrs);
						/*var sample=$("#act_hrs").id.val(actualhrs);
                        alert("testing",sample);
                        alert($("#act_hrs").val("actualhrs"));*/
						//$('#act_hrs').val(actualhrs);
						//$('#act_hrs').val(actualhrs);
						document.getElementById(act_hrs.id).value=actualhrs;
					},
					error: function (e) { //A callback function to be executed when the request fails.
						console.log(e);
					}
				});
			}

		}
		if (act_srt == "" || actual_enddate == "") {
			document.getElementById(act_hrs.id).value = "";
			//alert("plan");
			if(act_srt==""&&pln_srt!=""&&pln_end!=""||actual_enddate==""&&pln_srt!=""&&pln_end!="") {
				//alert("plan1");
				$.ajax({
					url: "Countplan",
					type: 'post',
					data: {fromD: pln_srt, toD: pln_end},
					dataType: "text",
					success: function (data) {
						console.log("data", data);
						var planhrs = data * 8;
						//alert(planhrs);
						document.getElementById(pln_hrs.id).value = planhrs;
					},
					error: function (e) { //A callback function to be executed when the request fails.
						console.log(e);
					}
				});
			}
		}
	} else if (pln_srt != "" && pln_end != "" && act_srt != ""&&actual_enddate!="") {
		$.ajax({

			url: 'Count',
			type: 'POST',
			data: {field1: pln_srt, field2: pln_end, field3: act_srt ,field4:actual_enddate},
			dataType: "text",
			success: function (data) {
				str_array = " ";
				str_array = data.split(',');
				planned_Hours = parseInt(str_array[0]) * 8;
				actual_Hours = parseInt(str_array[1]) * 8;
				console.log("SUCCESS : ", data);

				var percent = (actual_Hours / planned_Hours) * 100;
				if (lev != 1) {
					document.getElementById(pln_hrs.id).value = planned_Hours;
					document.getElementById(act_hrs.id).value = actual_Hours;
				}

				if (percent < 0) {
					percent = 0;
					$('#' + progressbar.id).reportprogress(percent);
				} else if (percent > 100) {

					percent = 100;
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'green'});
				} else if (percent < 35) {
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'red'});
				} else if (percent > 35) {
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'yellow'});
				} else if (percent < 75) {
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'yellow'});
				} else if (percent > 76) {
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'green'});
				}


				var first, last;

				if (seq_no > initiate_seqno) {
					if (seq_no > plan_seqno) {
						if (seq_no > execute_seqno) {
							if (seq_no > hypercare_seqno) {
								first = hypercare_seqno;
								last = hypercare_seqno + 7;
							} else {
								first = execute_seqno;
								last = hypercare_seqno;
							}
						} else {
							first = plan_seqno;
							last = execute_seqno;
						}
					} else {
						first = initiate_seqno;
						last = plan_seqno;
					}
				}
				// window.alert("first "+first+" last "+last);
				for (var i = first; i < last - 1; i++) {
					var q = document.getElementById("pln_srt_date" + first).value;
					if (q != "")
						date_count++;
				}
				// window.alert(date_count+" "+(last-1-first));


				if (date_count == (last - 1 - first)) {
					percent = 100;
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'green'});
				}
				if (percent < 0) {
					percent = 0;
					$('#' + progressbar.id).reportprogress(percent);
				} else if (percent > 100) {
					percent = 100;
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'green'});
				} else if (percent < 35) {
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'red'});
				} else if (percent > 35) {
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'yellow'});
				} else if (percent < 75) {
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'yellow'});
				} else if (percent > 76) {
					$('#' + progressbar.id).reportprogress(percent);
					$('#' + status.id).css({background: 'green'});
				}
			},
			error: function (e) {
				//salert("err");
				console.log("ERROR : ", e);

			}
		});
		//  }

		// window.alert(pln_srt+" "+pln_end+" "+act_srt+" "+status.id+" "+pln_hrs.id+" "+act_hrs.id+" "+progressbar.id);
		/* var startDate =pln_srt;
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

          percentage=100;
          console.log("actual_Hours : "+actual_Hours);
          console.log("total_hours : "+total_hours);*/

	}
}

function getDetID(total_hours, actual_Hours, progressbar, status, actual_enddate,comments,i,projectname,name) {
	//console.log("testing"+i+" projectname "+projectname);
	//console.log("progressbar "+progressbar.id+"status "+status.id);
    if (name=="Requirements"||name=="Build and Test"||name=="Ideation and Initiate"||name=="Plan"||name=="Execute"||name=="Closure") {
        console.log('name : ', name);
        var s = i;
        $.ajax({
            url: "Cal_Percentage",
            type: 'POST',
            data: {sequence: i, ProjectName: projectname},
            dataType: "json",
            success: function (data) {
            	//data=JSON.parse(data)["value"];
				//console.log('pecentage->',data.value);
				data=data.value;
            	var percent = parseInt(data);
                //console.log("percentage---->", percent);
                var progressbar_color="progress-bar progress-bar-success  progress-bar-striped active";
				if(percent<35)
				{
					progressbar_color= "progress-bar progress-bar-danger progress-bar-striped active";
				}
				else if(percent<65)
				{
					progressbar_color= "progress-bar progress-bar-warning progress-bar-striped";
				}
				$('#parent_progressbar'+i).html("<div class='"+progressbar_color+"' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+percent+"%;height: 20px'>"+percent+"% </div>");
				$('#parent_progressbar'+i).addClass("progress");
                if (percent <= 35) {
                    $('#' + status.id).css({background: 'red'});
                } else if (percent > 35 && percent <= 75) {
                    $('#' + status.id).css({background: 'yellow'});
                } else if (percent > 75) {
                    $('#' + status.id).css({background: 'green'});
                }
                },
            error: function (e) { //A callback function to be executed when the request fails.
                console.log(e);
            }
        });
    }
}

function sub(x, y, z, w) {
	var f = document.loginForm;
	f.method = "post";
	f.action = 'archive_exec?s=' + x + '&l=' + y + '&r=' + z + '&m=' + w;
	f.submit();
}

function update() {

	var f = document.loginForm;
	f.method = "post";
	f.action = 'archivesummary.jsp';
	f.submit();
	// document.loginForm.action = "update_view";
	// document.loginForm.submit();
	// document.Form1.target = "_blank";    // Open in a new window
	//document.loginForm.submit();

}

function call_fun(mem_ass, name, a, b, c, d, e, g, h, i, j, k, l,project_name) {
	//alert(l);
	var comments = document.getElementById("cmnts" + (a - 1)).value;
	var f = document.loginForm;
	f.method = "post";
	//alert(l);
	f.action = 'date_update?mem_ass=' + mem_ass + '&name=' + name + '&sequence_no=' + a + '&plan_start=' + b + '&plan_end=' + c + '&actual_start=' + d + '&actual_hrs=' + g + '&plan_hrs=' + e + '&actual_end=' + h + '&initiate_seqno=' + i + '&plan_seqno=' + j + '&execute_seqno=' + k + '&hypercare_seqno=' + l + "&cmnts=" + comments + "&ProjectName=" +project_name ;
	// f.action='date_update?name='+name+'&sequence_no='+a+'&plan_start='+b+'&plan_end='+c+'&actual_start='+d+'&actual_hrs='+g+'&plan_hrs='+e+'&actual_end='+h+'&initiate_seqno='+i+'&plan_seqno='+j+'&execute_seqno='+k+'&hypercare_seqno='+l+"'&cmnts="+comments;
	f.submit();
}
/*function call_fun1(mem_ass) {
	//alert(l);
	var f = document.loginForm;
	f.method = "post";
	//alert(l);
	f.action = 'Cal_Percentage?mem_ass=' + mem_ass;
	// f.action='date_update?name='+name+'&sequence_no='+a+'&plan_start='+b+'&plan_end='+c+'&actual_start='+d+'&actual_hrs='+g+'&plan_hrs='+e+'&actual_end='+h+'&initiate_seqno='+i+'&plan_seqno='+j+'&execute_seqno='+k+'&hypercare_seqno='+l+"'&cmnts="+comments;
	f.submit();
}*/

function remove(x) {
	var f = document.loginForm;
	f.method = "post";
	f.action = 'remove?s=' + x;
	f.submit();
}


function checkk() {
	for (var i = 0; i < 1000; i++) {
		document.getElementsByName("name" + i)[0].disabled = true;
		document.getElementsByName("mem_ass" + i)[0].disabled = true;
		document.getElementsByName("act_srt_date" + i)[0].disabled = true;
		document.getElementsByName("act_end_date" + i)[0].disabled = true;
		document.getElementsByName("pln_srt_date" + i)[0].disabled = true;
		document.getElementsByName("pln_end_date" + i)[0].disabled = true;
		document.getElementsByName("hrs" + i)[0].disabled = true;
	}

}

function init_disable() {
	for (var i = 6; i < 1000; i++) {
		document.getElementsByName("name" + i)[0].disabled = true;
		document.getElementsByName("mem_ass" + i)[0].disabled = true;
		document.getElementsByName("act_srt_date" + i)[0].disabled = true;
		document.getElementsByName("act_end_date" + i)[0].disabled = true;
		document.getElementsByName("pln_srt_date" + i)[0].disabled = true;
		document.getElementsByName("pln_end_date" + i)[0].disabled = true;
		document.getElementsByName("hrs" + i)[0].disabled = true;
	}

}

function check_previous(seq_no, level, previous_level, initiate_seqno, plan_seqno, execute_seqno, hypercare_seqno, number) {
 	//alert("Seqno: "+seq_no+" level :"+level+" prevoius level :"+previous_level+" initiate no : "+initiate_seqno+" plan seqno : "+plan_seqno+" execute_seqno :"+execute_seqno+" hypercare_seqno :"+hypercare_seqno+" number :"+number );
	/*var plan_startdate=$('#pln_srt_date'+(seq_no-1)).val();
	var plan_enddate=$('#pln_end_date'+(seq_no-1)).val();
	var actual_startdate=$('#act_srt_date'+(seq_no-1)).val();
	var actual_enddate=$('#act_end_date'+(seq_no-1)).val();
	var checkdate=false;
	if(number==1)
	{
		checkdate=true;
	}
	else if(number==2)
	{
		if(plan_startdate!="")
		{
			checkdate=true;
		}
		else {
			BootstrapDialog.alert("please fill the plan start date.");
		}
	}
	else if(number==3)
	{
		if(plan_enddate!="")
		{
			checkdate=true;
		}
		else {
			if(plan_startdate=="")
			{
				BootstrapDialog.alert("please fill the plan start and plan end date.");

			}
			else {
				BootstrapDialog.alert("please fill the plan end date.");
			}
		}
	}
	else if(number==4)
	{
		if(actual_startdate!="")
		{
			checkdate=true;
		}
		else {
			if(plan_startdate==""&&plan_enddate==""&&actual_startdate=="")
			{
				BootstrapDialog.alert("please fill the plan start date,plan end date and actual start date.");
			}
			else if(plan_enddate==""&&actual_startdate=="")
			{
				BootstrapDialog.alert("please fill the plan end date and actual start date.");
			}
			else {
				BootstrapDialog.alert("please fill the actual start date.");
			}
		}
	}*/
/*if(checkdate==true) {*/
	var Ideation_Progressbar=parseInt($('#prog_bar').attr('aria-valuenow'));
	//alert("Ideation_Progressbar "+seq_no);
	var Plan_Progressbar=parseInt($('#prog_bar1').attr('aria-valuenow'));
	var Execute_Progressbar=parseInt($('#prog_bar2').attr('aria-valuenow'));
	var Closure_Progressbar=parseInt($('#prog_bar3').attr('aria-valuenow'));
	var checking_pogressbar=false;
	var sequence_number=parseInt(seq_no);
	if(sequence_number>initiate_seqno&&sequence_number<plan_seqno)
	{
		checking_pogressbar=true;
	}
	else if(sequence_number>plan_seqno&&sequence_number<execute_seqno){
		if(Ideation_Progressbar==100)
		{
			checking_pogressbar=true;
		}
		else {
			checking_pogressbar=false;
		}
	}
	else if(sequence_number>execute_seqno&&sequence_number<hypercare_seqno)
	{
		if(Ideation_Progressbar==100&&Plan_Progressbar==100)
		{
			checking_pogressbar=true;
		}
		else {
			checking_pogressbar=false;
		}
	}
	else if(sequence_number>hypercare_seqno)
	{
		if(Ideation_Progressbar==100&&Plan_Progressbar==100&&Closure_Progressbar==100)
		{
			checking_pogressbar=true;
		}
		else {
			checking_pogressbar=false;
		}
	}
	if(checking_pogressbar) {
		var task_number = [initiate_seqno, plan_seqno, execute_seqno, hypercare_seqno];
		var tasks = [];
		var count1 = [];
		var x, y, z, index, count = 0, cnt = 1;
//    	window.alert(seq_no+"   "+true_cnt);
		//window.alert(initiate_seqno+" "+plan_seqno+" "+execute_seqno+" "+hypercare_seqno);
		if (level == previous_level) {
			x = document.getElementById("pln_srt_date" + (seq_no - 2)).value;
			y = document.getElementById("pln_end_date" + (seq_no - 2)).value;
			z = document.getElementById("act_srt_date" + (seq_no - 2)).value;
			w = document.getElementById("act_end_date" + (seq_no - 2)).value;
			if (x == "" && y == "" && z == "") {
				cnt = 0;
				//window.alert("Please fill the above text field");
				BootstrapDialog.alert("Please fill the above text field");
			}
		} else {
			for (var i = 0; i < 4; i++) {
				if (parseInt(task_number[i]) < parseInt(seq_no)) {
					tasks.push(task_number[i]);
				} else {
					continue;
				}
			}
			for (var i = tasks.length - 1; i >= 0; i--) {
				count++;
				if (count <= 2) {
					x = document.getElementById("pln_srt_date" + (tasks[i] - 1)).value;
					y = document.getElementById("pln_end_date" + (tasks[i] - 1)).value;
					z = document.getElementById("act_srt_date" + (tasks[i] - 1)).value;
					if (x == "" && y == "" && z == "") {
						count1.push("FALSE");
						continue;

					} else {
						count1.push("TRUE");
						continue;
					}
				} else {
					break;
				}
			}


		}
		if (count1[0] == "FALSE" && count1[1] == "FALSE") {
			//window.alert("please fill the above fields");
			BootstrapDialog.alert("please fill the above fields");

			cnt = 0;
		}
		if (cnt == 1) {
			$("#pln_srt_date" + (seq_no - 1)).datepicker({
				format: "mm/dd/yyyy",
				autoclose: true
			});
			$("#pln_end_date" + (seq_no - 1)).datepicker({
				format: "mm/dd/yyyy",
				autoclose: true
			});
			$("#act_srt_date" + (seq_no - 1)).datepicker({
				format: "mm/dd/yyyy",
				autoclose: true
			});
			$("#act_end_date" + (seq_no - 1)).datepicker({
				format: "mm/dd/yyyy",
				autoclose: true
			});
			if (number == 1)
				$("#pln_srt_date" + (seq_no - 1)).datepicker('show');
			if (number == 2)
				$("#pln_end_date" + (seq_no - 1)).datepicker('show');
			if (number == 3)
				$("#act_srt_date" + (seq_no - 1)).datepicker('show');
			if (number == 4)
				$("#act_end_date" + (seq_no - 1)).datepicker('show');
		}
	}
	else {
		BootstrapDialog.alert("Please try to fill all the above task.");
	}
/*}*/
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
//calling java servlet for adding task name
function createnode(seq,taskname,projectname,typeofnode)
{
//console.log("start");
//alert(seq+" "+taskname+" "+projectname+" "+typeofnode);
	if(taskname!="") {
		var f = document.loginForm;
		//console.log("after loginform");
		f.method = "post";
		//console.log("after post");
		f.action = 'AddingNode?sequence=' + seq + '&task_name=' + taskname + '&project_name=' + projectname + '&type_of_node=' + typeofnode;
		//console.log("after action");
		f.submit();
		//console.log("after submit");
	}
	else {
		BootstrapDialog.alert("Please fill the task name.");
	}
}
//adding task popups
function popup(id)
{
//alert(id);
//console.log(id);
	var modal = document.getElementById('myModal');
	var btn = document.getElementById(id);
//alert(id);
	$('.modal-content').draggable();
	/*$('#myModal').on('show.bs.modal', function () {
        $(this).find('.modal-body').css({
            'max-height':'100%'
        });
    });*/

	document.getElementById('sequence').value=id;
	var closebtn=document.getElementById("cancelbtn");
	modal.style.display = "block";
	closebtn.onclick= function() {
		modal.style.display="none";
	}
	var span = document.getElementsByClassName("close")[0];
	span.onclick = function() {
		modal.style.display = "none";
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}

}
function delete_popup(id)
{
	//alert(id);
	//console.log(id);
	var modal = document.getElementById('myModal1');
	var btn = document.getElementById(id);
	//alert(id);
	var ID=id.substring(id.lastIndexOf('e')+1,id.length);
	//alert("changed "+ID);
	document.getElementById('sequence1').value=ID;
	//var taskid=document.getElementById('name'+ID).value;
	//document.getElementById('taskdelete').innerHTML=taskid;
	$('.modal-content1').draggable();
	var closebtn=document.getElementById("cancelbtn1");
	modal.style.display = "block";
	closebtn.onclick= function() {
		modal.style.display="none";
	}
	var span = document.getElementsByClassName("close")[1];
	span.onclick = function() {
		modal.style.display = "none";
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
}
function deletenode(seq,projectname)
{
//alert(seq+" "+projectname);
	var f=document.loginForm;
	f.method="post";
	var sequence=seq;
	var project=projectname;
	f.action='DeletingNode?seq='+seq+'&projectname='+projectname;
	f.submit();
}
function modify_popup(id)
{
	//alert(id);
	//console.log(id);
	var modal = document.getElementById('myModal2');
	var btn = document.getElementById(id);
	//alert(id);
	var ID=id.substring(id.lastIndexOf('y')+1,id.length);
	//alert("changed "+ID);
	document.getElementById('sequence2').value=ID;
	$('.modal-content2').draggable();
	//var taskid=document.getElementById('name'+ID).value;
	//document.getElementById('taskdelete').innerHTML=taskid;
	var closebtn=document.getElementById("cancelbtn2");
	modal.style.display = "block";
	closebtn.onclick= function() {
		modal.style.display="none";
	}
	var span = document.getElementsByClassName("close")[2];
	span.onclick = function() {
		modal.style.display = "none";
	}
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
}
function editnode(seq,projectname,taskname)
{
//alert("sequence "+seq+" projectname "+projectname+" taskname "+taskname);
	if(taskname!="") {
		var f = document.loginForm;
		f.method = "post";
		f.action = "EditingNode?seq=" + seq + "&projectname=" + projectname + "&taskname=" + taskname;
		f.submit();
	}
	else {
		BootstrapDialog.alert("Please fill the task name.");
	}
}
function Progressbar_ColorDesign(Initiate,Plan,Execute,Closure)
{
	if(Initiate<35)
	{
		document.getElementById('prog_bar').className='progress-bar progress-bar-danger progress-bar-striped';
	}
	else if(Initiate<65)
	{
		document.getElementById('prog_bar').className='progress-bar progress-bar-warning progress-bar-striped'
	}
	if(Plan<35)
	{
		document.getElementById('prog_bar1').className='progress-bar progress-bar-danger progress-bar-striped';
	}
	else if(Plan<65)
	{
		document.getElementById('prog_bar1').className='progress-bar progress-bar-warning progress-bar-striped';
	}
	if(Execute<35)
	{
		document.getElementById('prog_bar2').className='progress-bar progress-bar-danger progress-bar-striped';
	}
	else if(Execute<65)
	{
		document.getElementById('prog_bar2').className='progress-bar progress-bar-warning progress-bar-striped';
	}
	if(Closure<35)
	{
		document.getElementById('prog_bar3').className='progress-bar progress-bar-danger progress-bar-striped';
	}
	else if(Closure<65)
	{
		document.getElementById('prog_bar3').className='progress-bar progress-bar-warning progress-bar-striped';
	}
}

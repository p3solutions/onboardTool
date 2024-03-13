/*var users =[]*/;
var taskTypeArr = [];
var n;
$(document).ready(function()
{			var phasename="";
 			var waveid = "";
            var wavename = "";
            console.log("WA",wavename);
            var creation_date="";
            var completion_date="";
            $('#phaseName').html(phasename);
            $('#waveName').html(wavename);
            $('#creation_date').html(creation_date);
            $('#completion_date').html(completion_date);
 $('#spinner').hide();
    users=[];
    taskTypeArr = [];
    $('.collapse.in').prev('.card-header').addClass('active');
   
      $('#accordion, #bs-collapse')
        .on('show.bs.collapse', function(a) {
          $(a.target).prev('.card-header').addClass('active');
          var s=$(this).attr("id");
          /*$('.arc_collapse').hide();
          $('.arc_expand').show();*/
          n=true;
          console.log("Expand",s);
        })
        .on('hide.bs.collapse', function(a) {
          $(a.target).prev('.card-header').removeClass('active');
          console.log("Collapse");
          n=false;
          
        });
       
     
   
    /*$(document).on("click", ".submitDisable", function() {
        $(this).attr('Disable');
    });*/
    $(document).on("mouseenter", ".completion", function() {
        var index = $(this).index('.completion');
        $('.visibleBtn').eq(index).show();
        $('.ArchiveList').eq(index).attr('data-bs-toggle','');
    });
    $(document).on("mouseleave", ".completion", function() {
        var index = $(this).index('.completion');
        $('.visibleBtn').eq(index).hide();
        $('.ArchiveList').eq(index).attr('data-bs-toggle','collapse');
    });
    $(document).on('click','.up',function()
        {
        
        });
      
            
      $(document).on('dblclick','.percentage',function()
        {
	
});

$(document).on('change','#wave',function(){
	var wave=$('#wave').val();
	var phase=$('#phase').val();
	$('#demo').show();
	$('#govmsg').hide();
	 $("#ArchiveExecutionList").empty();
	  $('#spinner').show();
	  
$.ajax({
        url: "ArchiveExecutionGovernanceInfoDataRetrieveServlet",
        type: 'POST',
        data : {wave:wave},
        dataType: "json",
        success: function (data) {
            console.log("Archive Exec Data Retrieve--->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            console.log("DATA ---> : ",data.length);
            var s=data.length;
            /*var parentRow = ""*/
            appendRowFunction(data);
           	
            $('.assignedToDrop').selectpicker();
            var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});"+
            "$('.datepicker2').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});<\/script>";
        $(".visibleBtn").hide(); 
        $('#scripttag').append(script);
        for(var i = 0; i<$('.datepicker1').length; i++){
            var className = $('.datepicker1').eq(i).attr('class');
            $('.datepicker1').eq(i).attr('class', className+" taskChange");
        }
        $('#spinner').hide();
        },
        error: function (e) {
            console.log(e);
        }
    });
       		var phasename = phase == false ? "" : phase;
            $('#phaseName').html(phasename);
});
      
 $(document).on('click','.arc_level',function()
  {        
	if(n!=true)
	{      
	var s=$(this).attr("id");
	var s1=parseInt(s.replace(/[^0-9.]/g, ""));
	$(".arc_collapse"+s1+"").hide();
	$(".arc_expand"+s1+"").show(); 
	
	}
	if(n==true)
	{
	var s=$(this).attr("id");
	var s1=parseInt(s.replace(/[^0-9.]/g, ""));
	$(".arc_collapse"+s1+"").show();
	$(".arc_expand"+s1+"").hide();   
	}
});
     
 $(document).on('keypress','.per',function(e)
        {
	console.log(e)
	if(e.charCode==13){
			var index  = $(this).index('.per');
			var ids=$(this).attr("id");
			var ss = ids.split('_')[1];
			var f="#p"+ids;
			var g="#ppp"+ids;
			console.log("ID : ",f);
            console.log("INDEXX",ss);
            var statusIndex =g;
            console.log("Status Index",statusIndex);
            var classArr = $("#p"+ids+"").attr('class').split(' ');
            var Progressclass = classArr[1].substring(1);
            var value=$(this).val();
            var value1=(value>=100)?"100":value;
            $("#pp"+ids+"").html(value1+"%");
            var progress = classArr[0]+" "+"p"+(value1)+" "+classArr[2]+" "+classArr[3];
            $("#p"+ids+"").attr('class',progress);
            var seqNo = parseInt(ss);
            var columnName = "completion";
            fieldName = "";
            saveFunction(seqNo, columnName, value1);
           statusColor1(parseInt(value1),statusIndex);
           $("#p"+ids+"").show();
           $("#"+ids+"").hide();
           }
        });
            $(document).on('click','.down',function()
                {
                    
                });
});
function userAppendFunction(data) {
    $.each(data, function(){
    })
}
function appendRowFunction(data){
    var collapse = "";
    var checkIndex = false;
    var i=0;
  	var num = 0;
  	console.log("Data Length : ",data.length);
  	if(data.length==1)
  	{
	 $("#ArchiveExecutionList").hide();
	$('#notfound').show();
}
if(data.length>1)
  	{
	 $("#ArchiveExecutionList").show();
	$('#notfound').hide();
}
    $.each(data, function(key, value){
	
	console.log("INDEX UI",i);
        if(checkIndex){
        var seqNo = value.seq_no;
        var oppId = value.oppId;
        var oppName = value.oppName;
        var taskId = value.taskId;
        var level = value.level;
        var taskGroup = value.taskGroup;
        var taskName = value.taskName;
        var taskType = value.taskType;
        var majDep = value.majorDep;
        var assingedTo = value.assignedTo;
        var planStart = value.planStart;
        var planEnd = value.planEnd;
        var actStart = value.actStart;
        var actEnd = value.actEnd;
        var completion = !isNaN(value.completion)&&value.completion!=""?value.completion:0 ;
        var status = value.status;
        var remark = value.remark;
        var AssignedToOptions =userAppendFunction(data[0].user,assingedTo);
        var taskTypeOptions = Options(taskTypeArr,taskType);
        var status1=arcstatuscolor(completion);
        var lvlflag=levlflag(level);
       var t=taskId;

       console.log("T VALUE",t);
       var t1=t;
       console.log(t1);
       collapse1="collapse1"+t1;
        if (level == 1){        
            collapse = "collapse"+i;
           
       var row = "<tr class='ArchiveList' style='height:60px;' role='button' data-bs-toggle='collapse' data-bs-parent='#accordion' href='."+collapse+"' aria-expanded='false' aria-controls='"+collapse+"' >"+
         		  "<td style='text-align:left;vertical-align: middle; color:black;' class='arc_level' id='arclevel_"+i+"' data-bs-toggle='tooltip' data-bs-placement='top' title='"+oppName+"'><label class='control-label' style='cursor:pointer;'for='ArchiveExection'><i class='fa fa-angle-down arc_expand"+i+"' style='font-size:14px;color:black; display:none;'></i>&nbsp;<i class='fa fa-angle-right arc_collapse"+i+"' style='font-size:14px;color:black'></i>&nbsp;"+oppName+"</label>" +
                "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskChange taskId' for='ArchiveExection'></label>" +
                        "<input type = 'hidden' class = 'archiveLevel' value = '"+level+"'/>"+
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' for='ArchiveExection'></label></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px; display:none;'Class='form-control planStart' placeholder='mm/dd/yyyy' value='' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;display:none;' Class='form-control planEnd' placeholder='mm/dd/yyyy' value='' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;display:none;' Class='form-control actStart' placeholder='mm/dd/yyyy' value='' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;display:none;' Class='form-control actEnd' placeholder='mm/dd/yyyy' value='' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<div class='clearfix completion'>"+
             "<input type='text' style='display:none;width:40px; height:40px;'class='per pro' id='perc_"+i+"'>"+
           "<div class='c100 p small circle' id='pperc_"+i+"' style='display:none;'>"+
           "<span class='percentage' id='ppperc_"+i+"'style='display:none;'>"+completion+" %</span>"+
                  "<div class='slice'>"+
                  "<div class='bar'></div>"+
                 "<div class='fill'></div>"+
                 "</div>"+
                 "</div>"+
                 "<div class='visibleBtn arrow'>"+
                 "<div>"+
                 "<i style='vertical-align:top;position:relative;display:none;' role ='button' class='triangle up parentUp'></i>"+
                 "</div>"+
                 "<br/>"+
                 "<div>"+
                 "<i style='vertical-align:bottom;position:relative; display:none;' role='button' class='triangle down parentDown'></i>"+
                 "</div>"+
                 "</div>"+
                 "</div>"+
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<span class='"+arcstatuscolor(completion)+" statusCode colorCode' id='pppperc_"+i+"' style='display:none;'></span>"+
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><i class='fas fa-comment-alt fa-2x remarksIcon' style='color:#87CEEB; display:none;' role='button' ></i><input type='hidden' class ='remark changeText' value='"+remark+"' disabled></td>"+
                  "<td style='display:none;'><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-bs-toggle='dropdown' style='display:none;'></img>"+
                  "<ul class='dropdown-menu'>"+
                  "<li><a  class='fa fa-plus AddRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Add</a></li>"+
                  "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                  "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                  "</ul>"+
                  "</div>"+
                  "</td>"+
                  "</tr>";
                  $("#ArchiveExecutionList").append(row);
                 
        }
        
     
            
        else if(level==2){

            var row = "<tr class='ArchiveList panel-collapse collapse out "+collapse+"' role='button'  aria-labelledby='headingOne' data-bs-toggle='collapse' data-bs-parent='#accordion1' href='."+collapse1+"' aria-expanded='false' aria-controls='"+collapse1+"'>"+
             "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskChange taskId' for='ArchiveExection'></label>" +
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskId' for='ArchiveExection'>"+taskId+"</label>" +
            "<input type = 'hidden' class = 'archiveLevel' value = '"+level+"'/>"+      
            "</td>"+
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' id='taskGroup"+i+"' for='ArchiveExection'>"+taskGroup+"</label></td>"+
             
              "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;' Class='form-control datepicker1 planStart' placeholder='mm/dd/yyyy' value='"+planStart+"' maxlength='0' id='pln_srt"+t+"' disabled/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;' Class='form-control datepicker1 planEnd' placeholder='mm/dd/yyyy' value='"+planEnd+"' maxlength='0' id='pln_end"+t+"'disabled/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;'Class='form-control datepicker1 actStart' placeholder='mm/dd/yyyy' value='"+actStart+"' maxlength='0' id='act_srt"+t+"'disabled/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;' Class='form-control datepicker1 actEnd' placeholder='mm/dd/yyyy' value='"+actEnd+"' maxlength='0' id='act_end"+t+"'disabled/></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
            "<div class='clearfix completion'>"+
             "<input type='text' style='display:none;width:40px; disabled height:40px;'class='per pro' id='perc_"+i+"'value="+completion+">"+
           "<div class='c100 p"+completion+" small circle' id='pperc_"+i+"'>"+
           "<span class='percentage' id='ppperc_"+i+"'>"+completion+" %</span>"+
          "<div class='slice'>"+
         "<div class='bar'></div>"+
        "<div class='fill'></div>"+
        "</div>"+
        "</div>"+
        "<div class='visibleBtn arrow'>"+
        "<div>"+
        "<i style='vertical-align:top;position:relative; display:none;' role ='button' class='triangle up parentUp'></i>"+
        "</div>"+
        "<br/>"+
        "<div>"+
        "<i style='vertical-align:bottom;position:relative;display:none;' role='button' class='triangle down parentDown'></i>"+
        "</div>"+
        "</div>"+
        "</div>"+
          "</td>"+
          "<td style='text-align:center;vertical-align: middle;'>"+
              "<span class='"+arcstatuscolor(completion)+" statusCode colorCode' id='pppperc_"+i+"' disabled></span>"+
              "</td>"+ 
              "<td style='text-align:center;vertical-align: middle;'><i class='fas fa-comment-alt fa-2x remarksIcon'id='remarksIcon"+i+"' style='color:#87CEEB;' role='button'></i><input type='hidden' class ='remark changeText' value='"+remark+"' disabled></td>"+
          "<td style='display:none;'><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-bs-toggle='dropdown'></img>"+
          "<ul class='dropdown-menu'>"+
          "<li><a  class='fa fa-plus AddRow' style='font-size: 19px; color: black; "+lvlflag+"'>&nbsp;&nbsp;&nbsp;Add</a></li>"+
          "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
          "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
          "</ul>"+
          "</div>"+
          "</td>"+
              "</tr>";
              
              $("#ArchiveExecutionList").append(row);
             
        }
         num++;
         console.log("NUMBB",num);
         noDataFound(num)
        }
         else {
           /* users =[];*/
            taskTypeArr = ['','Activity','Deliverable'];
            checkIndex = true;
            var waveid = value.waveId == false ? "" : value.waveId;
            var wavename = value.waveName == false ? "" : value.waveName;
            console.log("WA",wavename);
            var creation_date=value.creation_date == false ? "" : value.creation_date;
            var completion_date=value.completion_date == false ? "" : value.completion_date;
            $('#waveName').html(wavename);
            $('#creation_date').html(creation_date);
            $('#completion_date').html(completion_date);
        }
        
   i++;
    
    });
         
  getData();

}
function noDataFound(count) {
    if (count < 1) {
        console.log("==============================================================");
        console.log("data is shown");
        // $("#notFound").show();
    } else {
        console.log("==============================================================");
        console.log("data is shown");
        // $("#notFound").hide();
    }
}
function Options(optionlist,value)
{
     var options = "";
     for(var i=0;i<optionlist.length;i++)
    {
   /*   if(value.includes(optionlist[i].toString()))
          options += "<option value='"+optionlist[i]+"' selected>"+optionlist[i]+"</option>";
      else
          options += "<option value='"+optionlist[i]+"'>"+optionlist[i]+"</option>";*/
    }
     return options;
}
function userAppendFunction(optionlist,value1) {
    //console.log(optionlist);
    var options = "";
    /*var userArrayList = optionlist.split(',').slice(1);
    //console.log(userArrayList);
   
    $.each(userArrayList, function(key, value){
        //var getUser = "user"+count.toString();
        var userList = (value);
         if(value1.includes(userList.toString()))
          options += "<option value='"+userList+"'>"+userList+"</option>";
      else
          options += "<option value='"+userList+"'>"+userList+"</option>";
    });*/
    return options;
}
function arcstatuscolor(completion){
    var s=completion;
          var colorClass = "";
          if(s<=25)
              colorClass = "statusRed";
          else if(s<=75 && s>25)
              colorClass = "statusOrange";
          else if(s>75)
              colorClass = "statusGreen";
           return colorClass;
      }
      
function levlflag(level){
	var lvl=level;
	var displayflag="";
	if(lvl==3)
        {
		var displayflag="display:none;";
		console.log("METHOD INVOKES in 3rd Level");
		}
		else
		{
			var displayflag="display:block;";	
			console.log("METHOD INVOKES in 1st & 2nd Level");
		}
		
	return displayflag;
}

function s(taskId)
{
	var t=taskId;
	console.log("Welcome",t);
}


function getData(){
	var m=[];
	$("#ArchiveExecutionList tr").each(function(index, value){
	m.push($(this).find("td:eq(0)").text());
		
    });
    console.log("Array",m);
    for(var i = 0; i < m.length-1; i++) {
		console.log("Current Row Level : ",m[[i]]);
		var ss=m[[i]];
		var ss1=m[[i]].length;
		
	var next = m[($.inArray(m[[i]], m) + 1) % m.length];
	var sss=next;
	var sss1=next.length;
	
	console.log("Check DOT",sss.includes('.'));
	if(ss.includes('.') )
	{
		count1=0;
		count2=0
	    for (let s of ss){    
		if(s=='.')
		 count1++
	       } 
	      for(let r of sss){
		 if(r=='.')count2++
	}
	if(count1==1 && count2==2){
		
		 ss=ss.replaceAll('.','_');
		 console.log("SS VALUE",ss);
					$("#pln_srt"+ss+"").attr("disabled", "disabled");
					$("#pln_end"+ss+"").attr("disabled", "disabled");
					$("#act_srt"+ss+"").attr("disabled", "disabled"); 
					$("#act_end"+ss+"").attr("disabled", "disabled");
		 			$("#maj_"+ss+"").attr("disabled", "disabled");
		 			$("#assign_"+ss+"").attr("disabled", "disabled");
		 			$("#tasktype_"+ss+"").attr("disabled", "disabled");
				
	}
	}
	console.log("NEXT Row Level: ",next)
	}
    
	}



	 
		 
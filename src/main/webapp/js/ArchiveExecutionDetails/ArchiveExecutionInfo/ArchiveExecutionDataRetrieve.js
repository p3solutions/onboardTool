/*var users =[]*/;
var taskTypeArr = [];
$(document).ready(function()
{

    users=[];
    taskTypeArr = [];
    $('.collapse.in').prev('.card-header').addClass('active');
      $('#accordion, #bs-collapse')
        .on('show.bs.collapse', function(a) {
          $(a.target).prev('.card-header').addClass('active');
        })
        .on('hide.bs.collapse', function(a) {
          $(a.target).prev('.card-header').removeClass('active');
        });
       
     
    $.ajax({
        url: "ArchiveExecutionInfoDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Archive Exec Data Retrieve--->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
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
        /*var className = $('.datepicker1').attr('class');
        $('.datepicker1').attr('class', className+" taskChange");*/
        $('#spinner').hide();
        },
        error: function (e) {
            console.log(e);
        }
    });
    /*$(document).on("click", ".submitDisable", function() {
        $(this).attr('Disable');
    });*/
    $(document).on("mouseenter", ".completion", function() {
        var index = $(this).index('.completion');
        $('.visibleBtn').eq(index).show();
        $('.ArchiveList').eq(index).attr('data-toggle','');
    });
    $(document).on("mouseleave", ".completion", function() {
        var index = $(this).index('.completion');
        $('.visibleBtn').eq(index).hide();
        $('.ArchiveList').eq(index).attr('data-toggle','collapse');
    });
    $(document).on('click','.up',function()
        {
            var index  = $(this).index('.up');
            var statusIndex = $(this).index('.parentUp');
            var classArr = $('.circle').eq(index).attr('class').split(' ');
            var Progressclass = classArr[1].substring(1);
            var value=progressPercentage(Progressclass)+5;
            var value1=(value>=100)?"100":value;
            $('.percentage').eq(index).html(value1+"%");
            var progress = classArr[0]+" "+"p"+(value1)+" "+classArr[2]+" "+classArr[3];
            $(".circle").eq(index).attr('class',progress);
            var seqNo = parseInt(index)+1;
            var columnName = "completion";
            fieldName = "";
            saveFunction(seqNo, columnName, value1);
           statusColor(parseInt(value1),statusIndex);
        });
            $(document).on('click','.down',function()
                {
                    var index  = $(this).index('.down');
                    var statusIndex = $(this).index('.parentDown');
                    var classArr = $('.circle').eq(index).attr('class').split(' ');
                    var Progressclass = classArr[1].substring(1);           
                    var value=progressPercentage(Progressclass)-5;
                    var value1=(value<=0)?"0":value;
                   $('.percentage').eq(index).html(value1+"%");
                   var progress = classArr[0]+" "+"p"+(value1)+" "+classArr[2]+" "+classArr[3];
                   $(".circle").eq(index).attr('class',progress);
                   var seqNo = parseInt(index)+1;
                   var columnName = "completion";
                   fieldName = "";
                   saveFunction(seqNo, columnName, value1);
               statusColor(parseInt(value1),statusIndex);
                });
      function progressPercentage(percentClass)
          {
              var perc = parseInt(percentClass.substring(0));
              return perc;
          }
      function statusColor(progress,index){
          var colorClass = "";
          if(progress<=25)
              colorClass = "statusRed statusCode colorCode";
          else if(progress<=75 && progress>25)
              colorClass = "statusOrange statusCode colorCode";
          else if(progress>75)
              colorClass = "statusGreen statusCode colorCode";
           console.log()
           $('.statusCode').eq(index).attr('class',colorClass);
      }
});
function userAppendFunction(data) {
    $.each(data, function(){
    })
}
function appendRowFunction(data){
    var collapse = "";
    var checkIndex = false;
    var i=0;
   
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
       var t=taskId.replaceAll('.','_');
       console.log("T VALUE",t);
      
       var t1=t.slice(0,3);
       console.log(t1);
       collapse1="collapse1"+t1;
        if (level == 1){        
            collapse = "collapse"+seqNo;
            
            //console.log("CONS")
        var row = "<tr class='ArchiveList' role='button' data-toggle='collapse' data-parent='#accordion' href='."+collapse+"' aria-expanded='false' aria-controls='"+collapse+"'>"+
                "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskChange taskId' for='ArchiveExection'>"+taskId+"</label>" +
                        "<input type = 'hidden' class = 'archiveLevel' value = '"+level+"'/>"+
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' for='ArchiveExection'>"+taskGroup+"</label></td>"+
                  "<td><label class='control-label taskName' for='ArchiveExection'>"+taskName+"</label></td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<select class='taskTypeDrop taskChange' disabled>"+
                  taskTypeOptions+
                  "</select>" +
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' class ='majorDep changeText' value='"+majDep+"' disabled></td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<select multiple data-live-search='true' class='assignedToDrop selectpicker' multiple data-actions-box='true' disabled>"+
                  AssignedToOptions+
                  "</select>" +
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control planStart' placeholder='mm/dd/yyyy' value='"+planStart+"' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control planEnd' placeholder='mm/dd/yyyy' value='"+planEnd+"' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control actStart' placeholder='mm/dd/yyyy' value='"+actStart+"' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control actEnd' placeholder='mm/dd/yyyy' value='"+actEnd+"' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<div class='clearfix completion'>"+
                  "<div class='c100 p"+completion+" small circle'>"+
                  "<span class='percentage' >"+completion+"%</span>"+
                  "<div class='slice'>"+
                  "<div class='bar'></div>"+
                 "<div class='fill'></div>"+
                 "</div>"+
                 "</div>"+
                 "<div class='visibleBtn arrow'>"+
                 "<div>"+
                 "<i style='vertical-align:top;position:relative;' role ='button' class='triangle up parentUp'></i>"+
                 "</div>"+
                 "<br/>"+
                 "<div>"+
                 "<i style='vertical-align:bottom;position:relative;' role='button' class='triangle down parentDown'></i>"+
                 "</div>"+
                 "</div>"+
                 "</div>"+
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<span class='"+arcstatuscolor(completion)+" statusCode colorCode'></span>"+
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><i class='fas fa-comment-alt fa-2x remarksIcon' style='color:#87CEEB;' role='button' ></i><input type='hidden' class ='remark changeText' value='"+remark+"' disabled></td>"+
                  "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
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

            var row = "<tr class='ArchiveList panel-collapse collapse out "+collapse+"' role='button'  aria-labelledby='headingOne' data-toggle='collapse' data-parent='#accordion1' href='."+collapse1+"' aria-expanded='false' aria-controls='"+collapse1+"'>"+
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskId' for='ArchiveExection'>"+taskId+"</label>" +
            "<input type = 'hidden' class = 'archiveLevel' value = '"+level+"'/>"+      
            "</td>"+
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' for='ArchiveExection'>"+taskGroup+"</label></td>"+
              "<td><label class='control-label taskName' for='ArchiveExection'>"+taskName+"</label></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
              "<select class='taskTypeDrop taskChange' id='tasktype_"+t+"'>"+
              taskTypeOptions+
              "</select>" +
              "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' class ='majorDep changeText' id='maj_"+t+"' value='"+majDep+"'></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
              "<select multiple data-live-search='true' class='assignedToDrop selectpicker' multiple data-actions-box='true' id='assign_"+t+"' >"+
            AssignedToOptions+
              "</select>" +
              "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 planStart' placeholder='mm/dd/yyyy' value='"+planStart+"' maxlength='0' id='pln_srt"+t+"' /></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 planEnd' placeholder='mm/dd/yyyy' value='"+planEnd+"' maxlength='0' id='pln_end"+t+"'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 actStart' placeholder='mm/dd/yyyy' value='"+actStart+"' maxlength='0' id='act_srt"+t+"'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 actEnd' placeholder='mm/dd/yyyy' value='"+actEnd+"' maxlength='0' id='act_end"+t+"'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
             "<div class='clearfix completion'>"+
          "<div class='c100 p"+completion+" small circle'>"+
          "<span class='percentage'>"+completion+" %</span>"+
          "<div class='slice'>"+
         "<div class='bar'></div>"+
        "<div class='fill'></div>"+
        "</div>"+
        "</div>"+
        "<div class='visibleBtn arrow'>"+
        "<div>"+
        "<i style='vertical-align:top;position:relative;' role ='button' class='triangle up'></i>"+
        "</div>"+
        "<br/>"+
        "<div>"+
        "<i style='vertical-align:bottom;position:relative;' role='button' class='triangle down'></i>"+
        "</div>"+
        "</div>"+
        "</div>"+
          "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><span class='colorCode' ></span></td>"+
              "<td style='text-align:center;vertical-align: middle;'><i class='fas fa-comment-alt fa-2x remarksIcon' style='color:#87CEEB;' role='button'></i><input type='hidden' class ='remark changeText' value='"+remark+"'></td>"+
          "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
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
         else {

            var row = "<tr class='ArchiveList panel-collapse collapse out "+collapse1+"' role='tabpanel' aria-labelledby='headingOne'>"+
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskId' for='ArchiveExection'>"+taskId+"</label>" +
            "<input type = 'hidden' class = 'archiveLevel' value = '"+level+"'/>"+      
            "</td>"+
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' for='ArchiveExection'>"+taskGroup+"</label></td>"+
              "<td><label class='control-label taskName' for='ArchiveExection'>"+taskName+"</label></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
              "<select class='taskTypeDrop taskChange' id='tasktype_"+t+"'>"+
              taskTypeOptions+
              "</select>" +
              "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' class ='majorDep changeText' id='maj_"+t+"' value='"+majDep+"'></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
              "<select multiple data-live-search='true' class='assignedToDrop selectpicker' multiple data-actions-box='true' id='assign_"+t+"' >"+
            AssignedToOptions+
              "</select>" +
              "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 planStart' placeholder='mm/dd/yyyy' value='"+planStart+"' maxlength='0' id='pln_srt"+t+"' /></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 planEnd' placeholder='mm/dd/yyyy' value='"+planEnd+"' maxlength='0' id='pln_end"+t+"'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 actStart' placeholder='mm/dd/yyyy' value='"+actStart+"' maxlength='0' id='act_srt"+t+"'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 actEnd' placeholder='mm/dd/yyyy' value='"+actEnd+"' maxlength='0' id='act_end"+t+"'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
             "<div class='clearfix completion'>"+
          "<div class='c100 p"+completion+" small circle'>"+
          "<span class='percentage'>"+completion+" %</span>"+
          "<div class='slice'>"+
         "<div class='bar'></div>"+
        "<div class='fill'></div>"+
        "</div>"+
        "</div>"+
        "<div class='visibleBtn arrow'>"+
        "<div>"+
        "<i style='vertical-align:top;position:relative;' role ='button' class='triangle up'></i>"+
        "</div>"+
        "<br/>"+
        "<div>"+
        "<i style='vertical-align:bottom;position:relative;' role='button' class='triangle down'></i>"+
        "</div>"+
        "</div>"+
        "</div>"+
          "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><span class='colorCode' ></span></td>"+
              "<td style='text-align:center;vertical-align: middle;'><i class='fas fa-comment-alt fa-2x remarksIcon' style='color:#87CEEB;' role='button'></i><input type='hidden' class ='remark changeText' value='"+remark+"'></td>"+
          "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
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
        }
        else {
           /* users =[];*/
            taskTypeArr = ['','Activity','Deliverable'];
            checkIndex = true;
            var headerOppId = value.Opp_Id == false ? "" : value.Opp_Id;
            var headerOppName = value.appName == false ? "" : value.appName;
            var headerstartDate=value.startDate == false ? "</br>" : value.startDate;
            var headerendDate=value.endDate == false ? "</br>" : value.endDate;
            $('#oppName').html("Opportunity Name : </br>"+headerOppName);
            $('#oppId').html("P3 Project Id : </br>"+headerOppId);
            $('#startDate').html("Start Date : </br>"+headerstartDate);
            $('#endDate').html("Estimated Completion : </br>"+headerendDate);
        }
   i++;
   
    });
  getData();
}
function Options(optionlist,value)
{
     var options = "";
     for(var i=0;i<optionlist.length;i++)
    {
      if(value.includes(optionlist[i].toString()))
          options += "<option value='"+optionlist[i]+"' selected>"+optionlist[i]+"</option>";
      else
          options += "<option value='"+optionlist[i]+"'>"+optionlist[i]+"</option>";
    }
     return options;
}
function userAppendFunction(optionlist,value1) {
    //console.log(optionlist);
    var userArrayList = optionlist.split(',').slice(1);
    //console.log(userArrayList);
    var options = "";
    $.each(userArrayList, function(key, value){
        //var getUser = "user"+count.toString();
        var userList = (value);
         if(value1.includes(userList.toString()))
          options += "<option value='"+userList+"' selected>"+userList+"</option>";
      else
          options += "<option value='"+userList+"'>"+userList+"</option>";
    });
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
 
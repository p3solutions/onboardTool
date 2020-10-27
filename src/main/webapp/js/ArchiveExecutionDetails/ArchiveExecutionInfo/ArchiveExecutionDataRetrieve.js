var users =[];
var taskTypeArr = [];
$(document).ready(function()
{
	users=[];
	taskTypeArr = [];
	$('.collapse.in').prev('.panel-heading').addClass('active');
	  $('#accordion, #bs-collapse')
	    .on('show.bs.collapse', function(a) {
	      $(a.target).prev('.panel-heading').addClass('active');
	    })
	    .on('hide.bs.collapse', function(a) {
	      $(a.target).prev('.panel-heading').removeClass('active');
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
            saveFunction(seqNo, columnName, value1);
            //statusColor(parseInt(value1),statusIndex);
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
		           saveFunction(seqNo, columnName, value1);
	           //statusColor(parseInt(value1),statusIndex);
	            });
            
      function progressPercentage(percentClass)
	      {
		      var perc = parseInt(percentClass.substring(0));
		      return perc;
	      }
      
      function statusColor(progress,index){
    	  var colorClass = "";
    	  
    	  if(progress<=25)
    		  colorClass = "statusRed statusCode";
    	  	  
    	  else if(progress<=75 && progress>25)
    		  colorClass = "statusOrange statusCode";
    	  	 
    	  else if(progress>75)
    		  colorClass = "statusGreen statusCode";
    	  
    	   
    	   $('.statusCode').eq(index).attr('class',colorClass);
      }
     
});


function appendRowFunction(data){
	var collapse = "";
	var checkIndex = false;
	$.each(data, function(key, value){
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
		var completion = value.completion;
		var status = value.status;
		var remark = value.remark;
		var AssignedToOptions = Options(users,assingedTo);
		var taskTypeOptions = Options(taskTypeArr,taskType);
 	    if (level == 1){    	
 	    	collapse = "collapse"+seqNo;
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
				  "<div class='c100 p75 small circle'>"+
				  "<span class='percentage' >75%</span>"+
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
				  "<span class='statusRed statusCode colorCode'></span>"+
				  "</td>"+
				  "<td style='text-align:center;vertical-align: middle;'><input type='text' class ='remark changeText' value='"+remark+"' disabled></td>"+
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
 	    else {
 	    	var row = "<tr class='ArchiveList panel-collapse collapse out "+collapse+"' role='tabpanel' aria-labelledby='headingOne'>"+
 	    	"<td style='text-align:center;vertical-align: middle;'><label class='control-label taskId' for='ArchiveExection'>"+taskId+"</label>" +
 	    	"<input type = 'hidden' class = 'archiveLevel' value = '"+level+"'/>"+		
 	    	"</td>"+
 	    	"<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' for='ArchiveExection'>"+taskGroup+"</label></td>"+
			  "<td><label class='control-label taskName' for='ArchiveExection'>"+taskName+"</label></td>"+
			  "<td style='text-align:center;vertical-align: middle;'>"+
			  "<select class='taskTypeDrop taskChange'>"+
			  taskTypeOptions+
			  "</select>" +
			  "</td>"+
			  "<td style='text-align:center;vertical-align: middle;'><input type='text' class ='majorDep changeText' value='"+majDep+"'></td>"+
			  "<td style='text-align:center;vertical-align: middle;'>"+
			  "<select multiple data-live-search='true' class='assignedToDrop selectpicker' multiple data-actions-box='true'>"+
			AssignedToOptions+
			  "</select>" +
			  "</td>"+
			  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 planStart' placeholder='mm/dd/yyyy' value='"+planStart+"' maxlength='0' /></td>"+
			  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 planEnd' placeholder='mm/dd/yyyy' value='"+planEnd+"' maxlength='0'/></td>"+
			  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 actStart' placeholder='mm/dd/yyyy' value='"+actStart+"' maxlength='0'/></td>"+
			  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 actEnd' placeholder='mm/dd/yyyy' value='"+actEnd+"' maxlength='0'/></td>"+
			  "<td style='text-align:center;vertical-align: middle;'>"+
			 "<div class='clearfix completion'>"+
		  "<div class='c100 p12 small circle'>"+
		  "<span class='percentage' >12%</span>"+
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
			  "<td style='text-align:center;vertical-align: middle;'><input type='text' class ='remark changeText' value='"+remark+"'></td>"+
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
			
		}
    	else {
    	    
    		users =['Ravi','Eric','Anand','Jim'];
    		taskTypeArr = ['','Activity','Deliverable'];
    		checkIndex = true;
    		var headerOppId = value.Opp_Id;
    		var headerOppName = value.appName;
    		$('#oppName').html("Opportunity Name : </br>"+headerOppName);
    		$('#oppId').html("P3 Project Id : </br>"+headerOppId);
    		
    	}
		
	});
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
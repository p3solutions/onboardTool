/*var users =[]*/;
// map the table using name
var taskTypeArr = [];
var n;
$(document).ready(function()
{
    var phasename="";
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
                appendRowFunction(data);

                // $('.assignedToDrop').selectpicker();
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
function appendRowFunction(data) {
    var collapse = "";
    var checkIndex = false;
    var i = 0;
    var num = 0;
    if (data.length == 1) {
        $("#ArchiveExecutionList").hide();
        $('#notfound').show();
    }
    if (data.length > 1) {
        $("#ArchiveExecutionList").show();
        $('#notfound').hide();
    }
    var previousoppname = "";
    var pretabname = "";
    const dynamicId = "#tabledata";
    var temp;
    var idchange=1;
    $.each(data, function (key, value) {
        console.log("INDEX UI", i);
        if (checkIndex) {
            var heading = "";
            var tabledata="";
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
            var completion = !isNaN(value.completion) && value.completion != "" ? value.completion : 0;
            var status = value.status;
            var remark = value.remark;
            var AssignedToOptions = userAppendFunction(data[0].user, assingedTo);
            var taskTypeOptions = Options(taskTypeArr, taskType);
            var status1 = arcstatuscolor(completion);
            var lvlflag = levlflag(level);
            var t = taskId;
            var name = value.oppName;

            if(name === previousoppname){

            }
            else{
                temp = dynamicId+idchange;
                collapse1 = "collapse" + idchange;
                heading = "heading" + idchange;
                tabledata="tabledata"+idchange;
                idchange++;
                previousoppname = name;
            }

            console.log("temp check" + temp);
            console.log("i check" + i);

            if (level == 1) {
                var row = "<div class='accordion-item'> <h2 class='accordion-header' id='" + heading + "'>" +
                    "      <button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#" + collapse1 + "'  aria-expanded='true' aria-controls='" + collapse1 + "'>" + oppName +
                    "      </button>" +
                    "    </h2>"+"<div id='" + collapse1 + "' class='accordion-collapse collapse ' aria-labelledby='" + heading + "' data-bs-parent='#ArchiveExecutionList'>" +
                    "      <div class='accordion-body'>" +
                    "<div class=\"table-responsive\">" +
                    "                                <table class=\"table table-bordered\">" +
                    "                                    <thead class=\"text-center Table-Header\">" +
                    "                                        <tr>\n" +
                    "                                            <th scope=\"col\">Task Id</th>" +
                    "                                            <th scope=\"col\">Task Group</th>" +
                    "                                            <th scope=\"col\">Planned Start</th>" +
                    "                                            <th scope=\"col\">Planned End</th>" +
                    "                                            <th scope=\"col\">Actual Start</th>" +
                    "                                            <th scope=\"col\">Actual End</th>" +
                    "                                            <th scope=\"col\">% Completion</th>" +
                    "                                            <th scope=\"col\">Status</th>" +
                    "                                            <th scope=\"col\">Remarks</th>" +
                    "                                        </tr>" +
                    "                                    </thead>" +
                    "                                    <tbody class=\"text-center align-middle Table-Body\" id="+tabledata+">"
                "<td id='notFound' colspan='9'>No records found</td>";
                $("#ArchiveExecutionList").append(row);

            }
            else if (level == 2 ) {
                var row = "<tr>" +
                    "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskId' for='ArchiveExection'>" + taskId + "</label>" +
                    "<input type = 'hidden' class = 'archiveLevel' value = '" + level + "'/>" +
                    "</td>" +
                    "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' id='taskGroup" + i + "' for='ArchiveExection'>" + taskGroup + "</label></td>" +
                    "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;' Class='form-control datepicker1 planStart' placeholder='mm/dd/yyyy' value='" + planStart + "' maxlength='0' id='pln_srt" + t + "' disabled/></td>" +
                    "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;' Class='form-control datepicker1 planEnd' placeholder='mm/dd/yyyy' value='" + planEnd + "' maxlength='0' id='pln_end" + t + "'disabled/></td>" +
                    "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;'Class='form-control datepicker1 actStart' placeholder='mm/dd/yyyy' value='" + actStart + "' maxlength='0' id='act_srt" + t + "'disabled/></td>" +
                    "<td style='text-align:center;vertical-align: middle;'><input type='text' style='width:88px;' Class='form-control datepicker1 actEnd' placeholder='mm/dd/yyyy' value='" + actEnd + "' maxlength='0' id='act_end" + t + "'disabled/></td>" +
                    "<td style='text-align:center;vertical-align: middle;'>" +
                    "<div class='clearfix completion'>" +
                    "<input type='text' style='display:none;width:40px; disabled height:40px;'class='per pro' id='perc_" + i + "'value=" + completion + ">" +
                    "<div class='c100 p" + completion + " small circle' id='pperc_" + i + "'>" +
                    "<span class='percentage' id='ppperc_" + i + "'>" + completion + " %</span>" +
                    "<div class='slice'>" +
                    "<div class='bar'></div>" +
                    "<div class='fill'></div>" +
                    "</div>" +
                    "</div>" +
                    "<div class='visibleBtn arrow'>" +
                    "<div>" +
                    "<i style='vertical-align:top;position:relative; display:none;' role ='button' class='triangle up parentUp'></i>" +
                    "</div>" +
                    "<br/>" +
                    "<div>" +
                    "<i style='vertical-align:bottom;position:relative;display:none;' role='button' class='triangle down parentDown'></i>" +
                    "</div>" +
                    "</div>" +
                    "</div>" +
                    "</td>" +
                    "<td style='text-align:center;vertical-align: middle;'>" +
                    "<span class='" + arcstatuscolor(completion) + " statusCode colorCode' id='pppperc_" + i + "' disabled></span>" +
                    "</td>" +
                    "<td style='text-align:center;vertical-align: middle;'><i class='fas fa-comment-alt fa-2x remarksIcon'id='remarksIcon" + i + "' style='color:#87CEEB;' role='button'></i><input type='hidden' class ='remark changeText' value='" + remark + "' disabled></td>" +
                    "<td style='display:none;'><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-bs-toggle='dropdown'></img>" +
                    "<ul class='dropdown-menu'>" +
                    "<li><a  class='fa fa-plus AddRow' style='font-size: 19px; color: black; " + lvlflag + "'>&nbsp;&nbsp;&nbsp;Add</a></li>" +
                    "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>" +
                    "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>" +
                    "</ul>" +
                    "</div>" +
                    "</td> ";
                $(temp).append(row);
            }
            num++;
            noDataFound(num)
        }

        else {
            /* users =[];*/
            taskTypeArr = ['', 'Activity', 'Deliverable'];
            checkIndex = true;
            var waveid = value.waveId == false ? "" : value.waveId;
            var wavename = value.waveName == false ? "" : value.waveName;

            var creation_date = value.creation_date == false ? "" : value.creation_date;
            var completion_date = value.completion_date == false ? "" : value.completion_date;
            $('#waveName').html(wavename);
            $('#creation_date').html(creation_date);
            $('#completion_date').html(completion_date);
        }
        if (level == 1 && name !== previousoppname) {
            var row ="</tbody></table>  </div>  </div>  </div>";
            $("#ArchiveExecutionList").append(row);
        }
        i++;


    });

    getData();
}


function noDataFound(count) {
    if (count < 1) {
        $("#notFound").show();
    } else {
        $("#notFound").hide();
    }
}
function Options(optionlist,value)
{
    var options = "";
    for(var i=0;i<optionlist.length;i++)
    {
    }
    return options;
}
function userAppendFunction(optionlist,value1) {
    var options = "";
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





$(document).ready(function(){
    archiveReqDocRevDataRetrieve();
});
function archiveReqDocRevDataRetrieve(){
    $.ajax({
        url: "archiveReqDocRevDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
            console.log("Table Retrieve--->",data);
             if (!$.isArray(data)) {
                 data = [data];
             }
             $("#docRevInfo").html("");
             var checkTable = data[0].checkExistance;
                 var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            today = mm + '/' + dd + '/' + yyyy;
             if(checkTable){
             $.each(data, function(key, value){
                 var dateFromDb=value.date==''?today:value.date;
                 var versionFromDb=value.version;
                 var Row="<tr class = 'rowClassDoc'>"+
                 "<td><input type ='text' class='date form-control' value='"+dateFromDb+"' readonly></td>" +
                 "<td><input type ='text' class='version form-control' value='"+versionFromDb+"' readonly></td>" +
                 "<td><input type ='text' class='documentChanges form-control' value='"+value.documentChanges+"' readonly></td>" +
                 "<td><input type ='text' class='changeAuthor form-control' value='"+value.changeAuthor+"' readonly></td>" +
                 "<td>"+
                 "<div class=\"dropdown dropend\">" +
                     "<button class=\"btn btn-outline-light\" id=\"Drop-option\" data-bs-toggle=\"dropdown\"" +
                     " aria-expanded=\"false\"> " +
                     " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
                     "</button>" +
                     "<ul class=\"dropdown-menu\" aria-labelledby=\"Drop-option\">" +
                     "<li><a class=\"dropdown-item dropdown-styles EditRowDoc\"><i" +
                     " class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
                     "</li>" +
                     "<li>" +
                     "<hr class=\"dropdown-divider m-0\">" +
                     "</li>" +
                     "<li><a class=\"dropdown-item dropdown-styles DeleteRowDoc\"><i" +
                     " class=\"fa-solid fa-trash-can text-danger \"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
                     "</li>" +
                     "</ul>" +
                     "</div>"+
                 "</td>" +
                 "</tr>";
                 $("#docRevInfo").append(Row);
                 });
             var script="<script>$('.datepicker1').datepicker({\n" +
             "format: \"mm/dd/yyyy\",\n"+
             "clearBtn:true,"+
             "autoclose: true,\n"+
             "orientation: 'bottom',"+
             "});";
             $('#scripttag').append(script);
                 }
            else{
                     var Row="<tr class = 'rowClassDoc'>"+
                     "<td><input type ='text' class='date form-control' value="+today+" readonly></td>" +
             "<td><input type ='text' class='version form-control' value="+'1' +" readonly></td>" +
                                         "<td><input type ='text' class='documentChanges form-control' value='' readonly></td>" +
                     "<td><input type ='text' class='changeAuthor form-control' value='' readonly></td>" +
                     "<td>"+
                     "<div class=\"dropdown dropend\">" +
                         "<button class=\"btn btn-outline-light\" id=\"Drop-option\" data-bs-toggle=\"dropdown\"" +
                         " aria-expanded=\"false\"> " +
                         " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
                         "</button>" +
                         "<ul class=\"dropdown-menu\" aria-labelledby=\"Drop-option\">" +
                         "<li><a class=\"dropdown-item dropdown-styles EditRowDoc\"><i" +
                         " class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
                         "</li>" +
                         "<li>" +
                         "<hr class=\"dropdown-divider m-0\">" +
                         "</li>" +
                         "<li><a class=\"dropdown-item dropdown-styles DeleteRowDoc\"><i" +
                         " class=\"fa-solid fa-trash-can text-danger \"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
                         "</li>" +
                         "</ul>" +
                         "</div>"+
                     "</td>" +
                     "</tr>";
                     $("#docRevInfo").append(Row);
                 }
                 },
        error: function (e) {
            console.log(e);
        }
    });
}
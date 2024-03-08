$(document).on('click', '.download_btn', function () {
    var File_Name=$("#File_Name").val();
    console.log("FileName :",File_Name);
    var seqnum=$(this).index('.download_btn');
    console.log("seqnum :",seqnum);
    var currentRow=$(this).closest("tr");
    console.log("currentRow :",currentRow);
    var File_Name=currentRow.find("td:eq(1)").text();
    console.log("File_Name 1 :",File_Name);
    console.log("say Hi");

    $('#File_Name').val(File_Name);
    $('#scr_submit').click();
});
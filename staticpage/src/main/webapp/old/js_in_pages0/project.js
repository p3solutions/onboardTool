
function edit(id,nam)
{

var f=document.form;
f.method="post";
f.action="setid?id="+id+"&name="+nam;
f.submit();
}

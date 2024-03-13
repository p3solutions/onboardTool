 var typingTimer;
var doneTypingInterval = 500;  

$(document).on('keyup','#appFilter', function () {
	      clearTimeout(typingTimer);
		  var Obj_this = this;
		  typingTimer=setTimeout(function (){
	          doneTyping(Obj_this);
	          },  doneTypingInterval);
});

	 
$(document).on('keydown','#appFilter',function () {
 clearTimeout(typingTimer);
});

function doneTyping(obj)
{
	var appName = $(obj).val();
//alert(appName);
getList("All","All",appName,"Phase",true);
}
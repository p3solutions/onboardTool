var typingTimer;                
var doneTypingInterval = 500;  

$(document).on('keyup','#appFilter', function () {
	$('#overlay').hide();
	      clearTimeout(typingTimer);
		  var Obj_this = this;
		  typingTimer=setTimeout(function (){
	          doneTyping(Obj_this);
	          },  doneTypingInterval);
});

	 
$(document).on('keydown','#appFilter',function () {
 clearTimeout(typingTimer);
});
$(document).on('search', '#appFilter', function() {
	filterBySearchAjaxCall("")
	clearTimeout(typingTimer);

});

function doneTyping(obj)
{
	var appName = $(obj).val();

	filterBySearchAjaxCall(appName);
}

function filterBySearchAjaxCall(appName)
{
	$.ajax({
        url: "OpportunityFilterListServlet",
        type: 'POST',
        dataType: "json",
        data:{appName:appName,bySearch:true},
        success: function (data) {
        	console.log("Data:", data);
        	 if (!$.isArray(data)) {
                 data = [data];
				 $('#overlay').hide();
        	 }  
        	 getAppList(data);
        },
        error: function (e) {
            console.log(e);
        }
});

}
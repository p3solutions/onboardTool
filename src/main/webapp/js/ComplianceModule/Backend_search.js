var typingTimer;
var doneTypingInterval = 800;
var lastSearchValue = '';
var globalData = null;
console.log("globalData : ",globalData);
var globalcategory = null;
console.log("globalcategory : ",globalcategory);
 
function filterfunction(data,category){
	console.log("data search",data);
	console.log("category search",category);
	globalData = data;
	globalcategory = category;
}
 
 
$(document).on('keyup', '#Search', function () {
    clearTimeout(typingTimer);
    var Obj_this = this;
    typingTimer = setTimeout(function () {
        doneTyping(Obj_this);
    }, doneTypingInterval);
});
 
$(document).on('keyup', '#SearchRequest', function () {
    clearTimeout(typingTimer);
    var Obj_this_request = this;
    typingTimer = setTimeout(function () {
        doneTypingRequest(Obj_this_request);
    }, doneTypingInterval);
});
 
$(document).on('keydown', '#Search', function () {
    clearTimeout(typingTimer);
});
 
 
$(document).on('keydown', '#SearchRequest', function () {
    clearTimeout(typingTimer);
});
 
 
function doneTyping(obj) {
    var Search = $(obj).val();
    console.log("Search Value : ",Search);
	makeAjaxRequestSearch(Search);
}
 
function doneTypingRequest(Obj_this_request) {
    var SearchRequest = $(Obj_this_request).val();
    console.log("Search Value : ",SearchRequest);
	makeAjaxRequestSearchRequest(SearchRequest);
}
 
function makeAjaxRequestSearch(Search) {
	var category = globalcategory;
    $.ajax({
        url: "IntakeReportServlet",
        type: 'POST',
        data: {
            Search: Search,
            category: category
        },
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
            $('#overlay').hide();

 
            if (data.error) {
                $("#dynamicHeader").html("Error: " + data.error);
            } else {
                    var tableHtml = constructTablefilter(data);
                	var table = tableHtml;
                	console.log("tableHtml", table);
                	table = getPaginationcom(table);
                	$("#dynamicHeader").html(tableHtml);
                	getPaginationcom('#dynamicHeader');
                }
        },
    });
}
 
function makeAjaxRequestSearchRequest(SearchRequest) {
	var category = globalcategory;
    $.ajax({
        url: "Compliance",
        type: 'POST',
        data: {
            SearchRequest: SearchRequest,
            category: category
        },
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
            $('#overlay').hide();

 
            if (data.error) {
                $("#dynamicHeader").html("Error: " + data.error);
            } else {
                    var tableHtml = constructTablefilter(data);
                	var table = tableHtml;
                	console.log("tableHtml", table);
                	table = getPaginationcom(table);
                	$("#dynamicHeader").html(tableHtml);
                	getPaginationcom('#dynamicHeader');
                }
        },
    });
}

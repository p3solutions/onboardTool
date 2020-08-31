function filter() {
    // when this function is called at client side you get the resolution
    var x =  document.getElementById("filtertext").value;
    var y =  document.getElementById("usr").value;
    myFunction(x);
  }

function myFunction(x){
	
	$("#table td.col1:contains('" + $(this).val() + "')").parent().show();  
    
};




$(document).ready(function () {
    // Create jqxTree
    $('#jqxTree').jqxTree({ height: '650px', width: '0px' });
    $('#jqxTree').css('visibility', 'visible');

    var contextMenu = $("#jqxMenu").jqxMenu({ width: '100px',  height: '56px', autoOpenPopup: false, mode: 'popup' });
    var clickedItem = null;
    
    var attachContextMenu = function () {
        // open the context menu when the user presses the mouse right button.
        $("#jqxTree li").on('mousedown', function (event) {
            var target = $(event.target).parents('li:first')[0];
            var rightClick = isRightClick(event);
            if (rightClick && target != null) {
                $("#jqxTree").jqxTree('selectItem', target);
                var scrollTop = $(window).scrollTop();
                var scrollLeft = $(window).scrollLeft();
                contextMenu.jqxMenu('open', parseInt(event.clientX) + 5 + scrollLeft, parseInt(event.clientY) + 5 + scrollTop);
                return false;
            }
        });
    }
    attachContextMenu();
    $("#jqxMenu").on('itemclick', function (event) {
        var item = $.trim($(event.args).text());
        switch (item) {
            case "Add Item":
                var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                if (selectedItem != null) {
                    $('#jqxTree').jqxTree('addTo', { label: 'Item' }, selectedItem.element);
                    attachContextMenu();
                }
                break;
            case "Remove Item":
                var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                if (selectedItem != null) {
                    $('#jqxTree').jqxTree('removeItem', selectedItem.element);
                    attachContextMenu();
                }
                break;
        }
    });
    // disable the default browser's context menu.
    $(document).on('contextmenu', function (e) {
        if ($(e.target).parents('.jqx-tree').length > 0) {
            return false;
        }
        return true;
    });
    function isRightClick(event) {
        var rightclick;
        if (!event) var event = window.event;
        if (event.which) rightclick = (event.which == 3);
        else if (event.button) rightclick = (event.button == 2);
        return rightclick;
    }
});




function EnableDisableTextBox(chkROD) {
var txtROD = document.getElementById("txtROD");
txtROD.disabled = chkROD.checked ? false : true;
if (!txtROD.disabled) {
    txtROD.focus();
}

}


var link,color;

function disable_link() { 

document.getElementById('testlink').disabled=true;

link = document.getElementById('testlink').href;

document.getElementById('testlink').removeAttribute('href');
//document.getElementById('testlink').style.color = "grey";

} 


function enable_link() { 

document.getElementById('testlink').setAttribute("href",link);

} 




$(function() {
$("#datamig").change(function() {
if ($(this).val() == "yes") {
    console.log(true);
    $("#textbox").removeAttr("disabled");
}
else {
    console.log(false);
    $("#textbox").attr("disabled", "disabled");
}
});
});
$(function() {
$("#datamig").change(function() {
if ($(this).val() == "yes") {
    console.log(true);
    $("#textbox1").removeAttr("disabled");
}
else {
    console.log(false);
    $("#textbox1").attr("disabled", "disabled");
}
});
});



function ShowHideDiv() {
var adMigrated = document.getElementById("adMigrated");
var adMigratedDet = document.getElementById("adMigratedDet");
adMigratedDet.style.display = adMigrated.value == "Y" ? "block" : "none";
}



function ShowHideDiv() {
var arcNeed = document.getElementById("arcNeed");
var arcReason = document.getElementById("arcReason");
arcReason.style.display = arcNeed.value == "N" ? "block" : "none";
var arcComment = document.getElementById("arcComment");
arcComment.style.display = arcNeed.value == "O" ? "block" : "none";
}




  
    $(function() {
        $( "#expirydate" ).datepicker({
            format: "dd/mm/yyyy",
            autoclose: true
        });
    });
    $(function() {
        $( "#rod" ).datepicker({
            format: "dd/mm/yyyy",
            autoclose: true
        });
    });
    $(function() {
        $( "#daterange" ).datepicker({
            format: "dd/mm/yyyy",
            autoclose: true
        });
    });
    
    $(function() {
        $( "#triggerdate" ).datepicker({
            format: "dd/mm/yyyy",
            autoclose: true
        });
    });
    
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
        $(document).ready(function(){
        	  var date_input=$('input[name="expdate"]'); //our date input has the name "date"
        	  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        	  var options={
        	    format: 'yyyy/mm/dd',
        	    container: container,
        	    todayHighlight: true,
        	    autoclose: true,
        	  };
        	  date_input.datepicker(options);
        	});
        
        function switchColors0()  
        {  
        links=document.getElementsByTagName("li") ;  
        var element=document.getElementById("a");
        for (var i = 0 ; i < links.length ; i ++)  
        links.item(i).style.backgroundColor = '#3276B1' ; 
        element.style.borderRadius="5px";
        element.style.marginRight = "70px";
        element.style.boxSizing = "content-box";
        element.style.borderColor = "#3276B1";
        element.style.background="#3276B1";
        var list = document.getElementsByTagName("OL")[0];
        var x=list.getElementsByTagName("LI");
        for (var i = 0 ; i < x.length ; i ++)  
        x.item(i).style.backgroundColor = '3276B1' ; 
        } 
        
        function switchColors(){
        	links=document.getElementsByTagName("li") ;  
        	var element=document.getElementById("b");
        	for (var i = 0 ; i < links.length ; i ++)  
        	links.item(i).style.backgroundColor = '#3276B1' ; 
        	element.style.borderRadius="5px";
        	element.style.marginRight = "70px";
        	element.style.boxSizing = "content-box";
        	element.style.borderColor = "#3276B1";
        	element.style.background="#3276B1";
        	var list = document.getElementsByTagName("OL")[0];
        	var x=list.getElementsByTagName("LI");
        	for (var i = 0 ; i < x.length ; i ++)  
        	x.item(i).style.backgroundColor = '#3276B1' ; 
        	}
        
        
        function validateform() {
        	 
        	var legappname = document.loginForm.legappname.value
        	var description = document.loginForm.descr.value
        	var vendor = document.loginForm.vendor.value
        	var conExpDate = document.loginForm.expdate.value
        	var read = document.loginForm.rod.value
        	var daterange = document.loginForm.daterange.value
        	var data = document.loginForm.dbsize.value
        	var archival = document.loginForm.needarch.value
        	var reason = document.loginForm.archreason.value
        	var cmnt = document.loginForm.archcmnt.value


        	if(legappname=="" || description=="" || vendor == "" || conExpDate =="" || read=="" || daterange =="" || data=="" || archival=="" || reason=="" || cmnt =="")
        	 
        	{
        	alert("Please Fill the Mandatory Field");
        	}
        	else{
        	 
        	toggle();
        	}
        	}
        
        
        
        
        
        function toggle() {
        	var ele = document.getElementById("collapse2");
        	 
        	if(ele.style.display == "block") {
        	    ele.style.display = "none";
        	text.innerHTML = "show";
        	  }
        	else {
        	ele.style.display = "block";
        	text.innerHTML = "hide";
        	}
        	} 
        function validateform1() {
        	 
        	var record = document.loginForm.reccode.value
        	var trigger = document.loginForm.triggerdate.value
        	var retention = document.loginForm.retentionperiod.value
        	var table = document.loginForm.retentiontable.value
        	var path = document.loginForm.file.value
        	var name = document.loginForm.retentionname.value
        	var reason1 = document.loginForm.reason.value
        	var explain = document.loginForm.archexp.value
        	 
        	if(record ==""|| trigger==""||retention=="" ||table=="" || path == "" || name =="" || reason1 =="" || explain == "" )
        	 
        	{
        	alert("Please Fill the Mandatory Field");
        	 
        	  
        	}
        	else{
        	toggle1();
        	}
        	 
        	 
        	 
        	}
        
        
        function toggle1() {
        	var ele = document.getElementById("collapse3");
        	 
        	if(ele.style.display == "block") {
        	    ele.style.display = "none";
        	text.innerHTML = "show";
        	  }
        	else {
        	ele.style.display = "block";
        	text.innerHTML = "hide";
        	}
        	} 
        
        

        function validateform2() {
         
        var local = document.loginForm.localreq.value
        var country = document.loginForm.localcountry.value
        var infra = document.loginForm.localinf.value
        var data = document.loginForm.datacenters.value
         
        if(local ==""|| country=="" || infra =="" || data == "")
         
        {
        alert("Please Fill the Mandatory Field");
          
        }
        else{
        toggle2();
        }
        }
        
        
        
        function toggle2()
        {

        var f=document.form;
        f.method="post";
        f.action="business"
        f.submit();
        }
        
        
        function switchColors1()  
        {  
        links=document.getElementsByTagName("li") ;  
        var element=document.getElementById("c");
        for (var i = 0 ; i < links.length ; i ++)  
        links.item(i).style.backgroundColor = '#3276B1' ; 
        element.style.borderRadius="5px";
        element.style.marginRight = "100px";
        element.style.boxSizing = "content-box";
        element.style.borderColor = "#3276B1";
        element.style.background="#3276B1";
        var list = document.getElementsByTagName("OL")[0];
        var x=list.getElementsByTagName("LI");
        for (var i = 0 ; i < x.length ; i ++)  
        x.item(i).style.backgroundColor = '#3276B1' ; 


        } 
        
        
        function switchColors2()  
        {  
        links=document.getElementsByTagName("li") ;  
        var element=document.getElementById("d");
        for (var i = 0 ; i < links.length ; i ++)  
        links.item(i).style.backgroundColor = '#3276B1' ; 
        element.style.borderRadius="5px";
        element.style.marginRight = "120px";
        element.style.boxSizing = "content-box";
        element.style.borderColor = "#3276B1";
        element.style.background="#3276B1";
        var list = document.getElementsByTagName("OL")[0];
        var x=list.getElementsByTagName("LI");
        for (var i = 0 ; i < x.length ; i ++)  
        x.item(i).style.backgroundColor = '#3276B1' ; 


        } 
        
        
        
        function checkk()
        {
        document.getElementById('legappname').readOnly = true;
        document.getElementById('reftoapp').readOnly = true;
        document.getElementById('tid').readOnly = true;
        document.getElementById('descr').readOnly = true;
        document.getElementById('vendor').readOnly = true;
        document.getElementById('expirydate').readOnly = true;
        document.getElementById('noticeperiod').readOnly = true;
        document.getElementById('contractvalue').readOnly = true;
        document.getElementById('businessunits').disabled = true;
        document.getElementById('rodch').disabled = true;
        document.getElementById('rod').readOnly = true;
        document.getElementById('cmnt').readOnly = true; 
        document.getElementById('hasdep').readOnly = true; 
        document.getElementById('daterange').readOnly = true; 
        document.getElementById('dbsize').readOnly = true; 
        document.getElementById('dataloc').readOnly = true; 
        document.getElementById('siteloc').readOnly = true; 
        document.getElementById('needarch').disabled = true; 
        document.getElementById('archreason').readOnly = true; 
        document.getElementById('archcmnt').readOnly = true; 
        document.getElementById('sourceoft').disabled = true; 
        document.getElementById('btt').disabled = true; 
        document.getElementById('reccode').readOnly = true; 
        document.getElementById('triggerdate').readOnly = true; 
        document.getElementById('retentionperiod').readOnly = true; 
        document.getElementById('retentiontable').readOnly = true; 
        document.getElementById('file').readOnly = true;
        document.getElementById('retentionname').readOnly = true; 
        document.getElementById('reason_for_access').disabled = true; 
        document.getElementById('wholegal').readOnly = true; 
        document.getElementById('reason_for_access1').disabled = true; 
        document.getElementById('archexp').readOnly = true; 
        document.getElementById('btt').disabled = true;
        document.getElementById('btn_new').disabled = true; 
        document.getElementById('reason_for_access2').disabled = true; 
        document.getElementById('checkbox').disabled = true; 
        document.getElementById('checkbox1').disabled = true; 
        document.getElementById('reccode').readOnly = true; 
        document.getElementById('checkbox23').disabled = true; 
        document.getElementById('checkbox2').disabled = true;
        document.getElementById('checkbox3').disabled = true;
        document.getElementById('checkbox4').disabled = true;
        document.getElementById('checkbox5').disabled = true;
        document.getElementById('checkbox6').disabled = true;
        document.getElementById('checkbox7').disabled = true;
        document.getElementById('checkbox8').disabled = true;
        document.getElementById('checkbox9').disabled = true;
        document.getElementById('checkbox10').disabled = true;
        document.getElementById('checkbox11').disabled = true;
        document.getElementById('checkbox12').disabled = true;
        document.getElementById('checkbox13').disabled = true;
        document.getElementById('checkbox14').disabled = true;
        document.getElementById('checkbox15').disabled = true;
        document.getElementById('checkbox16').disabled = true;
        document.getElementById('checkbox17').disabled = true;
        document.getElementById('checkbox18').disabled = true;
        document.getElementById('checkbox19').disabled = true;
        document.getElementById('checkbox20').disabled = true;
        document.getElementById('checkbox21').disabled = true;
        document.getElementById('checkbox22').disabled = true;
        document.getElementById('expl').readOnly = true; 
        document.getElementById('reason_for_access4').disabled = true;
        document.getElementById('reason_for_access5').disabled = true;
        document.getElementById('reason_for_access6').disabled = true;
        document.getElementById('vendor1').readOnly = true;
        document.getElementById('reason_for_access7').disabled = true; 
        document.getElementById('vendor2').readOnly = true;
        document.getElementById('vendor3').readOnly = true;
        document.getElementById('vendor4').readOnly = true;
        document.getElementById('vendor5').readOnly = true;
        document.getElementById('vendor6').readOnly = true; 
        document.getElementById('sysreq').readOnly = true; 
        }
        
        if(document.getElementById('pwqej').value=="XR" ||document.getElementById('pwqej').value=="R" )
        	 
        	checkk();
        
        
        links=document.getElementsByTagName("li") ;  
        var element=document.getElementById("a");
        for (var i = 0 ; i < links.length ; i ++)  
        links.item(i).style.backgroundColor = '3276B1' ; 
        element.style.borderRadius="5px";
        element.style.marginRight = "70px";
        element.style.boxSizing = "content-box";
        element.style.borderColor = "#3276B1";
        element.style.background="#3276B1";
        var list = document.getElementsByTagName("UL")[0];
        var x=list.getElementsByTagName("LI");
        for (var i = 0 ; i < x.length ; i ++)  
        x.item(i).style.backgroundColor = '#3276B1' ; 

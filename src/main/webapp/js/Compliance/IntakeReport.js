$(document).ready(function () {
  var maxRows = 5;
  var categorySelect = $("#category");
  var maxRowsSelect = $("#maxRows");
  var section = 0; 
if(section==0){
	$("#prevButton").hide();
}
  makeAjaxRequest("Intake_Report_1", maxRows, section, null);

 

  categorySelect.change(function () {
    var selectedCategory = categorySelect.val();
    var selectedDirection = null;
   section=0;
    if(section==0){
	$("#prevButton").hide();
}else{
	$("#prevButton").show();
}
    
    console.log("Selected Category:", selectedCategory);
    makeAjaxRequest(selectedCategory, maxRows, section, selectedDirection);
  });

  maxRowsSelect.change(function () {
    maxRows = maxRowsSelect.val();

   console.log("Max Rows Value in Out",maxRows);
    var selectedCategory = categorySelect.val();
    var selectedDirection = null;
   
     if (section==0) {
      console.log("The value comes", maxRows)
      
      $("#prevButton").hide();
    }else if(maxRows=5000){$("#prevButton").hide();
    
   console.log("Max Rows Value in In",maxRows);
     $("#nextButton").hide();} else {
      $("#nextButton").show();
      $("#prevButton").show();
    }
    makeAjaxRequest(selectedCategory, maxRows, section, selectedDirection);
  });

  $('#nextButton').click(function () {
    console.log('Next button clicked');
    section++; 
    var selectedCategory = categorySelect.val();
    var selectedDirection = 'next'; 
    makeAjaxRequest(selectedCategory, maxRows, section, selectedDirection);
    $("#prevButton").show(); 
  });

  $('#prevButton').click(function () {
    console.log('Prev button clicked');
    if (section > 0) {
      section--; 
      var selectedCategory = categorySelect.val();
      var selectedDirection = 'prev'; 
      makeAjaxRequest(selectedCategory, maxRows, section, selectedDirection);
    }
    if (section === 0) {
      $("#prevButton").hide(); 
    }
  });

  function makeAjaxRequest(category, maxRows, section, direction) {
    $.ajax({
      url: "Compliance",
      type: 'POST',
      data: {
        category: category,
        maxRows: maxRows,
        section: section, 
        direction: direction
      },
      dataType: "json",
      beforeSend: function () {
        $('#overlay').show();
      },
      success: function (data,total_count) {
	console.log("total_count",total_count)
        $('#overlay').hide();
		filterfunction(data,category);
        console.log("MaxRows Value 2:", maxRows);
        console.log("Selected Category 2:", category);

       
        if (direction === 'next') {
          console.log("Navigating to the next page");
        } else if (direction === 'prev') {
          console.log("Navigating to the previous page");
        }
console.log("data",data);
console.log("total_count",total_count)
        if (data && data.length > 0) {
          
          var tableHtml = constructTable(data);
          $("#dynamicHeader").html(tableHtml);
           $("#nextButton").show();
        } 
        
        else {
         
        var noRecordFoundHTML = '<div style="text-align: center; font-weight: bold;">No More Record Found</div>';
    $("#dynamicHeader").html(noRecordFoundHTML);
          $("#nextButton").hide();
        }
      },
      error: function (xhr, status, error) {
        console.error("AJAX Request Error: " + error);
      }
    });
  }

  function constructTable(data) {
    var tableHtml = "<table><thead>";

    if (data.length > 0) {
      tableHtml += "<tr>";

      for (var key in data[0]) {
        if (data[0].hasOwnProperty(key)) {
          tableHtml += "<th>" + key + "</th>";
        }
      }

      tableHtml += "</tr>";
    }

    tableHtml += "</thead><tbody>";

    data.forEach(function (item) {
      tableHtml += "<tr>";

      for (var key in item) {
        if (item.hasOwnProperty(key)) {
          tableHtml += "<td>" + item[key] + "</td>";
        }
      }

      tableHtml += "</tr>";
    });

    tableHtml += "</tbody></table>";

    return tableHtml;
  }
});

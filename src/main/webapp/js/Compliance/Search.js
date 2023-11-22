var typingTimer;
var doneTypingInterval = 500;
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

$(document).on('keydown', '#Search', function () {
    clearTimeout(typingTimer);
});


function doneTyping(obj) {
    var appName = $(obj).val();
    console.log("appName",appName);

    // Check if the search value has changed
    if (appName !== lastSearchValue) {
        clearResults(); // Clear old details
        filterBySearchAjaxCall(appName,globalData);
        lastSearchValue = appName;
    }
}
function displayResults(results) {
    resultsDiv.innerHTML = '';
    if (results.length === 0) {
      resultsDiv.innerHTML = 'No results found';
      return;
    }

    results.forEach(result => {
      const div = document.createElement('div');
      div.innerHTML = JSON.stringify(result, null, 2);
      resultsDiv.appendChild(div);
    });
  }
  
function filterBySearchAjaxCall(appName,globalData) {
   
  			var data = globalData;

            // Assuming 'appendRowFunction' appends results to a container with id 'results'
            // Clear existing results
            clearResults();

            const appFilter = document.getElementById('Search');
            const searchValue = appFilter.value.trim().toLowerCase();
            const filteredData = data.filter(item => {
                for (const key in item) {
                    if (item[key].toString().toLowerCase().includes(searchValue)) {
                        return true;
                    }
                }
                return false;
            });
            console.log("filteredData", filteredData);
           
            if (filteredData.error) {
                    $("#dynamicHeader").html("Error: " + filteredData.error);
                } else {
                    var tableHtml = constructTablefilter(filteredData);;
                    $("#dynamicHeader").html(tableHtml);
                }
}

function clearResults() {
    const resultsDiv = document.getElementById('results');
    resultsDiv.innerHTML = ''; // Clear existing results
}
function constructTablefilter(filteredData) {
    var tableHtml = "<table><thead>";

    if (filteredData.length > 0) {
        tableHtml += "<tr>";

        for (var key in filteredData[0]) {
            if (filteredData[0].hasOwnProperty(key)) {
                tableHtml += "<th>" + key + "</th>";
            }
        }

        tableHtml += "</tr>";
    }

    tableHtml += "</thead><tbody>";

    filteredData.forEach(function (item) {
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

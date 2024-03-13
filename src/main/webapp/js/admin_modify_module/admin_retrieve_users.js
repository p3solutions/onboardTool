
$(document).ready(function () {
    let user;
    $.ajax({
        url: "Retrieve_users_servlet",
        type: 'POST',
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
            $('#overlay').hide();

            console.log("Users List Retrieve", data);
            if (!$.isArray(data)) {
                data = [data];
            }
            /*var parentRow = ""*/
            user = data;
            appendRowFunction(data);

        },
    });
    $('#search-input').keyup(function() {
        var searchTerm = $(this).val();
        if (searchTerm !== undefined && searchTerm.trim() !== "") {
            searchTerm = searchTerm.toLowerCase();
            var filteredUsers = user.filter(function(item) {
                if (item.uname !== undefined) {
                    return item.uname.toLowerCase().indexOf(searchTerm) !== -1;
                }
            });
            appendRowFunction(filteredUsers);
        } else {
            appendRowFunction(user);
        }
    });
});

function appendRowFunction(data) {
    $("#AdminUserslist").empty();
    if (data.length === 0) {
        var row = '<tr><td colspan="8">No records found</td></tr>';
        $("#AdminUserslist").append(row);
    } else {
        $.each(data, function (key, value) {
            var uname = value.uname;
            var ufname = value.ufname;
            var ulname = value.ulname;
            var u_email = value.u_email;
            var u_role = value.u_role;
            var random_id = value.random_id;
            if (typeof uname !== "undefined" && typeof ufname !== "undefined" && typeof ulname !== "undefined" && typeof u_email !== "undefined" && typeof u_role !== "undefined") {
                var row = "<tr>" +
                    "<td>" + uname +
                    "</td>" +
                    "<td>" + ufname +
                    "</td>" +
                    "<td>" + ulname +
                    "</td>" +
                    "<td>" + u_email +
                    "</td>" +
                    "<td>" + u_role +
                    "</td>" +
                    "<td style='display:none;'>" + random_id +
                    "</td>" +
                    "<td class='useraction mx-5' style='display:none;'><span class='fa-solid fa-pencil editpopup iconColor' id='editpopup" + random_id + "'></span>" +
                    "</td>" +
                    "<td class='useraction mx-5' style='display:none;'><span class='fa-solid fa-trash-can text-danger deletepopup'></span>" +
                    "</td>" +
                    "</tr>";

                $("#AdminUserslist").append(row);
            }
            usertablehide();
            getPagination('#admin_userslist');
        });
    }
}

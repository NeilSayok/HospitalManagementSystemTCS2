function logout(path) {
    console.log("Logout")
    $.ajax({
        type: "post",
        url: path,
        success: function (data) {
            if (data==="success"){
                window.location.href = "index.jsp";
            }
        },
        error: function (a, b, c) {
            alert("Error");

        }
    })
}

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <title>TCS HOSPITAL</title>
  <link rel="shortcut icon" href="assets/img/hospital.png">
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
  <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
  <link rel="stylesheet" href="assets/css/styles.css">
  <link rel="stylesheet" href="assets/css/TCS-Hospital-Header-slim.css">
  <link rel="stylesheet" href="assets/css/TCS-Hospital-Header.css">
  <link rel="stylesheet" href="assets/css/TCS-Hospital-Rect-Button.css">
  <link rel="stylesheet" href="assets/css/TCS-Hospital-Rounded-Button.css">
  <link rel="stylesheet" href="assets/css/TCS-Hospital-Table.css">
</head>

<body style="display: grid;grid-template-rows: 80px auto;">
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if (session.getAttribute("id")!=null){
    response.sendRedirect("home.jsp");
  }
%>
<header id="hospital-header" class="header-hospital-login">
  <h1 style="text-align: center;font-size: xx-large;">ABC Hospital Management System</h1>
</header>

<div class="login-clean">
  <form method="post" action="javascript:;" onsubmit="handelLogin()">
    <div class="illustration"><img src="assets/img/hospital.png" style="width: 80px;"></div>
    <h2 style="text-align: center;font-size: x-large;">Login Form</h2>
    <div class="form-group"><input class="form-control" type="text" id="uname" placeholder="User ID"></div>
    <div class="form-group"><input class="form-control" type="password" id="upass" placeholder="Password"></div>
    <div class="form-group"><button id="loginbtn" class="btn btn-primary btn-block" type="submit" style="background-color: #269bf4;">Log In</button></div>
  </form>
</div>

<script>
  function handelLogin(){
    <%--${pageContext.request.contextPath}--%>
    $("#loginbtn").prop('disabled',true);
    $.ajax({
      type: "post",
      url: "/Servlets/Login",
      data : "uname=" + $('#uname').val() + "&upass=" + $('#upass').val(),
      success: function (data) {
        if (data === "error"){
          alert("Please Check Your User ID or Password");
          $("#loginbtn").prop('disabled',false);
        }
        else if (data==="success"){
          window.location.href = "home.jsp";
          $('body').fadeOut(500);
          $("#loginbtn").prop('disabled',false);

        }else{
          alert("Error");
          $("#loginbtn").prop('disabled',false);

        }

      },
      error: function (a, b, c) {
        alert("Error");
        $("#loginbtn").prop('disabled',false);


      }
    })
  }
</script>

</body>

</html>
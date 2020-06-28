<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>TCS HOSPITAL</title>
    <link rel="shortcut icon" href="assets/img/hospital.png">

    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/TCS-Hospital-Header-slim.css">
    <link rel="stylesheet" href="assets/css/TCS-Hospital-Header.css">
    <link rel="stylesheet" href="assets/css/TCS-Hospital-Rect-Button.css">
    <link rel="stylesheet" href="assets/css/TCS-Hospital-Rounded-Button.css">
    <link rel="stylesheet" href="assets/css/TCS-Hospital-Table.css">

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/script.js"></script>
</head>

<body style="display: grid;grid-template-rows: 120px auto;">

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("id") == null) {
        response.sendRedirect("index.jsp");
    } else {
        System.out.println(session.getAttribute("timestamp"));
    }

    String time = String.valueOf(session.getAttribute("timestamp"));
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date d = null;
    Date newDate = null;
    String sessionendTime = null;
    try {
        d = df.parse(time);
        newDate = new Date(d.getTime() + 3600 * 1000);
        sessionendTime = df.format(newDate);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<header id="hospital-header" class="header-hospital">
    <h1 style="text-align: center;font-size: xx-large;">ABC Hospital Management System</h1>
    <div style="display: flex;padding-top: 16px;justify-content: center;">
        <div class="dropdown header-dropdown">
            <button class="btn btn-primary dropdown-toggle dropdown-btn" data-toggle="dropdown" aria-expanded="false"
                    type="button">Patient
            </button>
            <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation" href="#">First
                Item</a><a class="dropdown-item" role="presentation" href="#">Second Item</a><a class="dropdown-item"
                                                                                                role="presentation"
                                                                                                href="#">Third Item</a>
            </div>
        </div>
        <div class="dropdown header-dropdown">
            <button class="btn btn-primary dropdown-toggle dropdown-btn" data-toggle="dropdown" aria-expanded="false"
                    type="button">Pharmacy
            </button>
            <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation" href="#">First
                Item</a><a class="dropdown-item" role="presentation" href="#">Second Item</a><a class="dropdown-item"
                                                                                                role="presentation"
                                                                                                href="#">Third Item</a>
            </div>
        </div>
        <div class="dropdown header-dropdown">
            <button class="btn btn-primary dropdown-toggle dropdown-btn" data-toggle="dropdown" aria-expanded="false"
                    type="button">Diagnostics
            </button>
            <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation" href="#">First
                Item</a><a class="dropdown-item" role="presentation" href="#">Second Item</a><a class="dropdown-item"
                                                                                                role="presentation"
                                                                                                href="#">Third Item</a>
            </div>
        </div>
        <button class="btn btn-primary btn-block icon-button" type="button" style="color:black;width: 8rem;" onclick="logout('/Servlets/Logout')"><i
                class="fas fa-power-off"></i><span>Logout</span></button>
    </div>
</header>
<div>
    <h3 style="text-align: center;padding-bottom: 24px;">Welcome</h3>
    <p style="text-align: center;">Name:<span id="name_id"><%=session.getAttribute("name")%></span></p>
    <p style="text-align: center;">User ID:<span id="user_id"><%=session.getAttribute("login")%></span></p>
    <p style="text-align: center;">Login Time:<span id="user_login_time"><%=time%></span></p>
    <p style="text-align: center;">Session Expire Time:<span id="session_expire_time"><%=sessionendTime%></span></p>
</div>

</body>

</html>
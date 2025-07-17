<%@page errorPage="error.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%
    String email = session.getAttribute("email").toString();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Details</title>

    <!-- ✅ Font Awesome 4.7.0 CDN (Matches your screenshot) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Your CSS -->
    <link rel="stylesheet" href="css/home-style.css">
</head>
<body>

    <div class="topnav sticky">
        <center><h2>Change Details <i class="fa fa-edit"></i></h2></center>

        <h2><a href="home.jsp"><i class="fa fa-arrow-circle-left"></i> Back</a></h2>

        <h2>
            <a href="#"><i class="fa fa-user"></i> Your Profile (<%= email %>)</a>
        </h2>

        <a href="changePassword.jsp"><i class="fa fa-key"></i> Change Password</a>
        <a href="addChangeAddress.jsp"><i class="fa fa-map-marker"></i> Add or change Address</a>
        <a href="changeSecurityQuestion.jsp"><i class="fa fa-repeat"></i> Change Security Question</a>
        <a href="changeMobileNumber.jsp"><i class="fa fa-phone"></i> Change Mobile Number</a>
    </div>

    <br>

 
<%@ page import="java.io.*, java.util.*" %>

<%
    session.invalidate();

    // Set cache-control headers to prevent caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-image: url("img/background3.jpg");
		    background-repeat: no-repeat;
		    background-size: cover;
		    background-attachment: fixed;
        }

        .loader {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #3498db;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
    </style>
</head>
<body>
    <h1>Logged Out Successfully</h1>
    <div class="loader"></div>
    <p>Redirecting to the Login Page...</p>
    
    <%
        response.setHeader("Refresh", "3; URL=http://localhost:8080/ServiceSprint/index.jsp");
    %>
</body>
</html>

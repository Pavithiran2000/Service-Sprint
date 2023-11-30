<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
    
<%
Properties property = new Properties();
InputStream input_stream = application.getResourceAsStream("authorization.properties");
property.load(input_stream);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Sprint</title>
<link href="img/icon.png" rel="icon" />
<link rel="stylesheet" href="css/style.css">
</head>
<body>
  <div class="form">
    <h1>Sign In </h1>
    <hr>
    <div>
      <h2 style="color:brown;">WELCOME TO</h2>
    </div>
    <div class="logo">
      <img src="img/logo.png" alt="logo-signin">
    </div>
        <div class="button" onclick="window.location.href='<%= property.getProperty("auth_endpoint") %>?scope=<%= property.getProperty("scope") %>&response_type=<%= property.getProperty("response_type") %>&redirect_uri=<%= property.getProperty("redirect_uri") %>&client_id=<%= property.getProperty("client_id") %>'" >
          <img src="img/asgardeo.png" alt="logo asgardeo"><span>Sign In with Asgardeo</span>
      </div>
    </div>
</body>
</html>
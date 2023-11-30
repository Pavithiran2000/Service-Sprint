<%@ page import="com.services.authentication.Authentication" %>
<%@page import="com.services.database.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@include file="profile.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Past Reservations</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h4 {
            color: #333;
        }
        .table {
            width: 80%;
            margin: 20px auto;
            margin-top: 80px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: rgb(5, 133, 111);
            color: #fff;
        }
    </style>
</head>
<body>
    <%
    try {
        String username = (String) request.getSession().getAttribute("username");
        DbConnection dbConnection = new DbConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM vehicle_service WHERE username=? AND date <= NOW()");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
    %>
    <h2 style="text-align: center;">Past Registration Records</h2>
    
    <table class="table">
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Date</th>
                <th>Time</th>
                <th>Location</th>
                <th>Vehicle Number</th>
                <th>Mileage</th>
                <th>Message</th>
            </tr>
        </thead>
        <tbody>
            <%
            do {
            %>
            <tr>
                <td><%= rs.getString(1) %></td>
	            <td><%= rs.getString(2) %></td>
	            <td><%= rs.getString(3) %></td>
	            <td><%= rs.getString(4) %></td>
	            <td><%= rs.getString(5) %></td>
	            <td><%= rs.getString(6) %></td>
	            <td><%= rs.getString(7) %></td>
            </tr>
            <%
            } while (rs.next());
            %>
        </tbody>
    </table>
    <%
        } else {
    %>
    <p style="color: black; text-align: center; margin-top: 100px;">No Past Reservations Found.</p>
    <%
        }
        rs.close();
        dbConnection.closeConnection(connection);
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</body>
</html>

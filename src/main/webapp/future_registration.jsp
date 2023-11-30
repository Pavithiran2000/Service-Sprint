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
    <title>Future Registrations</title>
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

        .table th {
            background-color: rgb(5, 133, 111);
            color: #fff;
        }
        .delete-btn {
            font: 15px/28px rgb(255, 255, 255);
            background: orangered;
            padding: 5px 20px;
            border: outset 0px rgb(244, 152, 146);
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
            color: white;
            transition: background-color 0.3s ease;
        }

        .delete-btn:hover {
            background: rgb(255, 235, 234);
            color: rgb(244, 152, 146);
        }
    </style>
</head>
<body>
    <%
    try {
        String username = (String) request.getSession().getAttribute("username");
        DbConnection dbConnection = new DbConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM vehicle_service WHERE username=? AND date > NOW()");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
    %>
<h2 style="text-align: center;">Future Registration Records</h2>
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
                <th>Action</th>
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
                <td>
                    <form method="post" action="delete_registration.jsp">
                        <input type="hidden" name="booking_id" value="<%= rs.getString("booking_id") %>">
                        <input type="submit" class="delete-btn" value="Delete" onclick="return confirm('Are you sure you want to delete this registration?')">
                    </form>
                </td>
            </tr>
            <%
            } while (rs.next());
            %>
        </tbody>
    </table>
    <%
        } else {
    %>
    <p style="color: black; text-align: center; margin-top: 100px;">No Future Reservations Found.</p>
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

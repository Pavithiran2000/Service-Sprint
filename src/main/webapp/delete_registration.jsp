<%@page import="com.services.database.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

<%
if (request.getParameter("booking_id") != null) {
    String bookingId = request.getParameter("booking_id");
    try {
        DbConnection dbConnection = new DbConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement ps = connection.prepareStatement("DELETE FROM vehicle_service WHERE booking_id = ?");
        ps.setString(1, bookingId);
        ps.executeUpdate();
        dbConnection.closeConnection(connection);
        response.sendRedirect("future_registration.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

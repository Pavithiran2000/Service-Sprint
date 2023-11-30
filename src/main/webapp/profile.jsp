<%@ page import="java.io.*, java.net.*, java.util.*" %>
<%@ page import="org.json.JSONObject" %>

<%String sessionState = (String) session.getAttribute("sessionState"); 
  String client_id="ldAWxtgu8FWfE1ySZvws1ZyuFfAa" ;
%> 
<%
  String access_token = (String) request.getSession().getAttribute("access_token");
  if (access_token != null && !access_token.isEmpty()) {
      try {
          Properties property = new Properties();
          InputStream input_stream = application.getResourceAsStream("/authorization.properties");
          property.load(input_stream);

          String userinfo_endpoint = property.getProperty("userinfo_endpoint");

          // Setup URL for user Info
          URL userinfo_url = new URL(userinfo_endpoint);
          HttpURLConnection userinfo_connection = (HttpURLConnection) userinfo_url.openConnection();
          userinfo_connection.setRequestMethod("GET");
          userinfo_connection.setRequestProperty("Authorization", "Bearer " + access_token);

          // Get the response code and Read the response data from the userinfo endpoint
          int userinfo_response_code = userinfo_connection.getResponseCode();

          // Parse the userinfo response data as JSON
          try (BufferedReader userinfo_reader = new BufferedReader(new InputStreamReader(userinfo_connection.getInputStream()))) {
              StringBuilder userinfo_response = new StringBuilder();
              String userinfo_input_line;

              while ((userinfo_input_line = userinfo_reader.readLine()) != null) {
                  userinfo_response.append(userinfo_input_line);
              }

              JSONObject userinfo_json = new JSONObject(userinfo_response.toString());
		
              String username = userinfo_json.optString("username");
              session.setAttribute("username", username);
              UserInfo user = extractUserInfo(userinfo_json);
%> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Service Sprint </title>
    <link href="img/icon.png" rel="icon" />

    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>

<body>

<header>
    <img src="img/logo.png" alt="Logo" height="70">


    <ul class="navbar">
        <li><a class="nav-link" href="about.jsp">Home</a></li>
        <li><a class="nav-link" href="service_registration.jsp">Add Reservation</a></li>
        <li><a class="nav-link" href="future_registration.jsp">Future Reservation</a></li>
        <li><a class="nav-link" href="past_registration.jsp">Past Reservation</a></li>
    </ul>
    
    <div class="profile-icon">
        <img src="img/User.png" alt="Profile" width="40" height="40">
        <div class="profile-details">
        <table>
            <tr>
                <td class="info-label">User Name: </td>
                <td class="info-value"><%= user.getUsername() %></td>
            </tr>
            <tr>
                <td class="info-label">Name: </td>
                <td class="info-value"><%= user.getName() %></td>
            </tr>
            <tr>
                <td class="info-label">Email: </td>
                <td class="info-value"><%= user.getEmail() %></td>
            </tr>
            <tr>
                <td class="info-label">Contact No:</td>
                <td class="info-value"><%= user.getContactNo() %></td>
            </tr>
            <tr>
                <td class="info-label">Country: </td>
                <td class="info-value"><%= user.getCountry() %></td>
            </tr>
            <tr>
                <td colspan="2" class="info-label"><a href="logout.jsp">Logout</a></td>
            </tr>
        </table>
            
        </div>
    </div>

</header>

</body>
</html>

<%
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>

<%!
class UserInfo {
    private String username;
    private String name;
    private String email;
    private String contactNo;
    private String lastName;
    private String country;


    // Constructors
    public UserInfo(String username, String name, String email, String contactNo, String lastName, String country) {
        this.username = username;
        this.name = name;
        this.email = email;
        this.contactNo = contactNo;
        this.lastName = lastName;
        this.country = country;

    }

    // Getters
    public String getUsername() {
        return username;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getContactNo() {
        return contactNo;
    }

    public String getLastName() {
        return lastName;
    }

    public String getCountry() {
        return country;
    }
}
%>

<%!
UserInfo extractUserInfo(JSONObject userinfoJson) {
    String username = userinfoJson.optString("username");
    String name = userinfoJson.optString("given_name");
    String email = userinfoJson.optString("email");
    String contactNo = userinfoJson.optString("phone_number");
    String lastName = userinfoJson.optString("family_name");
    JSONObject addressObject = userinfoJson.optJSONObject("address");
    String country = (addressObject != null) ? addressObject.optString("country") : "";
        
    return new UserInfo(username, name, email, contactNo, lastName, country);
}
%>

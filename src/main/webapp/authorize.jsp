<%@ page import="java.io.*, java.net.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONObject" %>

<%
    // Retrieve authorization code from request parameters
    String code = request.getParameter("code");
    String sessionState = request.getParameter("session_state");
    session.setAttribute("sessionState", sessionState);

    String client_id = null;
    String client_secret = null;
    String token_endpoint = null;
    String redirect_uri = null;

    Properties property = new Properties();
    InputStream input_stream = application.getResourceAsStream("authorization.properties");
    try {
        property.load(input_stream);

        client_id = property.getProperty("client_id");
        client_secret = property.getProperty("client_secret");
        token_endpoint = property.getProperty("token_endpoint");
        redirect_uri = property.getProperty("redirect_uri");
    } catch (IOException e) {
        e.printStackTrace();
    } finally {
        if (input_stream != null) {
            try {
            	input_stream.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    if (code != null && !code.isEmpty() && client_id != null && client_secret != null && token_endpoint != null && redirect_uri != null) {
        try {
            // Construct request data for token exchange
            StringBuilder requestDataBuilder = new StringBuilder();
            requestDataBuilder.append("code=").append(code)
                    .append("&grant_type=authorization_code")
                    .append("&client_id=").append(client_id)
                    .append("&client_secret=").append(client_secret)
                    .append("&redirect_uri=").append(URLEncoder.encode(redirect_uri, "UTF-8"));

            String requestData = requestDataBuilder.toString();

            // Construct the URL and connection for token exchange
            URL token_url = new URL(token_endpoint);
            HttpURLConnection token_connection = (HttpURLConnection) token_url.openConnection();
            token_connection.setRequestMethod("POST");
            token_connection.setDoOutput(true);

            // Prepare the request data
            try (DataOutputStream token_output_stream = new DataOutputStream(token_connection.getOutputStream())) {
                token_output_stream.writeBytes(requestData);
                token_output_stream.flush();
            }

            // Get the response code Read the response data from the token endpoint
            int token_response_code = token_connection.getResponseCode();

            try (BufferedReader token_reader = new BufferedReader(new InputStreamReader(token_connection.getInputStream()))) {
                StringBuilder token_response = new StringBuilder();
                String token_input_line;

                while ((token_input_line = token_reader.readLine()) != null) {
                    token_response.append(token_input_line);
                }

                // Process the response data
                String response_data_str = token_response.toString();
                JSONObject json_response = new JSONObject(response_data_str);

                String access_token = json_response.getString("access_token");
                String id_token = json_response.getString("id_token");

                request.getSession().setAttribute("access_token", access_token);
                request.getSession().setAttribute("id_token", id_token);

                response.sendRedirect("about.jsp");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    } else {
        out.println("Error: Authorization code or required properties are missing.");
    }
%>

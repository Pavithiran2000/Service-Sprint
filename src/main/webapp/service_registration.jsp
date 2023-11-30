<%@ page import="com.services.authentication.Authentication" %>
<%@ include file="profile.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.services.database.DbConnection" %>
<%
if (!Authentication.isAuthenticatedSuccess(request)) {
    response.sendRedirect("index.jsp");
}
%>

<%
String username = (String) request.getSession().getAttribute("username");

if (request.getParameter("submit") != null) {
    String dateString = request.getParameter("date");
    String timeString = request.getParameter("preferred-time");
    String location = request.getParameter("preferred-location");
    String mileageStr = request.getParameter("current-mileage");
    String vehicleNo = request.getParameter("reg1") + request.getParameter("reg2") + " - " +
            request.getParameter("reg3") + request.getParameter("reg4") +
            request.getParameter("reg5") + request.getParameter("reg6");
    String message = request.getParameter("message");

    try {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsedDate = dateFormat.parse(dateString);
        java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

        int mileage = Integer.parseInt(mileageStr);

        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        java.util.Date parsedTime = timeFormat.parse(timeString);
        java.sql.Time sqlTime = new java.sql.Time(parsedTime.getTime());

        DbConnection dbConnection = new DbConnection();
        Connection connection = dbConnection.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO vehicle_service (date, time, location, vehicle_no, mileage, message, username) VALUES (?, ?, ?, ?, ?, ?, ?)");

        preparedStatement.setDate(1, sqlDate);
        preparedStatement.setTime(2, sqlTime);
        preparedStatement.setString(3, location);
        preparedStatement.setString(4, vehicleNo);
        preparedStatement.setInt(5, mileage);
        preparedStatement.setString(6, message);
        preparedStatement.setString(7, username);

        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("service_registration.jsp?msg=success");
        } else {
            response.sendRedirect("service_registration.jsp?msg=failure");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("service_registration.jsp?msg=exception");
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <style>
    		body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('img/about.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            height: 100vh;
        	}

	        #reservation-form {
	            width: 450px; 
	            margin: 0 auto;
	            margin-right:50px;
	            background-color: rgba(255, 255, 255, 0.8);
	            padding: 30px;
	            border-radius: 10px;
	            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	        }
        	#service {
                text-align: center;
                padding: 50px;
                font-family: Arial;
            }

            h2 {
                color: #333;
            }



            label {
                display: block;
                margin-top: 10px;
                font-weight: bold;
            }
            #registration-inputs {
            display: flex;
            align-items: center;
	        }
	
	        #registration-inputs input {
	            text-align: center;
	            width: 30px;
	            height: 30px;
	            margin: 0 5px;
	            border: 1px solid #ccc;
	            border-radius: 5px;
	            font-size: 16px;
	        }
	
	        #registration-inputs span {
	            font-size: 18px;
	        }
            #date,#current-mileage{
            box-sizing: border-box;
            padding: 10px;
            }
            input{
            width: 100%;
            margin-top: 5px;
            margin-bottom: 15px;
            }
            
            select,
            textarea {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 15px;
                box-sizing: border-box;
            }

            button[type="submit"] {
            background-color: orangered;
            color: white;
            padding: 15px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
	        }
	
	        button[type="submit"]:hover {
	            background-color: #ffebf0;
	            color: #f49892;
	        }

            #date-error {
                color: red;
            }    
    </style>
</head>
<body>
<section id="service">
    <form id="reservation-form" method="post" action="">
        <input type="hidden" id="username" name="username" value="<%= username %>">
        <label for="date">Date</label>
        <input type="date" name="date" id="date" placeholder="Enter date" class="form-control" required>
        <span id="date-error" style="color: red;"></span>

        <label for="preferred-time">Preferred Time:</label>
        <select id="preferred-time" name="preferred-time">
            <option value="10:00:00">--Select--</option>    
            <option value="11:00:00">8 AM</option>
            <option value="12:00:00">9 AM</option>
            <option value="10:00:00">10 AM</option>
            <option value="11:00:00">11 AM</option>
            <option value="12:00:00">12 PM</option>            
            <option value="11:00:00">1 PM</option>
            <option value="12:00:00">2 PM</option>         
            <option value="11:00:00">3 AM</option>
            <option value="12:00:00">4 PM</option>
        </select>

        <label for="preferred-location">Preferred Location:</label>
        <select id="preferred-location" name="preferred-location">
            <option value="Jaffna">--Select--</option>
            <option value="Jaffna">Jaffna</option>
            <option value="Kilinochchi">Kilinochchi</option>
            <option value="Mannar">Mannar</option>
            <option value="Mullaitivu">Mullaitivu</option>
            <option value="Vavuniya">Vavuniya</option>
            <option value="Colombo">Colombo</option>
            <option value="Gampaga">Gampaga</option>
            <option value="Kaluthara">Kaluthara</option>
            <option value="Galle">Galle</option>
            <option value="Matara">Matara</option>
            <option value="Hambanthota">Hambanthota</option>
            <option value="Kandy">Kandy</option>
            <option value="Matale">Matale</option>
            <option value="Nuwara Eliya">Nuwara Eliya</option>
            <option value="Kegalle">Kegalle</option>
            <option value="Ratnapura">Ratnapura</option>
            <option value="Anuradhapura">Anuradhapura</option>
            <option value="Polonnaruwa">Polonnaruwa</option>
            <option value="Puttalam">Puttalam</option>
            <option value="Kurunegala">Kurunegala</option>
            <option value="Badulla">Badulla</option>
            <option value="Monaragala">Monaragala</option>
            <option value="Trincomalee">Trincomalee</option>
            <option value="Batticaloa">Batticaloa</option>
            <option value="Ampara">Ampara</option>
        </select>

        <label for="vehicle-registration">Vehicle Registration Number:</label>
        <div id="registration-inputs">
            <input type="text" id="reg1" name="reg1" maxlength="1" style="width: 20px; text-align: center;" required>
            <input type="text" id="reg2" name="reg2" maxlength="1" style="width: 20px; text-align: center;" required>
            <span style="margin: 0 5px;">-</span>
            <input type="text" id="reg3" name="reg3" maxlength="1" style="width: 20px; text-align: center;" required>
            <input type="text" id="reg4" name="reg4" maxlength="1" style="width: 20px; text-align: center;" required>
            <input type="text" id="reg5" name="reg5" maxlength="1" style="width: 20px; text-align: center;" required>
            <input type="text" id="reg6" name="reg6" maxlength="1" style="width: 20px; text-align: center;" required>
        </div>

        <label for="current-mileage">Current Mileage:</label>
        <input type="number" id="current-mileage" name="current-mileage" required>

        <label for="message">Message:</label>
        <textarea id="message" name="message"></textarea>

        <button type="submit" name="submit">Reserve</button>
    </form>
</section>

<script>
var dateInput = document.getElementById('date');
//Function to check if a given date is a Sunday
function isSunday(date) {
 return date.getDay() === 0; 
}
//Set the minimum value of the date input to the current day
var currentDate = new Date().toISOString().split('T')[0]; 
dateInput.min = currentDate;
    function validateDate() {
    var selectedDate = new Date(dateInput.value);
    var currentDate = new Date();
    
    // Check if the selected date is a Sunday or earlier than the current date
    if (isSunday(selectedDate) || selectedDate < currentDate) {
        document.getElementById('date-error').innerText = 'Please select a valid date (after today and not a Sunday).';
        dateInput.value = ''; 
    } else {
        document.getElementById('date-error').innerText = ''; 
    }
    }

dateInput.addEventListener('change', validateDate);

const regInputs = document.querySelectorAll('#registration-inputs input');
    // Add event listeners to each input field
    regInputs.forEach((input, index) => {
        input.addEventListener('input', (e) => {
            const val = e.target.value;
            if (val.length === 1 && index < regInputs.length - 1) {
                regInputs[index + 1].focus(); // Move focus to the next input
            }
        });

        // When the Backspace key is pressed, move to the previous input field
        input.addEventListener('keydown', (e) => {
            if (e.key === 'Backspace' && index > 0 && !e.target.value) {
                regInputs[index - 1].focus(); 
            }
        });
    });
</script>

</body>
</html>

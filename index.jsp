<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Interactive JSP Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            color: #000000;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }
        input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #003d80;
        }
        .message {
            margin-top: 20px;
            padding: 15px;
            background-color: #e7f4ff;
            border-left: 5px solid #0056b3;
        }
        .error {
            background-color: #ffebe8;
            border-left: 5px solid #e74c3c;
            color: #000000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Enter Your Name</h2>
        <form action="Project.jsp" method="post">
            <input type="text" name="username" placeholder="Enter your name here" required>
            <input type="submit" name="action" value="Submit Name">
            <input type="submit" name="action" value="Orel and Netanel">
        </form>

        <%
            String name = request.getParameter("username");
            String action = request.getParameter("action");
            // Regular expression to ensure the name contains only letters (both lowercase and uppercase)
            String regex = "^[a-zA-Z]+$";
            
            if (name != null && !name.isEmpty()) {
                if (!name.matches(regex)) {
                    // If the name contains anything other than letters, print an error message
                    out.println("<div class='message error'><h3>Error: Name must contain letters only. Please try again.</h3></div>");
                } else {
                    // Proceed with the original logic if the input is valid
                    if ("Say Hello".equals(action)) {
                        out.println("<div class='message'><h3>Hello, " + name + "!</h3></div>");
                    } else if ("Submit Name".equals(action)) {
                        out.println("<div class='message'><h3>Name submitted: " + name + "</h3></div>");
                    }
                }
            }
        %>
    </div>
</body>
</html>
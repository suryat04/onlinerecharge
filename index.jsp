<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin and User Login | Registration</title>
    <style>
        /* Body styling */
        body {
            background: linear-gradient(to right, #2196F3, #21CBF3);
            font-family: 'Arial', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Main container */
        .container {
            width: 100%;
            max-width: 600px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            overflow-y: auto;  /* Enable vertical scrolling */
            background-image: url("path/to/your/background.jpg");  /* Replace with your image path */
            background-attachment: fixed;
            background-size: cover;
            background-position: center;
        }

        /* Main heading */
        h1 {
            text-align: center;
            margin: 20px 0;
            color: #333;
        }

        /* Styling for the tab container */
        .tab-header {
            display: flex;
            justify-content: space-around;
            background-color: #333;
        }

        .tab-header button {
            flex: 1;
            padding: 15px;
            cursor: pointer;
            color: white;
            background-color: #444;
            border: none;
            outline: none;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        .tab-header button:hover {
            background-color: #555;
        }

        .tab-header button.active {
            background-color: #2196F3;
        }

        /* Content for each tab */
        .tab-content {
            display: none;
            padding: 20px;
        }

        .tab-content.active {
            display: block;
        }

        /* Form Styling */
        form {
            display: flex;
            flex-direction: column;
        }

        input {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #2196F3;
            outline: none;
        }

        button {
            padding: 10px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            font-size: 16px;
        }

        button:hover {
            background-color: #1976D2;
            transform: translateY(-2px);
        }

        /* Error message styling */
        .error {
            color: red;
            font-weight: bold;
            margin: 10px 0;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to Online Recharge Platform</h1>
        <div class="tab-header">
            <button class="tab-link active" onclick="openTab(event, 'admin')">Admin Login</button>
            <button class="tab-link" onclick="openTab(event, 'user')">User Login</button>
            <button class="tab-link" onclick="openTab(event, 'register')">Register</button>
        </div>

        <div id="admin" class="tab-content active">
            <h2>Admin Login</h2>
            <form action="admin" method="post">
                <label for="adminname">Admin Name:</label>
                <input type="text" name="adminname" required>

                <label for="password">Password:</label>
                <input type="password" name="password" required>

                <button type="submit">Login as Admin</button>
            </form>
        </div>

        <div id="user" class="tab-content">
            <h2>User Login</h2>
            <form action="login" method="post">
                <label for="username">Username:</label>
                <input type="text" name="username" required>

                <label for="password">Password:</label>
                <input type="password" name="password" required>

                <button type="submit">Login as User</button>
            </form>
        </div>

        <div id="register" class="tab-content">
            <h2>User Registration</h2>
            <c:if test="${not empty errorMessage}">
                <h3 class="error">${errorMessage}</h3>
            </c:if>
            <form action="register" method="post">
                <label for="username">Username:</label>
                <input type="text" name="username" required>

                <label for="password">Password:</label>
                <input type="password" name="password" required>

                <label for="email">Email:</label>
                <input type="email" name="email" required>

                <button type="submit">Register</button>
            </form>
        </div>
    </div>

    <script>
        // JavaScript function to switch between tabs
        function openTab(event, tabId) {
            // Hide all tab contents
            const contents = document.getElementsByClassName("tab-content");
            for (let i = 0; i < contents.length; i++) {
                contents[i].classList.remove("active");
            }

            // Remove active class from all buttons
            const buttons = document.getElementsByClassName("tab-link");
            for (let i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove("active");
            }

            // Show the selected tab and activate its button
            document.getElementById(tabId).classList.add("active");
            event.currentTarget.classList.add("active");
        }
    </script>

</body>
</html>
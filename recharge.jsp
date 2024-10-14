<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Mobile Recharge</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .recharge-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            margin-top: 10px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="recharge-container">
        <h2>Online Mobile Recharge</h2>
       <form id="rechargeForm" action="Recharge" method="post">
    <label for="name">Name:</label>
    <input type="text" name="name" required>

    <label for="mobileNumber">Mobile Number:</label>
    <input type="text" name="mobileNumber" required pattern="[0-9]{10}" title="Please enter a valid 10-digit mobile number.">

    <label for="networkType">Network Type:</label>
    <select name="networkType" required>
        <option value="">Select Network Type</option>
        <option value="prepaid">Pre-paid</option>
        <option value="postpaid">Post-paid</option>
    </select>

    <label for="networkName">Network Name:</label>
    <select name="networkName" required>
        <option value="">Select Network Name</option>
        <option value="vodafone">V!</option>
        <option value="airtel">Airtel</option>
        <option value="jio">Jio</option>
        <option value="bsnl">BSNL</option>
        <option value="idea">MNTL</option>
        
    </select>

    <label for="rechargePlan">Select Plan:</label>
    <select name="rechargePlan" required>
        <option value="">Select Plan</option>
        <option value="10">₹10 - Talk time</option>
        <option value="50">₹50 - 1GB Data</option>
        <option value="100">₹100 - 3GB Data</option>
        <option value="200">₹200 - Unlimited Calls</option>
        <option value="500">₹500 - 5GB Data + 1000 Minutes</option>
    </select>

    <button type="submit">Recharge</button>
</form>

    </div>

    <script>
        // Optional JavaScript for client-side validation or dynamic behavior
        document.querySelector("form").addEventListener("submit", function(event) {
            const mobileNumber = document.querySelector("input[name='mobileNumber']").value;
            const amount = document.querySelector("select[name='rechargePlan']").value;

            // Basic validation for mobile number and amount
            if (mobileNumber.length !== 10) {
                event.preventDefault();
                document.getElementById("error-message").innerText = "Mobile number must be 10 digits long.";
            } else if (!amount) {
                event.preventDefault();
                document.getElementById("error-message").innerText = "Please select a recharge plan.";
            } else {
                document.getElementById("error-message").innerText = ""; // Clear error message if valid
            }
        });
    </script>
</body>
</html>

<%-- 
    Document   : password_change
    Created on : 29 Mar, 2025, 7:59:07 PM
    Author     : Shobika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .main {
            width: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
             background-color:#062c5f;
        }

        .container {
            width: 600px;
            background: white;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 40px;
        }

        .header_main {
            font-size: 28px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        .detail-box {
            width: 100%;
            height: 40px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            padding: 10px;
            box-sizing: border-box;
            color: #555;
            border-radius: 5px;
        }

        .detail-box:hover {
            border-color: #4CAF50;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #4CAF50;
            outline: none;
        }

        .btn-container {
            text-align: center;
        }

        button {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 12px 25px;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
            font-size: 16px;
        }

        button:hover {
            background: #45a049;
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 30px;
            }
        }
    </style>
</head>
<body>

<div class="main">
    <div class="container">
        <div class="header_main">CHANGE PASSWORD</div>

        <form action="change_password.java" method="POST">
            
            <div>
                <label for="faculty_name">Name of Faculty:</label>
                <div class="detail-box">   ${Fname}</div> 
            </div>

            <div>
                <label for="faculty_no">Faculty No:</label>
                <div class="detail-box"> ${FID}</div>
            </div>

            <div>
                <label for="department">Department Name:</label>
                <div class="detail-box"> ${FDept}</div>
            </div>
        </form>
            <form name ="otpgenerateform"action="otpgeneratepage" method="post">
             
                     <div class="btn-container">
                <button type="submit">Genarate OTP</button>
            </div>
            </form>
            <form name="passwordform" action="change_password" >
                    <div>                   
                <label for="otpverfication">Enter OTP:</label>
                <input type="text"  name="otpverfication" placeholder="Enter OTP">
            </div>
            <div>
                <label for="new_password">Enter New Password:</label>
                <input type="password" name="new_password" placeholder="Enter New Password" required>
            </div>
            <div>
                <label for="re_new_password">Re-Enter Password:</label>
                <input type="password" name="re_new_password" placeholder="Re-Enter Password" required>
            </div>
                    <div class="btn-container">
                <button type="submit">Change Password</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>

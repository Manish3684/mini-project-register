<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
        <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Teacher Web Interface</title>
                <style>
                        body {
                                display: flex;
                                flex-direction: column;
                                align-items: center;
                                justify-content: center;
                                min-height: 100vh;
                                margin: 0;
                                font-family: sans-serif;
                                background-color: #f4f4f9;
                        }
                        .logo {
                                width: 50%;
                                height: 100px;
                                display: flex;
                                align-items: center;
                                justify-content: center;                           
                        }
                        .logo img {
                                max-height: 100%;
                                max-width: 100%;
                        }
                        .main {
                                width: 33%;
                                display: flex;
                                flex-direction: column;
                                align-items: center;
                                border: 0.5px solid lightgray;
                                border-radius: 15px;
                                background-color: #ffffff;           
                                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                                margin-top: 10px;
                        }
                        .header {
                                width: 100%;
                                text-align: center;
                                line-height: 40px;
                                font-weight: bold;
                                background-color: #069ed1;
                                color: white;            
                                border-radius: 15px 15px 0 0;
                                border-bottom:4px solid black;
                        }
                        .body {
                                width: 100%;
                                display: flex;
                                flex-direction: column;
                                gap: 50px;
                                padding: 10px;
                        }
                        .body label {
                                font-weight: 10px;
                                color: lightgrey;           
                        }
                        .body input {
                                width: 100%;
                                padding:5px;
                                border:none;            
                                outline: none;
                                border-bottom: 1px solid black;

                        }
                        #captcha {
                                display: flex;
                                align-items: center;
                                justify-content: center;
                                width: 40%;
                                height: 40px;
                                margin: 10px auto;
                                border: 1px solid black;
                                font-size: 20px;
                                text-align: center;
                        }
                        #button_sub {
                                cursor: pointer;
                                border: none;
                                background-color: #069ed1;
                                border-radius: 15px;
                                color: white;
                                padding: 10px;
                                font-size: 14px;
                                font-weight: bold;
                                margin-top: 10px;
                                width: 100%;
                                margin-left: 20%;
                        }
                        .body_submit {
                                width: 70%;
                                height: 60px;
                        }
                        #for_pin {
                                margin-top: 15px;
                                font-size: 14px;
                                margin-left: 300px;          
                                text-decoration: none;
                        }
                        #for_pin:hover {
                                text-decoration: underline;
                        }
                        .errordiv{
                                width: 80%;
                                height: 30px;
                                margin-left: 10%;
                                margin-top: 2%;
                                margin-bottom: 2%;
                                color: red;
                                font-weight: bold;
                                text-align: center;
                        }
                </style>
        </head>
        <body>
                <div class="logo">
                        <img src="logo.png" class="logo_cls"/>
                </div>

                <div class="main">
                        <div class="header">TEACHER WEB INTERFACE</div>
                        <form id="Index" action="LoginValidate" method="post">
                                <table class="body">
                                        <tr>
                                                <td>
                                                        <label id="label_id">Faculty Id</label> 
                                                </td>
                                                <td>
                                                        <input id="Input_ID" type="text" value="" maxLength="20" size="35" name="F_ID" required/>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <label id="pword_id">Password</label>
                                                </td>
                                                <td>
                                                        <input id="Input_ID" type="password" value="" maxLength="20" size="35" name="F_Pword" required/>
                                                </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                        <label id="chp_id">Enter captcha</label>
                                                </td>
                                                <td>
                                                        <input id="Input_ID" type="text" value="" maxLength="20" size="35" name="F_captcha" required/>
                                                </td>
                                        </tr>
                                </table>
                                <div id="captcha"></div>
                                <div class="body_submit">
                                        <input id="button_sub" type="submit" value="Submit"/>
                                </div>
                                <a href="#" id="for_pin">Forget password?</a>
                                <div class="errordiv">
                                        <%= request.getAttribute("error") != null ? request.getAttribute("error") : ""%>
                                        <div class="error" id="captchaError"></div>                  
                                </div>
                        </form>
                </div>    
                <script>
                        let captchaText = '';
                        function generateCaptcha() {
                                const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                                captchaText = '';
                                for (let i = 0; i < 5; i++) {
                                        captchaText += chars.charAt(Math.floor(Math.random() * chars.length));
                                }
                                document.getElementById('captcha').textContent = captchaText;
                        }
                        window.onload = generateCaptcha;
                        document.getElementById('Index').addEventListener('submit', function (e) {
                                const userCaptcha = document.querySelector('input[name="F_captcha"]').value;
                                const errorElement = document.getElementById('captchaError');
                                if (userCaptcha !== captchaText) {
                                        e.preventDefault();
                                        errorElement.textContent = 'Incorrect CAPTCHA. Please try again.';
                                        generateCaptcha();
                                } else {
                                        errorElement.textContent = '';
                                }
                        });
                </script>
        </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Popup Example</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        *{
                box-sizing: border-box;
        }

        /* Button Style */
        .open-popup-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin: 20px;
        }

        .open-popup-btn:hover {
            background-color: #0056b3;
        }

        /* Popup Overlay */
        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        /* Popup Content */
        .popup-content {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .popup-content h2 {
            margin: 0 0 10px;
            font-size: 18px;
        }

        .popup-content p {
            margin: 0 0 20px;
            font-size: 14px;
            color: #555;
        }

        /* Close Button */
        .close-popup-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            color: #333;
        }

        .close-popup-btn:hover {
            color: red;
        }

        /* Blur Effect */
        .blur-background {
            filter: blur(5px);
        }
    </style>
</head>
<body>
    <div id="mainContent">
        <button class="open-popup-btn" onclick="openPopup()">Open Popup</button>
    </div>
    <div class="popup-overlay" id="popupOverlay">
        <div class="popup-content">
            <button class="close-popup-btn" onclick="closePopup()">&times;</button>
            <h2>Popup Title</h2>
            <p>This is a sample popup content.</p>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        function openPopup() {
            document.getElementById('popupOverlay').style.display = 'flex';
            document.getElementById('mainContent').classList.add('blur-background');
        }

        function closePopup() {
            document.getElementById('popupOverlay').style.display = 'none';
            document.getElementById('mainContent').classList.remove('blur-background');
        }
    </script>
</body>
</html>

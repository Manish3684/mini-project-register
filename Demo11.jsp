<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Replacement</title>
    <style>
        /* Style for success box */
        .msg-box {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #4CAF50;
            color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .error {
            background: red;
        }
        .close-btn {
            margin-left: 10px;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <h2>Faculty Replacement Form</h2>

    <form action="Storing_Data" method="post">
        <!-- Your form inputs here -->
        <input type="text" name="Date_select" required placeholder="Enter Date"><br>
        <input type="text" name="Time_select" required placeholder="Enter Time"><br>
        <input type="text" name="sectionselect" required placeholder="Enter Section"><br>
        <input type="text" name="room_select" required placeholder="Enter Room No"><br>
        <input type="text" name="course_select" required placeholder="Enter Course"><br>
        <input type="text" name="faculty_select" required placeholder="Enter Faculty"><br>
        <button type="submit">Submit</button>
    </form>

    <%-- Display the Message Box --%>
    <%
        HttpSession session1 = request.getSession();
        String msg = (String) session1.getAttribute("msg");
        if (msg != null) {
    %>
        <div id="msgBox" class="msg-box <%= msg.contains("Error") ? "error" : "" %>">
            <%= msg %>
            <span class="close-btn" onclick="hideMsgBox()"></span>
        </div>
    <%
        session1.removeAttribute("msg"); // Clear the message after displaying
        }
    %>

    <script>
        // Show message box
        window.onload = function() {
            var msgBox = document.getElementById("msgBox");
            if (msgBox) {
                msgBox.style.display = "block";
                setTimeout(hideMsgBox, 10000); // Hide after 3 seconds
            }
        };

        // Hide message box function
        function hideMsgBox() {
            var msgBox = document.getElementById("msgBox");
            if (msgBox) {
                msgBox.style.display = "none";
            }
        }
    </script>

</body>
</html>

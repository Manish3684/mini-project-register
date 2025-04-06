<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Faculty</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(to right, #e0eafc, #cfdef3);
                margin: 0;
                padding: 0;
            }

            .main {
                width: 90%;
                max-width: 500px;
                margin: 10% auto;
                padding: 30px;
                background-color: #ffffff;
                border-radius: 16px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }

            .header {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .facultyid {
                display: flex;
                flex-direction: column;
                font-size: 16px;
                font-weight: 500;
            }

            .facultyid label {
                margin-bottom: 8px;
                color: #333;
            }

            .facultyid input {
                padding: 10px;
                font-size: 15px;
                border-radius: 8px;
                border: 1px solid #ccc;
                outline: none;
                transition: border 0.3s ease;
            }

            .facultyid input:focus {
                border-color: #007bff;
            }

            .delbutton {
                text-align: center;
            }

            .del-btn {
                background-color: #dc3545;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 10px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .del-btn:hover {
                background-color: #c82333;
                transform: scale(1.05);
            }

            form {
                margin: 0;
            }
        </style>

        <script>
            function confirmDeletion() {
                const facultyId = document.forms["addnewfacultys"]["oldfacultyid"].value;
                if (facultyId.trim() === "") {
                    alert("Please enter a Faculty ID.");
                    return false;
                }
                return confirm("Are you sure you want to delete Faculty ID: " + facultyId + "?");
            }
        </script>
    </head>
    <body>
        <div class="main">
            <div class="header">
                <form name="addnewfacultys" action="delfacultyservlet" onsubmit="return confirmDeletion();">
                    <div class="facultyid">
                        <label>Enter Faculty ID:</label>
                        <input type="text" name="oldfacultyid" required>
                    </div>
                    <div class="delbutton">
                        <button type="submit" class="del-btn">Delete Faculty</button>
                    </div>
                </form>
            </div>
        </div> 
    </body>
</html>

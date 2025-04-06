<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style> 
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 70px;
            }

            .main {
                width: 60%;
                margin-left: 25%;
                margin-top: 10%;
                padding: 30px;                
                background-color: #fff;
                border-radius: 12px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }

            .header {
                display: flex;
                justify-content: space-between;
                gap: 10px;
                background: white;
            }

            .button1div, .button2div {
                width: 100%;
            }

            .add-btn, .del-btn {
                width: 100%;
                padding: 5px;
                font-size: 16px;
                font-weight: bold;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                margin-top: 0px;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .add-btn {
                background-color: #4CAF50;
                color: white;
            }

            .add-btn:hover {
                background-color: #45a049;
                transform: scale(1.03);
            }

            .del-btn {
                background-color: #f44336;
                color: white;
            }

            .del-btn:hover {
                background-color: #d32f2f;
                transform: scale(1.03);
            }

            form {
                margin: 0;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <h2>Modify The Faculty Table</h2>
            <div class="header">
                <div class="button1div">
                    <form name="addfacultyform" action="addfaculty.jsp">
                        <button class="add-btn">Add New Faculty</button>
                    </form>
                </div>
                <div class="button2div">
                    <form name="deletefacultyform" action="deletefaculty.jsp">
                        <button class="del-btn">Delete Existing Faculty</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

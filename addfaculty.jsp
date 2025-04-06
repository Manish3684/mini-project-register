<%-- 
    Document   : addfaculty
    Created on : 5 Apr, 2025, 11:42:25 AM
    Author     : Shobika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <style>
                        * {
                            box-sizing: border-box;
                        }

                        body {
                            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                            background-color: #062c5f;
                            margin: 0;
                            padding: 0;
                        }

                        .main {
                            width: 90%;
                            max-width: 500px;
                            margin: 10% auto;
                            background-color: #fff;
                            padding: 30px;
                            border-radius: 12px;
                            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
                        }

                        .header {
                            display: flex;
                            flex-direction: column;
                            gap: 20px;
                        }

                        label {
                            font-weight: bold;
                            display: block;
                            margin-bottom: 8px;
                            font-size: 15px;
                        }

                        input[type="text"] {
                            width: 100%;
                            padding: 12px;
                            font-size: 15px;
                            border: 1px solid #ccc;
                            border-radius: 6px;
                            transition: border-color 0.2s ease;
                        }

                        input[type="text"]:focus {
                            border-color: #007bff;
                            outline: none;
                        }

                        .facultyid,
                        .facultyname,
                        .facultydept {
                            margin-bottom: 20px;
                        }

                        .newbutton {
                            text-align: center;
                        }

                        .add-btn {
                            background-color: #007bff;
                            color: white;
                            padding: 12px 25px;
                            border: none;
                            border-radius: 6px;
                            font-size: 16px;
                            width: 100%;
                            cursor: pointer;
                            transition: background-color 0.3s;
                        }

                        .add-btn:hover {
                            background-color: #0056b3;
                        }

                        /* Responsive tweaks for very small screens */
                        @media (max-width: 480px) {
                            .main {
                                padding: 20px;
                                margin-top: 20%;
                            }

                            label {
                                font-size: 14px;
                            }

                            .add-btn {
                                font-size: 15px;
                                padding: 10px 20px;
                            }
                        }
</style>

           </head>
        <body>
                <div class="main">
                        <div class="header">
                                <form name="addnewfacultys" action="addfacultyservlet">
                                         <div class="facultyid"><label> Enter New Faculty ID :</label><input type="text" name="newfacultyid"></div>
                                         <div class="facultyname"><label> Enter New Faculty Name :</label><input type="text" name="newfacultyname"></div>
                                         <div class="facultydept"><label> Enter New Faculty Dept :</label><input type="text" name="deptfaculty"></div>
                                         <div class="newbutton"><button class="add-btn">Add Faculty </button></div>
                                </form>
                        </div>
                </div>
        </body>
</html>

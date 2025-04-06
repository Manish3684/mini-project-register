<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <style>
           .wrapper21 {
                    background: white;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                    width: 40%;
                    text-align: center;
                    margin-left: 25%;
                    margin-top: 15%;
                }
        .contentolod {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            border: 2px solid #3498db;
            border-radius: 8px;
            background-color: #ecf0f1;
            margin: 10px 0;
        }
    input[type="radio"] {
        accent-color: #3498db;
        transform: scale(1.3);
        cursor: pointer;
    }
    label {
        font-size: 16px;
        font-weight: 600;
        color: #2c3e50;
        cursor: pointer;
    }
    input[type="radio"]:hover {
        accent-color: #2980b9;
    }
    input[type="radio"]:checked + label {
        color: #3498db;
        font-weight: bold;
    }
      button {
                            width: 80%;
                            padding: 12px;
                            background-color: #3498db;
                            border: none;
                            color: white;
                            font-size: 18px;
                            font-weight: bold;
                            border-radius: 6px;
                            cursor: pointer;
                            transition: 0.3s ease-in-out;
                            margin-top: 20px;
                        }

                        button:hover {
                            background-color: #2980b9;
                            transform: scale(1.05);
                        }
</style>
        </head>
        <body >
                <div class="wrapper21">
                        <form name="form2" action="DemoDemo.jsp">
                                <label>Leave Type </label>
                               <div class="contentolod">
                                 <input type="radio" id="option" name="LeaveType" value="CL – Casual Leave" required>
                                 <label for="optioncl">CL – Casual Leave</label>
                             </div>
                             <div class="contentolod">
                                 <input type="radio" id="option" name="LeaveType" value="OD – On Duty">
                                 <label for="optionod">OD – On Duty</label>
                             </div>
                                <button type="submit">Next - ></button>
                        </form>
                </div>
        </body>
</html>

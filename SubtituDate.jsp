<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Date & Time Selection</title>
        <style>
  
                        .wrapperrr {
                                        background: white;
                                        border-radius: 12px;
                                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                                        width: 40%; 
                                        max-width: 500px; 
                                        text-align: center;
                                        margin-left: 25%;
                                        margin-top: 5%;
                                        transition: 0.3s ease-in-out;
                                        padding: 20px;
                        }
                        .head23 {
                                        margin-bottom: 20px;
                                        font-size: 22px;
                                        font-weight: bold;
                                        color: #2c3e50;
                                        text-transform: uppercase;
                                }
                        .data_select {
                            margin-bottom: 20px;
                            text-align: left;
                        }

                        input[type="date"] {
                            width: 90%;
                            padding: 12px;
                            font-size: 16px;
                            border: 2px solid #3498db;
                            border-radius: 6px;
                            background-color: white;
                            color: #333;
                            cursor: pointer;
                            transition: 0.3s ease-in-out;
                        }

                        input[type="date"]::-webkit-calendar-picker-indicator {
                            filter: invert(0.6);
                            cursor: pointer;
                        }
                        input[type="date"]:hover,
                        input[type="date"]:focus {
                            border-color: #1abc9c;
                            box-shadow: 0 0 8px rgba(26, 188, 156, 0.4);
                            outline: none;
                        }

                        .select_ratio {
                            display: flex;
                            flex-direction: column;
                            gap: 10px;
                            padding: 15px;
                            border: 2px solid #3498db;
                            border-radius: 8px;
                            background-color: #ecf0f1;
                            text-align: left;
                        }

                        .select_ratio label {
                            font-size: 16px;
                            font-weight: 600;
                            color: #2c3e50;
                        }

                        .radio-group {
                            display: flex;
                            align-items: center;
                            gap: 8px;
                            padding: 5px 0;
                        }

                        input[type="radio"] {
                            accent-color: #3498db;
                            transform: scale(1.3);
                            cursor: pointer;
                            margin-right: 5px;
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
    <body>
                        <div class="wrapperrr">
                     <div class="head23">Date & Time Selection</div>
                     <form name="form1" action="leave_type.jsp" method="post"  >
                         <div class="data_select">
                             <label for="dob">Select Date:</label>
                             <input type="date" id="dob" name="dob" required>
                         </div>
                         <div class="select_ratio">
                             <label>Select Time Option:</label>
                             <div class="radio-group">
                                 <input type="radio" id="forenone" name="timeoption" value="Forenoon" required>
                                 <label for="forenone">Forenoon (AM)</label>
                             </div>
                             <div class="radio-group">
                                 <input type="radio" id="afternone" name="timeoption" value="Afternoon">
                                 <label for="afternone">Afternoon (PM)</label>
                             </div>
                             <div class="radio-group">
                                 <input type="radio" id="fullday" name="timeoption" value="FullDay">
                                 <label for="fullday">Full Day</label>
                             </div>
                         </div>

                      <button type="sumbit" onclick="parent.showPage('leave_type.jsp')">Next -></button>
                     </form>
                 </div>
    </body>
</html>

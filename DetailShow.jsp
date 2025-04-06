<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Popup  Example</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        *{
                box-sizing: border-box;
        }
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
        .popup-content {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            width: 40%;
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
        .blur-background {
            filter: blur(5px);
        }
        .ID-class{
                width:60%;
                margin-left: 20%;
                margin-top: 5%;                
        }
                .name-class{
                         width:60%;
                        margin-left: 20%;
                        margin-top: 2%;     
                }
                .dept-class{
                        width:60%;
                        margin-left: 20%;
                        margin-top: 2%;     
                }
                .password-class{
                        width:60%;
                        margin-left: 20%;
                        margin-top: 2%;   
                }
                
    </style>
</head>
<body>
    <div id="mainContent">
        <button class="open-popup-btn" onclick="openPopup()">View Details</button>
    </div>
    <div class="popup-overlay" id="popupOverlay">
        <div class="popup-content">
            <button class="close-popup-btn" onclick="closePopup()">&times;</button>
            <h2>Popup Title</h2>
            <p>
                    <%
                            try{                           
                    
                            String str=(String)session.getAttribute("FID");
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                            String query = "SELECT * FROM Information WHERE FACULTYID=12345";
                            PreparedStatement pst = con.prepareStatement(query);
                            
                            ResultSet rs=pst.executeQuery();
                            while(rs.next()){
                                          int faculty_id=rs.getInt("FACULTYID");
                                          String FACULTYNAME = rs.getString("FACULTYNAME");
                                          String FACULTYDEPT=rs.getString("FACULTYDEPT");
                                          String FACULTYPASSWORD =rs.getString("FACULTYPASSWORD");
                                     %>     
                                        <div class="ID-class"><%="FACULTY ID:"+faculty_id %></div>
                                        <div class="name-class"> <%= "FACULTY NAME :"+FACULTYNAME  %></div>
                                        <div class="dept-class"><%= "DEPARTMENT : "+FACULTYDEPT %></div>
                                        <div class="password-class"> <%= "PASSWORD :"+FACULTYPASSWORD  %></div>
                             <%  
                               }
                        }
                        catch(Exception e){
                        e.printStackTrace();
                       }
                %>
                            
                            
            </p>
        </div>
    </div>
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

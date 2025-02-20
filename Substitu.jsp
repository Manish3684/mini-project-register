<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Teacher Staff Register</title>
    <style>
        .head{
            width:100%;
            height:auto;
            border:1px solid black;
        }
        .head .date, .head .time, .head .room, .head .course, .head .faculty {
            margin-left: 10%;
            margin-top: 2%;
            width:40%;
            height:auto;
            border:1px solid black;
            padding: 1%;
            font-family: "Times New Roman", Times, serif;
            display: flex;
            align-items: center;
        }
        .search-box, .date-input, .time-input, .room-input, .course-input, .faculty-input {
            width: 60%;
            font-size: 17px;
            margin-left: 10px;
            text-align: center;
            font-family: "Times New Roman", Times, serif;
        }
        .btn{
                width: 100%;
                height: auto;
                display:flex;
                flex-direction: cloumn;
        }
        .body_submit {
                                width: 15%;
                                height: 60px;
                                margin-left: 10%;
                                display:flexl;
                                flex-direction: cloumn;
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
                                display:flex;
                                flex-direction: column;
                                margin-left: 20%;
                        }
    </style>
    <script>
        function filterDropdown(inputId, dropdownId) {
            var input, filter, select, options, i;
            input = document.getElementById(inputId);
            filter = input.value.toUpperCase();
            select = document.getElementById(dropdownId);
            options = select.getElementsByTagName("option");
            
            for (i = 0; i < options.length; i++) {
                if (options[i].text.toUpperCase().indexOf(filter) > -1) {
                    options[i].style.display = "";
                } else {
                    options[i].style.display = "none";
                }
            }
        }

        function updateSearchBox(dropdownId, inputId) {
            var dropdown = document.getElementById(dropdownId);
            var input = document.getElementById(inputId);
            input.value = dropdown.options[dropdown.selectedIndex].text;
        }
    </script>
</head>
<body>
    <div class="head">
        <form name="Detail-form">
            <div class="date"><label>Date : </label><input class="date-input" type="date"/></div>
            <div class="time"><label>Time : </label><select class="time-input">
                <option>8.45 - 9.45</option>
                <option>9.45 - 10.45</option>
                <option>11.00 - 12.00</option>
                <option>12.00 - 1.00</option>
                <option>1.00 - 2.00</option>
                <option>2.00 - 3.00</option>                                                    
                <option>3.15 - 4.15</option>
                <option>4.15 - 5.15</option>                                
            </select></div>
            <div class="room"><label>Class Room No : </label><input class="room-input" type="text"/></div>
            
            <!-- Course Search and Dropdown -->
            <div class="course">
                <label>Course ID and Name:</label>
                <input type="text" id="courseSearch" class="search-box" onkeyup="filterDropdown('courseSearch', 'courseDropdown')" placeholder="Search Course...">
                <select id="courseDropdown" class="course-input" onchange="updateSearchBox('courseDropdown', 'courseSearch')">
                    <option value="">-- Select Course --</option>
                    <% 
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT course_id, course_name FROM courseDetail");
                            while (rs.next()) {
                    %>
                        <option value="<%= rs.getString("course_id") %>"><%= rs.getString("course_id") %> - <%= rs.getString("course_name") %></option>
                    <% 
                            }
                            rs.close();
                            stmt.close();
                            con.close();
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                    %>
                </select>
            </div>
            
            <!-- Faculty Search and Dropdown -->
            <div class="faculty">
                <label>Faculty ID and Name:</label>
                <input type="text" id="facultySearch" class="search-box" onkeyup="filterDropdown('facultySearch', 'facultyDropdown')" placeholder="Search Faculty...">
                <select id="facultyDropdown" class="faculty-input" onchange="updateSearchBox('facultyDropdown', 'facultySearch')">
                    <option value="">-- Select Faculty --</option>
                    <% 
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT faculty_id, faculty_name FROM facultyDetail");
                            while (rs.next()) {
                    %>
                        <option value="<%= rs.getString("faculty_id") %>"><%= rs.getString("faculty_id") %> - <%= rs.getString("faculty_name") %></option>
                    <% 
                            }
                            rs.close();
                            stmt.close();
                            con.close();
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                    %>
                </select>
            </div>
                <div class="btn">
               <div class="body_submit">
                                        <input id="button_sub" type="submit" value="Submit" style="margin-bottom: 1%;"/>   
                                          </div>
                           <div class="body_submit">
                                        <input id="button_sub" type="submit" value="Reset" style="margin-left: 0%;"/>
               </div>
                </div>
        </form>
    </div>
</body>
</html>
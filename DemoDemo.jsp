<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import="javax.servlet.http.HttpServletResponse.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Teacher Staff Register</title>
    
               <link rel="stylesheet" type="text/css" href="modelcss.css">

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
       function sendData() {
            var selectedDept = document.getElementById("selected-dept").value;
            var yearDropdown = document.getElementById("year-section");

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "fetchYear.jsp?selectedDept=" + encodeURIComponent(selectedDept), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    yearDropdown.innerHTML = xhr.responseText; 
                }
            };
            xhr.send();
        }
         function fetchSections() {
            var selectedYear = document.getElementById("year-section").value;
            var sectionDropdown = document.getElementById("section_dropdown");

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "fetchSection.jsp?selectedYear=" + encodeURIComponent(selectedYear), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    sectionDropdown.innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
        window.onload = function() {
            var msgBox = document.getElementById("msgBox");
            if (msgBox) {
                msgBox.style.display = "block";
                setTimeout(hideMsgBox, 3000); // Hide after 3 seconds
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
</head>
<body>
    <div class="head12">
        <form name="Detail-form" method="Post" action="Storing_Data"> 
            <!-- Time -->
            <div class="time"><label>Time : </label><select class="time-input"  name="Time_select">
                            <option>--select Time -- </option>
                 <option>8.45 - 9.45</option>
                <option>9.45 - 10.45</option>
                <option>11.00 - 12.00</option>
                <option>12.00 - 1.00</option>
                <option>1.00 - 2.00</option>
                <option>2.00 - 3.00</option>                                                    
                <option>3.15 - 4.15</option>
                <option>4.15 - 5.15</option>                                
            </select></div>
            
            <!--Department choose -->
            <div class="dept">
            <label class="dept-label">Dept:</label>
           <select class="dept-input" id="selected-dept" name="Dept_select" onchange="sendData()">
                <option value="">Select Department</option>
                <option value="B-Tech">B-Tech</option>
                <option value="BCA">BCA</option>
                <option value="B.Sc CS">B.Sc CS</option>
            </select>
        </div>
            
            <!--Year Choose -->
          <div class="year">
            <label>Year:</label>
          <select class="year-input" id="year-section" name="Year_select" onchange="fetchSections()">
                <option value="">-- Select Year --</option>
            </select>
        </div>

           <!--Section choose -->
        <div class="section">
            <label>Section:</label>
           <select class="section-input" id="section_dropdown" name="sectionselect">
                <option value="">-- Select Section --</option>
            </select>
        </div>
           
           <!--Class Room Number -->
            <div class="room"><label>Class Room No : </label><input class="room-input" type="text" name="room_select"/></div>
            
            <!--Course ID and Course Name -->
            <div class="course">
                <label>Course ID and Name:</label>
                <input type="text" id="courseSearch" class="search-box" onkeyup="filterDropdown('courseSearch', 'courseDropdown')" placeholder="Search Course...">
                <select id="courseDropdown" class="course-input" name="course_select" onchange="updateSearchBox('courseDropdown', 'courseSearch')">
                    <option value="">-- Select Course --</option>
                    <% 
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                           Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT course_id, course_name FROM courseDetail");
                            while (rs.next()) {
                    %>
                        <option value="<%= rs.getString("course_id") + " - " + rs.getString("course_name") %>"> <%= rs.getString("course_id")%> - <%= rs.getString("course_name") %></option>
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
                
               <!--Faculty Id and Name choose-->
            <div class="faculty">
                <label>Faculty ID and Name:</label>
                <input type="text" id="facultySearch" class="search-box" onkeyup="filterDropdown('facultySearch', 'facultyDropdown')" placeholder="Search Faculty...">
                <select id="facultyDropdown" class="faculty-input" name="faculty_select" onchange="updateSearchBox('facultyDropdown', 'facultySearch')">
                    <option value="">-- Select Faculty --</option>
                    <% 
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT faculty_id, faculty_name FROM facultyDetail");
                            while (rs.next()) {
                    %>
                      <option value="<%= rs.getString("faculty_id") + " - " + rs.getString("faculty_name") %>">
    <%= rs.getString("faculty_id") %> - <%= rs.getString("faculty_name") %>
</option>

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
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Database credentials
    String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "system";
    String dbPassword = "system";
    int attendancePercentage = 0;

    try {
        // Load Oracle JDBC Driver
        Class.forName("oracle.jdbc.OracleDriver");

        // Establish database connection
        Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        Statement stmt = con.createStatement();
        
        // Fetch attendance percentage
        ResultSet rs = stmt.executeQuery("SELECT ((100 - hours_absent) / 100.0) * 100 AS percentage FROM SYSTEM.alternatestaff11 WHERE id = '16'");

        if (rs.next()) {
            attendancePercentage = rs.getInt("percentage");
        }

        // Close resources
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.toString() + "</p>");
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Performance</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Chart.js Library -->
    <style>
        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 40%;
            margin-left: 20%;
            margin-top: 5%;
        }

        .chart-container {
            width: 250px;
           height:250px;
            margin: 20px auto;
        }

        .label {
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>

    <div class="card">
        <h2>Attendance</h2>
         <!--<canvas id="attendanceChart" ></canvas>-->
        <div class="chart-container">
                <canvas id="attendanceChart" ></canvas>  <!-- Pie Chart Canvas -->
        </div>
        
    </div>

    <script>
        // Get attendance percentage from JSP
        let attendancePercentage = <%= attendancePercentage %>;

        // Create Pie Chart
        let ctx = document.getElementById("attendanceChart").getContext("2d");
        new Chart(ctx, {
            type: "pie",
            data: {
                labels: ["Present", "Absent"],
                datasets: [{
                    data: [attendancePercentage, 100 - attendancePercentage], 
                    backgroundColor: ["green", "red"],  
                    hoverBackgroundColor: ["darkgreen", "darkred"]
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        position: "bottom"
                    }
                }
            }
        });
    </script>
    
</body>
</html>
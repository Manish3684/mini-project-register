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
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 400px;
        }

        .chart-container {
            width: 100%;
            height: 300px;
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
        <div class="chart-container">
            <canvas id="attendanceChart"></canvas>  <!-- Bar Chart Canvas -->
        </div>
        <div class="label">Performance</div>
    </div>

    <script>
        // Get attendance percentage from JSP
        let attendancePercentage = <%= attendancePercentage %>;

        // Create Bar Chart
        let ctx = document.getElementById("attendanceChart").getContext("2d");
        new Chart(ctx, {
            type: "bar",
            data: {
                labels: ["Present", "Absent"],
                datasets: [{
                    label: "Attendance Percentage",
                    data: [attendancePercentage, 100 - attendancePercentage], 
                    backgroundColor: ["green", "red"],  
                    hoverBackgroundColor: ["darkgreen", "darkred"]
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100,
                        title: {
                            display: true,
                            text: "Percentage (%)"
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: "top"
                    }
                }
            }
        });
    </script>
    
</body>
</html>
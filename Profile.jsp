<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attendance Speedometer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .speedometer-container {
            position: relative;
            width: 300px;
            height: 150px;
            margin: 50px auto;
        }

        svg {
            transform: rotate(-90deg);
        }

        .speedometer-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Attendance Percentage</h1>
    <div class="speedometer-container">
        <svg width="300" height="150" viewBox="0 0 300 150">
            <!-- Background Arc -->
            <path d="M150,150 A100,100 0 0,1 50,50" fill="none" stroke="#e6e6e6" stroke-width="20" />
            <!-- Foreground Arc -->
            <path id="attendanceArc" d="M150,150 A100,100 0 0,1 50,50" fill="none" stroke="#00ff00" stroke-width="20" stroke-linecap="round" />
        </svg>
        <div class="speedometer-text" id="attendanceText">0%</div>
    </div>

    <input type="number" id="attendanceInput" placeholder="Enter attendance %" min="0" max="100" />
    <button onclick="updateAttendance()">Update</button>

    <script>
        function polarToCartesian(centerX, centerY, radius, angleInDegrees) {
            const angleInRadians = (angleInDegrees - 90) * Math.PI / 180.0;
            return {
                x: centerX + (radius * Math.cos(angleInRadians)),
                y: centerY + (radius * Math.sin(angleInRadians))
            };
        }

        function describeArc(x, y, radius, startAngle, endAngle) {
            const start = polarToCartesian(x, y, radius, endAngle);
            const end = polarToCartesian(x, y, radius, startAngle);

            const largeArcFlag = endAngle - startAngle <= 180 ? "0" : "1";

            return [
                "M", start.x, start.y,
                "A", radius, radius, 0, largeArcFlag, 0, end.x, end.y
            ].join(" ");
        }

        function updateAttendance() {
            const attendanceInput = document.getElementById("attendanceInput").value;
            const attendance = Math.min(Math.max(attendanceInput, 0), 100); // Clamp value between 0 and 100

            // Update attendance text
            const attendanceText = document.getElementById("attendanceText");
            attendanceText.textContent = attendance + "%";

            // Calculate arc based on attendance percentage
            const endAngle = (attendance / 100) * 180;
            const arcPath = describeArc(150, 150, 100, 0, endAngle);
            const attendanceArc = document.getElementById("attendanceArc");
            attendanceArc.setAttribute("d", arcPath);

            // Update color based on percentage
            let color = "#00ff00"; // Green for 100%
            if (attendance < 50) {
                color = "#ff0000"; // Red for below 50%
            } else if (attendance < 75) {
                color = "#ffa500"; // Orange for 50-74%
            }
            attendanceArc.setAttribute("stroke", color);
        }
    </script>
</body>
</html>

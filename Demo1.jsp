<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>

<%
    String selectedDept = request.getParameter("selectedDept");

    if (selectedDept != null && !selectedDept.isEmpty()) {
        try {
            // Load Oracle Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish Connection
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

            // Prepare SQL Query
            PreparedStatement ps = con.prepareStatement("SELECT YEAR FROM yearsection WHERE UPPER(DEPNAME) = UPPER(?)");
            ps.setString(1, selectedDept);
            ResultSet rs = ps.executeQuery();

            // Return options dynamically
            out.println("<option value=''>-- Select Year --</option>");
            while (rs.next()) {
                out.println("<option value='" + rs.getString("YEAR") + "'>" + rs.getString("YEAR") + "</option>");
            }

            // Close Connections
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            out.println("<option>Error: " + e.getMessage() + "</option>");
        }
    } else {
        out.println("<option value=''>-- Select Year --</option>");
    }
%>

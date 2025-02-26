<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String selectedDept = request.getParameter("selectedDept");

    if (selectedDept != null && !selectedDept.isEmpty()) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

            // Fetch distinct YEAR values instead of DEPT_NAME
            PreparedStatement ps = con.prepareStatement("SELECT DISTINCT DEPT_NAME FROM yearsection WHERE UPPER(DEPNAME) = UPPER(?)");
            ps.setString(1, selectedDept);
            ResultSet rs = ps.executeQuery();

            out.println("<option value=''>-- Select Year --</option>"); // Reset options

            while (rs.next()) {
                out.println("<option value='" + rs.getString("DEPT_NAME") + "'>" + rs.getString("DEPT_NAME") + "</option>");
              
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("<option>Error: " + e.getMessage() + "</option>");
        }
    }
%>

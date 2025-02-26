<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String selectedYear = request.getParameter("selectedYear");

    if (selectedYear != null && !selectedYear.isEmpty()) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

            PreparedStatement ps = con.prepareStatement("SELECT DISTINCT SECTION FROM yearsection WHERE DEPT_NAME = ?");
            ps.setString(1, selectedYear);
            ResultSet rs = ps.executeQuery();

            out.println("<option value=''>-- Select Section --</option>"); // Default option

            while (rs.next()) {
                out.println("<option value='" + rs.getString("SECTION") + "'>" + rs.getString("SECTION") + "</option>");
            }

            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("<option>Error: " + e.getMessage() + "</option>");
        }
    }
%>

<%-- 
    Document   : Demo
    Created on : 24 Feb, 2025, 7:57:26 PM
    Author     : Shobika
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <script>
                        function updatedept(){
                             var dep=document.getElementByName("Dept")[0].value;
                             console.log(dep);
                             session.setAttribute("Department",Dept);
                        }
                       </script>
        </head>
        <body>
                <%
                        
                        String selectedCourse=request.getParameter("Dept");
                          session.setAttribute("Departent",selectedCourse);
                %>
                <form id="courseForm">
                        <select name="Dept"  onload="document.getElementById('courseForm').submit();"><option value="BCA"><%="BCA".equals(selectedcourse)?"selected": "" %>BCA</option></select>
                        <select name="year"><option>--select year--</option>
                                <%
                                        
                                        try{
                                                     ResultSet rs = null;
                                                    Class.forName("oracle.jdbc.driver.OracleDriver");
                                                     Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                                                     String query = "SELECT DEPT_NAME from yearsection where DEPNAME=?";
                                                     PreparedStatement pst = con.prepareStatement(query);
                                                     String dept=(String)session.getAttribute("Departent");
                                                      pst.setString(1, dept);
                                                      rs = pst.executeQuery();
                                                    while(rs.next()){
                                %><option value="<%= rs.getString("DEPT_NAME") %>"><%= rs.getString("DEPT_NAME") %></option>
                                       <%             }     
                                        }
                                        catch(Exception e){
                                            out.println("Error: " + e.getMessage());
                                        }
                                        %>
                        </select>
                </form>
        </body>
</html>

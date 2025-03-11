<%-- 
    Document   : Home
    Created on : 19 Jan, 2025, 9:57:07 PM
    Author     : Shobika
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <link rel="stylesheet" href="HomeFilecss.css" type="text/css"/>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Chart.js Library -->
        </head>
        <body>
                <%@ page import="java.sql.*" %>
                <%@ page import="java.io.IOException" %>
                <%@ page import="java.io.PrintWriter" %>
                <%@ page import="java.sql.DriverManager" %>
                <%@ page import="javax.servlet.*" %>
                <%@ page import="javax.servlet.ServletException" %>
                <%@ page import="javax.servlet.http.HttpServlet" %>
                <%@ page import="javax.servlet.http.HttpServletRequest" %>
                <%@ page import="javax.servlet.http.HttpServletResponse" %>
                <%@ page import="javax.servlet.http.HttpSession" %>
                <div class="header"></div>
                <div class="wrapper">
                        <div class="Main">
                                <div class="profile">
                                        <a class="mainlink" href="Home.jsp">Profile</a>
                                </div>
                                <div class="topic">
                                        <a class="mainlink">Topic</a>
                                </div>
                                <div class="Substitute-staff">
                                        <a class="mainlink" data-page="Substitu.jsp">Substitute staff</a>
                                </div>
                                <div class="Absent-details" >
                                        <a class="mainlink" data-page="ftty.jsp">Absent Details</a>
                                </div>
                                <div class="Total-absents">
                                      <a class="mainlink" data-page="viewDetails.jsp">View Details </a>
                                </div>
                                <div class="Logout">
                                        <a class="mainlink">Logout</a>
                                </div>
                        </div>
                        <div class="head">
                                <div class="logo">
                                        <img src="logo.png" class="logo_cls"/>
                                </div>
                                <div class="head1">
                                        
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
                                         
                                         String FID=(String)session.getAttribute("FID");
                                          int fid=Integer.parseInt(FID);
                                %>
                                       
                                            <%     
                                        Class.forName("oracle.jdbc.driver.OracleDriver");
                                         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                                        String query = "select * from information where FACULTYID=?";
                                        PreparedStatement pst = con.prepareStatement(query);
                                        pst.setString(1,FID);                            
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
                                        
                                        <div class="details" >
                                                <div class="photo">
                                                        photo
                                                </div>
                                                <div>  
                                                        <div class="detail_inside" >    
                                                                <div id="Name">    
                                                                        ${Fname}
                                                                </div>
                                                                <div id="F_id">    
                                                                        ${FID}
                                                                </div>
                                                                <div id="dept">    
                                                                        ${FDept}
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                </div>
                            </div>
                        </div>                                                          
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                <script>
                        $(document).ready(function ()
                        {
                                $(".mainlink").click(function ()
                                {
                                        var page = $(this).data("page");
                                        $(".head1").load(page);
                                });


                        });       
        
                </script>
        </body>
</html>
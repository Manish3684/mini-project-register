<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <link rel="stylesheet" href="HomeStyle.css" type="text/css"/>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                                        <a class="mainlink" data-page="SubtituDate.jsp">Substitute staff</a>
                                </div>
                                <div class="Absent-details" >
                                        <a class="mainlink" data-page="ftty.jsp">Absent Details</a>
                                </div>
                                <div class="Total-absents">
                                      <a class="mainlink" data-page="viewDetails.jsp">View Details </a>
                                </div>
                              <div class="password_class">
                                      <a class="mainlink" href="password_change.jsp">Change Password </a>
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
                                         <div id="mainContent1">
                                                   <button class="open-popup-btn1" onclick="openPopup1()">Edit Profile</button>
                                         </div>
                                         <div class="popup-overlay1" id="popupOverlay1">
                                <div class="popup-content1" style="
    background: #fff; 
    padding: 20px; 
    border-radius: 10px; 
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2); 
    max-width: 500px; 
    width: 100%; 
    text-align: center; 
    position: relative;">

                                    <button class="close-popup-btn1" onclick="closePopup1()">&times;</button>
                                    <h2>Popup Title</h2>
                             
                    <% 
                                        String faculty_id=null;
                                         String FACULTYNAME=null;
                                          String FACULTYDEPT=null;
                                          String facultydesi=null;
                                         String femail=null;
                                          String fphn=null;
                            try{                                            
                                        String FID=(String)session.getAttribute("FID");                                       
                                        Class.forName("oracle.jdbc.driver.OracleDriver");
                                         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                                        String query = "select * from information where FACULTYID=?";
                                        PreparedStatement pst = con.prepareStatement(query);
                                        pst.setString(1,FID);
                                         ResultSet rs=pst.executeQuery();
                                         while(rs.next()){
                                                faculty_id=rs.getString("FACULTYID");
                                                FACULTYNAME = rs.getString("FACULTYNAME");
                                                FACULTYDEPT=rs.getString("FACULTYDEPT");
                                                facultydesi=rs.getString("DESIGNATION");
                                                femail=rs.getString("EMAIL");
                                                fphn=rs.getString("PHN_NUMBER");
                                         }
                                    %>    
                                                   
                                    <form name="facultydetaileditform" action="changemydetail">
                                            
                                     <div class="fiddetail_div"><label>Faculty ID</label><%=faculty_id%></div>
                                     <div class="fnamedetail_div"><label>Name of Faculty :</label><input type="text" name="fnamedetail" value="<%=FACULTYNAME%>"></div>
                                    <div class="fdeptdetail_div"><label>Faculty Department :</label><input type="text" name="fdeptdetail" value="<%=FACULTYDEPT%>"></div>
                                     <div class="fdisgdetail_div"><label>Faculty Designation:</label><input type="text" name="fdesidetail" value="<%=facultydesi%>"></div>
                                     <div class="femaildetail_div"><label>Faculty EMail:</label><input type="text" name="femaildetail" value="<%=femail%>"></div>
                                      <div class="fphndetail_div"><label>Faculty Phn Number :</label><input type="text" name="fphndetail" value="<%=fphn%>"></div>
                                       <button type="submit">Submit</button>
                                    
                                    </form> 
                                                         <%  
                                                     }
                                                 
                                                  catch(Exception e){
                                                  e.printStackTrace();
                                                   } 
                                            %>
                                     
                                </div>
                                         </div>
                                           <div id="mainContent">
                                                   <button class="open-popup-btn" onclick="openPopup()" style=" margin-left:1000%;">View Details</button>
                                         </div>
                                         <div class="popup-overlay" id="popupOverlay">
                                <div class="popup-content">
                                    <button class="close-popup-btn" onclick="closePopup()">&times;</button>
                                    <h2>Popup Title</h2>
                                    <p>
                    <%
                            try{                                            
                                        String FID=(String)session.getAttribute("FID");                                       
                                        Class.forName("oracle.jdbc.driver.OracleDriver");
                                         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
                                        String query1 = "select * from information where FACULTYID=?";
                                        PreparedStatement pst1 = con.prepareStatement(query1);
                                        pst1.setString(1,FID);
                                         ResultSet rs1=pst1.executeQuery();
                                           while(rs1.next()){
                                          String faculty_id1=rs1.getString("FACULTYID");
                                          String FACULTYNAME1 = rs1.getString("FACULTYNAME");
                                          String FACULTYDEPT1=rs1.getString("FACULTYDEPT");
                                    %>    
                                        <div class="ID-class"><%="FACULTY ID:"+faculty_id1%></div>
                                        <div class="name-class"> <%= "FACULTY NAME :"+FACULTYNAME1  %></div>
                                        <div class="dept-class"><%= "DEPARTMENT : "+FACULTYDEPT1 %></div>
                                        
                                                         <%  
                                                           }
                                                    }
                                                   catch(Exception e){
                                                    e.printStackTrace();
                                                  }                                             %>
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
                                    function openPopup1() {
                                        document.getElementById('popupOverlay1').style.display = 'flex';
                                        document.getElementById('mainContent1').classList.add('blur-background');
                                    }
                                    function closePopup1() {
                                        document.getElementById('popupOverlay1').style.display = 'none';
                                        document.getElementById('mainContent1').classList.remove('blur-background');
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
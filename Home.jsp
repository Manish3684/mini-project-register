<%-- 
    Document   : Home
    Created on : 19 Jan, 2025, 9:57:07 PM
    Author     : Shobika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <link rel="stylesheet" href="HomeStyle.css" type="text/css"/>
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
                                        <a class="mainlink">View Detail</a>
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
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
        <link rel="stylesheet" href="homestyle.css"/>
       <%-- <style>
            body{
                padding:0px;    
            }
            .header{
                width:100%;
                height: 10px;               
                background-color: #2a72a5;
            }
            .Main{
                width:13%;
                height:700px;               
                margin-left: 0px;
                padding-top:5px;
                background-color: #2a72a5;
                color:white;                
            }
            .wrapper{
                width:100%;  
                display:flex;
            }
           .wrapper .Main{
              
                height:800px;
                border:1px solid black;
                flex-direction: row;
            }
            .wrapper .head{
                width:100%;                              
                border:1px solid black;
                flex-direction: row;
            }
            .profile,.topic,.Substitute-staff,.Absent-details,.Total-absents,.Hourly-absents,.Download-details,.Logout{
                width:80%;
                height:18px;
                border-bottom:1px solid white;
                padding-bottom: 2px;
                padding-top: 2px;
            }  
            .profile,.topic,.Logout{
                margin-left: 5%;
                width:90%;
            }
            .Substitute-staff,.Absent-details{
                 margin-left: 10%;
                 width:85%;
            }
            .Total-absents,.Hourly-absents,.Download-details{
                 margin-left: 15%;
            }
            .logo_cls{
                width: 30%;
                height:100px;
                margin-left: 35%;
                margin-top: 2%;
            }
            .head .details{
                width: 30%;
                height: 340px;
                margin-left: 35%;
                border: 1px solid black;
                margin-top: 10%;
               
                
            }
            .photo{
                margin-left: 90px;
                margin-top: 10px;
                height:200px;
                width:50%;
                border: 1px solid black;
            }
            .detail_inside{
                
                margin-top: 10px;
                 height:110px;
                width:100%;
                border: 1px solid black;
            }
            #Name,#F_id,#dept{
                width:80%;
                height:20px;
                margin-left:10%;
                margin-top:10px;
               border-bottom: 1px solid black;
               text-align: center;
            }
            .mainlink{
                text-decoration: none;
                color: white;
            }
            .mainlink:hover{
                color: grey;
            }
        </style>--%>
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
                <a class="mainlink" href="Profile.jsp" target="head">Substitute staff</a>
            </div>
            <div class="Absent-details">
                <a class="mainlink">Absent Details</a>
            </div>
            <div class="Total-absents">
                <a class="mainlink">Total Absents</a>
            </div>
            <div class="Hourly-absents">
                <a class="mainlink">Hourly Absents</a>
            </div>
            <div class="Download-details">
                <a class="mainlink">Download Details</a>
            </div>
            <div class="Logout">
                <a class="mainlink">Logout</a>
            </div>
        </div>
            <div class="head">
            <div class="logo">
        <img src="logo.png" class="logo_cls"/>
            </div>
                <div class="details">
                    <div class="photo">
                        photo
                    </div>
                    <div>
                        <div class="detail_inside">    
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
    </body>
</html>
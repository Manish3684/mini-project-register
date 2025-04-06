<%-- 
    Document   : SubmitTest
    Created on : 25 Feb, 2025, 6:14:12 PM
    Author     : Shobika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
        </head>
        <body>
                <h1>Hello World!</h1>
                <%= request.getParameter("myText")%>
        </body>
</html>

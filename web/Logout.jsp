<%-- 
    Document   : Logout
    Created on : 17 Apr, 2025, 8:56:04 PM
    Author     : mites
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("Login.jsp");
            %>
    </body>
</html>
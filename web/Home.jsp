<%-- 
    Document   : Home
    Created on : 17 Apr, 2025, 8:46:45 PM
    Author     : mites
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
       session =request.getSession(false);
      String useremail=(String) session.getAttribute("useremail");
   
      
  if(useremail!=null)
  {
%>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="Logout.jsp" method="post">
        <input type="submit" value="LogOut">
        </form>
    </body>
</html>
<%
  }
else
{
 response.sendRedirect("Login.jsp");
}
%>
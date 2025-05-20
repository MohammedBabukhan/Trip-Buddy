package controller;

import db.DBConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Deleteaccount extends HttpServlet 
{
    
       protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
       {
           response.sendRedirect("Home1.jsp"); 
       }
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
      {
             response.setContentType("text/html");
           PrintWriter out = response.getWriter();
        try
        {
        String email= request.getParameter("email");
        Statement st= DBConnector.getStatement(); 
        String query="DELETE  FROM tb WHERE email='"+email+"'";
        System.out.println(query);
        int i=st.executeUpdate(query);
        if(i>0)
        { 
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Account Deleted Successfully');");
                out.println("window.location.href = 'Registration.html';"); 
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");     
        }  
        else
        {
                out.println("<html>");
                out.println("<head></head>");
                out.println("<body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Email Not found');");
                out.println("window.location.href = 'Profile.jsp';"); 
                out.println("</script>");
                out.println("</body>");
                out.println("</html>");
                 
                 
        }
        }
       
        catch(SQLException e)
        {
            System.out.println(e);
        }       
     
      }
}
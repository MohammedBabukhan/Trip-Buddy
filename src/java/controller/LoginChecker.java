/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import db.DBConnector;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class LoginChecker extends HttpServlet 
{
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
      response.sendRedirect("Login.jsp");
   }
     
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       String useremail=null;
       try
       {
        Statement st= DBConnector.getStatement(); 
        String query="SELECT password,email FROM tb WHERE email='"+email+"' and password='"+password+"'";
        System.out.println("query="+query);
        ResultSet rs=st.executeQuery(query);
        
        int my_cnt = 0;
        while (rs.next()) {
            my_cnt++;
        }
         if (my_cnt == 0) 
         {
	System.out.println("No Record Found");
        response.sendRedirect("LoginFail.jsp");
         }
         else
         {
          HttpSession session = request.getSession(true);
          session.setAttribute("userpassword",password);
          session.setAttribute("useremail",email);
          response.sendRedirect("Home.jsp");
                      
         }
       }
       catch(SQLException e)
       {
           System.out.println(e);
       }
       
      
   }
}

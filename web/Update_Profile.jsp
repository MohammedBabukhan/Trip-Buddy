<%@page import="db.DBConnector"%>
<%@page import="java.sql.*"%>

<%
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String city = request.getParameter("city");
    String budget = request.getParameter("budget");
    String fdate = request.getParameter("fdate");
    String tdate = request.getParameter("tdate");
    String email = request.getParameter("email");

    try {
        Statement st = DBConnector.getStatement();
        String query = "UPDATE tb SET name='" + name + "', age='" + age + "', gender='" + gender + "', contact_number='" + mobile + "', city='" + city + "', budget='" + budget + "', from_date='" + fdate + "', to_date='" + tdate + "' WHERE email='" + email + "'";
        int i = st.executeUpdate(query);
        if (i > 0) {
            response.sendRedirect("Profile.jsp");
        } else {
            out.println("Update failed. Please try again.");
        }
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .search-params {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .hotel-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 15px;
        }
        .hotel-card {
            background-color: #fff;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            text-align: center;
        }
        .hotel-card:hover {
            transform: translateY(-5px);
            background-color: #f0f8ff;
        }
        .hotel-info {
            padding: 10px;
        }
        .hotel-name {
            font-size: 18px;
            font-weight: bold;
        }
        .no-results {
            text-align: center;
            padding: 50px;
            font-size: 18px;
            color: #666;
        }
        .error-message {
            color: red;
            padding: 15px;
            background-color: #ffeeee;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hotel Search Results</h1>
        
        <%
        // Get search parameters from request
        String arrivalDate = request.getParameter("depart-date");
        String departureDate = request.getParameter("return-date");
        String adultsStr = request.getParameter("adults");
        String childrenStr = request.getParameter("children");
        
        // Set default values if parameters are null or empty
        if (arrivalDate == null || arrivalDate.isEmpty()) {
            arrivalDate = LocalDate.now().format(DateTimeFormatter.ISO_DATE);
        }
        
        if (departureDate == null || departureDate.isEmpty()) {
            departureDate = LocalDate.now().plusDays(1).format(DateTimeFormatter.ISO_DATE);
        }
        
        int adults = 1;
        if (adultsStr != null && !adultsStr.isEmpty()) {
            try {
                adults = Integer.parseInt(adultsStr);
            } catch (NumberFormatException e) {
                // Use default value
            }
        }
        
        int children = 0;
        if (childrenStr != null && !childrenStr.isEmpty()) {
            try {
                children = Integer.parseInt(childrenStr);
            } catch (NumberFormatException e) {
                // Use default value
            }
        }
        
        int totalGuests = adults + children;
        %>
        
        <div class="search-params">
            <p><strong>Arrival:</strong> <%= arrivalDate %> | <strong>Departure:</strong> <%= departureDate %> | <strong>Guests:</strong> <%= adults %> Adults, <%= children %> Children</p>
        </div>

        <%
        try {
            Statement st = DBConnector.getStatement(); 
            
            // Simple query to get just hotel names
            String query = "SELECT Hotel_Name FROM hotels WHERE Status='Available'";
            System.out.println("query=" + query);
            ResultSet rs = st.executeQuery(query);
            
            // Check if results exist
            boolean hasResults = rs.next();
            
            if (!hasResults) {
                %>
                <div class="no-results">
                    <p>No hotels available.</p>
                </div>
                <%
            } else {
                %>
                <div class="hotel-list">
                <%
                // Loop through results
                do {
                    String hotelName = rs.getString("Hotel_Name");
                    %>
                    <div class="hotel-card">
                        <div class="hotel-info">
                            <div class="hotel-name"><%= hotelName %></div>
                        </div>
                    </div>
                    <%
                } while (rs.next());
                %>
                </div>
                <%
            }
        } catch(SQLException e) {
            %>
            <div class="error-message">
                <p>Error retrieving hotel data: <%= e.getMessage() %></p>
                <p>Please try again later or contact support.</p>
            </div>
            <%
            System.out.println(e);
        }
        %>
    </div>
</body>
</html>
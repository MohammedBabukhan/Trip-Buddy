<%@page import="java.sql.SQLException"%>
<%@page import="db.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%
    String name = "", email = "", mobile = "", city = "", age = "", gender = "", budget = "", fdate = "", tdate = "";

    try {
        String email1 = (String) session.getAttribute("useremail");
        Statement st = DBConnector.getStatement();
        String query = "SELECT * FROM tb WHERE email='" + email1 + "'";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            name = rs.getString(1);
            email = rs.getString(2);
            age = rs.getString(4);
            gender = rs.getString(5);
            mobile = rs.getString(6);
            budget = rs.getString(8);
            city = rs.getString(7);
            fdate = rs.getString(9);
            tdate = rs.getString(10);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile | Trip Buddy</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #48cae4, #0096c7, #023e8a);
            color: #fff;
        }

        .container {
            max-width: 750px;
            margin: 60px auto;
            background: #ffffff10;
            box-shadow: 0 12px 25px rgba(0,0,0,0.2);
            border-radius: 15px;
            padding: 40px;
            backdrop-filter: blur(10px);
        }

        h1 {
            text-align: center;
            color: #ffffff;
            margin-bottom: 40px;
            font-size: 32px;
        }

        .profile-field {
            margin-bottom: 25px;
            background: #ffffff20;
            padding: 20px;
            border-radius: 10px;
            transition: 0.3s ease;
        }

        .profile-field:hover {
            background: #ffffff30;
            transform: translateY(-2px);
        }

        .label {
            font-weight: bold;
            font-size: 14px;
            color: #caf0f8;
        }

        .value {
            font-size: 18px;
            color: #ffffff;
            margin-top: 5px;
        }

        .edit-btn {
            background: linear-gradient(135deg, #00b4d8, #0077b6);
            color: white;
            padding: 12px 28px;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
            text-shadow: 0 0 5px rgba(255, 255, 255, 0.3);
            margin-top: 30px;
        }

        .edit-btn:hover {
            background: linear-gradient(135deg, #90e0ef, #00b4d8);
            color: #03045e;
            transform: scale(1.05);
        }

        footer {
            margin-top: 50px;
            text-align: center;
            padding: 20px;
            color: #ffffffb3;
            font-size: 14px;
        }

        .glow {
            color: #00e0ff;
            text-shadow: 0 0 8px #00e0ff;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="glow">My Profile</h1>

    <div class="profile-field"><div class="label">Name</div><div class="value"><%=name %></div></div>
    <div class="profile-field"><div class="label">Email</div><div class="value"><%=email %></div></div>
    <div class="profile-field"><div class="label">Age</div><div class="value"><%=age %></div></div>
    <div class="profile-field"><div class="label">Gender</div><div class="value"><%=gender %></div></div>
    <div class="profile-field"><div class="label">Mobile</div><div class="value"><%=mobile %></div></div>
    <div class="profile-field"><div class="label">City</div><div class="value"><%=city %></div></div>
    <div class="profile-field"><div class="label">Budget</div><div class="value"><%=budget %></div></div>
    <div class="profile-field"><div class="label">Travel Start Date</div><div class="value"><%=fdate %></div></div>
    <div class="profile-field"><div class="label">Travel End Date</div><div class="value"><%=tdate %></div></div>

    <!-- ? Edit Profile Button inside the container and well placed -->
    <div style="text-align: center;">
        <form action="Edit_Profile.jsp" method="post">
            <button type="submit" class="edit-btn">Edit Profile</button>
        </form>
    </div>
</div>

<footer>
    &copy; 2025 <span class="glow">Trip Buddy</span> | Designed for Smart India Hackathon
</footer>

</body>
</html>
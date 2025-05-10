<%@page import="java.sql.*"%>
<%@page import="db.DBConnector"%>

<%
    String name = "", email = "", mobile = "", city = "", age = "", gender = "", budget = "", fdate = "", tdate = "";

    try {
        String email1 = (String) session.getAttribute("useremail");
        Statement st = DBConnector.getStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM tb WHERE email='" + email1 + "'");
        if (rs.next()) {
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
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Profile | Trip Buddy</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #48cae4, #0096c7, #023e8a);
      color: #fff;
    }

    form {
      max-width: 700px;
      margin: 60px auto;
      background: #ffffff10;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 12px 25px rgba(0,0,0,0.2);
      backdrop-filter: blur(10px);
    }

    h2 {
      text-align: center;
      color: #ffffff;
      margin-bottom: 30px;
      font-size: 28px;
      text-shadow: 0 0 6px #00e0ff;
    }

    label {
      font-weight: bold;
      color: #caf0f8;
      display: block;
      margin-top: 15px;
      margin-bottom: 6px;
    }

    input, select {
      width: 100%;
      padding: 12px;
      border-radius: 10px;
      border: none;
      outline: none;
      font-size: 16px;
      background-color: #f1faff;
      color: #023e8a;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
    }

    input:focus, select:focus {
      box-shadow: 0 0 0 2px #90e0ef;
    }

    button {
      margin-top: 30px;
      width: 100%;
      padding: 14px;
      font-size: 18px;
      border: none;
      border-radius: 30px;
      background: linear-gradient(135deg, #00b4d8, #0077b6);
      color: white;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s ease;
      box-shadow: 0 8px 15px rgba(0,0,0,0.2);
    }

    button:hover {
      background: linear-gradient(135deg, #90e0ef, #00b4d8);
      color: #03045e;
      transform: scale(1.03);
    }

  </style>
</head>
<body>

  <form action="Update_Profile.jsp" method="post">
    <h2> Edit Your Profile</h2>

    <label>Name:</label>
    <input type="text" name="name" value="<%=name%>" required>

    <label>Mobile:</label>
    <input type="text" name="mobile" value="<%=mobile%>" required>

    <label>Age:</label>
    <input type="number" name="age" value="<%=age%>" required>

    <label>Gender:</label>
    <select name="gender">
      <option value="Male" <%=gender.equals("Male") ? "selected" : ""%>>Male</option>
      <option value="Female" <%=gender.equals("Female") ? "selected" : ""%>>Female</option>
    </select>

    <label>City:</label>
    <input type="text" name="city" value="<%=city%>" required>

    <label>Budget (?):</label>
    <input type="number" name="budget" value="<%=budget%>" required>

    <label>From Date:</label>
    <input type="date" name="fdate" value="<%=fdate%>" required>

    <label>To Date:</label>
    <input type="date" name="tdate" value="<%=tdate%>" required>

    <input type="hidden" name="email" value="<%=email%>">

    <button type="submit"> Update Profile</button>
  </form>

</body>
</html>
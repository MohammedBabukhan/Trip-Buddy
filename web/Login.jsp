<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Styling the body with a gradient background */
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #ff6a00, #ee0979); /* Orange to pink gradient */
            font-family: Arial, sans-serif;
            color: #333;
        }

        /* Center container for the form */
        .login-container {
            background: #ffffff;
            border-radius: 10px;
            padding: 30px 40px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 400px;
        }

        /* Form heading */
        h1 {
            font-size: 24px;
            color: #ff9500; /* A vibrant orange matching the background theme */
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
        }

        table td {
            padding: 10px 0;
            text-align: left;
        }

        /* Input fields styling */
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        /* Login button styling */
        input[type="submit"] {
            background-color: #ff6a00; /* Orange button color */
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #ee0979; /* Pink hover effect */
        }

        /* Link styling for a polished look */
        a {
            color: #ff6a00;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Adjusting spacing for links */
        .links {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Welcome User...</h1>
        <form action="LoginChecker" method="post">
            <table>
                <tr>
                    <td><strong>Email:</strong></td>
                    <td><input type="email" name="email" placeholder="Enter email here"></td>
                </tr>
                <tr>
                    <td><strong>Password:</strong></td>
                    <td><input type="password" name="password" placeholder="Enter password here"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login"></td>
                </tr>
            </table>
        </form>
        <div class="links">
            <p><a href="ForgotPassword.html">Forgot Password?</a></p>
            <p><a href="Registration.html">Not Registered? Sign up here!</a></p>
        </div>
    </div>
</body>
</html>
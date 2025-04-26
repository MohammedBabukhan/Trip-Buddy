<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Modern styling with enhanced visual appeal */
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #6a11cb, #2575fc); /* Deep purple to blue gradient */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }
        
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 380px;
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease;
        }
        
        .login-container:hover {
            transform: translateY(-5px);
        }
        
        h1 {
            font-size: 28px;
            color: #4a6cf7;
            margin-bottom: 30px;
            font-weight: 600;
            position: relative;
            padding-bottom: 12px;
        }
        
        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            border-radius: 2px;
        }
        
        form {
            margin-bottom: 20px;
        }
        
        table {
            width: 100%;
        }
        
        table td {
            padding: 8px 0;
            text-align: left;
        }
        
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 8px 0;
            border: 2px solid #e1e5ee;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            box-sizing: border-box;
            background-color: #f8fafc;
        }
        
        input[type="email"]:focus, input[type="password"]:focus {
            border-color: #4a6cf7;
            box-shadow: 0 0 0 3px rgba(74, 108, 247, 0.2);
            outline: none;
        }
        
        input[type="submit"] {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            font-weight: 600;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
        }
        
        input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
            background: linear-gradient(135deg, #5c0fb1, #1e68e0);
        }
        
        input[type="submit"]:active {
            transform: translateY(1px);
        }
        
        .links {
            margin-top: 25px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        
        .links p {
            margin: 5px 0;
        }
        
        a {
            color: #4a6cf7;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        a:hover {
            color: #2575fc;
        }
        
        .field-label {
            font-weight: 600;
            color: #555;
            margin-bottom: 5px;
            font-size: 14px;
        }
        
        /* Responsive adjustments */
        @media (max-width: 480px) {
            .login-container {
                width: 88%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Welcome Back</h1>
        <form action="LoginChecker" method="post">
            <table>
                <tr>
                    <td class="field-label">Email</td>
                    <td><input type="email" name="email" placeholder="Enter your email" required></td>
                </tr>
                <tr>
                    <td class="field-label">Password</td>
                    <td><input type="password" name="password" placeholder="Enter your password" required></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Sign In"></td>
                </tr>
            </table>
        </form>
        <div class="links">
            <p><a href="ForgotPassword.html">Forgot your password?</a></p>
            <p><a href="Registration.html">New user? Create an account</a></p>
        </div>
    </div>
</body>
</html>
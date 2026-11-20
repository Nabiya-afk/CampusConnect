<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Login | CampusConnect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@500;600;700;800&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            min-height: 100vh;
            font-family: 'DM Sans', sans-serif;
            background: #F5F9FC;
            color: #142B46;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 18px;
        }

        .login-wrapper {
            width: 100%;
            max-width: 950px;
            min-height: 570px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            background: white;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 15px 45px rgba(20,43,70,0.10);
        }

        .welcome-panel {
            background: linear-gradient(145deg, #142B46, #235783);
            color: white;
            padding: 55px 42px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
        }

        .brand {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 23px;
            font-weight: 800;
            letter-spacing: 0.5px;
        }

        .brand span {
            color: #75C4F4;
        }

        .welcome-content {
            position: relative;
            z-index: 1;
        }

        .welcome-content h1 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 38px;
            line-height: 1.25;
            margin-bottom: 18px;
        }

        .welcome-content p {
            color: #D9EDFA;
            font-size: 15px;
            line-height: 1.8;
        }

        .welcome-footer {
            color: #B9D8ED;
            font-size: 13px;
        }

        .circle {
            position: absolute;
            width: 280px;
            height: 280px;
            border: 1px solid rgba(255,255,255,0.13);
            border-radius: 50%;
            right: -110px;
            bottom: -80px;
        }

        .circle.two {
            width: 190px;
            height: 190px;
            right: -65px;
            bottom: -35px;
        }

        .form-panel {
            padding: 65px 48px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-panel h2 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 29px;
            margin-bottom: 9px;
        }

        .subtitle {
            color: #718096;
            font-size: 14px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 700;
            margin: 18px 0 9px;
        }

        input {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #D6E0E9;
            border-radius: 10px;
            font-size: 14px;
            font-family: inherit;
            outline: none;
            transition: 0.3s;
        }

        input:focus {
            border-color: #3289C9;
            box-shadow: 0 0 0 3px rgba(50,137,201,0.12);
        }

        button {
            width: 100%;
            margin-top: 27px;
            padding: 15px;
            background: #3289C9;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 700;
            font-family: inherit;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #142B46;
            transform: translateY(-2px);
        }

        .message {
            padding: 12px;
            margin-bottom: 18px;
            text-align: center;
            border-radius: 9px;
            background: #FEE2E2;
            color: #991B1B;
            font-size: 13px;
        }

        .register {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #718096;
        }

        a {
            color: #3289C9;
            text-decoration: none;
            font-weight: 700;
        }

        a:hover {
            text-decoration: underline;
        }

        .home {
            text-align: center;
            margin-top: 24px;
            font-size: 13px;
        }

        @media (max-width: 700px) {
            .login-wrapper {
                grid-template-columns: 1fr;
                max-width: 450px;
            }

            .welcome-panel {
                padding: 30px;
                min-height: 230px;
            }

            .welcome-content {
                margin-top: 35px;
            }

            .welcome-content h1 {
                font-size: 28px;
            }

            .welcome-footer {
                margin-top: 25px;
            }

            .form-panel {
                padding: 38px 28px;
            }
        }
    </style>
</head>

<body>

<div class="login-wrapper">

    <div class="welcome-panel">

        <div class="brand">
            Campus<span>Connect</span>
        </div>

        <div class="welcome-content">
            <h1>Your Campus Journey Starts Here.</h1>
            <p>
                Connect with your college community, discover exciting events,
                and never miss an opportunity to participate.
            </p>
        </div>

        <div class="welcome-footer">
            © 2026 CampusConnect. All rights reserved.
        </div>

        <div class="circle"></div>
        <div class="circle two"></div>

    </div>

    <div class="form-panel">

        <h2>Welcome Back!</h2>
        <p class="subtitle">Login to continue to your student account.</p>

        <% if ("invalid".equals(request.getParameter("error"))) { %>
            <div class="message">
                Invalid email or password. Please try again.
            </div>
        <% } %>

        <form action="StudentLoginServlet" method="post">

            <label>Email Address</label>
            <input type="email" name="email"
                   placeholder="Enter your email address" required>

            <label>Password</label>
            <input type="password" name="password"
                   placeholder="Enter your password" required>

            <button type="submit">Login to Account →</button>

        </form>

        <p class="register">
            Don't have an account?
            <a href="student-register.jsp">Create Account</a>
        </p>

        <p class="home">
            <a href="index.html">← Back to Home</a>
        </p>

    </div>

</div>

</body>
</html>

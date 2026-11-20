    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("adminId") != null) {
        response.sendRedirect("admin-dashboard.jsp");
        return;
    }

    String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login | CampusConnect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet">

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 25px;
            font-family: 'DM Sans', sans-serif;
            background: #F5F9FC;
            color: #142B46;
        }

        .wrapper {
            width: 100%;
            max-width: 950px;
            min-height: 550px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            background: white;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 15px 45px rgba(20,43,70,0.10);
        }

        .welcome {
            background: linear-gradient(145deg, #142B46, #235783);
            color: white;
            padding: 50px 42px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
        }

        .brand {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 24px;
            font-weight: 800;
        }

        .brand span { color: #75C4F4; }

        .welcome-content { position: relative; z-index: 1; }

        .welcome-content h1 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 37px;
            line-height: 1.3;
            margin-bottom: 18px;
        }

        .welcome-content p {
            color: #D9EDFA;
            line-height: 1.8;
            font-size: 15px;
        }

        .footer-text {
            color: #B9D8ED;
            font-size: 13px;
        }

        .circle {
            position: absolute;
            width: 270px;
            height: 270px;
            border: 1px solid rgba(255,255,255,0.14);
            border-radius: 50%;
            right: -110px;
            bottom: -90px;
        }

        .circle.two {
            width: 180px;
            height: 180px;
            right: -65px;
            bottom: -45px;
        }

        .form-panel {
            padding: 55px 45px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h2 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 29px;
            margin-bottom: 9px;
        }

        .subtitle {
            color: #718096;
            font-size: 14px;
            margin-bottom: 28px;
        }

        label {
            display: block;
            font-weight: 700;
            font-size: 14px;
            margin: 18px 0 9px;
        }

        input {
            width: 100%;
            padding: 14px;
            border: 1px solid #D7E1EA;
            border-radius: 10px;
            font-family: inherit;
            font-size: 14px;
            outline: none;
        }

        input:focus {
            border-color: #3289C9;
            box-shadow: 0 0 0 3px rgba(50,137,201,0.12);
        }

        button {
            width: 100%;
            padding: 15px;
            margin-top: 26px;
            background: #3289C9;
            color: white;
            border: none;
            border-radius: 10px;
            font-family: inherit;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #142B46;
            transform: translateY(-2px);
        }

        .error {
            background: #FEE2E2;
            color: #991B1B;
            padding: 12px;
            border-radius: 9px;
            margin-bottom: 15px;
            text-align: center;
            font-size: 13px;
        }

        .back {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
        }

        a {
            color: #3289C9;
            text-decoration: none;
            font-weight: 700;
        }

        a:hover { text-decoration: underline; }

        @media(max-width: 700px) {
            .wrapper {
                grid-template-columns: 1fr;
                max-width: 450px;
            }

            .welcome {
                min-height: 230px;
                padding: 28px;
            }

            .welcome-content { margin-top: 35px; }
            .welcome-content h1 { font-size: 27px; }
            .footer-text { margin-top: 25px; }
            .form-panel { padding: 38px 28px; }
        }
    </style>
</head>

<body>

<div class="wrapper">

    <div class="welcome">
        <div class="brand">Campus<span>Connect</span></div>

        <div class="welcome-content">
            <h1>Manage Your Campus With Confidence.</h1>
            <p>
                Welcome to the administration portal.
                Organize college events, manage registrations,
                and keep your campus community connected.
            </p>
        </div>

        <div class="footer-text">
            © 2026 CampusConnect. All rights reserved.
        </div>

        <div class="circle"></div>
        <div class="circle two"></div>
    </div>

    <div class="form-panel">

        <h2>Admin Login</h2>
        <p class="subtitle">Sign in to access your administration dashboard.</p>

        <% if ("invalid".equals(error)) { %>
            <div class="error">
                Invalid email or password. Please try again.
            </div>
        <% } %>

        <form action="AdminLoginServlet" method="POST">

            <label>Email Address</label>
            <input type="email" name="email"
                   placeholder="Enter admin email" required>

            <label>Password</label>
            <input type="password" name="password"
                   placeholder="Enter password" required>

            <button type="submit">Login as Admin →</button>

        </form>

        <div class="back">
            <a href="index.html">← Back to Home</a>
        </div>

    </div>

</div>

</body>
</html>

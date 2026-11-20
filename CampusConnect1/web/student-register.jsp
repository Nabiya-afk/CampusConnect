
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Registration | CampusConnect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'DM Sans', sans-serif;
            background: #F5F9FC;
            color: #27394D;
            min-height: 100vh;
        }

        header {
            background: #142B46;
            color: white;
            padding: 19px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 24px;
            font-weight: 800;
        }

        .home-link {
            color: white;
            background: #3289C9;
            padding: 10px 17px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }

        .page-container {
            width: 90%;
            max-width: 1050px;
            margin: 45px auto;
            display: grid;
            grid-template-columns: 0.85fr 1.15fr;
            background: white;
            border-radius: 18px;
            overflow: hidden;
            box-shadow: 0 10px 35px rgba(20,43,70,0.09);
        }

        .side-panel {
            background: linear-gradient(145deg, #142B46, #286D9E);
            color: white;
            padding: 45px 35px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .side-icon {
            width: 70px;
            height: 70px;
            background: rgba(255,255,255,0.14);
            border-radius: 17px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 35px;
            margin-bottom: 27px;
        }

        .side-panel h1 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 30px;
            line-height: 1.3;
            margin-bottom: 16px;
        }

        .side-panel p {
            color: #D9EDFA;
            line-height: 1.8;
            font-size: 15px;
        }

        .benefits {
            margin-top: 28px;
            list-style: none;
        }

        .benefits li {
            margin-bottom: 17px;
            color: #F0F7FC;
            font-size: 14px;
        }

        .form-panel {
            padding: 42px;
        }

        .form-panel h2 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #142B46;
            font-size: 27px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #718096;
            margin-bottom: 24px;
            font-size: 14px;
        }

        .message {
            padding: 12px 14px;
            border-radius: 8px;
            margin-bottom: 18px;
            font-size: 14px;
            line-height: 1.5;
            font-weight: 600;
        }

        .success {
            background: #DCFCE7;
            color: #166534;
        }

        .error {
            background: #FEE2E2;
            color: #991B1B;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 17px;
        }

        .form-group {
            margin-bottom: 17px;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-size: 14px;
            font-weight: 700;
            color: #27394D;
        }

        input, select {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #D7E1EA;
            border-radius: 8px;
            font-family: inherit;
            font-size: 14px;
            color: #27394D;
            background: #FCFDFE;
            outline: none;
            transition: 0.2s;
        }

        input:focus, select:focus {
            border-color: #3289C9;
            box-shadow: 0 0 0 3px rgba(50,137,201,0.12);
        }

        input::placeholder {
            color: #A0AEC0;
        }

        .register-btn {
            width: 100%;
            padding: 14px;
            margin-top: 5px;
            background: #3289C9;
            color: white;
            border: none;
            border-radius: 8px;
            font-family: inherit;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
        }

        .register-btn:hover {
            background: #142B46;
        }

        .login {
            text-align: center;
            margin-top: 21px;
            color: #718096;
            font-size: 14px;
        }

        .login a {
            color: #3289C9;
            text-decoration: none;
            font-weight: 700;
        }

        .login a:hover {
            text-decoration: underline;
        }

        footer {
            text-align: center;
            padding: 22px;
            color: #718096;
            font-size: 13px;
        }

        @media(max-width: 800px) {
            .page-container {
                grid-template-columns: 1fr;
                max-width: 600px;
            }

            .side-panel {
                padding: 30px;
            }

            .side-panel h1 {
                font-size: 25px;
            }

            .benefits {
                margin-top: 18px;
            }

            .form-panel {
                padding: 30px;
            }
        }

        @media(max-width: 480px) {
            header {
                padding: 17px 5%;
            }

            .brand {
                font-size: 20px;
            }

            .page-container {
                width: 92%;
                margin: 25px auto;
            }

            .form-panel {
                padding: 24px 19px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .full-width {
                grid-column: auto;
            }
        }
    </style>
</head>

<body>

<header>
    <div class="brand">CampusConnect</div>
    <a href="index.html" class="home-link">&larr; Back to Home</a>
</header>

<div class="page-container">

    <section class="side-panel">

        <div class="side-icon">🎓</div>

        <h1>Become Part of CampusConnect!</h1>

        <p>
            Your college journey is full of opportunities.
            Create your student account and discover exciting
            events, workshops and campus activities.
        </p>

        <ul class="benefits">
            <li>✓ Discover upcoming college events</li>
            <li>✓ Register for exciting activities</li>
            <li>✓ Track your event registrations</li>
            <li>✓ Make your campus experience memorable</li>
        </ul>

    </section>

    <section class="form-panel">

        <h2>Create Your Account</h2>
        <p class="subtitle">Enter your details to join the CampusConnect community.</p>

        <% if ("true".equals(request.getParameter("success"))) { %>
            <div class="message success">
                Registration successful! You can now log in to your account.
            </div>
        <% } %>

        <% if (request.getParameter("error") != null) { %>
            <div class="message error">
                <% if ("empty".equals(request.getParameter("error"))) { %>
                    Please fill in all the fields.
                <% } else if ("semester".equals(request.getParameter("error"))) { %>
                    Please enter a valid semester (1–8).
                <% } else { %>
                    Registration failed. Check whether your email or enrollment number already exists.
                <% } %>
            </div>
        <% } %>

        <!-- Updated servlet action -->
        <form action="<%= request.getContextPath() %>/StudentRegisterServlet" method="post">

            <div class="form-grid">

                <div class="form-group full-width">
                    <label>Full Name</label>
                    <input type="text" name="name"
                           placeholder="Enter your full name" required>
                </div>

                <div class="form-group full-width">
                    <label>Email Address</label>
                    <input type="email" name="email"
                           placeholder="example@email.com" required>
                </div>

                <div class="form-group full-width">
                    <label>Password</label>
                    <input type="password" name="password"
                           placeholder="Create a password"
                           required minlength="6">
                </div>

                <div class="form-group full-width">
                    <label>Enrollment Number</label>
                    <input type="text" name="enrollment_no"
                           placeholder="Enter your enrollment number" required>
                </div>

                <div class="form-group">
                    <label>Branch</label>
                    <select name="branch" required>
                        <option value="">Select Branch</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Computer Engineering">Computer Engineering</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Semester</label>
                    <select name="semester" required>
                        <option value="">Select Semester</option>
                        <% for (int i = 1; i <= 8; i++) { %>
                            <option value="<%= i %>"><%= i %></option>
                        <% } %>
                    </select>
                </div>

            </div>

            <button type="submit" class="register-btn">
                Create My Account &rarr;
            </button>

        </form>

        <p class="login">
            Already have an account?
            <a href="student-login.jsp">Login here</a>
        </p>

    </section>

</div>

<footer>
    © 2026 CampusConnect | College Event Management System
</footer>

</body>
</html>

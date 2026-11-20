
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String studentEmail = (String) session.getAttribute("studentEmail");

    if (studentEmail == null) {
        response.sendRedirect("student-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard | CampusConnect</title>
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
            font-size: 25px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .logout {
            color: white;
            text-decoration: none;
            background: #3289C9;
            padding: 11px 21px;
            border-radius: 8px;
            font-weight: 600;
            transition: 0.3s;
        }

        .logout:hover {
            background: white;
            color: #142B46;
        }

        .container {
            width: 86%;
            max-width: 1200px;
            margin: 42px auto;
        }

        .welcome {
            background: linear-gradient(120deg, #142B46, #245C87);
            color: white;
            padding: 45px;
            border-radius: 18px;
            margin-bottom: 35px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(20, 43, 70, 0.13);
        }

        .welcome::after {
            content: "";
            position: absolute;
            width: 260px;
            height: 260px;
            border: 45px solid rgba(255,255,255,0.07);
            border-radius: 50%;
            right: -55px;
            top: -90px;
        }

        .welcome-tag {
            display: inline-block;
            background: rgba(255,255,255,0.14);
            padding: 7px 13px;
            border-radius: 30px;
            font-size: 13px;
            margin-bottom: 17px;
        }

        .welcome h1 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 34px;
            margin-bottom: 13px;
            position: relative;
            z-index: 1;
        }

        .welcome p {
            color: #D9EDFA;
            line-height: 1.7;
            font-size: 16px;
            position: relative;
            z-index: 1;
        }

        .student-email {
            color: white;
            font-weight: 700;
        }

        .section-heading {
            margin-bottom: 22px;
        }

        .section-heading h2 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #142B46;
            font-size: 25px;
            margin-bottom: 7px;
        }

        .section-heading p {
            color: #718096;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 23px;
        }

        .card {
            background: white;
            padding: 28px;
            border-radius: 15px;
            box-shadow: 0 5px 22px rgba(20,43,70,0.06);
            border: 1px solid #EDF2F7;
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
            min-height: 275px;
        }

        .card:hover {
            transform: translateY(-7px);
            box-shadow: 0 13px 28px rgba(20,43,70,0.12);
        }

        .icon {
            width: 55px;
            height: 55px;
            border-radius: 13px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 27px;
            margin-bottom: 21px;
        }

        .blue { background: #E3F2FC; }
        .light { background: #E8F7F5; }
        .purple { background: #F0EAFE; }

        .card h3 {
            color: #142B46;
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 19px;
            margin-bottom: 11px;
        }

        .card p {
            color: #718096;
            line-height: 1.7;
            font-size: 14px;
            margin-bottom: 22px;
            flex-grow: 1;
        }

        .card a {
            display: inline-block;
            text-align: center;
            background: #3289C9;
            color: white;
            padding: 12px 17px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }

        .card a:hover {
            background: #142B46;
        }

        .bottom-banner {
            margin-top: 35px;
            background: #D9EDFA;
            padding: 25px 30px;
            border-radius: 13px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .bottom-banner h3 {
            color: #142B46;
            margin-bottom: 6px;
        }

        .bottom-banner p {
            color: #526B82;
            font-size: 14px;
        }

        .bottom-banner span {
            font-size: 32px;
        }

        footer {
            text-align: center;
            padding: 28px 15px;
            color: #718096;
            font-size: 14px;
            margin-top: 30px;
        }

        @media(max-width: 900px) {
            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media(max-width: 600px) {
            header {
                padding: 18px 5%;
            }

            .brand {
                font-size: 21px;
            }

            .container {
                width: 90%;
                margin: 28px auto;
            }

            .welcome {
                padding: 30px 23px;
            }

            .welcome h1 {
                font-size: 26px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .bottom-banner {
                padding: 22px;
            }
        }
    </style>
</head>

<body>

<header>
    <div class="brand">CampusConnect</div>
    <a class="logout" href="LogoutServlet">Logout</a>
</header>

<div class="container">

    <section class="welcome">
        <div class="welcome-tag">STUDENT PORTAL</div>

        <h1>Welcome Back! 👋</h1>

        <p>
            Great to see you again! You are logged in as
            <span class="student-email"><%= studentEmail %></span>.
        </p>

        <p>
            Discover exciting college events, connect with others
            and make your campus experience unforgettable.
        </p>
    </section>

    <div class="section-heading">
        <h2>Your Student Dashboard</h2>
        <p>Everything you need to explore and manage your college events.</p>
    </div>

    <div class="cards">

        <div class="card">
            <div class="icon blue">🎉</div>
            <h3>Explore Events</h3>
            <p>
                Discover upcoming college events, workshops,
                competitions and exciting campus activities.
            </p>
            <a href="StudentEventsServlet">Explore Events →</a>
        </div>

        <div class="card">
            <div class="icon light">📝</div>
            <h3>Register for Events</h3>
            <p>
                Find events that interest you and reserve your
                place to participate.
            </p>
            <a href="StudentEventsServlet">Browse & Register →</a>
        </div>

        <div class="card">
            <div class="icon purple">📅</div>
            <h3>My Registrations</h3>
            <p>
                View your registered events and keep track
                of your participation details.
            </p>
            <a href="MyRegistrationsServlet">View Registrations →</a>
        </div>

    </div>

    <div class="bottom-banner">
        <div>
            <h3>Make Every Campus Moment Count!</h3>
            <p>Explore new opportunities and be part of something exciting.</p>
        </div>
        <span>✨</span>
    </div>

</div>

<footer>
    © 2026 CampusConnect | College Event Management System
</footer>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Integer adminId = (Integer) session.getAttribute("adminId");
    String adminName = (String) session.getAttribute("adminName");

    if (adminId == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    if (adminName == null || adminName.trim().isEmpty()) {
        adminName = "Administrator";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | CampusConnect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet">

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'DM Sans', sans-serif;
            background: #F5F9FC;
            color: #27394D;
        }

        header {
            background: #142B46;
            color: white;
            padding: 20px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .brand {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 23px;
            font-weight: 800;
        }

        .brand span { color: #75C4F4; }

        .logout {
            background: #3289C9;
            color: white;
            padding: 11px 19px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: 700;
            transition: 0.3s;
        }

        .logout:hover { background: #246FA8; }

        .container {
            width: 86%;
            max-width: 1150px;
            margin: 42px auto;
        }

        .welcome {
            background: linear-gradient(120deg, #142B46, #3289C9);
            color: white;
            padding: 38px;
            border-radius: 19px;
            margin-bottom: 35px;
            box-shadow: 0 8px 25px rgba(20,43,70,0.12);
        }

        .welcome .tag {
            display: inline-block;
            background: rgba(255,255,255,0.15);
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 12px;
            margin-bottom: 17px;
        }

        .welcome h1 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 31px;
            margin-bottom: 12px;
        }

        .welcome p {
            color: #E1F1FB;
            line-height: 1.7;
        }

        .section-heading {
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #142B46;
            font-size: 23px;
            margin-bottom: 20px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 22px;
        }

        .card {
            background: white;
            padding: 28px;
            border-radius: 16px;
            box-shadow: 0 5px 20px rgba(20,43,70,0.06);
            border: 1px solid #EDF2F7;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 28px rgba(20,43,70,0.11);
        }

        .card-icon {
            width: 53px;
            height: 53px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #D9EDFA;
            color: #142B46;
            border-radius: 13px;
            font-size: 25px;
            margin-bottom: 20px;
        }

        .card h3 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #142B46;
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card p {
            color: #718096;
            line-height: 1.7;
            font-size: 14px;
            min-height: 48px;
        }

        .card a {
            display: inline-block;
            margin-top: 20px;
            background: #3289C9;
            color: white;
            padding: 12px 18px;
            border-radius: 9px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
            transition: 0.3s;
        }

        .card a:hover { background: #142B46; }

        footer {
            text-align: center;
            padding: 30px;
            color: #718096;
            font-size: 13px;
        }

        @media(max-width: 600px) {
            header { padding: 18px 5%; }
            .container { width: 90%; margin: 28px auto; }
            .welcome { padding: 27px; }
            .welcome h1 { font-size: 25px; }
        }
    </style>
</head>

<body>

<header>
    <div class="brand">Campus<span>Connect</span> Admin</div>
    <a class="logout" href="LogoutServlet">Logout ↗</a>
</header>

<div class="container">

    <div class="welcome">
        <span class="tag">ADMINISTRATION PORTAL</span>
        <h1>Welcome, <%= adminName %>!</h1>
        <p>
            Your campus management starts here.
            Create events, manage existing activities,
            and keep track of student participation.
        </p>
    </div>

    <h2 class="section-heading">Manage Your Campus</h2>

    <div class="cards">

        <div class="card">
            <div class="card-icon">＋</div>
            <h3>Add New Event</h3>
            <p>Create and publish exciting new college events for students.</p>
            <a href="add-event.jsp">Create Event →</a>
        </div>

        <div class="card">
            <div class="card-icon">▤</div>
            <h3>Manage Events</h3>
            <p>View, update, and delete existing college events.</p>
            <a href="ViewEventsServlet">Manage Events →</a>
        </div>

        <div class="card">
            <div class="card-icon">♙</div>
            <h3>View Participants</h3>
            <p>Explore student registrations and check event participation.</p>
            <a href="AdminParticipantsServlet">View Participants →</a>
        </div>

    </div>

</div>

<footer>
    © 2026 CampusConnect | Admin Portal
</footer>

</body>
</html>

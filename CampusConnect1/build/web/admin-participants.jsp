<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<Map<String, String>> participants =
        (List<Map<String, String>>) request.getAttribute("participantsList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Participants | CampusConnect</title>
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
            font-size: 22px;
            font-weight: 800;
        }

        .brand span { color: #75C4F4; }

        nav { display: flex; gap: 20px; }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        nav a:hover { color: #75C4F4; }

        .container {
            width: 90%;
            max-width: 1250px;
            margin: 42px auto;
        }

        .heading {
            margin-bottom: 27px;
        }

        h1 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 29px;
            color: #142B46;
            margin-bottom: 9px;
        }

        .subtitle {
            color: #718096;
            font-size: 14px;
            line-height: 1.6;
        }

        .table-card {
            background: white;
            padding: 22px;
            border-radius: 17px;
            box-shadow: 0 5px 20px rgba(20,43,70,0.06);
            overflow-x: auto;
            border: 1px solid #EDF2F7;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 950px;
        }

        th {
            background: #142B46;
            color: white;
            padding: 16px 14px;
            text-align: left;
            font-size: 13px;
            white-space: nowrap;
        }

        th:first-child { border-radius: 8px 0 0 0; }
        th:last-child { border-radius: 0 8px 0 0; }

        td {
            padding: 15px 14px;
            border-bottom: 1px solid #E8EEF4;
            font-size: 13px;
            color: #4A5D70;
        }

        tbody tr:hover { background: #F5F9FC; }

        .status {
            display: inline-block;
            background: #D9EDFA;
            color: #142B46;
            padding: 7px 12px;
            border-radius: 20px;
            font-weight: 700;
            font-size: 12px;
            white-space: nowrap;
        }

        .empty {
            background: white;
            padding: 55px 25px;
            text-align: center;
            border-radius: 17px;
            box-shadow: 0 5px 20px rgba(20,43,70,0.06);
        }

        .empty-icon {
            font-size: 42px;
            margin-bottom: 15px;
        }

        .empty h2 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #142B46;
            margin-bottom: 10px;
        }

        .empty p { color: #718096; }

        .back-button {
            display: inline-block;
            margin-top: 25px;
            background: #3289C9;
            color: white;
            padding: 12px 20px;
            border-radius: 9px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
        }

        .back-button:hover { background: #142B46; }

        footer {
            text-align: center;
            padding: 28px;
            color: #718096;
            font-size: 13px;
        }

        @media(max-width: 600px) {
            header { padding: 18px 5%; }
            .container { margin: 28px auto; }
            h1 { font-size: 25px; }
        }
    </style>
</head>

<body>

<header>
    <div class="brand">Campus<span>Connect</span> Admin</div>

    <nav>
        <a href="admin-dashboard.jsp">Dashboard</a>
        <a href="LogoutServlet">Logout</a>
    </nav>
</header>

<div class="container">

    <div class="heading">
        <h1>Registered Participants</h1>
        <p class="subtitle">
            View student details and their registrations for college events.
        </p>
    </div>

    <% if (participants != null && !participants.isEmpty()) { %>

        <div class="table-card">

            <table>
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Enrollment No.</th>
                        <th>Email</th>
                        <th>Event Name</th>
                        <th>Event Date</th>
                        <th>Registration Date</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>

                    <% for (Map<String, String> p : participants) { %>

                        <tr>
                            <td><%= p.get("name") %></td>
                            <td><%= p.get("enrollmentNo") %></td>
                            <td><%= p.get("email") %></td>
                            <td><%= p.get("eventName") %></td>
                            <td><%= p.get("eventDate") %></td>
                            <td><%= p.get("registrationDate") %></td>
                            <td>
                                <span class="status">
                                    <%= p.get("status") %>
                                </span>
                            </td>
                        </tr>

                    <% } %>

                </tbody>
            </table>

        </div>

    <% } else { %>

        <div class="empty">
            <div class="empty-icon">♙</div>
            <h2>No Participants Found</h2>
            <p>No students have registered for any events yet.</p>
        </div>

    <% } %>

    <a class="back-button" href="admin-dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

<footer>
    © 2026 CampusConnect | Admin Portal
</footer>

</body>
</html>

<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.campusconnect.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<Event> events = (List<Event>) request.getAttribute("events");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Events | CampusConnect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Plus+Jakarta+Sans:wght@600;700;800&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'DM Sans', sans-serif;
            background: #F5F9FC;
            color: #27394D;
        }

        header {
            background: #142B46;
            padding: 20px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .brand {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 24px;
            font-weight: 800;
            color: white;
            letter-spacing: -0.5px;
        }

        .brand span {
            color: #65B7ED;
        }

        .header-link {
            text-decoration: none;
            color: white;
            background: rgba(255,255,255,0.12);
            padding: 10px 17px;
            border-radius: 9px;
            font-weight: 600;
            transition: 0.3s;
        }

        .header-link:hover {
            background: #3289C9;
        }

        .container {
            max-width: 1250px;
            margin: 45px auto;
            padding: 0 25px;
        }

        .welcome {
            background: linear-gradient(120deg, #142B46, #235D88);
            padding: 35px;
            border-radius: 18px;
            color: white;
            margin-bottom: 30px;
            box-shadow: 0 10px 28px rgba(20,43,70,0.12);
        }

        .welcome-label {
            color: #A9D9F5;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 10px;
        }

        .welcome h1 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 30px;
            margin-bottom: 9px;
        }

        .welcome p {
            color: #D8EAF6;
            font-size: 15px;
            line-height: 1.6;
        }

        .heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 18px;
            margin-bottom: 23px;
        }

        .section-title {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 22px;
            color: #142B46;
        }

        .section-subtitle {
            color: #718096;
            margin-top: 6px;
            font-size: 14px;
        }

        .add-btn {
            display: inline-block;
            text-decoration: none;
            background: #3289C9;
            color: white;
            padding: 12px 19px;
            border-radius: 9px;
            font-weight: 700;
            transition: 0.3s;
            box-shadow: 0 4px 12px rgba(50,137,201,0.2);
        }

        .add-btn:hover {
            background: #17649B;
            transform: translateY(-2px);
        }

        .table-card {
            background: white;
            border-radius: 16px;
            padding: 22px;
            box-shadow: 0 5px 25px rgba(20,43,70,0.06);
            border: 1px solid #EAF0F5;
        }

        .table-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .table-top h3 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #142B46;
            font-size: 17px;
        }

        .event-count {
            background: #EAF4FB;
            color: #17649B;
            padding: 7px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        th {
            background: #F0F6FA;
            color: #52677D;
            text-align: left;
            padding: 15px 13px;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            white-space: nowrap;
        }

        th:first-child {
            border-radius: 8px 0 0 8px;
        }

        th:last-child {
            border-radius: 0 8px 8px 0;
        }

        td {
            padding: 16px 13px;
            border-bottom: 1px solid #EDF1F5;
            font-size: 13px;
            vertical-align: middle;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tbody tr {
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #FAFCFE;
        }

        .event-id {
            color: #718096;
            font-weight: 700;
        }

        .event-name {
            color: #142B46;
            font-weight: 700;
        }

        .description {
            max-width: 190px;
            color: #718096;
            line-height: 1.5;
        }

        .date-badge {
            background: #F0F6FA;
            color: #17649B;
            padding: 6px 9px;
            border-radius: 6px;
            white-space: nowrap;
            font-size: 12px;
            font-weight: 600;
        }

        .participants {
            color: #17649B;
            font-weight: 700;
        }

        .actions {
            white-space: nowrap;
        }

        .edit-btn, .delete-btn {
            display: inline-block;
            text-decoration: none;
            border: none;
            padding: 8px 12px;
            border-radius: 7px;
            font-family: inherit;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }

        .edit-btn {
            background: #D9EDFA;
            color: #17649B;
            margin-right: 5px;
        }

        .edit-btn:hover {
            background: #BBDFF5;
        }

        .delete-btn {
            background: #FCE8E8;
            color: #B42318;
        }

        .delete-btn:hover {
            background: #F8D0D0;
        }

        .empty {
            text-align: center;
            padding: 55px 20px;
            color: #718096;
        }

        .empty-icon {
            font-size: 38px;
            margin-bottom: 12px;
        }

        .empty h3 {
            color: #142B46;
            font-family: 'Plus Jakarta Sans', sans-serif;
            margin-bottom: 7px;
        }

        .empty p {
            font-size: 14px;
            margin-bottom: 18px;
        }

        footer {
            text-align: center;
            padding: 25px;
            color: #8A99A9;
            font-size: 12px;
        }

        @media(max-width: 600px) {
            header {
                padding: 18px 5%;
            }

            .container {
                margin: 28px auto;
                padding: 0 15px;
            }

            .welcome {
                padding: 25px 20px;
            }

            .welcome h1 {
                font-size: 24px;
            }

            .heading {
                align-items: flex-start;
            }

            .add-btn {
                width: 100%;
                text-align: center;
            }

            .table-card {
                padding: 15px;
            }
        }
    </style>
</head>

<body>

<header>
    <div class="brand">Campus<span>Connect</span></div>
    <a href="admin-dashboard.jsp" class="header-link">Admin Dashboard</a>
</header>

<div class="container">

    <section class="welcome">
        <div class="welcome-label">Event Administration</div>
        <h1>Manage Your Events</h1>
        <p>Keep track of college events, update event details and manage your campus activities from one place.</p>
    </section>

    <div class="heading">
        <div>
            <h2 class="section-title">All Events</h2>
            <p class="section-subtitle">View, edit and manage all registered college events.</p>
        </div>

        <a href="add-event.jsp" class="add-btn">+ Add New Event</a>
    </div>

    <div class="table-card">

        <div class="table-top">
            <h3>Event Records</h3>
            <span class="event-count">
                <%= (events == null) ? 0 : events.size() %> Events
            </span>
        </div>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Event Name</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Venue</th>
                        <th>Participants</th>
                        <th>Admin ID</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>

                <%
                    if (events != null && !events.isEmpty()) {
                        for (Event event : events) {
                %>

                    <tr>
                        <td class="event-id"><%= event.getEventId() %></td>

                        <td class="event-name">
                            <%= event.getEventName() %>
                        </td>

                        <td class="description">
                            <%= event.getDescription() %>
                        </td>

                        <td>
                            <span class="date-badge">
                                <%= event.getEventDate() %>
                            </span>
                        </td>

                        <td><%= event.getVenue() %></td>

                        <td class="participants">
                            <%= event.getMaxParticipants() %>
                        </td>

                        <td><%= event.getAdminId() %></td>

                        <td class="actions">

                            <a class="edit-btn"
                               href="edit-event.jsp?eventId=<%=event.getEventId()%>&eventName=<%=URLEncoder.encode(event.getEventName(), "UTF-8")%>&description=<%=URLEncoder.encode(event.getDescription(), "UTF-8")%>&eventDate=<%=event.getEventDate()%>&venue=<%=URLEncoder.encode(event.getVenue(), "UTF-8")%>&maxParticipants=<%=event.getMaxParticipants()%>&adminId=<%=event.getAdminId()%>">
                                Edit
                            </a>

                            <a class="delete-btn"
                               href="DeleteEventServlet?eventId=<%=event.getEventId()%>"
                               onclick="return confirm('Are you sure you want to delete this event?');">
                                Delete
                            </a>

                        </td>
                    </tr>

                <%
                        }
                    } else {
                %>

                    <tr>
                        <td colspan="8">
                            <div class="empty">
                                <div class="empty-icon">&#128197;</div>
                                <h3>No Events Yet</h3>
                                <p>There are currently no events available. Start by adding your first college event.</p>
                                <a href="add-event.jsp" class="add-btn">+ Create First Event</a>
                            </div>
                        </td>
                    </tr>

                <%
                    }
                %>

                </tbody>
            </table>
        </div>

    </div>

</div>

<footer>
    CampusConnect &copy; 2026 | College Event Management System
</footer>

</body>
</html>

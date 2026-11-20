<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    String studentEmail = (String) session.getAttribute("studentEmail");

    if (studentEmail == null) {
        response.sendRedirect("student-login.jsp");
        return;
    }

    List<Map<String, String>> registrations =
        (List<Map<String, String>>) request.getAttribute("registrationsList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Registrations | CampusConnect</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #F5F9FC;
            color: #27394D;
        }

        header {
            background: #142B46;
            color: white;
            padding: 22px 7%;
        }

        header h2 {
            margin-bottom: 12px;
        }

        header a {
            color: #D9EDFA;
            text-decoration: none;
            margin-right: 20px;
        }

        .container {
            width: 86%;
            max-width: 1100px;
            margin: 40px auto;
        }

        h1 {
            color: #142B46;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #718096;
            margin-bottom: 28px;
        }

        .registration-card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.07);
            border-left: 5px solid #3289C9;
        }

        .registration-card h2 {
            color: #142B46;
            margin-bottom: 12px;
        }

        .registration-card p {
            margin: 9px 0;
            line-height: 1.5;
        }

        .status {
            display: inline-block;
            background: #D9EDFA;
            color: #142B46;
            padding: 7px 13px;
            border-radius: 20px;
            font-weight: bold;
            margin-top: 8px;
        }

        .cancelled-status {
            background: #FDE2E2;
            color: #B42318;
        }

        .cancel-button {
            background: #DC3545;
            color: white;
            border: none;
            padding: 11px 18px;
            border-radius: 7px;
            cursor: pointer;
            margin-top: 18px;
            font-size: 14px;
            font-weight: bold;
            transition: 0.3s;
        }

        .cancel-button:hover {
            background: #B02A37;
        }

        .empty {
            background: white;
            padding: 35px;
            border-radius: 12px;
            text-align: center;
        }

        .back-button {
            display: inline-block;
            margin-top: 25px;
            background: #3289C9;
            color: white;
            padding: 12px 22px;
            text-decoration: none;
            border-radius: 7px;
        }

        .message {
            padding: 13px 16px;
            margin-bottom: 20px;
            border-radius: 7px;
        }

        .success {
            background: #D1FAE5;
            color: #065F46;
        }

        .error {
            background: #FDE2E2;
            color: #B42318;
        }

        @media (max-width: 600px) {
            .container {
                width: 92%;
            }
        }
    </style>
</head>

<body>

<header>
    <h2>CampusConnect</h2>
    <a href="student-dashboard.jsp">Dashboard</a>
    <a href="StudentEventsServlet">Explore Events</a>
    <a href="LogoutServlet">Logout</a>
</header>

<div class="container">

    <h1>My Registrations</h1>
    <p class="subtitle">View all the events you have registered for.</p>

    <%
        String message = request.getParameter("message");

        if ("cancelled".equals(message)) {
    %>
        <div class="message success">
            Your event registration has been cancelled successfully!
        </div>
    <%
        } else if ("failed".equals(message)) {
    %>
        <div class="message error">
            Unable to cancel registration. Please try again.
        </div>
    <%
        } else if ("invalid".equals(message)) {
    %>
        <div class="message error">
            Invalid registration details.
        </div>
    <%
        }
    %>

    <% if (registrations != null && !registrations.isEmpty()) { %>

        <% for (Map<String, String> item : registrations) { %>

            <div class="registration-card">

                <h2><%= item.get("eventName") %></h2>

                <p><strong>Description:</strong>
                    <%= item.get("description") %></p>

                <p><strong>Event Date:</strong>
                    <%= item.get("eventDate") %></p>

                <p><strong>Venue:</strong>
                    <%= item.get("venue") %></p>

                <p><strong>Registration Date:</strong>
                    <%= item.get("registrationDate") %></p>

                <span class="status <%= "CANCELLED".equalsIgnoreCase(item.get("status")) ? "cancelled-status" : "" %>">
                    <%= item.get("status") %>
                </span>

                <% if ("REGISTERED".equalsIgnoreCase(item.get("status"))) { %>

                    <form action="CancelRegistrationServlet"
                          method="post"
                          onsubmit="return confirm('Are you sure you want to cancel this registration?');">

                        <input type="hidden"
                               name="registrationId"
                               value="<%= item.get("registrationId") %>">

                        <button type="submit" class="cancel-button">
                            Cancel Registration
                        </button>

                    </form>

                <% } else if ("CANCELLED".equalsIgnoreCase(item.get("status"))) { %>

                    <p style="color: #B42318; margin-top: 15px;">
                        This registration has been cancelled.
                    </p>

                <% } %>

            </div>

        <% } %>

    <% } else { %>

        <div class="empty">
            <h2>No Registrations Yet!</h2>
            <p>You haven't registered for any events.</p>
            <a class="back-button" href="StudentEventsServlet">
                Explore Events
            </a>
        </div>

    <% } %>

    <a class="back-button" href="student-dashboard.jsp">
        Back to Dashboard
    </a>

</div>

</body>
</html>
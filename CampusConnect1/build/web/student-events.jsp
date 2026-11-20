
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.campusconnect.Event" %>

<%
    String studentEmail = (String) session.getAttribute("studentEmail");
    String studentName = (String) request.getAttribute("studentName");

    if (studentEmail == null) {
        response.sendRedirect("student-login.jsp");
        return;
    }

    List<Event> events = (List<Event>) request.getAttribute("eventsList");
    String message = request.getParameter("message");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Explore Events | CampusConnect</title>
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
            padding: 19px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .brand {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 24px;
            font-weight: 800;
        }

        .header-link {
            color: white;
            background: #3289C9;
            text-decoration: none;
            padding: 11px 17px;
            border-radius: 8px;
            font-weight: 600;
        }

        .container {
            width: 88%;
            max-width: 1200px;
            margin: 38px auto;
        }

        .hero {
            background: linear-gradient(120deg, #142B46, #286D9E);
            padding: 42px;
            border-radius: 18px;
            color: white;
            margin-bottom: 35px;
            position: relative;
            overflow: hidden;
        }

        .hero::after {
            content: "";
            position: absolute;
            width: 230px;
            height: 230px;
            border: 40px solid rgba(255,255,255,0.07);
            border-radius: 50%;
            right: -45px;
            top: -85px;
        }

        .hero-tag {
            display: inline-block;
            padding: 7px 13px;
            border-radius: 30px;
            background: rgba(255,255,255,0.15);
            font-size: 13px;
            margin-bottom: 16px;
        }

        .hero h1 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 32px;
            margin-bottom: 12px;
            position: relative;
            z-index: 1;
        }

        .hero p {
            color: #D9EDFA;
            line-height: 1.7;
            position: relative;
            z-index: 1;
        }

        .section-heading {
            margin-bottom: 23px;
        }

        .section-heading h2 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 25px;
            color: #142B46;
            margin-bottom: 7px;
        }

        .section-heading p { color: #718096; }

        .message {
            padding: 14px 18px;
            border-radius: 9px;
            margin-bottom: 22px;
            font-weight: 600;
        }

        .error {
            background: #FCE4E4;
            color: #A12626;
        }

        .events {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
            gap: 23px;
        }

        .event-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            border: 1px solid #EAF0F5;
            box-shadow: 0 5px 20px rgba(20,43,70,0.06);
            display: flex;
            flex-direction: column;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .event-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 13px 28px rgba(20,43,70,0.12);
        }

        .event-icon {
            width: 52px;
            height: 52px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #E3F2FC;
            border-radius: 13px;
            font-size: 26px;
            margin-bottom: 18px;
        }

        .event-card h3 {
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #142B46;
            font-size: 19px;
            margin-bottom: 10px;
        }

        .description {
            color: #718096;
            line-height: 1.7;
            font-size: 14px;
            margin-bottom: 18px;
            overflow-wrap: anywhere;
            flex-grow: 1;
        }

        .details {
            background: #F5F9FC;
            border-radius: 9px;
            padding: 13px;
            line-height: 1.9;
            font-size: 14px;
            margin-bottom: 17px;
            overflow-wrap: anywhere;
        }

        .details strong { color: #142B46; }

        .register-btn {
            width: 100%;
            padding: 13px;
            background: #3289C9;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-family: inherit;
            font-size: 15px;
            font-weight: 700;
            transition: 0.3s;
        }

        .register-btn:hover { background: #142B46; }

        .empty {
            background: white;
            padding: 45px 20px;
            border-radius: 14px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(20,43,70,0.05);
        }

        .empty-icon { font-size: 42px; margin-bottom: 15px; }
        .empty h3 { color: #142B46; margin-bottom: 9px; }
        .empty p { color: #718096; }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            inset: 0;
            background: rgba(10,25,42,0.65);
            justify-content: center;
            align-items: center;
            padding: 18px;
        }

        .modal-content {
            background: white;
            width: 100%;
            max-width: 460px;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
            text-align: center;
            animation: appear 0.2s ease-out;
        }

        @keyframes appear {
            from { opacity: 0; transform: translateY(12px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .modal-content h2 {
            color: #142B46;
            font-family: 'Plus Jakarta Sans', sans-serif;
            margin-bottom: 10px;
        }

        .modal-content > p {
            color: #718096;
            line-height: 1.6;
        }

        .student-info, .event-info {
            background: #F5F9FC;
            padding: 15px;
            border-radius: 9px;
            margin: 16px 0;
            line-height: 1.9;
            text-align: left;
            overflow-wrap: anywhere;
            font-size: 14px;
        }

        .modal-actions {
            display: flex;
            gap: 12px;
            margin-top: 20px;
        }

        .modal-actions button {
            flex: 1;
            padding: 13px 8px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-family: inherit;
            font-size: 14px;
            font-weight: 700;
        }

        .confirm-btn, .done-btn {
            background: #3289C9;
            color: white;
        }

        .cancel-btn {
            background: #E9EEF3;
            color: #27394D;
        }

        .success-icon {
            width: 65px;
            height: 65px;
            background: #DDF5E5;
            color: #176B37;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 35px;
            margin: 0 auto 18px;
        }

        .success-title { color: #176B37 !important; }

        .done-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 700;
            margin-top: 12px;
        }

        footer {
            text-align: center;
            padding: 28px 15px;
            color: #718096;
            font-size: 14px;
            margin-top: 25px;
        }

        @media(max-width: 600px) {
            header { padding: 17px 5%; }
            .container { width: 90%; margin: 25px auto; }
            .hero { padding: 30px 23px; }
            .hero h1 { font-size: 26px; }
            .events { grid-template-columns: 1fr; }
            .modal-content { padding: 23px 18px; }
        }
    </style>
</head>

<body>

<header>
    <div class="brand">CampusConnect</div>
    <a class="header-link" href="student-dashboard.jsp">← Dashboard</a>
</header>

<div class="container">

    <section class="hero">
        <div class="hero-tag">STUDENT EVENT PORTAL</div>
        <h1>Discover. Participate. Experience! 🎉</h1>
        <p>
            Hey <strong><%= studentName == null ? "Student" : studentName %></strong>!
            Explore exciting college events, workshops and competitions.
            Find your next campus experience here.
        </p>
    </section>

    <% if ("duplicate".equals(message)) { %>
        <div class="message error">You have already registered for this event.</div>
    <% } else if ("full".equals(message)) { %>
        <div class="message error">Sorry! This event is already full.</div>
    <% } else if ("failed".equals(message)) { %>
        <div class="message error">Registration failed. Please try again.</div>
    <% } else if ("invalid".equals(message)) { %>
        <div class="message error">Invalid event selection.</div>
    <% } %>

    <div class="section-heading">
        <h2>Explore Upcoming Events</h2>
        <p>Choose an event that interests you and reserve your place!</p>
    </div>

    <% if (events != null && !events.isEmpty()) { %>

        <div class="events">

            <% for (Event event : events) { %>

                <div class="event-card">

                    <div class="event-icon">🎓</div>

                    <h3><%= event.getEventName() %></h3>

                    <p class="description"><%= event.getDescription() %></p>

                    <div class="details">
                        <strong>📅 Date:</strong>
                        <%= event.getEventDate() %><br>

                        <strong>📍 Venue:</strong>
                        <%= event.getVenue() %><br>

                        <strong>👥 Maximum Participants:</strong>
                        <%= event.getMaxParticipants() %>
                    </div>

                    <button class="register-btn"
                        type="button"
                        onclick="openRegistration(
                            '<%= event.getEventId() %>',
                            '<%= event.getEventName().replace("\\", "\\\\").replace("'", "\\'") %>',
                            '<%= event.getEventDate() %>',
                            '<%= event.getVenue().replace("\\", "\\\\").replace("'", "\\'") %>'
                        )">
                        Register for Event →
                    </button>

                </div>

            <% } %>

        </div>

    <% } else { %>

        <div class="empty">
            <div class="empty-icon">📭</div>
            <h3>No Events Available Right Now</h3>
            <p>Please check again later for exciting campus events.</p>
        </div>

    <% } %>

</div>

<!-- Registration Confirmation Popup -->

<div class="modal" id="registrationModal">
    <div class="modal-content">

        <h2>Confirm Your Registration</h2>
        <p>Please review your details before registering.</p>

        <div class="student-info">
            <strong>Student Name:</strong>
            <%= studentName == null ? "" : studentName %><br>

            <strong>Email:</strong>
            <%= studentEmail %>
        </div>

        <div class="event-info">
            <strong>Event:</strong>
            <span id="modalEventName"></span><br>

            <strong>Date:</strong>
            <span id="modalEventDate"></span><br>

            <strong>Venue:</strong>
            <span id="modalEventVenue"></span>
        </div>

        <form action="StudentEventRegisterServlet" method="post">
            <input type="hidden" name="eventId" id="modalEventId">

            <div class="modal-actions">
                <button type="submit" class="confirm-btn">
                    Confirm Registration
                </button>

                <button type="button" class="cancel-btn"
                        onclick="closeRegistration()">
                    Cancel
                </button>
            </div>
        </form>

    </div>
</div>

<!-- Registration Success Popup -->

<div class="modal" id="successModal">
    <div class="modal-content">

        <div class="success-icon">✓</div>

        <h2 class="success-title">Registration Successful!</h2>

        <p>
            Congratulations! Your event registration has been
            completed successfully.
        </p>

        <div class="event-info">
            <strong>Student:</strong>
            <%= studentName == null ? "" : studentName %><br>

            <strong>Email:</strong>
            <%= studentEmail %><br>

            <strong>Status:</strong> REGISTERED
        </div>

        <button class="done-btn" onclick="closeSuccess()">Done</button>

    </div>
</div>

<footer>
    © 2026 CampusConnect | College Event Management System
</footer>

<script>
    function openRegistration(id, name, date, venue) {
        document.getElementById("modalEventId").value = id;
        document.getElementById("modalEventName").textContent = name;
        document.getElementById("modalEventDate").textContent = date;
        document.getElementById("modalEventVenue").textContent = venue;

        document.getElementById("registrationModal").style.display = "flex";
    }

    function closeRegistration() {
        document.getElementById("registrationModal").style.display = "none";
    }

    function closeSuccess() {
        document.getElementById("successModal").style.display = "none";
        window.history.replaceState({}, document.title, window.location.pathname);
    }

    document.getElementById("registrationModal").addEventListener("click", function(event) {
        if (event.target === this) {
            closeRegistration();
        }
    });

    <% if ("success".equals(message)) { %>
        window.addEventListener("DOMContentLoaded", function() {
            document.getElementById("successModal").style.display = "flex";
        });
    <% } %>
</script>

</body>
</html>


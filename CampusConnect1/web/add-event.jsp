<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Integer adminId = (Integer) session.getAttribute("adminId");

    if (adminId == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Event | CampusConnect</title>
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
            gap: 15px;
        }

        .brand {
            font-family: 'Plus Jakarta Sans', sans-serif;
            font-size: 23px;
            font-weight: 800;
        }

        .brand span { color: #75C4F4; }

        header a {
            color: white;
            text-decoration: none;
            background: #3289C9;
            padding: 11px 16px;
            border-radius: 9px;
            font-weight: 700;
            font-size: 13px;
        }

        header a:hover { background: #246FA8; }

        .container {
            max-width: 760px;
            margin: 45px auto;
            padding: 0 20px;
        }

        .form-card {
            background: white;
            padding: 38px;
            border-radius: 18px;
            box-shadow: 0 6px 25px rgba(20,43,70,0.07);
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
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .form-group { margin-bottom: 21px; }

        label {
            display: block;
            font-weight: 700;
            font-size: 14px;
            margin-bottom: 9px;
        }

        input, textarea {
            width: 100%;
            padding: 14px;
            border: 1px solid #D7E1EA;
            border-radius: 9px;
            font-family: inherit;
            font-size: 14px;
            outline: none;
            background: #FCFDFE;
        }

        input:focus, textarea:focus {
            border-color: #3289C9;
            box-shadow: 0 0 0 3px rgba(50,137,201,0.12);
        }

        textarea { min-height: 115px; resize: vertical; }

        .submit-btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 9px;
            background: #3289C9;
            color: white;
            font-family: inherit;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
        }

        .submit-btn:hover {
            background: #142B46;
            transform: translateY(-2px);
        }

        .back-link {
            display: inline-block;
            margin-top: 23px;
            color: #3289C9;
            text-decoration: none;
            font-weight: 700;
            font-size: 14px;
        }

        .back-link:hover { text-decoration: underline; }

        @media(max-width: 600px) {
            .form-card { padding: 25px 20px; }
            h1 { font-size: 24px; }
            header { padding: 18px 5%; }
        }
    </style>
</head>

<body>

<header>
    <div class="brand">Campus<span>Connect</span></div>
    <a href="admin-dashboard.jsp">Admin Dashboard</a>
</header>

<div class="container">

    <div class="form-card">

        <h1>Create a New Event</h1>
        <p class="subtitle">
            Add an exciting event and share it with your college community.
        </p>

        <form action="AddEventServlet" method="post">

            <input type="hidden" name="adminId" value="<%= adminId %>">

            <div class="form-group">
                <label>Event Name</label>
                <input type="text" name="eventName"
                       placeholder="Enter event name" required>
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea name="description"
                          placeholder="Describe your event..." required></textarea>
            </div>

            <div class="form-group">
                <label>Event Date</label>
                <input type="date" name="eventDate" required>
            </div>

            <div class="form-group">
                <label>Venue</label>
                <input type="text" name="venue"
                       placeholder="Enter event venue" required>
            </div>

            <div class="form-group">
                <label>Maximum Participants</label>
                <input type="number" name="maxParticipants"
                       min="1" placeholder="Enter participant limit" required>
            </div>

            <button type="submit" class="submit-btn">
                + Publish Event
            </button>

        </form>

        <a href="ViewEventsServlet" class="back-link">
            ← Back to Manage Events
        </a>

    </div>

</div>

</body>
</html>

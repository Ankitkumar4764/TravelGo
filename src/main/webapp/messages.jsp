<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.travel.model.Message" %>

<%
    Integer currentUserId = (Integer) session.getAttribute("userId");

    if (currentUserId == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String contextPath = request.getContextPath();
    String success = request.getParameter("success");
    String error = request.getParameter("error");

    List<Message> messages =
            (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages | TravelGo</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --navy: #10213f;
            --muted: #64748b;
            --border: #e5eaf2;
            --background: #f5f8fd;
            --white: #ffffff;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: var(--background);
            color: var(--navy);
            min-height: 100vh;
        }

        a {
            text-decoration: none;
        }

        .navbar {
            background: var(--white);
            border-bottom: 1px solid var(--border);
            padding: 0 6%;
            min-height: 76px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 24px;
            flex-wrap: wrap;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 11px;
            color: var(--navy);
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.8px;
        }

        .brand-icon {
            width: 42px;
            height: 42px;
            border-radius: 13px;
            display: grid;
            place-items: center;
            background: #eaf1ff;
            color: var(--primary);
            font-size: 23px;
        }

        .brand span:last-child {
            color: var(--primary);
        }

        .nav-links {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: #526078;
            font-size: 14px;
            font-weight: 600;
            transition: color 0.2s;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: var(--primary);
        }

        .nav-links .logout {
            padding: 10px 16px;
            border: 1px solid var(--border);
            border-radius: 9px;
            color: var(--navy);
        }

        .nav-links .logout:hover {
            border-color: var(--primary);
            color: var(--primary);
        }

        .page {
            max-width: 1160px;
            width: 90%;
            margin: 38px auto 60px;
        }

        .breadcrumb {
            margin-bottom: 20px;
            color: var(--muted);
            font-size: 13px;
        }

        .breadcrumb a {
            color: var(--primary);
            font-weight: 600;
        }

        .page-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 28px;
        }

        .eyebrow {
            color: var(--primary);
            text-transform: uppercase;
            letter-spacing: 1.8px;
            font-size: 11px;
            font-weight: 800;
            margin-bottom: 9px;
        }

        h1 {
            font-size: clamp(28px, 4vw, 38px);
            letter-spacing: -1.2px;
            margin-bottom: 9px;
        }

        .subtitle {
            color: var(--muted);
            line-height: 1.7;
            font-size: 15px;
        }

        .heading-icon {
            width: 68px;
            height: 68px;
            display: grid;
            place-items: center;
            border-radius: 22px;
            background: #e7efff;
            color: var(--primary);
            font-size: 31px;
        }

        .alert {
            padding: 15px 18px;
            border-radius: 12px;
            margin-bottom: 22px;
            font-size: 14px;
            font-weight: 600;
        }

        .success {
            background: #ecfdf3;
            border: 1px solid #bbf7d0;
            color: #166534;
        }

        .error {
            background: #fff1f2;
            border: 1px solid #fecdd3;
            color: #9f1239;
        }

        .content-grid {
            display: grid;
            grid-template-columns: minmax(0, 0.85fr) minmax(0, 1.15fr);
            gap: 24px;
            align-items: start;
        }

        .panel {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 19px;
            box-shadow: 0 8px 28px rgba(25, 49, 90, 0.045);
            overflow: hidden;
        }

        .panel-header {
            padding: 23px 25px;
            border-bottom: 1px solid var(--border);
        }

        .panel-header h2 {
            font-size: 19px;
            margin-bottom: 7px;
        }

        .panel-header p {
            color: var(--muted);
            font-size: 13px;
            line-height: 1.6;
        }

        .form-body {
            padding: 25px;
        }

        .field {
            margin-bottom: 21px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 9px;
            color: #334155;
        }

        input,
        textarea {
            display: block;
            width: 100%;
            font: inherit;
            font-size: 14px;
            color: var(--navy);
            padding: 13px 14px;
            border: 1px solid #dbe3ef;
            border-radius: 10px;
            outline: none;
            background: #fbfcff;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus,
        textarea:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            background: var(--white);
        }

        input {
            min-height: 47px;
        }

        textarea {
            min-height: 150px;
            resize: vertical;
            line-height: 1.6;
        }

        .field-hint {
            display: block;
            margin-top: 7px;
            color: var(--muted);
            font-size: 12px;
            line-height: 1.5;
        }

        .send-button {
            width: 100%;
            border: 0;
            border-radius: 10px;
            background: var(--primary);
            color: white;
            min-height: 49px;
            padding: 13px 18px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }

        .send-button:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
        }

        .messages-body {
            padding: 22px;
        }

        .message-card {
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 19px;
            margin-bottom: 15px;
            background: #fff;
            transition: box-shadow 0.2s, border-color 0.2s;
            overflow-wrap: anywhere;
        }

        .message-card:last-child {
            margin-bottom: 0;
        }

        .message-card:hover {
            border-color: #cbd9f6;
            box-shadow: 0 5px 18px rgba(25, 49, 90, 0.06);
        }

        .message-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 17px;
        }

        .message-number {
            color: var(--muted);
            font-size: 12px;
            font-weight: 700;
        }

        .message-badge {
            padding: 6px 10px;
            background: #edf3ff;
            color: var(--primary);
            border-radius: 7px;
            font-size: 11px;
            font-weight: 800;
        }

        .message-detail {
            margin-bottom: 13px;
        }

        .message-detail:last-child {
            margin-bottom: 0;
        }

        .detail-label {
            color: var(--muted);
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.7px;
            margin-bottom: 5px;
        }

        .detail-value {
            color: #263752;
            font-size: 14px;
            line-height: 1.7;
            white-space: pre-wrap;
        }

        .message-text {
            background: #f7f9fe;
            border-radius: 9px;
            padding: 12px;
        }

        .empty-state {
            text-align: center;
            padding: 42px 20px;
        }

        .empty-icon {
            width: 65px;
            height: 65px;
            border-radius: 20px;
            background: #edf3ff;
            color: var(--primary);
            display: grid;
            place-items: center;
            margin: 0 auto 18px;
            font-size: 29px;
        }

        .empty-state h3 {
            font-size: 18px;
            margin-bottom: 9px;
        }

        .empty-state p {
            color: var(--muted);
            font-size: 13px;
            line-height: 1.7;
            max-width: 280px;
            margin: auto;
        }

        .footer {
            text-align: center;
            color: #8490a4;
            font-size: 12px;
            padding: 0 15px 30px;
        }

        @media (max-width: 850px) {
            .content-grid {
                grid-template-columns: 1fr;
            }

            .navbar {
                padding: 17px 5%;
            }

            .nav-links {
                gap: 15px;
            }

            .page {
                margin-top: 28px;
            }
        }

        @media (max-width: 520px) {
            .navbar {
                align-items: flex-start;
            }

            .nav-links {
                justify-content: flex-start;
                gap: 13px 17px;
            }

            .nav-links a {
                font-size: 12px;
            }

            .page {
                width: 92%;
            }

            .panel-header,
            .form-body {
                padding: 19px;
            }

            .messages-body {
                padding: 14px;
            }

            .heading-icon {
                display: none;
            }
        }
    </style>
</head>

<body>

<nav class="navbar">
    <a href="<%= contextPath %>/traveler/dashboard.jsp" class="brand">
        <span class="brand-icon">✈</span>
        <span>Travel<span>Go</span></span>
    </a>

    <div class="nav-links">
        <a href="<%= contextPath %>/traveler/dashboard.jsp">Dashboard</a>
        <a href="<%= contextPath %>/flights">Flights</a>
        <a href="<%= contextPath %>/hotels">Hotels</a>
        <a href="<%= contextPath %>/cars">Cars</a>
        <a href="<%= contextPath %>/itinerary">Itinerary</a>
        <a href="<%= contextPath %>/messages" class="active">Messages</a>
        <a href="<%= contextPath %>/logout" class="logout">Logout</a>
    </div>
</nav>

<main class="page">

    <div class="breadcrumb">
        <a href="<%= contextPath %>/traveler/dashboard.jsp">Dashboard</a>
        &nbsp; / &nbsp; Messages
    </div>

    <div class="page-heading">
        <div>
            <div class="eyebrow">Stay connected</div>
            <h1>Your Messages</h1>
            <p class="subtitle">
                Communicate with your travel team and keep your travel plans moving.
            </p>
        </div>

        <div class="heading-icon">✉</div>
    </div>

    <% if ("true".equals(success)) { %>
        <div class="alert success" role="status">
            ✓ Message sent successfully!
        </div>
    <% } %>

    <% if ("true".equals(error)) { %>
        <div class="alert error" role="alert">
            Unable to send your message. Please check the details and try again.
        </div>
    <% } %>

    <div class="content-grid">

        <section class="panel">
            <div class="panel-header">
                <h2>✉ &nbsp; Send a Message</h2>
                <p>Enter the recipient's user ID and write your message below.</p>
            </div>

            <div class="form-body">
                <form action="<%= contextPath %>/messages" method="post">

                    <div class="field">
                        <label for="receiverId">Receiver User ID</label>
                        <input
                            type="number"
                            id="receiverId"
                            name="receiverId"
                            min="1"
                            required
                            placeholder="Enter recipient's user ID">
                        <span class="field-hint">
                            Make sure the user ID is correct before sending.
                        </span>
                    </div>

                    <div class="field">
                        <label for="message">Your Message</label>
                        <textarea
                            id="message"
                            name="message"
                            required
                            maxlength="2000"
                            placeholder="Write your message here..."></textarea>
                    </div>

                    <button type="submit" class="send-button">
                        Send Message &nbsp; →
                    </button>

                </form>
            </div>
        </section>

        <section class="panel">
            <div class="panel-header">
                <h2>Recent Messages</h2>
                <p>Your messages available from the current session.</p>
            </div>

            <div class="messages-body">

                <% if (messages == null || messages.isEmpty()) { %>

                    <div class="empty-state">
                        <div class="empty-icon">✉</div>
                        <h3>No Messages Yet</h3>
                        <p>
                            Your message list is empty. Send a message to start
                            a conversation with your travel team.
                        </p>
                    </div>

                <% } else {
                    for (Message message : messages) { %>

                    <article class="message-card">

                        <div class="message-top">
                            <span class="message-number">
                                Message #<%= message.getId() %>
                            </span>
                            <span class="message-badge">MESSAGE</span>
                        </div>

                        <div class="message-detail">
                            <div class="detail-label">From User</div>
                            <div class="detail-value">
                                <%= message.getSenderId() %>
                            </div>
                        </div>

                        <div class="message-detail">
                            <div class="detail-label">To User</div>
                            <div class="detail-value">
                                <%= message.getReceiverId() %>
                            </div>
                        </div>

                        <div class="message-detail">
                            <div class="detail-label">Message</div>
                            <div class="detail-value message-text"><%= message.getMessage() %></div>
                        </div>

                        <div class="message-detail">
                            <div class="detail-label">Date &amp; Time</div>
                            <div class="detail-value">
                                <%= message.getCreatedAt() %>
                            </div>
                        </div>

                    </article>

                <%  }
                   } %>

            </div>
        </section>

    </div>

</main>

<footer class="footer">
    © TravelGo · Your journey, made easier.
</footer>

</body>
</html>
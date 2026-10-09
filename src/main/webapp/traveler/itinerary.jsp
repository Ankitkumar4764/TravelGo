
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.travel.model.Itinerary" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Itinerary | TravelGo</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f4f7fc;
            color: #172554;
        }

        .navbar {
            background: #ffffff;
            padding: 18px 6%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 18px rgba(15, 23, 42, 0.06);
            gap: 16px;
            flex-wrap: wrap;
        }

        .brand {
            color: #2563eb;
            font-size: 25px;
            font-weight: 800;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 22px;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: #475569;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .nav-links a:hover {
            color: #2563eb;
        }

        .page {
            width: 90%;
            max-width: 1120px;
            margin: 32px auto 60px;
        }

        .hero {
            padding: 36px;
            border-radius: 22px;
            color: white;
            background: linear-gradient(120deg, #1d4ed8, #2563eb, #38bdf8);
            box-shadow: 0 12px 28px rgba(37, 99, 235, 0.16);
            margin-bottom: 28px;
        }

        .eyebrow {
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 700;
            opacity: 0.85;
            margin-bottom: 12px;
        }

        .hero h1 {
            font-size: clamp(28px, 4vw, 38px);
            margin-bottom: 12px;
        }

        .hero p {
            line-height: 1.7;
            max-width: 620px;
            color: #eff6ff;
        }

        .section-title {
            font-size: 23px;
            margin-bottom: 8px;
        }

        .section-subtitle {
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .message {
            padding: 15px 18px;
            border-radius: 12px;
            margin-bottom: 22px;
            background: #dcfce7;
            border: 1px solid #bbf7d0;
            color: #166534;
            font-weight: 600;
        }

        .form-card,
        .itinerary-card,
        .empty {
            background: #ffffff;
            border: 1px solid #e8edf5;
            border-radius: 18px;
            padding: 26px;
            margin-bottom: 24px;
            box-shadow: 0 7px 24px rgba(15, 23, 42, 0.04);
        }

        .form-card h2 {
            font-size: 21px;
            margin-bottom: 7px;
        }

        .form-intro {
            color: #64748b;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .field {
            min-width: 0;
        }

        .field-full {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 8px;
        }

        input,
        textarea {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #dbe3ef;
            border-radius: 10px;
            font-family: inherit;
            font-size: 14px;
            color: #172554;
            background: #fbfdff;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus,
        textarea:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.12);
        }

        textarea {
            min-height: 115px;
            resize: vertical;
        }

        .primary-btn {
            display: inline-block;
            border: none;
            border-radius: 10px;
            padding: 13px 22px;
            margin-top: 20px;
            color: #ffffff;
            background: #2563eb;
            font-weight: 700;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }

        .primary-btn:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }

        .itinerary-list {
            margin-top: 24px;
        }

        .itinerary-card {
            position: relative;
            overflow: hidden;
        }

        .itinerary-card::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 5px;
            background: linear-gradient(#2563eb, #38bdf8);
        }

        .card-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 22px;
        }

        .card-top h3 {
            font-size: 19px;
        }

        .trip-badge {
            background: #eff6ff;
            color: #1d4ed8;
            border-radius: 30px;
            padding: 7px 12px;
            font-size: 12px;
            font-weight: 700;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 16px;
        }

        .detail-box {
            padding: 15px;
            background: #f8fafc;
            border: 1px solid #eef2f7;
            border-radius: 12px;
            min-width: 0;
        }

        .detail-label {
            display: block;
            color: #64748b;
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-bottom: 8px;
        }

        .detail-value {
            color: #1e293b;
            font-size: 15px;
            line-height: 1.7;
            overflow-wrap: anywhere;
            white-space: pre-wrap;
        }

        .empty {
            text-align: center;
            padding: 44px 22px;
        }

        .empty-icon {
            font-size: 40px;
            margin-bottom: 14px;
        }

        .empty h3 {
            font-size: 21px;
            margin-bottom: 10px;
        }

        .empty p {
            color: #64748b;
            line-height: 1.7;
        }

        footer {
            padding: 24px;
            background: #ffffff;
            border-top: 1px solid #e8edf5;
            text-align: center;
            color: #64748b;
            font-size: 13px;
        }

        @media (max-width: 650px) {
            .navbar {
                padding: 16px 5%;
            }

            .nav-links {
                gap: 14px;
            }

            .page {
                width: 92%;
                margin-top: 22px;
            }

            .hero {
                padding: 26px 22px;
            }

            .form-card,
            .itinerary-card {
                padding: 22px 18px;
            }

            .form-grid,
            .details-grid {
                grid-template-columns: 1fr;
            }

            .field-full {
                grid-column: auto;
            }
        }
    </style>
</head>

<body>

<nav class="navbar">
    <a class="brand"
       href="<%= request.getContextPath() %>/">
        TravelGo.
    </a>

    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/traveler/dashboard.jsp">
            Dashboard
        </a>
        <a href="<%= request.getContextPath() %>/flights">
            Flights
        </a>
        <a href="<%= request.getContextPath() %>/hotels">
            Hotels
        </a>
        <a href="<%= request.getContextPath() %>/cars">
            Cars
        </a>
        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>
    </div>
</nav>

<main class="page">

    <section class="hero">
        <div class="eyebrow">Your journey, beautifully organized</div>
        <h1>My Travel Itinerary ✈️</h1>
        <p>
            Keep your travel plans organized in one place.
            Create an itinerary for your booking and easily review
            your travel dates and plans whenever you need them.
        </p>
    </section>

    <%
        String success = request.getParameter("success");

        if ("true".equals(success)) {
    %>
        <div class="message" role="status">
            ✓ Itinerary created successfully!
        </div>
    <%
        }
    %>

    <section class="form-card">
        <h2>＋ Create a New Itinerary</h2>
        <p class="form-intro">
            Add your booking reference, travel date, and a description
            of your trip.
        </p>

        <form action="<%= request.getContextPath() %>/create-itinerary"
              method="post">

            <div class="form-grid">

                <div class="field">
                    <label for="bookingId">Booking ID</label>
                    <input type="number"
                           id="bookingId"
                           name="bookingId"
                           min="1"
                           step="1"
                           placeholder="Enter your booking ID"
                           required>
                </div>

                <div class="field">
                    <label for="travelDate">Travel Date</label>
                    <input type="date"
                           id="travelDate"
                           name="travelDate"
                           required>
                </div>

                <div class="field field-full">
                    <label for="description">Trip Description</label>
                    <textarea id="description"
                              name="description"
                              placeholder="Describe your travel plan, destinations, or activities..."
                              required></textarea>
                </div>

            </div>

            <button class="primary-btn" type="submit">
                Create Itinerary →
            </button>
        </form>
    </section>

    <section class="itinerary-list">
        <h2 class="section-title">Your Saved Trips</h2>
        <p class="section-subtitle">
            All the itineraries currently available in your account.
        </p>

        <%
            List<Itinerary> itineraries =
                (List<Itinerary>) request.getAttribute("itineraries");

            if (itineraries == null || itineraries.isEmpty()) {
        %>

            <div class="empty">
                <div class="empty-icon">🧳</div>
                <h3>No Itineraries Yet</h3>
                <p>
                    Your travel plans will appear here after you create
                    your first itinerary.
                </p>
            </div>

        <%
            } else {
                for (Itinerary itinerary : itineraries) {
        %>

            <article class="itinerary-card">
                <div class="card-top">
                    <h3>
                        Trip Plan #<%= itinerary.getId() %>
                    </h3>
                    <span class="trip-badge">Travel Plan</span>
                </div>

                <div class="details-grid">

                    <div class="detail-box">
                        <span class="detail-label">Booking Reference</span>
                        <div class="detail-value">
                            #<%= itinerary.getBookingId() %>
                        </div>
                    </div>

                    <div class="detail-box">
                        <span class="detail-label">Travel Date</span>
                        <div class="detail-value">
                            <%= itinerary.getTravelDate() %>
                        </div>
                    </div>

                    <div class="detail-box" style="grid-column: 1 / -1;">
                        <span class="detail-label">Trip Description</span>
                        <div class="detail-value"><%= itinerary.getDescription() %></div>
                    </div>

                </div>
            </article>

        <%
                }
            }
        %>
    </section>

</main>

<footer>
    © 2026 TravelGo · Make every journey memorable.
</footer>

</body>
</html>
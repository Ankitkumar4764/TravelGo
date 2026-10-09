
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.travel.model.Booking" %>
<%@ page import="com.travel.dao.BookingDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings | TravelGo</title>

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
            background: white;
            padding: 18px 6%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
            box-shadow: 0 3px 18px rgba(15, 23, 42, 0.06);
        }

        .brand {
            font-size: 25px;
            font-weight: 800;
            color: #2563eb;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 22px;
            flex-wrap: wrap;
        }

        .nav-links a {
            text-decoration: none;
            color: #475569;
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
            background: linear-gradient(120deg, #1d4ed8, #2563eb, #38bdf8);
            color: white;
            padding: 38px;
            border-radius: 22px;
            margin-bottom: 28px;
            box-shadow: 0 12px 28px rgba(37, 99, 235, 0.16);
        }

        .eyebrow {
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 12px;
            font-weight: 700;
            opacity: 0.85;
            margin-bottom: 12px;
        }

        .hero h1 {
            font-size: clamp(28px, 4vw, 38px);
            margin-bottom: 12px;
        }

        .hero p {
            color: #eff6ff;
            line-height: 1.7;
            max-width: 650px;
        }

        .success {
            background: #dcfce7;
            color: #166534;
            border: 1px solid #bbf7d0;
            padding: 15px 18px;
            border-radius: 12px;
            margin-bottom: 24px;
            font-weight: 600;
        }

        .section-heading {
            font-size: 23px;
            margin-bottom: 8px;
        }

        .section-subtitle {
            color: #64748b;
            margin-bottom: 22px;
            line-height: 1.6;
        }

        .booking-card {
            background: white;
            padding: 26px;
            border: 1px solid #e8edf5;
            border-radius: 18px;
            margin-bottom: 20px;
            box-shadow: 0 7px 24px rgba(15, 23, 42, 0.04);
            position: relative;
            overflow: hidden;
        }

        .booking-card::before {
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
            align-items: center;
            justify-content: space-between;
            gap: 14px;
            flex-wrap: wrap;
            margin-bottom: 22px;
        }

        .card-top h2 {
            font-size: 20px;
            text-transform: capitalize;
        }

        .booking-reference {
            color: #64748b;
            font-size: 13px;
            margin-top: 7px;
        }

        .type-badge {
            padding: 7px 12px;
            border-radius: 30px;
            background: #eff6ff;
            color: #1d4ed8;
            font-size: 12px;
            font-weight: 700;
            text-transform: capitalize;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 15px;
        }

        .detail-box {
            padding: 16px;
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
            letter-spacing: 0.6px;
            text-transform: uppercase;
            margin-bottom: 9px;
        }

        .detail-value {
            color: #1e293b;
            font-size: 16px;
            font-weight: 650;
            overflow-wrap: anywhere;
        }

        .price {
            color: #15803d;
            font-size: 22px;
            font-weight: 800;
        }

        .status {
            display: inline-block;
            padding: 6px 11px;
            border-radius: 30px;
            background: #ecfdf5;
            color: #047857;
            font-size: 12px;
            font-weight: 750;
            overflow-wrap: anywhere;
        }

        .empty {
            background: white;
            text-align: center;
            padding: 48px 24px;
            border: 1px solid #e8edf5;
            border-radius: 18px;
            box-shadow: 0 7px 24px rgba(15, 23, 42, 0.04);
        }

        .empty-icon {
            font-size: 42px;
            margin-bottom: 14px;
        }

        .empty h2 {
            margin-bottom: 10px;
        }

        .empty p {
            color: #64748b;
            line-height: 1.7;
            margin-bottom: 20px;
        }

        .explore-btn {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 12px 19px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
        }

        .explore-btn:hover {
            background: #1d4ed8;
        }

        footer {
            padding: 24px;
            background: white;
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
                padding: 27px 22px;
            }

            .booking-card {
                padding: 22px 18px;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<nav class="navbar">
    <a class="brand" href="<%= request.getContextPath() %>/">
        TravelGo.
    </a>

    <div class="nav-links">
        <a href="<%= request.getContextPath() %>/traveler/dashboard.jsp">Dashboard</a>
        <a href="<%= request.getContextPath() %>/flights">Flights</a>
        <a href="<%= request.getContextPath() %>/hotels">Hotels</a>
        <a href="<%= request.getContextPath() %>/cars">Cars</a>
        <a href="<%= request.getContextPath() %>/itinerary">Itinerary</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</nav>

<main class="page">

    <section class="hero">
        <div class="eyebrow">Your trips, all in one place</div>
        <h1>My Bookings ✈️</h1>
        <p>
            Keep track of your travel reservations, booking references,
            prices, and current booking statuses from one convenient place.
        </p>
    </section>

    <%
        String success = request.getParameter("success");

        if ("true".equals(success)) {
    %>
        <div class="success" role="status">
            ✓ Booking completed successfully!
        </div>
    <%
        }

        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
    %>

        <div class="empty">
            <div class="empty-icon">🔐</div>
            <h2>Please Log In</h2>
            <p>You must log in to view your personal bookings.</p>
            <a class="explore-btn"
               href="<%= request.getContextPath() %>/">
                Back to Home
            </a>
        </div>

    <%
        } else {

            BookingDAO bookingDAO = new BookingDAO();

            List<Booking> bookings =
                bookingDAO.getBookingsByUser(userId);
    %>

        <h2 class="section-heading">Your Reservations</h2>
        <p class="section-subtitle">
            Review the details of your existing bookings below.
        </p>

    <%
            if (bookings == null || bookings.isEmpty()) {
    %>

        <div class="empty">
            <div class="empty-icon">🧳</div>
            <h2>No Bookings Yet</h2>
            <p>
                Your reservations will appear here after you make
                your first booking.
            </p>
            <a class="explore-btn"
               href="<%= request.getContextPath() %>/flights">
                Explore Flights
            </a>
        </div>

    <%
            } else {

                for (Booking booking : bookings) {
    %>

        <article class="booking-card">

            <div class="card-top">
                <div>
                    <h2>
                        <%= booking.getListingType() %> Booking
                    </h2>
                    <div class="booking-reference">
                        Booking reference #<%= booking.getId() %>
                    </div>
                </div>

                <span class="type-badge">
                    <%= booking.getListingType() %>
                </span>
            </div>

            <div class="details-grid">

                <div class="detail-box">
                    <span class="detail-label">Booking ID</span>
                    <div class="detail-value">
                        #<%= booking.getId() %>
                    </div>
                </div>

                <div class="detail-box">
                    <span class="detail-label">Listing ID</span>
                    <div class="detail-value">
                        #<%= booking.getListingId() %>
                    </div>
                </div>

                <div class="detail-box">
                    <span class="detail-label">Total Price</span>
                    <div class="price">
                        &#8377;<%= booking.getTotalPrice() %>
                    </div>
                </div>

                <div class="detail-box">
                    <span class="detail-label">Booking Status</span>
                    <div>
                        <span class="status">
                            <%= booking.getStatus() %>
                        </span>
                    </div>
                </div>

            </div>
        </article>

    <%
                }
            }
        }
    %>

</main>

<footer>
    © 2026 TravelGo · Thank you for travelling with us.
</footer>

</body>
</html>
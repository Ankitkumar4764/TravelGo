<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.travel.model.Hotel" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>Available Hotels | TravelGo</title>

<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #f5f8fc;
        color: #172033;
    }

    /* NAVBAR */
    .navbar {
        height: 72px;
        background: white;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 7%;
        box-shadow: 0 2px 12px rgba(0, 0, 0, 0.07);
        position: sticky;
        top: 0;
        z-index: 10;
    }

    .logo {
        font-size: 25px;
        font-weight: 800;
        color: #2563eb;
        text-decoration: none;
    }

    .logo span {
        color: #172033;
    }

    .nav-right {
        display: flex;
        align-items: center;
        gap: 14px;
    }

    .dashboard-btn {
        text-decoration: none;
        color: #374151;
        font-weight: 600;
        padding: 10px 16px;
        border-radius: 10px;
        transition: 0.2s;
    }

    .dashboard-btn:hover {
        background: #eff6ff;
        color: #2563eb;
    }

    .logout-btn {
        text-decoration: none;
        color: white;
        background: #ef4444;
        padding: 10px 17px;
        border-radius: 10px;
        font-weight: 600;
        transition: 0.2s;
    }

    .logout-btn:hover {
        background: #dc2626;
    }

    /* HERO */
    .hero {
        background:
            linear-gradient(135deg, rgba(30, 64, 175, 0.94), rgba(37, 99, 235, 0.88)),
            url("https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1600&q=80");
        background-size: cover;
        background-position: center;
        color: white;
        padding: 55px 7%;
    }

    .hero-content {
        max-width: 1150px;
        margin: auto;
    }

    .hero h1 {
        font-size: 38px;
        margin-bottom: 10px;
    }

    .hero p {
        font-size: 17px;
        opacity: 0.94;
        max-width: 650px;
    }

    /* MAIN */
    .container {
        max-width: 1150px;
        margin: 35px auto 70px;
        padding: 0 20px;
    }

    .section-heading {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 22px;
    }

    .section-heading h2 {
        font-size: 25px;
    }

    .count {
        background: #e0ecff;
        color: #2563eb;
        padding: 7px 13px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: bold;
    }

    /* HOTEL CARD */
    .hotel-card {
        background: white;
        border-radius: 18px;
        margin-bottom: 20px;
        overflow: hidden;
        box-shadow: 0 6px 22px rgba(15, 23, 42, 0.08);
        border: 1px solid #e8edf5;
        transition: 0.25s;
    }

    .hotel-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 12px 30px rgba(15, 23, 42, 0.12);
    }

    .hotel-content {
        padding: 25px;
    }

    .hotel-top {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 20px;
    }

    .hotel-name-box {
        display: flex;
        align-items: center;
        gap: 14px;
    }

    .hotel-icon {
        width: 55px;
        height: 55px;
        border-radius: 14px;
        background: #eff6ff;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 27px;
    }

    .hotel-name {
        font-size: 22px;
        font-weight: 750;
    }

    .hotel-label {
        color: #718096;
        font-size: 13px;
        margin-top: 5px;
    }

    .price-box {
        text-align: right;
    }

    .price {
        color: #2563eb;
        font-size: 25px;
        font-weight: 800;
    }

    .price-label {
        color: #718096;
        font-size: 12px;
    }

    /* LOCATION */
    .location-box {
        margin: 22px 0;
        padding: 15px;
        background: #f8fafc;
        border-radius: 12px;
    }

    .location-title {
        color: #718096;
        font-size: 12px;
        margin-bottom: 6px;
    }

    .location-value {
        font-size: 16px;
        font-weight: 700;
    }

    /* DETAILS */
    .details {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 15px;
        padding: 18px 0;
        border-top: 1px solid #edf1f6;
        border-bottom: 1px solid #edf1f6;
    }

    .detail-box {
        background: #f8fafc;
        padding: 14px;
        border-radius: 11px;
    }

    .detail-title {
        color: #718096;
        font-size: 12px;
        margin-bottom: 6px;
    }

    .detail-value {
        font-size: 15px;
        font-weight: 700;
    }

    .status {
        display: inline-block;
        color: #15803d;
        background: #dcfce7;
        padding: 4px 9px;
        border-radius: 20px;
        font-size: 12px;
    }

    /* BOOK BUTTON */
    .card-bottom {
        display: flex;
        justify-content: flex-end;
        margin-top: 20px;
    }

    .book-btn {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 12px 24px;
        background: #2563eb;
        color: white;
        text-decoration: none;
        border-radius: 10px;
        font-weight: 700;
        transition: 0.2s;
    }

    .book-btn:hover {
        background: #1d4ed8;
        transform: translateY(-1px);
    }

    /* EMPTY */
    .empty {
        background: white;
        border-radius: 18px;
        padding: 60px 25px;
        text-align: center;
        box-shadow: 0 6px 22px rgba(15, 23, 42, 0.07);
    }

    .empty-icon {
        font-size: 55px;
        margin-bottom: 15px;
    }

    .empty h2 {
        margin-bottom: 8px;
    }

    .empty p {
        color: #718096;
    }

    /* FOOTER */
    footer {
        background: #111827;
        color: #cbd5e1;
        padding: 28px 7%;
        text-align: center;
    }

    footer strong {
        color: white;
    }

    /* RESPONSIVE */
    @media (max-width: 700px) {

        .navbar {
            padding: 0 20px;
        }

        .dashboard-btn {
            display: none;
        }

        .hero {
            padding: 40px 20px;
        }

        .hero h1 {
            font-size: 30px;
        }

        .container {
            margin-top: 25px;
        }

        .hotel-top {
            align-items: flex-start;
        }

        .hotel-name {
            font-size: 18px;
        }

        .price {
            font-size: 21px;
        }

        .details {
            grid-template-columns: 1fr;
        }

        .card-bottom {
            justify-content: stretch;
        }

        .book-btn {
            width: 100%;
            justify-content: center;
        }
    }
</style>


</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">


<a class="logo"
   href="<%= request.getContextPath() %>/traveler/dashboard.jsp">
    Travel<span>Go</span>
</a>

<div class="nav-right">

    <a class="dashboard-btn"
       href="<%= request.getContextPath() %>/traveler/dashboard.jsp">
        Dashboard
    </a>

    <a class="logout-btn"
       href="<%= request.getContextPath() %>/logout">
        Logout
    </a>

</div>


</nav>

<!-- HERO -->

<section class="hero">


<div class="hero-content">

    <h1>Find Your Perfect Stay 🏨</h1>

    <p>
        Explore approved hotels, check availability,
        and book a comfortable stay for your journey.
    </p>

</div>


</section>

<!-- MAIN -->

<div class="container">


<div class="section-heading">

    <h2>Available Hotels</h2>

    <%
        List<Hotel> hotels =
                (List<Hotel>) request.getAttribute("hotels");
    %>

    <span class="count">
        <%= hotels == null ? 0 : hotels.size() %> Hotels
    </span>

</div>


<%
    if (hotels == null || hotels.isEmpty()) {
%>

    <div class="empty">

        <div class="empty-icon">🏨</div>

        <h2>No Hotels Available</h2>

        <p>
            There are currently no approved hotels.
            Please check again later.
        </p>

    </div>

<%
    } else {

        for (Hotel hotel : hotels) {
%>

    <div class="hotel-card">

        <div class="hotel-content">

            <!-- TOP -->
            <div class="hotel-top">

                <div class="hotel-name-box">

                    <div class="hotel-icon">
                        🏨
                    </div>

                    <div>

                        <div class="hotel-name">
                            <%= hotel.getName() %>
                        </div>

                        <div class="hotel-label">
                            Verified TravelGo Hotel
                        </div>

                    </div>

                </div>


                <div class="price-box">

                    <div class="price">
                        ₹<%= hotel.getPrice() %>
                    </div>

                    <div class="price-label">
                        per stay
                    </div>

                </div>

            </div>


            <!-- LOCATION -->
            <div class="location-box">

                <div class="location-title">
                    LOCATION
                </div>

                <div class="location-value">
                    📍 <%= hotel.getLocation() %>
                </div>

            </div>


            <!-- DETAILS -->
            <div class="details">

                <div class="detail-box">

                    <div class="detail-title">
                        CHECK-IN
                    </div>

                    <div class="detail-value">
                        📅 <%= hotel.getCheckIn() %>
                    </div>

                </div>


                <div class="detail-box">

                    <div class="detail-title">
                        CHECK-OUT
                    </div>

                    <div class="detail-value">
                        📅 <%= hotel.getCheckOut() %>
                    </div>

                </div>


                <div class="detail-box">

                    <div class="detail-title">
                        AVAILABLE ROOMS
                    </div>

                    <div class="detail-value">
                        🛏 <%= hotel.getRooms() %> Rooms
                    </div>

                </div>

            </div>


            <!-- STATUS + BOOK -->
            <div class="card-bottom">

                <span class="status">
                    ✓ <%= hotel.getStatus() %>
                </span>

                <a class="book-btn"
                   href="<%= request.getContextPath() %>/book-hotel?id=<%= hotel.getId() %>">

                    Book Hotel →

                </a>

            </div>

        </div>

    </div>

<%
        }
    }
%>


</div>

<!-- FOOTER -->

<footer>


<strong>TravelGo</strong>
&nbsp; | &nbsp;
Your journey starts here.


</footer>

</body>
</html>

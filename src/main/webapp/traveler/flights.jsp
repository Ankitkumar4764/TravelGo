<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.travel.model.Flight" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>Available Flights | TravelGo</title>

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
        background: linear-gradient(135deg, #1d4ed8, #2563eb, #38bdf8);
        color: white;
        padding: 48px 7%;
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
        opacity: 0.92;
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

    /* FLIGHT CARD */
    .flight-card {
        background: white;
        border-radius: 18px;
        margin-bottom: 20px;
        padding: 25px;
        box-shadow: 0 6px 22px rgba(15, 23, 42, 0.08);
        border: 1px solid #e8edf5;
        transition: 0.25s;
    }

    .flight-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 12px 30px rgba(15, 23, 42, 0.12);
    }

    .flight-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 20px;
    }

    .airline-box {
        display: flex;
        align-items: center;
        gap: 14px;
    }

    .airline-icon {
        width: 52px;
        height: 52px;
        border-radius: 14px;
        background: #eff6ff;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 25px;
    }

    .airline {
        font-size: 20px;
        font-weight: 700;
    }

    .flight-label {
        color: #718096;
        font-size: 13px;
        margin-top: 4px;
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

    /* ROUTE */
    .route-section {
        display: flex;
        align-items: center;
        margin: 25px 0;
        gap: 18px;
    }

    .location {
        flex: 1;
    }

    .location-name {
        font-size: 21px;
        font-weight: 750;
    }

    .location-label {
        color: #718096;
        font-size: 13px;
        margin-top: 5px;
    }

    .route-line {
        flex: 1;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .line {
        height: 2px;
        background: #dbe5f0;
        flex: 1;
    }

    .plane {
        width: 38px;
        height: 38px;
        border-radius: 50%;
        background: #eff6ff;
        color: #2563eb;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
    }

    /* DETAILS */
    .details {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 15px;
        padding: 17px 0;
        border-top: 1px solid #edf1f6;
        border-bottom: 1px solid #edf1f6;
    }

    .detail-box {
        background: #f8fafc;
        padding: 13px;
        border-radius: 11px;
    }

    .detail-title {
        color: #718096;
        font-size: 12px;
        margin-bottom: 5px;
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
            padding: 35px 20px;
        }

        .hero h1 {
            font-size: 30px;
        }

        .container {
            margin-top: 25px;
        }

        .section-heading {
            align-items: flex-start;
            gap: 12px;
        }

        .flight-top {
            align-items: flex-start;
        }

        .route-section {
            gap: 10px;
        }

        .location-name {
            font-size: 17px;
        }

        .route-line {
            flex: 0.7;
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

    <h1>Find Your Perfect Flight ✈️</h1>

    <p>
        Discover approved flights and book your next journey
        quickly and easily with TravelGo.
    </p>

</div>


</section>

<!-- MAIN CONTENT -->

<div class="container">


<div class="section-heading">

    <h2>Available Flights</h2>

    <%
        List<Flight> flights =
                (List<Flight>) request.getAttribute("flights");
    %>

    <span class="count">
        <%= flights == null ? 0 : flights.size() %> Flights
    </span>

</div>


<%
    if (flights == null || flights.isEmpty()) {
%>

    <div class="empty">

        <div class="empty-icon">✈️</div>

        <h2>No Flights Available</h2>

        <p>
            There are currently no approved flights.
            Please check again later.
        </p>

    </div>

<%
    } else {

        for (Flight flight : flights) {
%>

    <div class="flight-card">

        <!-- TOP -->
        <div class="flight-top">

            <div class="airline-box">

                <div class="airline-icon">
                    ✈️
                </div>

                <div>

                    <div class="airline">
                        <%= flight.getAirline() %>
                    </div>

                    <div class="flight-label">
                        Available Flight
                    </div>

                </div>

            </div>


            <div class="price-box">

                <div class="price">
                    ₹<%= flight.getPrice() %>
                </div>

                <div class="price-label">
                    per traveler
                </div>

            </div>

        </div>


        <!-- ROUTE -->
        <div class="route-section">

            <div class="location">

                <div class="location-name">
                    <%= flight.getOrigin() %>
                </div>

                <div class="location-label">
                    Departure
                </div>

            </div>


            <div class="route-line">

                <div class="line"></div>

                <div class="plane">
                    ✈
                </div>

                <div class="line"></div>

            </div>


            <div class="location">

                <div class="location-name">
                    <%= flight.getDestination() %>
                </div>

                <div class="location-label">
                    Arrival
                </div>

            </div>

        </div>


        <!-- DETAILS -->
        <div class="details">

            <div class="detail-box">

                <div class="detail-title">
                    TRAVEL DATE
                </div>

                <div class="detail-value">
                    📅 <%= flight.getTravelDate() %>
                </div>

            </div>


            <div class="detail-box">

                <div class="detail-title">
                    AVAILABLE SEATS
                </div>

                <div class="detail-value">
                    💺 <%= flight.getSeats() %> Seats
                </div>

            </div>


            <div class="detail-box">

                <div class="detail-title">
                    STATUS
                </div>

                <div class="detail-value">

                    <span class="status">
                        ✓ <%= flight.getStatus() %>
                    </span>

                </div>

            </div>

        </div>


        <!-- BOOK -->
        <div class="card-bottom">

            <a class="book-btn"
               href="<%= request.getContextPath() %>/book-flight?id=<%= flight.getId() %>">

                Book Flight →
                
            </a>

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

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.travel.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Traveler Dashboard | TravelGo</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f6f8fc;
            color: #172033;
        }

        /* NAVBAR */

        .navbar {
            height: 72px;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 6%;
            box-shadow: 0 2px 15px rgba(0,0,0,0.07);
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
            color: #2563eb;
        }

        .logo span {
            color: #172033;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #334155;
            font-weight: 600;
        }

        .avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: #dbeafe;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2563eb;
            font-weight: bold;
        }

        .logout {
            text-decoration: none;
            background: #fee2e2;
            color: #dc2626;
            padding: 10px 17px;
            border-radius: 8px;
            font-weight: 600;
        }

        .logout:hover {
            background: #fecaca;
        }

        /* MAIN */

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 40px 25px 70px;
        }

        /* WELCOME */

        .welcome {
            background:
                linear-gradient(110deg, #1d4ed8, #2563eb, #3b82f6);
            color: white;
            border-radius: 18px;
            padding: 38px 42px;
            margin-bottom: 35px;
            position: relative;
            overflow: hidden;
        }

        .welcome::after {
            content: "✈";
            position: absolute;
            right: 60px;
            top: 25px;
            font-size: 130px;
            opacity: 0.10;
        }

        .welcome h1 {
            font-size: 34px;
            margin-bottom: 10px;
        }

        .welcome p {
            color: #dbeafe;
            font-size: 16px;
            line-height: 1.6;
        }

        .role-badge {
            display: inline-block;
            margin-top: 18px;
            padding: 7px 14px;
            background: rgba(255,255,255,0.16);
            border: 1px solid rgba(255,255,255,0.25);
            border-radius: 20px;
            font-size: 13px;
        }

        /* SECTION TITLE */

        .section-title {
            margin-bottom: 22px;
        }

        .section-title h2 {
            font-size: 25px;
            margin-bottom: 6px;
        }

        .section-title p {
            color: #64748b;
        }

        /* SERVICE CARDS */

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
        }

        .card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 15px;
            padding: 27px;
            transition: 0.25s;
            position: relative;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.09);
        }

        .card-icon {
            width: 58px;
            height: 58px;
            border-radius: 13px;
            background: #eff6ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .card h3 {
            font-size: 20px;
            margin-bottom: 9px;
        }

        .card p {
            color: #64748b;
            line-height: 1.55;
            min-height: 48px;
        }

        .card a {
            display: inline-block;
            margin-top: 20px;
            padding: 11px 18px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
        }

        .card a:hover {
            background: #1d4ed8;
        }

        /* BOOKING + ITINERARY */

        .secondary-section {
            margin-top: 42px;
        }

        .secondary-cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 22px;
        }

        .secondary-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 15px;
            padding: 27px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            transition: 0.2s;
        }

        .secondary-card:hover {
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .secondary-left {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .secondary-icon {
            width: 55px;
            height: 55px;
            border-radius: 12px;
            background: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
        }

        .secondary-card h3 {
            margin-bottom: 6px;
        }

        .secondary-card p {
            color: #64748b;
            font-size: 14px;
        }

        .secondary-btn {
            text-decoration: none;
            color: #2563eb;
            font-weight: bold;
            white-space: nowrap;
        }

        .secondary-btn:hover {
            text-decoration: underline;
        }

        /* QUICK INFO */

        .info-section {
            margin-top: 42px;
        }

        .info-box {
            background: #eff6ff;
            border-radius: 15px;
            padding: 28px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .info-item {
            display: flex;
            gap: 13px;
            align-items: center;
        }

        .info-icon {
            font-size: 25px;
        }

        .info-item strong {
            display: block;
            margin-bottom: 4px;
        }

        .info-item span {
            color: #64748b;
            font-size: 13px;
        }

        /* FOOTER */

        footer {
            background: #0f172a;
            color: white;
            padding: 32px 6%;
        }

        .footer-content {
            max-width: 1200px;
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-logo {
            font-size: 21px;
            font-weight: bold;
        }

        .footer-text {
            color: #94a3b8;
            font-size: 13px;
            margin-top: 6px;
        }

        .footer-role {
            color: #94a3b8;
            font-size: 13px;
        }

        /* RESPONSIVE */

        @media (max-width: 900px) {

            .cards {
                grid-template-columns: repeat(2, 1fr);
            }

            .info-box {
                grid-template-columns: 1fr;
            }

        }

        @media (max-width: 650px) {

            .navbar {
                padding: 0 20px;
            }

            .profile span {
                display: none;
            }

            .container {
                padding: 25px 18px 50px;
            }

            .welcome {
                padding: 30px 25px;
            }

            .welcome h1 {
                font-size: 27px;
            }

            .cards,
            .secondary-cards {
                grid-template-columns: 1fr;
            }

            .secondary-card {
                align-items: flex-start;
            }

            .footer-content {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

        }

    </style>

</head>


<body>


<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">
        ✈ Travel<span>Go</span>
    </div>

    <div class="nav-right">

        <div class="profile">

            <div class="avatar">
                <%= user.getName().substring(0, 1).toUpperCase() %>
            </div>

            <span>
                <%= user.getName() %>
            </span>

        </div>

        <a class="logout"
           href="<%= request.getContextPath() %>/logout">
            Logout
        </a>

    </div>

</nav>


<!-- MAIN -->

<div class="container">


    <!-- WELCOME -->

    <section class="welcome">

        <h1>
            Welcome back, <%= user.getName() %>! 👋
        </h1>

        <p>
            Plan your next adventure, manage your bookings
            and keep your entire journey organized.
        </p>

        <div class="role-badge">
            Traveler Account
        </div>

    </section>


    <!-- SERVICES -->

    <div class="section-title">

        <h2>
            Plan Your Journey
        </h2>

        <p>
            Choose a travel service to get started.
        </p>

    </div>


    <div class="cards">


        <!-- FLIGHTS -->

        <div class="card">

            <div class="card-icon">
                ✈️
            </div>

            <h3>
                Flights
            </h3>

            <p>
                Search available flights and book your
                next destination.
            </p>

            <a href="<%= request.getContextPath() %>/flights">
                Explore Flights →
            </a>

        </div>


        <!-- HOTELS -->

        <div class="card">

            <div class="card-icon">
                🏨
            </div>

            <h3>
                Hotels
            </h3>

            <p>
                Find comfortable hotels for your
                upcoming journey.
            </p>

            <a href="<%= request.getContextPath() %>/hotels">
                Explore Hotels →
            </a>

        </div>


        <!-- CARS -->

        <div class="card">

            <div class="card-icon">
                🚗
            </div>

            <h3>
                Rental Cars
            </h3>

            <p>
                Choose a rental car and travel around
                your destination easily.
            </p>

            <a href="<%= request.getContextPath() %>/cars">
                Explore Cars →
            </a>

        </div>

    </div>


    <!-- BOOKINGS + ITINERARY -->

    <section class="secondary-section">

        <div class="section-title">

            <h2>
                Your Travel
            </h2>

            <p>
                Keep track of your reservations and plans.
            </p>

        </div>


        <div class="secondary-cards">


            <!-- BOOKINGS -->

            <div class="secondary-card">

                <div class="secondary-left">

                    <div class="secondary-icon">
                        📋
                    </div>

                    <div>

                        <h3>
                            My Bookings
                        </h3>

                        <p>
                            View and track your confirmed bookings.
                        </p>

                    </div>

                </div>

                <a class="secondary-btn"
                   href="<%= request.getContextPath() %>/traveler/bookings.jsp">
                    View →
                </a>

            </div>


            <!-- ITINERARY -->

            <div class="secondary-card">

                <div class="secondary-left">

                    <div class="secondary-icon">
                        🗺️
                    </div>

                    <div>

                        <h3>
                            My Itinerary
                        </h3>

                        <p>
                            View your complete travel itinerary.
                        </p>

                    </div>

                </div>

                <a class="secondary-btn"
                   href="<%= request.getContextPath() %>/itinerary">
                    View →
                </a>

            </div>


        </div>

    </section>


    <!-- QUICK INFO -->

    <section class="info-section">

        <div class="info-box">


            <div class="info-item">

                <div class="info-icon">
                    🔐
                </div>

                <div>

                    <strong>
                        Secure Booking
                    </strong>

                    <span>
                        Your account is protected.
                    </span>

                </div>

            </div>


            <div class="info-item">

                <div class="info-icon">
                    ⚡
                </div>

                <div>

                    <strong>
                        Easy Planning
                    </strong>

                    <span>
                        Manage your journey in one place.
                    </span>

                </div>

            </div>


            <div class="info-item">

                <div class="info-icon">
                    🌍
                </div>

                <div>

                    <strong>
                        Travel Anywhere
                    </strong>

                    <span>
                        Flights, hotels and cars together.
                    </span>

                </div>

            </div>


        </div>

    </section>


</div>


<!-- FOOTER -->

<footer>

    <div class="footer-content">

        <div>

            <div class="footer-logo">
                ✈ TravelGo
            </div>

            <div class="footer-text">
                Online Travel Booking Platform
            </div>

        </div>

        <div class="footer-role">
            Logged in as Traveler
        </div>

    </div>

</footer>


</body>

</html>
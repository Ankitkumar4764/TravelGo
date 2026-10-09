<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>TravelGo - Online Travel Booking</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f8fafc;
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
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
            position: relative;
            z-index: 10;
        }

        .logo {
            font-size: 26px;
            font-weight: bold;
            color: #2563eb;
        }

        .logo span {
            color: #0f172a;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            text-decoration: none;
            color: #334155;
            font-size: 15px;
            font-weight: 600;
        }

        .nav-links a:hover {
            color: #2563eb;
        }

        .login-btn {
            background: #2563eb;
            color: white !important;
            padding: 11px 22px;
            border-radius: 8px;
        }

        .login-btn:hover {
            background: #1d4ed8;
        }

        /* HERO */

        .hero {
            min-height: 570px;
            background:
                linear-gradient(rgba(15,23,42,0.55), rgba(15,23,42,0.65)),
                url("https://images.unsplash.com/photo-1500534623283-312aade485b7?auto=format&fit=crop&w=1800&q=85");
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 60px 20px;
        }

        .hero-content {
            max-width: 850px;
            color: white;
        }

        .hero-content .tag {
            display: inline-block;
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.3);
            padding: 9px 18px;
            border-radius: 30px;
            margin-bottom: 22px;
            font-size: 14px;
        }

        .hero h1 {
            font-size: 58px;
            line-height: 1.1;
            margin-bottom: 20px;
        }

        .hero h1 span {
            color: #60a5fa;
        }

        .hero p {
            font-size: 19px;
            line-height: 1.7;
            color: #e2e8f0;
            margin-bottom: 35px;
        }

        .hero-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .primary-btn,
        .secondary-btn {
            text-decoration: none;
            padding: 14px 28px;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.2s;
        }

        .primary-btn {
            background: #2563eb;
            color: white;
        }

        .primary-btn:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        .secondary-btn {
            background: white;
            color: #1e3a8a;
        }

        .secondary-btn:hover {
            transform: translateY(-2px);
        }

        /* SEARCH BOX */

        .search-wrapper {
            max-width: 1050px;
            margin: -45px auto 0;
            position: relative;
            z-index: 5;
            padding: 0 20px;
        }

        .search-box {
            background: white;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 8px 35px rgba(0,0,0,0.12);
        }

        .search-title {
            font-size: 20px;
            margin-bottom: 18px;
        }

        .search-options {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }

        .search-item {
            border: 1px solid #e2e8f0;
            padding: 17px;
            border-radius: 10px;
            background: #f8fafc;
        }

        .search-item .icon {
            font-size: 24px;
            margin-bottom: 8px;
        }

        .search-item h3 {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .search-item p {
            color: #64748b;
            font-size: 13px;
        }

        /* SERVICES */

        .section {
            max-width: 1150px;
            margin: 90px auto;
            padding: 0 25px;
        }

        .section-heading {
            text-align: center;
            margin-bottom: 40px;
        }

        .section-heading .small-title {
            color: #2563eb;
            font-weight: bold;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .section-heading h2 {
            font-size: 36px;
            margin: 10px 0;
        }

        .section-heading p {
            color: #64748b;
            max-width: 600px;
            margin: auto;
            line-height: 1.6;
        }

        .service-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .service-card {
            background: white;
            padding: 32px;
            border-radius: 15px;
            border: 1px solid #e5e7eb;
            transition: 0.25s;
        }

        .service-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.1);
        }

        .service-icon {
            width: 58px;
            height: 58px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eff6ff;
            border-radius: 12px;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .service-card h3 {
            margin-bottom: 10px;
            font-size: 20px;
        }

        .service-card p {
            color: #64748b;
            line-height: 1.6;
        }

        /* WHY US */

        .why-section {
            background: #eff6ff;
            padding: 80px 25px;
        }

        .why-content {
            max-width: 1100px;
            margin: auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
        }

        .why-content h2 {
            font-size: 38px;
            margin-bottom: 18px;
        }

        .why-content > div > p {
            color: #64748b;
            line-height: 1.7;
            margin-bottom: 25px;
        }

        .features {
            display: grid;
            gap: 18px;
        }

        .feature {
            display: flex;
            gap: 15px;
            align-items: flex-start;
        }

        .feature-icon {
            background: white;
            padding: 10px;
            border-radius: 8px;
            font-size: 20px;
        }

        .feature h3 {
            margin-bottom: 4px;
        }

        .feature p {
            color: #64748b;
            font-size: 14px;
        }

        .travel-card {
            min-height: 330px;
            border-radius: 20px;
            background:
                linear-gradient(rgba(15,23,42,0.2), rgba(15,23,42,0.35)),
                url("https://images.unsplash.com/photo-1527631746610-bca00a040d60?auto=format&fit=crop&w=1000&q=85");
            background-size: cover;
            background-position: center;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        /* CTA */

        .cta {
            max-width: 1100px;
            margin: 80px auto;
            padding: 55px 30px;
            border-radius: 20px;
            text-align: center;
            color: white;
            background:
                linear-gradient(120deg, #1d4ed8, #2563eb);
        }

        .cta h2 {
            font-size: 35px;
            margin-bottom: 12px;
        }

        .cta p {
            color: #dbeafe;
            margin-bottom: 25px;
        }

        /* FOOTER */

        footer {
            background: #0f172a;
            color: white;
            padding: 45px 7%;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            gap: 30px;
        }

        .footer-logo {
            font-size: 23px;
            font-weight: bold;
        }

        .footer-text {
            color: #94a3b8;
            margin-top: 10px;
            max-width: 350px;
            line-height: 1.6;
        }

        .footer-links {
            display: flex;
            gap: 25px;
        }

        .footer-links a {
            color: #cbd5e1;
            text-decoration: none;
        }

        .footer-bottom {
            border-top: 1px solid #334155;
            margin-top: 35px;
            padding-top: 20px;
            color: #64748b;
            font-size: 13px;
        }

        /* RESPONSIVE */

        @media (max-width: 800px) {

            .nav-links {
                gap: 10px;
            }

            .nav-links a:not(.login-btn) {
                display: none;
            }

            .hero h1 {
                font-size: 40px;
            }

            .search-options,
            .service-grid,
            .why-content {
                grid-template-columns: 1fr;
            }

            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }

            .footer-content {
                flex-direction: column;
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

    <div class="nav-links">

        <a href="#services">Services</a>

        <a href="#why-us">Why Us</a>

        <a href="<%= request.getContextPath() %>/login.jsp"
           class="login-btn">
            Login
        </a>

    </div>

</nav>


<!-- HERO -->

<section class="hero">

    <div class="hero-content">

        <div class="tag">
            ✈ Your journey starts here
        </div>

        <h1>
            Explore the world.<br>
            <span>Travel without limits.</span>
        </h1>

        <p>
            Book flights, hotels and rental cars from one
            convenient platform. Plan your journey and
            create unforgettable travel experiences.
        </p>

        <div class="hero-buttons">

            <a href="<%= request.getContextPath() %>/login.jsp"
               class="primary-btn">
                Start Exploring →
            </a>

            <a href="<%= request.getContextPath() %>/register.jsp"
               class="secondary-btn">
                Create Account
            </a>

        </div>

    </div>

</section>


<!-- SEARCH / SERVICE BOX -->

<div class="search-wrapper">

    <div class="search-box">

        <div class="search-title">
            <strong>What are you looking for?</strong>
        </div>

        <div class="search-options">

            <div class="search-item">

                <div class="icon">✈️</div>

                <h3>Flights</h3>

                <p>
                    Find and book your next flight.
                </p>

            </div>


            <div class="search-item">

                <div class="icon">🏨</div>

                <h3>Hotels</h3>

                <p>
                    Discover comfortable places to stay.
                </p>

            </div>


            <div class="search-item">

                <div class="icon">🚗</div>

                <h3>Rental Cars</h3>

                <p>
                    Rent a car for your journey.
                </p>

            </div>

        </div>

    </div>

</div>


<!-- SERVICES -->

<section class="section" id="services">

    <div class="section-heading">

        <div class="small-title">
            Our Services
        </div>

        <h2>
            Everything you need to travel
        </h2>

        <p>
            From booking your flight to planning your
            complete itinerary, TravelGo brings your
            entire journey together.
        </p>

    </div>


    <div class="service-grid">


        <div class="service-card">

            <div class="service-icon">
                ✈️
            </div>

            <h3>Flight Booking</h3>

            <p>
                Search available flights and reserve
                your seats quickly and easily.
            </p>

        </div>


        <div class="service-card">

            <div class="service-icon">
                🏨
            </div>

            <h3>Hotel Booking</h3>

            <p>
                Find comfortable hotels and manage
                your accommodation in one place.
            </p>

        </div>


        <div class="service-card">

            <div class="service-icon">
                🚗
            </div>

            <h3>Car Rental</h3>

            <p>
                Choose from available rental cars
                for convenient transportation.
            </p>

        </div>


    </div>

</section>


<!-- WHY US -->

<section class="why-section" id="why-us">

    <div class="why-content">


        <div>

            <h2>
                Travel planning made simple.
            </h2>

            <p>
                TravelGo gives travelers, agents and
                administrators one connected platform
                to manage the complete travel journey.
            </p>


            <div class="features">


                <div class="feature">

                    <div class="feature-icon">
                        🔐
                    </div>

                    <div>

                        <h3>Secure Platform</h3>

                        <p>
                            Role-based access keeps
                            your travel data organized.
                        </p>

                    </div>

                </div>


                <div class="feature">

                    <div class="feature-icon">
                        ⚡
                    </div>

                    <div>

                        <h3>Easy Booking</h3>

                        <p>
                            Book flights, hotels and
                            cars from one platform.
                        </p>

                    </div>

                </div>


                <div class="feature">

                    <div class="feature-icon">
                        📋
                    </div>

                    <div>

                        <h3>Complete Itinerary</h3>

                        <p>
                            Keep your bookings and
                            travel plans organized.
                        </p>

                    </div>

                </div>


            </div>

        </div>


        <div class="travel-card"></div>


    </div>

</section>


<!-- CTA -->

<section class="cta">

    <h2>
        Ready for your next adventure?
    </h2>

    <p>
        Create your account and start planning your journey today.
    </p>

    <a href="<%= request.getContextPath() %>/register.jsp"
       class="secondary-btn">
        Get Started →
    </a>

</section>


<!-- FOOTER -->

<footer>

    <div class="footer-content">

        <div>

            <div class="footer-logo">
                ✈ TravelGo
            </div>

            <p class="footer-text">
                Your complete online travel booking
                platform for flights, hotels and rental cars.
            </p>

        </div>


        <div class="footer-links">

            <a href="#services">Services</a>

            <a href="#why-us">About</a>

            <a href="<%= request.getContextPath() %>/login.jsp">
                Login
            </a>

        </div>

    </div>


    <div class="footer-bottom">

        © 2026 TravelGo — Online Travel Booking Platform

    </div>

</footer>


</body>

</html>
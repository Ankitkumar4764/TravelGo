
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.travel.model.RentalCar" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Cars | TravelGo</title>

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

        .navbar {
            min-height: 72px;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
            box-shadow: 0 2px 12px rgba(0,0,0,0.07);
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

        .dashboard-btn, .logout-btn {
            text-decoration: none;
            padding: 10px 16px;
            border-radius: 10px;
            font-weight: 600;
            transition: 0.2s;
        }

        .dashboard-btn {
            color: #374151;
        }

        .dashboard-btn:hover {
            background: #eff6ff;
            color: #2563eb;
        }

        .logout-btn {
            color: white;
            background: #ef4444;
        }

        .logout-btn:hover {
            background: #dc2626;
        }

        .hero {
            background:
                linear-gradient(120deg, rgba(30,64,175,0.96),
                rgba(37,99,235,0.88)),
                url("https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=1600&q=80");
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
            margin-bottom: 12px;
        }

        .hero p {
            font-size: 17px;
            line-height: 1.7;
            max-width: 650px;
        }

        .container {
            max-width: 1150px;
            margin: 35px auto 70px;
            padding: 0 20px;
        }

        .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-bottom: 22px;
        }

        .section-heading h2 {
            font-size: 25px;
        }

        .count {
            background: #e0ecff;
            color: #2563eb;
            padding: 8px 13px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: bold;
            white-space: nowrap;
        }

        .car-card {
            background: white;
            border: 1px solid #e8edf5;
            border-radius: 18px;
            margin-bottom: 22px;
            padding: 25px;
            box-shadow: 0 6px 22px rgba(15,23,42,0.07);
            transition: 0.25s;
        }

        .car-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(15,23,42,0.12);
        }

        .car-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .car-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .car-icon {
            width: 58px;
            height: 58px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eff6ff;
            border-radius: 15px;
            font-size: 30px;
            flex-shrink: 0;
        }

        .car-name {
            font-size: 21px;
            font-weight: 750;
            overflow-wrap: anywhere;
        }

        .car-label {
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
            margin-top: 4px;
        }

        .location-box {
            background: #f8fafc;
            padding: 15px;
            border-radius: 12px;
            margin: 23px 0;
        }

        .detail-title {
            color: #718096;
            font-size: 12px;
            margin-bottom: 7px;
        }

        .detail-value {
            color: #172033;
            font-size: 15px;
            font-weight: 700;
            overflow-wrap: anywhere;
        }

        .details {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
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

        .status {
            display: inline-block;
            color: #15803d;
            background: #dcfce7;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        .card-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-top: 20px;
        }

        .book-btn {
            display: inline-flex;
            justify-content: center;
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

        .empty {
            background: white;
            border-radius: 18px;
            padding: 60px 25px;
            text-align: center;
            box-shadow: 0 6px 22px rgba(15,23,42,0.07);
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .empty h2 {
            margin-bottom: 9px;
        }

        .empty p {
            color: #718096;
            line-height: 1.6;
        }

        footer {
            background: #111827;
            color: #cbd5e1;
            padding: 28px 7%;
            text-align: center;
        }

        footer strong {
            color: white;
        }

        @media (max-width: 700px) {
            .navbar {
                padding: 0 18px;
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

            .car-card {
                padding: 18px;
            }

            .car-header {
                align-items: flex-start;
                gap: 12px;
            }

            .car-info {
                gap: 10px;
            }

            .car-icon {
                width: 46px;
                height: 46px;
                font-size: 24px;
            }

            .car-name {
                font-size: 17px;
            }

            .price {
                font-size: 21px;
            }

            .details {
                grid-template-columns: 1fr;
            }

            .card-bottom {
                align-items: stretch;
                flex-direction: column;
            }

            .book-btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>

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

<section class="hero">
    <div class="hero-content">
        <h1>Find Your Perfect Ride 🚗</h1>
        <p>
            Explore available rental cars, check rental dates,
            and choose a convenient ride for your next journey.
        </p>
    </div>
</section>

<div class="container">

    <div class="section-heading">
        <h2>Available Rental Cars</h2>

        <%
            List<RentalCar> cars =
                    (List<RentalCar>) request.getAttribute("cars");
        %>

        <span class="count">
            <%= cars == null ? 0 : cars.size() %> Cars
        </span>
    </div>

    <%
        if (cars == null || cars.isEmpty()) {
    %>

        <div class="empty">
            <div class="empty-icon">🚘</div>
            <h2>No Rental Cars Available</h2>
            <p>
                There are currently no approved rental cars.
                Please check again later.
            </p>
        </div>

    <%
        } else {
            for (RentalCar car : cars) {
    %>

        <div class="car-card">

            <div class="car-header">

                <div class="car-info">
                    <div class="car-icon">🚘</div>

                    <div>
                        <div class="car-name">
                            <%= car.getCarName() %>
                        </div>

                        <div class="car-label">
                            Rental vehicle
                        </div>
                    </div>
                </div>

                <div class="price-box">
                    <div class="price">
                        ₹<%= car.getPrice() %>
                    </div>

                    <div class="price-label">
                        Rental price
                    </div>
                </div>

            </div>

            <div class="location-box">
                <div class="detail-title">PICKUP LOCATION</div>
                <div class="detail-value">
                    📍 <%= car.getLocation() %>
                </div>
            </div>

            <div class="details">

                <div class="detail-box">
                    <div class="detail-title">AVAILABLE FROM</div>
                    <div class="detail-value">
                        📅 <%= car.getAvailableFrom() %>
                    </div>
                </div>

                <div class="detail-box">
                    <div class="detail-title">AVAILABLE UNTIL</div>
                    <div class="detail-value">
                        📅 <%= car.getAvailableTo() %>
                    </div>
                </div>

                <div class="detail-box">
                    <div class="detail-title">LISTING STATUS</div>
                    <div class="detail-value">
                        <span class="status">
                            ✓ <%= car.getStatus() %>
                        </span>
                    </div>
                </div>

            </div>

            <div class="card-bottom">

                <span class="car-label">
                    Check the availability dates before booking.
                </span>

                <a class="book-btn"
                   href="<%= request.getContextPath() %>/book-car?id=<%= car.getId() %>">
                    Book Car →
                </a>

            </div>

        </div>

    <%
            }
        }
    %>

</div>

<footer>
    <strong>TravelGo</strong>
    &nbsp; | &nbsp;
    Your journey starts here.
</footer>

</body>
</html>


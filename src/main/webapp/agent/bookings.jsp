
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.travel.model.Booking" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookings | TravelGo</title>

    <style>
        :root {
            --navy: #102a43;
            --green: #15966a;
            --green-dark: #087f5b;
            --bg: #f4f7f5;
            --text: #243b53;
            --muted: #718096;
            --border: #e3eae6;
            --white: #ffffff;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: var(--bg);
            color: var(--text);
        }

        a {
            text-decoration: none;
        }

        .navbar {
            background: var(--navy);
            color: white;
            padding: 18px 6%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
        }

        .brand {
            color: white;
            font-size: 25px;
            font-weight: 800;
            letter-spacing: -0.7px;
        }

        .brand span {
            color: #50d6a0;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 22px;
            flex-wrap: wrap;
        }

        .nav-right a {
            color: #e5eee9;
            font-size: 14px;
            font-weight: 600;
        }

        .nav-right a:hover {
            color: #50d6a0;
        }

        .page {
            max-width: 1180px;
            margin: 34px auto;
            padding: 0 22px 40px;
        }

        .hero {
            background: linear-gradient(120deg, #102a43, #176b55);
            color: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 28px;
            position: relative;
            overflow: hidden;
        }

        .hero:after {
            content: "";
            position: absolute;
            width: 190px;
            height: 190px;
            border: 28px solid rgba(255,255,255,0.07);
            border-radius: 50%;
            right: -35px;
            top: -75px;
        }

        .eyebrow {
            color: #8df0c6;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .hero h1 {
            font-size: clamp(26px, 4vw, 36px);
            margin: 10px 0;
        }

        .hero p {
            color: #dcebe5;
            margin: 0;
            line-height: 1.7;
            max-width: 600px;
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 22px;
        }

        .toolbar h2 {
            color: var(--navy);
            margin: 0 0 5px;
            font-size: 23px;
        }

        .subtext {
            color: var(--muted);
            font-size: 14px;
        }

        .search {
            width: min(100%, 320px);
            padding: 12px 15px;
            border: 1px solid var(--border);
            border-radius: 10px;
            outline: none;
            background: white;
            font: inherit;
        }

        .search:focus {
            border-color: var(--green);
            box-shadow: 0 0 0 3px rgba(21,150,106,0.1);
        }

        .booking-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .booking-card {
            background: white;
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 23px;
            box-shadow: 0 5px 20px rgba(16,42,67,0.035);
            transition: transform .2s, box-shadow .2s;
            min-width: 0;
        }

        .booking-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 28px rgba(16,42,67,0.08);
        }

        .card-top {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 12px;
            margin-bottom: 22px;
        }

        .booking-label {
            color: var(--muted);
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .booking-id {
            color: var(--navy);
            font-size: 21px;
            font-weight: 800;
            margin-top: 5px;
            overflow-wrap: anywhere;
        }

        .type-badge {
            display: inline-block;
            padding: 7px 10px;
            border-radius: 8px;
            background: #e7f7ef;
            color: #087f5b;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            overflow-wrap: anywhere;
        }

        .details {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px 12px;
        }

        .detail-label {
            display: block;
            font-size: 12px;
            color: var(--muted);
            margin-bottom: 6px;
        }

        .detail-value {
            display: block;
            color: var(--text);
            font-size: 14px;
            font-weight: 700;
            overflow-wrap: anywhere;
        }

        .card-footer {
            border-top: 1px solid var(--border);
            margin-top: 22px;
            padding-top: 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
        }

        .price-label {
            color: var(--muted);
            font-size: 12px;
            display: block;
            margin-bottom: 4px;
        }

        .price {
            color: var(--green-dark);
            font-size: 23px;
            font-weight: 800;
            overflow-wrap: anywhere;
        }

        .status {
            display: inline-block;
            padding: 7px 11px;
            border-radius: 20px;
            background: #edf2f7;
            color: #475569;
            font-size: 12px;
            font-weight: 800;
            overflow-wrap: anywhere;
            text-align: center;
        }

        .status[data-status="confirmed"],
        .status[data-status="approved"],
        .status[data-status="completed"] {
            background: #dcfce7;
            color: #166534;
        }

        .status[data-status="pending"] {
            background: #fef3c7;
            color: #92400e;
        }

        .status[data-status="cancelled"],
        .status[data-status="rejected"] {
            background: #fee2e2;
            color: #991b1b;
        }

        .empty {
            background: white;
            border: 1px solid var(--border);
            border-radius: 18px;
            padding: 55px 20px;
            text-align: center;
        }

        .empty-icon {
            width: 66px;
            height: 66px;
            margin: 0 auto 18px;
            display: grid;
            place-items: center;
            background: #e7f7ef;
            color: var(--green-dark);
            border-radius: 50%;
            font-size: 28px;
        }

        .empty h2 {
            margin: 0 0 10px;
            color: var(--navy);
        }

        .empty p {
            color: var(--muted);
            margin: 0;
            line-height: 1.6;
        }

        .no-results {
            display: none;
            padding: 25px;
            text-align: center;
            color: var(--muted);
            background: white;
            border-radius: 12px;
            margin-top: 15px;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: var(--green-dark);
            font-size: 14px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .back-link:hover {
            color: var(--navy);
        }

        .footer {
            text-align: center;
            padding: 24px;
            color: var(--muted);
            font-size: 12px;
            border-top: 1px solid var(--border);
        }

        @media (max-width: 720px) {
            .booking-grid {
                grid-template-columns: 1fr;
            }

            .navbar {
                padding: 17px 5%;
            }

            .nav-right {
                gap: 14px;
            }

            .page {
                margin-top: 22px;
                padding: 0 14px 28px;
            }

            .hero {
                padding: 24px;
            }

            .toolbar {
                align-items: stretch;
            }

            .search {
                width: 100%;
            }
        }

        @media (max-width: 380px) {
            .details {
                grid-template-columns: 1fr;
            }

            .card-footer {
                align-items: flex-start;
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<header class="navbar">
    <a class="brand" href="<%= request.getContextPath() %>/agent/dashboard.jsp">
        Travel<span>Go</span>
    </a>

    <nav class="nav-right">
        <a href="<%= request.getContextPath() %>/agent/dashboard.jsp">Dashboard</a>
        <a href="<%= request.getContextPath() %>/agent/listings">My Listings</a>
        <a href="<%= request.getContextPath() %>/agent/bookings">Bookings</a>
        <a href="<%= request.getContextPath() %>/messages">Messages</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </nav>
</header>

<main class="page">

    <a class="back-link"
       href="<%= request.getContextPath() %>/agent/dashboard.jsp">
        &#8592; Back to Dashboard
    </a>

    <section class="hero">
        <div class="eyebrow">TravelGo Partner Portal</div>
        <h1>Traveler Bookings</h1>
        <p>Review traveler reservations, check booking details, and keep track of booking status from one place.</p>
    </section>

    <%
        List<Booking> bookings =
                (List<Booking>) request.getAttribute("bookings");

        if (bookings == null || bookings.isEmpty()) {
    %>

        <section class="empty">
            <div class="empty-icon">&#9992;</div>
            <h2>No Bookings Yet</h2>
            <p>Traveler reservations will appear here when booking records are available.</p>
        </section>

    <%
        } else {
    %>

        <section class="toolbar">
            <div>
                <h2>All Bookings</h2>
                <div class="subtext">
                    Review reservation details below.
                </div>
            </div>

            <input
                type="search"
                id="bookingSearch"
                class="search"
                placeholder="Search bookings..."
                aria-label="Search bookings">
        </section>

        <section class="booking-grid" id="bookingGrid">

            <%
                for (Booking booking : bookings) {
                    String status = booking.getStatus() == null
                            ? "Unknown" : booking.getStatus();
                    String normalizedStatus = status.trim().toLowerCase();
            %>

                <article class="booking-card">
                    <div class="card-top">
                        <div>
                            <span class="booking-label">Booking Reference</span>
                            <div class="booking-id">
                                #<%= booking.getId() %>
                            </div>
                        </div>

                        <span class="type-badge">
                            <%= booking.getListingType() %>
                        </span>
                    </div>

                    <div class="details">
                        <div>
                            <span class="detail-label">Traveler ID</span>
                            <span class="detail-value">
                                <%= booking.getUserId() %>
                            </span>
                        </div>

                        <div>
                            <span class="detail-label">Listing ID</span>
                            <span class="detail-value">
                                <%= booking.getListingId() %>
                            </span>
                        </div>

                        <div>
                            <span class="detail-label">Booking Date</span>
                            <span class="detail-value">
                                <%= booking.getBookingDate() %>
                            </span>
                        </div>

                        <div>
                            <span class="detail-label">Booking Status</span>
                            <span class="status"
                                  data-status="<%= normalizedStatus %>">
                                <%= status %>
                            </span>
                        </div>
                    </div>

                    <div class="card-footer">
                        <div>
                            <span class="price-label">Total Booking Price</span>
                            <div class="price">
                                &#8377;<%= booking.getTotalPrice() %>
                            </div>
                        </div>
                    </div>
                </article>

            <%
                }
            %>

        </section>

        <div class="no-results" id="noResults">
            No bookings match your search.
        </div>

    <%
        }
    %>

</main>

<footer class="footer">
    &copy; <%= java.time.Year.now() %> TravelGo. Travel smarter, travel better.
</footer>

<script>
    const bookingSearch = document.getElementById("bookingSearch");
    const bookingCards = document.querySelectorAll(".booking-card");
    const noResults = document.getElementById("noResults");

    if (bookingSearch) {
        bookingSearch.addEventListener("input", function () {
            const query = this.value.toLowerCase().trim();
            let visibleCount = 0;

            bookingCards.forEach(function (card) {
                const matches = card.textContent.toLowerCase().includes(query);
                card.style.display = matches ? "" : "none";

                if (matches) {
                    visibleCount++;
                }
            });

            noResults.style.display = visibleCount === 0 ? "block" : "none";
        });
    }
</script>

</body>
</html>
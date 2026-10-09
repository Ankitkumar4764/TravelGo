
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Listings | TravelGo</title>

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

        .nav-links {
            display: flex;
            align-items: center;
            gap: 22px;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: #e5eee9;
            font-size: 14px;
            font-weight: 600;
        }

        .nav-links a:hover {
            color: #50d6a0;
        }

        .page {
            max-width: 1250px;
            margin: 34px auto;
            padding: 0 22px 40px;
        }

        .back-link {
            display: inline-block;
            color: var(--green-dark);
            font-size: 14px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .back-link:hover {
            color: var(--navy);
        }

        .hero {
            background: linear-gradient(120deg, #102a43, #176b55);
            color: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 26px;
            position: relative;
            overflow: hidden;
        }

        .hero::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border: 26px solid rgba(255,255,255,0.07);
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
            font-size: clamp(27px, 4vw, 36px);
            margin: 10px 0;
        }

        .hero p {
            color: #dcebe5;
            line-height: 1.7;
            margin: 0;
            max-width: 620px;
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .toolbar h2 {
            color: var(--navy);
            font-size: 22px;
            margin: 0 0 5px;
        }

        .muted {
            color: var(--muted);
            font-size: 13px;
        }

        .toolbar-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .search {
            width: 250px;
            max-width: 100%;
            padding: 12px 14px;
            border: 1px solid var(--border);
            border-radius: 10px;
            background: white;
            outline: none;
            font: inherit;
        }

        .search:focus {
            border-color: var(--green);
            box-shadow: 0 0 0 3px rgba(21,150,106,0.1);
        }

        .add-btn {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            gap: 7px;
            padding: 12px 17px;
            background: var(--green);
            color: white;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            transition: background .2s;
        }

        .add-btn:hover {
            background: var(--green-dark);
        }

        .table-card {
            background: white;
            border: 1px solid var(--border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(16,42,67,0.035);
        }

        .table-scroll {
            overflow-x: auto;
            width: 100%;
        }

        table {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
            text-align: left;
        }

        thead {
            background: #edf6f1;
        }

        th {
            color: var(--navy);
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: .7px;
            padding: 16px 15px;
            border-bottom: 1px solid var(--border);
            white-space: nowrap;
        }

        td {
            padding: 17px 15px;
            border-bottom: 1px solid #edf1ee;
            font-size: 13px;
            color: var(--text);
            vertical-align: middle;
        }

        tbody tr:hover {
            background: #f7fbf8;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .id {
            color: var(--muted);
            font-weight: 700;
        }

        .listing-name {
            color: var(--navy);
            font-weight: 700;
        }

        .type-badge {
            display: inline-block;
            padding: 6px 9px;
            border-radius: 7px;
            background: #e7f7ef;
            color: var(--green-dark);
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
        }

        .status {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            background: #edf2f7;
            color: #475569;
            font-size: 11px;
            font-weight: 800;
            white-space: nowrap;
        }

        .status[data-status="approved"],
        .status[data-status="active"],
        .status[data-status="available"] {
            background: #dcfce7;
            color: #166534;
        }

        .status[data-status="pending"] {
            background: #fef3c7;
            color: #92400e;
        }

        .status[data-status="rejected"],
        .status[data-status="inactive"] {
            background: #fee2e2;
            color: #991b1b;
        }

        .price {
            color: var(--green-dark);
            font-weight: 800;
            white-space: nowrap;
        }

        .empty {
            background: white;
            border: 1px solid var(--border);
            border-radius: 16px;
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
            color: var(--navy);
            margin: 0 0 10px;
        }

        .empty p {
            color: var(--muted);
            line-height: 1.6;
        }

        .no-results {
            display: none;
            padding: 25px;
            text-align: center;
            color: var(--muted);
            background: white;
        }

        .footer {
            text-align: center;
            padding: 24px;
            color: var(--muted);
            font-size: 12px;
            border-top: 1px solid var(--border);
        }

        @media (max-width: 700px) {
            .navbar {
                padding: 17px 5%;
            }

            .nav-links {
                gap: 13px;
            }

            .page {
                margin-top: 22px;
                padding: 0 14px 28px;
            }

            .hero {
                padding: 24px;
            }

            .toolbar-actions {
                width: 100%;
            }

            .search {
                flex: 1;
                width: 100%;
            }
        }
    </style>
</head>

<body>

<header class="navbar">
    <a class="brand"
       href="<%= request.getContextPath() %>/agent/dashboard.jsp">
        Travel<span>Go</span>
    </a>

    <nav class="nav-links">
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
        <h1>My Travel Listings</h1>
        <p>Manage and review the flights, hotels and cars you have added to TravelGo.</p>
    </section>

    <%
        List<String[]> listings =
                (List<String[]>) request.getAttribute("listings");

        if (listings == null || listings.isEmpty()) {
    %>

        <section class="empty">
            <div class="empty-icon">&#9992;</div>
            <h2>No Listings Yet</h2>
            <p>Your travel listings will appear here after you add them.</p>
            <a class="add-btn"
               href="<%= request.getContextPath() %>/agent/dashboard.jsp">
                + Add New Listing
            </a>
        </section>

    <%
        } else {
    %>

        <section class="toolbar">
            <div>
                <h2>All Listings</h2>
                <div class="muted">Review your travel inventory and listing status.</div>
            </div>

            <div class="toolbar-actions">
                <input
                    type="search"
                    id="listingSearch"
                    class="search"
                    placeholder="Search listings..."
                    aria-label="Search listings">

                <a class="add-btn"
                   href="<%= request.getContextPath() %>/agent/dashboard.jsp">
                    + Add New Listing
                </a>
            </div>
        </section>

        <section class="table-card">
            <div class="table-scroll">
                <table id="listingsTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Type</th>
                            <th>Name / Airline</th>
                            <th>Location / Origin</th>
                            <th>Details</th>
                            <th>Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>

                    <tbody>
                    <%
                        for (String[] listing : listings) {
                            String status = listing[6] == null
                                    ? "Unknown" : listing[6];
                            String normalizedStatus = status.trim().toLowerCase();
                    %>
                        <tr>
                            <td class="id"><%= listing[0] %></td>

                            <td>
                                <span class="type-badge"><%= listing[1] %></span>
                            </td>

                            <td class="listing-name"><%= listing[2] %></td>

                            <td><%= listing[3] %></td>

                            <td><%= listing[4] %></td>

                            <td class="price">&#8377;<%= listing[5] %></td>

                            <td>
                                <span class="status"
                                      data-status="<%= normalizedStatus %>">
                                    <%= status %>
                                </span>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <div class="no-results" id="noResults">
                No listings match your search.
            </div>
        </section>

    <%
        }
    %>

</main>

<footer class="footer">
    &copy; <%= java.time.Year.now() %> TravelGo. Travel smarter, travel better.
</footer>

<script>
    const listingSearch = document.getElementById("listingSearch");
    const listingRows = document.querySelectorAll("#listingsTable tbody tr");
    const noResults = document.getElementById("noResults");
    const tableCard = document.querySelector(".table-card");

    if (listingSearch) {
        listingSearch.addEventListener("input", function () {
            const query = this.value.toLowerCase().trim();
            let visibleCount = 0;

            listingRows.forEach(function (row) {
                const matches = row.textContent.toLowerCase().includes(query);
                row.style.display = matches ? "" : "none";

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
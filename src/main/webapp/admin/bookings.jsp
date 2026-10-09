
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.travel.model.Booking" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Bookings | TravelGo Admin</title>

<style>
:root {
    --primary: #4f46e5;
    --primary-dark: #3730a3;
    --bg: #f5f7fc;
    --text: #172033;
    --muted: #718096;
    --border: #e8ecf4;
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

.topbar {
    background: var(--white);
    border-bottom: 1px solid var(--border);
    padding: 18px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 16px;
}

.brand {
    color: var(--primary);
    font-size: 23px;
    font-weight: 800;
    letter-spacing: -0.7px;
}

.brand span {
    color: var(--text);
}

.topbar-label {
    color: var(--muted);
    font-size: 12px;
    letter-spacing: 1px;
    font-weight: 700;
}

.container {
    width: 92%;
    max-width: 1400px;
    margin: 32px auto;
}

.back {
    display: inline-block;
    margin-bottom: 24px;
    color: var(--primary);
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
}

.back:hover {
    color: var(--primary-dark);
}

.heading {
    margin-bottom: 26px;
}

.heading h1 {
    font-size: 30px;
    letter-spacing: -0.8px;
    margin: 0 0 8px;
}

.heading p {
    margin: 0;
    color: var(--muted);
    font-size: 14px;
}

.panel {
    background: var(--white);
    border: 1px solid var(--border);
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 8px 28px rgba(32, 44, 90, 0.04);
}

.panel-heading {
    padding: 22px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 14px;
    border-bottom: 1px solid var(--border);
}

.panel-heading h2 {
    margin: 0;
    font-size: 17px;
}

.search {
    width: 270px;
    max-width: 100%;
    padding: 11px 14px;
    border: 1px solid #dce2ee;
    border-radius: 9px;
    outline: none;
    background: #fbfcff;
    font-size: 13px;
}

.search:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
}

.table-wrap {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    min-width: 1000px;
    border-collapse: collapse;
}

thead {
    background: #f8f9fd;
}

th {
    color: #647089;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.7px;
    font-weight: 700;
}

th, td {
    padding: 17px 18px;
    text-align: left;
    border-bottom: 1px solid #edf0f6;
    vertical-align: middle;
}

td {
    color: #344054;
    font-size: 13px;
}

tbody tr {
    transition: background 0.2s ease;
}

tbody tr:hover {
    background: #fafbff;
}

tbody tr:last-child td {
    border-bottom: none;
}

.booking-id {
    color: var(--primary);
    font-weight: 750;
}

.type {
    display: inline-block;
    padding: 6px 10px;
    border-radius: 20px;
    background: #eeeaff;
    color: #5b3cc4;
    font-size: 11px;
    font-weight: 700;
    white-space: nowrap;
}

.status {
    display: inline-block;
    padding: 6px 10px;
    border-radius: 20px;
    background: #f0f2f6;
    color: #596579;
    font-size: 11px;
    font-weight: 700;
    white-space: nowrap;
}

.status-confirmed,
.status-approved,
.status-completed {
    background: #e5f8ef;
    color: #18794e;
}

.status-pending {
    background: #fff4d6;
    color: #946200;
}

.status-cancelled,
.status-rejected,
.status-failed {
    background: #feecec;
    color: #b42318;
}

.price {
    color: #18794e;
    font-weight: 750;
    white-space: nowrap;
}

.empty {
    text-align: center;
    padding: 55px 20px;
}

.empty-icon {
    display: grid;
    place-items: center;
    width: 58px;
    height: 58px;
    margin: 0 auto 16px;
    border-radius: 16px;
    background: #eef0ff;
    color: var(--primary);
    font-size: 26px;
}

.empty h2 {
    margin: 0 0 8px;
    font-size: 19px;
}

.empty p {
    margin: 0;
    color: var(--muted);
    font-size: 14px;
}

.no-results {
    display: none;
    padding: 24px;
    text-align: center;
    color: var(--muted);
    font-size: 14px;
}

.footer {
    padding: 20px;
    text-align: center;
    color: #929bad;
    font-size: 12px;
}

@media (max-width: 600px) {
    .topbar {
        padding: 16px 4%;
    }

    .topbar-label {
        font-size: 10px;
    }

    .container {
        width: 94%;
        margin: 22px auto;
    }

    .heading h1 {
        font-size: 25px;
    }

    .panel-heading {
        padding: 18px;
        align-items: stretch;
    }

    .search {
        width: 100%;
    }
}
</style>
</head>

<body>

<header class="topbar">
    <div class="brand">Travel<span>Go</span></div>
    <div class="topbar-label">ADMINISTRATION PANEL</div>
</header>

<main class="container">

    <a class="back"
       href="<%= request.getContextPath() %>/admin/dashboard.jsp">
        &larr; Back to Dashboard
    </a>

    <section class="heading">
        <h1>Booking Management</h1>
        <p>Review traveler reservations, booking details and payment totals.</p>
    </section>

    <section class="panel">

        <div class="panel-heading">
            <h2>All Bookings</h2>
            <input
                type="search"
                id="bookingSearch"
                class="search"
                placeholder="Search bookings..."
                aria-label="Search bookings">
        </div>

        <%
            List<Booking> bookings =
                (List<Booking>) request.getAttribute("bookings");

            if (bookings == null || bookings.isEmpty()) {
        %>

        <div class="empty">
            <div class="empty-icon">&#128197;</div>
            <h2>No Bookings Found</h2>
            <p>There are currently no traveler bookings to display.</p>
        </div>

        <%
            } else {
        %>

        <div class="table-wrap">
            <table id="bookingsTable">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Traveler ID</th>
                        <th>Type</th>
                        <th>Listing ID</th>
                        <th>Booking Date</th>
                        <th>Status</th>
                        <th>Total Price</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    for (Booking booking : bookings) {
                        String status = booking.getStatus() == null
                            ? "" : booking.getStatus().trim();

                        String statusLower = status.toLowerCase();
                        String statusClass = "status";

                        if ("confirmed".equals(statusLower)
                                || "approved".equals(statusLower)
                                || "completed".equals(statusLower)) {
                            statusClass = "status status-" + statusLower;
                        } else if ("pending".equals(statusLower)) {
                            statusClass = "status status-pending";
                        } else if ("cancelled".equals(statusLower)
                                || "rejected".equals(statusLower)
                                || "failed".equals(statusLower)) {
                            statusClass = "status status-" + statusLower;
                        }
                %>

                    <tr>
                        <td class="booking-id">
                            #<%= booking.getId() %>
                        </td>

                        <td><%= booking.getUserId() %></td>

                        <td>
                            <span class="type">
                                <%= booking.getListingType() %>
                            </span>
                        </td>

                        <td><%= booking.getListingId() %></td>

                        <td><%= booking.getBookingDate() %></td>

                        <td>
                            <span class="<%= statusClass %>">
                                <%= booking.getStatus() %>
                            </span>
                        </td>

                        <td class="price">
                            &#8377;<%= booking.getTotalPrice() %>
                        </td>
                    </tr>

                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <div class="no-results" id="noResults">
            No bookings match your search.
        </div>

        <%
            }
        %>

    </section>
</main>

<footer class="footer">
    TravelGo Admin Panel &bull; Booking Management
</footer>

<script>
const searchInput = document.getElementById("bookingSearch");
const table = document.getElementById("bookingsTable");
const noResults = document.getElementById("noResults");

if (searchInput && table && noResults) {
    searchInput.addEventListener("input", function () {
        const query = this.value.toLowerCase().trim();
        const rows = table.querySelectorAll("tbody tr");
        let visibleCount = 0;

        rows.forEach(function (row) {
            const matches =
                row.textContent.toLowerCase().includes(query);

            row.style.display = matches ? "" : "none";

            if (matches) {
                visibleCount++;
            }
        });

        noResults.style.display =
            visibleCount === 0 ? "block" : "none";
    });
}
</script>

</body>
</html>
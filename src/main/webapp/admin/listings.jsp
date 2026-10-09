
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Listings | TravelGo Admin</title>

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
    align-items: center;
    justify-content: space-between;
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
    font-size: 14px;
    font-weight: 600;
    text-decoration: none;
}

.back:hover {
    color: var(--primary-dark);
}

.heading {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    flex-wrap: wrap;
    gap: 15px;
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
    align-items: center;
    justify-content: space-between;
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
    font-size: 13px;
    background: #fbfcff;
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
    min-width: 1050px;
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
    text-align: left;
    padding: 17px 16px;
    border-bottom: 1px solid #edf0f6;
    vertical-align: middle;
}

td {
    font-size: 13px;
    color: #344054;
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

.id {
    color: #8791a5;
    font-weight: 700;
}

.listing-name {
    color: #202b40;
    font-weight: 650;
}

.type, .status {
    display: inline-block;
    padding: 6px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 700;
    white-space: nowrap;
}

.type {
    background: #eeeaff;
    color: #5b3cc4;
}

.status {
    background: #f0f2f6;
    color: #596579;
}

.status-approved {
    background: #e5f8ef;
    color: #18794e;
}

.status-rejected {
    background: #feecec;
    color: #b42318;
}

.status-pending {
    background: #fff4d6;
    color: #946200;
}

.price {
    color: #18794e;
    font-weight: 750;
    white-space: nowrap;
}

.actions {
    display: flex;
    align-items: center;
    gap: 7px;
}

.action-form {
    margin: 0;
}

.btn {
    border: 0;
    border-radius: 8px;
    padding: 9px 12px;
    font-size: 12px;
    font-weight: 700;
    cursor: pointer;
    transition: transform 0.15s ease, opacity 0.15s ease;
}

.btn:hover {
    opacity: 0.88;
    transform: translateY(-1px);
}

.approve-btn {
    color: #ffffff;
    background: #15945b;
}

.reject-btn {
    color: #ffffff;
    background: #dc4545;
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
    color: var(--muted);
    text-align: center;
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
        <div>
            <h1>Travel Listings</h1>
            <p>Review and manage flights, hotels and car rental listings.</p>
        </div>
    </section>

    <section class="panel">

        <div class="panel-heading">
            <h2>All Listings</h2>
            <input
                type="search"
                id="listingSearch"
                class="search"
                placeholder="Search listings..."
                aria-label="Search listings">
        </div>

        <%
            List<String[]> listings =
                (List<String[]>) request.getAttribute("listings");

            if (listings == null || listings.isEmpty()) {
        %>

        <div class="empty">
            <div class="empty-icon">&#9992;</div>
            <h2>No Listings Found</h2>
            <p>There are currently no travel listings to display.</p>
        </div>

        <%
            } else {
        %>

        <div class="table-wrap">
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
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    for (String[] listing : listings) {
                        String status = listing[6] == null
                            ? "" : listing[6].trim();

                        String statusClass = "status";
                        String statusLower = status.toLowerCase();

                        if ("approved".equals(statusLower)) {
                            statusClass = "status status-approved";
                        } else if ("rejected".equals(statusLower)) {
                            statusClass = "status status-rejected";
                        } else if ("pending".equals(statusLower)) {
                            statusClass = "status status-pending";
                        }
                %>

                    <tr>
                        <td class="id"><%= listing[0] %></td>

                        <td>
                            <span class="type"><%= listing[1] %></span>
                        </td>

                        <td class="listing-name"><%= listing[2] %></td>

                        <td><%= listing[3] %></td>

                        <td><%= listing[4] %></td>

                        <td class="price">&#8377;<%= listing[5] %></td>

                        <td>
                            <span class="<%= statusClass %>">
                                <%= listing[6] %>
                            </span>
                        </td>

                        <td>
                            <div class="actions">

                                <form class="action-form"
                                      action="<%= request.getContextPath() %>/admin/listing-action"
                                      method="post"
                                      onsubmit="return confirm('Approve this listing?');">

                                    <input type="hidden" name="id"
                                           value="<%= listing[0] %>">

                                    <input type="hidden" name="type"
                                           value="<%= listing[1] %>">

                                    <input type="hidden" name="action"
                                           value="APPROVE">

                                    <button type="submit"
                                            class="btn approve-btn">
                                        Approve
                                    </button>
                                </form>

                                <form class="action-form"
                                      action="<%= request.getContextPath() %>/admin/listing-action"
                                      method="post"
                                      onsubmit="return confirm('Reject this listing?');">

                                    <input type="hidden" name="id"
                                           value="<%= listing[0] %>">

                                    <input type="hidden" name="type"
                                           value="<%= listing[1] %>">

                                    <input type="hidden" name="action"
                                           value="REJECT">

                                    <button type="submit"
                                            class="btn reject-btn">
                                        Reject
                                    </button>
                                </form>

                            </div>
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

        <%
            }
        %>

    </section>
</main>

<footer class="footer">
    TravelGo Admin Panel &bull; Listing Management
</footer>

<script>
const searchInput = document.getElementById("listingSearch");
const table = document.getElementById("listingsTable");
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
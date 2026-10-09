
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Users | TravelGo Admin</title>

<style>
:root {
    --primary: #4f46e5;
    --primary-dark: #3730a3;
    --background: #f5f7fc;
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
    background: var(--background);
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
    font-size: 23px;
    font-weight: 800;
    color: var(--primary);
    letter-spacing: -0.7px;
}

.brand span {
    color: var(--text);
}

.topbar-label {
    color: var(--muted);
    font-size: 13px;
}

.container {
    max-width: 1250px;
    width: 92%;
    margin: 32px auto;
}

.back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 24px;
    color: var(--primary);
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
}

.back:hover {
    color: var(--primary-dark);
}

.page-heading {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    flex-wrap: wrap;
    gap: 16px;
    margin-bottom: 25px;
}

.page-heading h1 {
    margin: 0 0 8px;
    font-size: 30px;
    letter-spacing: -0.8px;
}

.page-heading p {
    margin: 0;
    color: var(--muted);
    font-size: 14px;
}

.panel {
    background: var(--white);
    border: 1px solid var(--border);
    border-radius: 16px;
    box-shadow: 0 8px 28px rgba(32, 44, 90, 0.04);
    overflow: hidden;
}

.panel-heading {
    padding: 22px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 14px;
    flex-wrap: wrap;
    border-bottom: 1px solid var(--border);
}

.panel-heading h2 {
    margin: 0;
    font-size: 17px;
}

.search {
    width: 260px;
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
    box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.10);
}

.table-wrap {
    width: 100%;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 720px;
}

thead {
    background: #f8f9fd;
}

th {
    color: #647089;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.8px;
    font-weight: 700;
}

th, td {
    padding: 17px 22px;
    text-align: left;
    border-bottom: 1px solid #edf0f6;
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

.user-id {
    color: #8791a5;
    font-weight: 600;
}

.user-name {
    color: #202b40;
    font-weight: 650;
}

.email {
    color: #667085;
}

.role, .status {
    display: inline-block;
    padding: 6px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 700;
    white-space: nowrap;
}

.role-admin {
    background: #eeeaff;
    color: #5b3cc4;
}

.role-agent {
    background: #e6f4ff;
    color: #1768a5;
}

.role-traveler {
    background: #e5f8ef;
    color: #18794e;
}

.role-default {
    background: #f0f2f6;
    color: #596579;
}

.status {
    background: #e5f8ef;
    color: #18794e;
}

.empty {
    padding: 55px 20px;
    text-align: center;
}

.empty-icon {
    width: 58px;
    height: 58px;
    margin: 0 auto 16px;
    display: grid;
    place-items: center;
    border-radius: 16px;
    background: #eef0ff;
    color: var(--primary);
    font-size: 25px;
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
    padding: 25px;
    text-align: center;
    color: var(--muted);
    font-size: 14px;
}

.footer {
    padding: 20px 5%;
    color: #929bad;
    text-align: center;
    font-size: 12px;
}

@media (max-width: 600px) {
    .topbar {
        padding: 16px 4%;
    }

    .topbar-label {
        display: none;
    }

    .container {
        width: 94%;
        margin: 22px auto;
    }

    .page-heading h1 {
        font-size: 25px;
    }

    .panel-heading {
        padding: 18px;
        align-items: stretch;
    }

    .search {
        width: 100%;
    }

    th, td {
        padding: 14px 16px;
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

    <section class="page-heading">
        <div>
            <h1>User Management</h1>
            <p>View and monitor registered users on your platform.</p>
        </div>
    </section>

    <section class="panel">

        <div class="panel-heading">
            <h2>All Registered Users</h2>
            <input
                type="search"
                id="userSearch"
                class="search"
                placeholder="Search name, email, role..."
                aria-label="Search users">
        </div>

        <%
            List<String[]> users =
                (List<String[]>) request.getAttribute("users");

            if (users == null || users.isEmpty()) {
        %>

        <div class="empty">
            <div class="empty-icon">&#128101;</div>
            <h2>No Users Found</h2>
            <p>There are currently no registered users to display.</p>
        </div>

        <%
            } else {
        %>

        <div class="table-wrap">
            <table id="usersTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email Address</th>
                        <th>Role</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    for (String[] user : users) {
                        String role = user[3] == null
                            ? "" : user[3].trim().toUpperCase();

                        String roleClass = "role-default";

                        if ("ADMIN".equals(role)) {
                            roleClass = "role-admin";
                        } else if ("TRAVEL_AGENT".equals(role)
                                || "AGENT".equals(role)) {
                            roleClass = "role-agent";
                        } else if ("TRAVELER".equals(role)) {
                            roleClass = "role-traveler";
                        }
                %>

                    <tr>
                        <td class="user-id"><%= user[0] %></td>
                        <td class="user-name"><%= user[1] %></td>
                        <td class="email"><%= user[2] %></td>
                        <td>
                            <span class="role <%= roleClass %>">
                                <%= user[3] == null ? "Unknown" : user[3] %>
                            </span>
                        </td>
                        <td>
                            <span class="status">
                                <%= user[4] == null ? "Unknown" : user[4] %>
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
            No users match your search.
        </div>

        <%
            }
        %>

    </section>
</main>

<footer class="footer">
    TravelGo Admin Panel &bull; User Management
</footer>

<script>
const searchInput = document.getElementById("userSearch");
const table = document.getElementById("usersTable");
const noResults = document.getElementById("noResults");

if (searchInput && table) {
    searchInput.addEventListener("input", function () {
        const query = this.value.toLowerCase().trim();
        const rows = table.querySelectorAll("tbody tr");
        let visibleCount = 0;

        rows.forEach(function (row) {
            const matches = row.textContent.toLowerCase().includes(query);
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
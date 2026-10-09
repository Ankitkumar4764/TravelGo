
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.travel.model.User" %>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}

if (!"ADMIN".equals(user.getRole())) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>System Settings | TravelGo Admin</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f4f7fb;
    color: #1e293b;
}

.header {
    background: #101828;
    color: white;
    padding: 22px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
}

.brand {
    font-size: 25px;
    font-weight: 800;
    letter-spacing: -0.5px;
}

.brand span {
    color: #60a5fa;
}

.header small {
    color: #cbd5e1;
    font-size: 13px;
}

.container {
    max-width: 1100px;
    margin: 35px auto;
    padding: 0 22px;
}

.topbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 18px;
    margin-bottom: 28px;
}

.topbar h1 {
    margin: 0 0 7px;
    font-size: 29px;
    color: #111827;
}

.subtitle {
    margin: 0;
    color: #64748b;
    font-size: 14px;
}

.back {
    display: inline-block;
    padding: 11px 17px;
    background: white;
    color: #334155;
    text-decoration: none;
    border: 1px solid #dbe3ee;
    border-radius: 9px;
    font-weight: 600;
    font-size: 14px;
    transition: 0.2s;
}

.back:hover {
    background: #eff6ff;
    border-color: #93c5fd;
}

.status-banner {
    background: linear-gradient(115deg, #1d4ed8, #2563eb, #3b82f6);
    color: white;
    padding: 24px 26px;
    border-radius: 16px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 18px;
    flex-wrap: wrap;
    margin-bottom: 25px;
    box-shadow: 0 8px 24px rgba(37, 99, 235, 0.15);
}

.status-banner h2 {
    margin: 0 0 7px;
    font-size: 21px;
}

.status-banner p {
    margin: 0;
    color: #dbeafe;
    font-size: 14px;
    line-height: 1.6;
}

.running {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 9px 13px;
    background: rgba(255,255,255,0.16);
    border: 1px solid rgba(255,255,255,0.25);
    border-radius: 30px;
    font-size: 13px;
    font-weight: 700;
    white-space: nowrap;
}

.dot {
    height: 9px;
    width: 9px;
    background: #86efac;
    border-radius: 50%;
}

.section-title {
    font-size: 19px;
    margin: 30px 0 16px;
    color: #111827;
}

.grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
}

.card {
    background: white;
    border: 1px solid #e7edf5;
    border-radius: 14px;
    padding: 23px;
    box-shadow: 0 4px 14px rgba(15, 23, 42, 0.035);
    min-width: 0;
}

.card-heading {
    display: flex;
    align-items: center;
    gap: 13px;
    margin-bottom: 18px;
}

.icon {
    width: 43px;
    height: 43px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #eff6ff;
    border-radius: 12px;
    font-size: 21px;
    flex-shrink: 0;
}

.card h3 {
    margin: 0 0 5px;
    font-size: 16px;
    color: #1e293b;
}

.card-heading p {
    margin: 0;
    color: #94a3b8;
    font-size: 12px;
}

.setting {
    padding: 15px 0;
    border-top: 1px solid #eef2f7;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
}

.setting:last-child {
    padding-bottom: 0;
}

.setting-label {
    color: #64748b;
    font-size: 13px;
}

.setting-value {
    font-size: 13px;
    font-weight: 700;
    text-align: right;
    overflow-wrap: anywhere;
}

.badge {
    display: inline-block;
    padding: 6px 10px;
    border-radius: 20px;
    background: #dcfce7;
    color: #166534;
    font-size: 11px;
    font-weight: 800;
    white-space: nowrap;
}

.role-list {
    display: flex;
    flex-wrap: wrap;
    gap: 9px;
    padding-top: 17px;
}

.role {
    background: #f1f5f9;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 8px 11px;
    font-size: 12px;
    font-weight: 600;
    color: #475569;
}

.notice {
    margin-top: 23px;
    padding: 17px 19px;
    background: #fffbeb;
    border: 1px solid #fde68a;
    border-radius: 11px;
    color: #92400e;
    font-size: 13px;
    line-height: 1.7;
}

.footer {
    text-align: center;
    padding: 25px 15px;
    color: #94a3b8;
    font-size: 12px;
}

@media (max-width: 650px) {
    .header {
        padding: 19px 22px;
    }

    .container {
        margin-top: 25px;
        padding: 0 15px;
    }

    .topbar h1 {
        font-size: 25px;
    }

    .grid {
        grid-template-columns: 1fr;
    }

    .status-banner {
        padding: 21px;
    }

    .card {
        padding: 19px;
    }
}
</style>
</head>

<body>

<header class="header">
    <div class="brand">Travel<span>Go</span></div>
    <small>Administrator Console</small>
</header>

<main class="container">

    <div class="topbar">
        <div>
            <h1>System Settings</h1>
            <p class="subtitle">
                View your application's configuration and system information.
            </p>
        </div>

        <a class="back"
           href="<%= request.getContextPath() %>/admin/dashboard.jsp">
            &#8592; Back to Dashboard
        </a>
    </div>

    <section class="status-banner">
        <div>
            <h2>Application Overview</h2>
            <p>Review the current configuration of your TravelGo platform.</p>
        </div>

        <div class="running">
            <span class="dot"></span>
            Application Running
        </div>
    </section>

    <h2 class="section-title">Configuration Details</h2>

    <div class="grid">

        <section class="card">
            <div class="card-heading">
                <div class="icon">&#9881;</div>
                <div>
                    <h3>Application</h3>
                    <p>General application information</p>
                </div>
            </div>

            <div class="setting">
                <span class="setting-label">Application Name</span>
                <span class="setting-value">TravelGo</span>
            </div>

            <div class="setting">
                <span class="setting-label">Platform</span>
                <span class="setting-value">Online Travel Booking</span>
            </div>

            <div class="setting">
                <span class="setting-label">User Interface</span>
                <span class="setting-value">JSP / HTML / CSS</span>
            </div>
        </section>

        <section class="card">
            <div class="card-heading">
                <div class="icon">&#128268;</div>
                <div>
                    <h3>Database</h3>
                    <p>Database technology</p>
                </div>
            </div>

            <div class="setting">
                <span class="setting-label">Database Engine</span>
                <span class="setting-value">MySQL</span>
            </div>

            <div class="setting">
                <span class="setting-label">Connection Status</span>
                <span class="setting-value">
                    <span class="badge">Configured</span>
                </span>
            </div>

            <div class="setting">
                <span class="setting-label">Access Layer</span>
                <span class="setting-value">JDBC</span>
            </div>
        </section>

        <section class="card">
            <div class="card-heading">
                <div class="icon">&#128187;</div>
                <div>
                    <h3>Server & Backend</h3>
                    <p>Application technology stack</p>
                </div>
            </div>

            <div class="setting">
                <span class="setting-label">Web Server</span>
                <span class="setting-value">Apache Tomcat 10.1.60</span>
            </div>

            <div class="setting">
                <span class="setting-label">Backend</span>
                <span class="setting-value">Java Servlets</span>
            </div>

            <div class="setting">
                <span class="setting-label">Packaging</span>
                <span class="setting-value">Maven WAR</span>
            </div>
        </section>

        <section class="card">
            <div class="card-heading">
                <div class="icon">&#128101;</div>
                <div>
                    <h3>User Access</h3>
                    <p>Supported platform roles</p>
                </div>
            </div>

            <div class="setting">
                <span class="setting-label">Access Control</span>
                <span class="setting-value">Role-based</span>
            </div>

            <div class="role-list">
                <span class="role">Administrator</span>
                <span class="role">Travel Agent</span>
                <span class="role">Traveler</span>
            </div>
        </section>

    </div>

    <div class="notice">
        <strong>Note:</strong> This page displays application information.
        The status labels are informational and do not perform live database
        health checks or change server configuration.
    </div>

</main>

<footer class="footer">
    TravelGo Admin Console &bull; System Settings
</footer>

</body>
</html>


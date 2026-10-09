
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

    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | TravelGo</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --navy: #12213d;
            --muted: #64748b;
            --border: #e6ebf3;
            --background: #f5f8fd;
            --white: #ffffff;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: var(--background);
            color: var(--navy);
            min-height: 100vh;
        }

        a {
            text-decoration: none;
        }

        .navbar {
            min-height: 76px;
            padding: 15px 6%;
            background: white;
            border-bottom: 1px solid var(--border);
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 11px;
            color: var(--navy);
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.7px;
        }

        .brand-icon {
            width: 43px;
            height: 43px;
            border-radius: 13px;
            display: grid;
            place-items: center;
            background: #eaf1ff;
            color: var(--primary);
            font-size: 24px;
        }

        .brand-name span {
            color: var(--primary);
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 17px;
        }

        .admin-label {
            display: flex;
            align-items: center;
            gap: 9px;
            color: #475569;
            font-size: 13px;
            font-weight: 600;
        }

        .avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            display: grid;
            place-items: center;
            background: #e6edff;
            color: var(--primary);
            font-weight: 800;
        }

        .logout {
            padding: 10px 16px;
            border: 1px solid #fee2e2;
            border-radius: 9px;
            color: #dc2626;
            font-size: 13px;
            font-weight: 700;
            transition: 0.2s;
        }

        .logout:hover {
            background: #fef2f2;
        }

        .page {
            max-width: 1200px;
            width: 90%;
            margin: 38px auto 55px;
        }

        .breadcrumb {
            margin-bottom: 22px;
            color: var(--muted);
            font-size: 13px;
        }

        .breadcrumb span {
            color: var(--primary);
            font-weight: 700;
        }

        .welcome {
            position: relative;
            overflow: hidden;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 25px;
            padding: 36px;
            margin-bottom: 32px;
            color: white;
            border-radius: 22px;
            background: linear-gradient(120deg, #173d86, #2563eb 68%, #4f8df9);
            box-shadow: 0 12px 28px rgba(37, 99, 235, 0.15);
        }

        .welcome::after {
            content: "";
            position: absolute;
            width: 250px;
            height: 250px;
            border: 42px solid rgba(255,255,255,0.08);
            border-radius: 50%;
            right: 50px;
            top: -120px;
            pointer-events: none;
        }

        .welcome-content {
            position: relative;
            z-index: 1;
        }

        .eyebrow {
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-weight: 800;
            color: #dbeafe;
            margin-bottom: 12px;
        }

        .welcome h1 {
            font-size: clamp(27px, 4vw, 38px);
            line-height: 1.2;
            letter-spacing: -1px;
            margin-bottom: 12px;
            overflow-wrap: anywhere;
        }

        .welcome p {
            max-width: 600px;
            font-size: 14px;
            line-height: 1.8;
            color: #e4edff;
        }

        .welcome-icon {
            position: relative;
            z-index: 1;
            width: 86px;
            height: 86px;
            flex-shrink: 0;
            display: grid;
            place-items: center;
            border: 1px solid rgba(255,255,255,0.25);
            background: rgba(255,255,255,0.13);
            border-radius: 24px;
            font-size: 39px;
        }

        .section-heading {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 15px;
            margin-bottom: 21px;
        }

        .section-heading h2 {
            font-size: 23px;
            letter-spacing: -0.5px;
            margin-bottom: 7px;
        }

        .section-heading p {
            font-size: 13px;
            line-height: 1.6;
            color: var(--muted);
        }

        .section-tag {
            padding: 8px 12px;
            border-radius: 8px;
            background: #eaf1ff;
            color: var(--primary);
            font-size: 11px;
            font-weight: 800;
            white-space: nowrap;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 22px;
        }

        .card {
            position: relative;
            padding: 27px;
            border: 1px solid var(--border);
            border-radius: 18px;
            background: white;
            box-shadow: 0 5px 22px rgba(25, 49, 90, 0.035);
            transition: transform 0.2s, box-shadow 0.2s, border-color 0.2s;
        }

        .card:hover {
            transform: translateY(-4px);
            border-color: #c9d8fb;
            box-shadow: 0 13px 28px rgba(25, 49, 90, 0.08);
        }

        .card-top {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 15px;
            margin-bottom: 23px;
        }

        .card-icon {
            width: 56px;
            height: 56px;
            border-radius: 16px;
            display: grid;
            place-items: center;
            font-size: 26px;
        }

        .blue {
            color: #2563eb;
            background: #eaf1ff;
        }

        .purple {
            color: #7c3aed;
            background: #f1eaff;
        }

        .green {
            color: #059669;
            background: #e4fbf1;
        }

        .orange {
            color: #ea580c;
            background: #fff0e5;
        }

        .card-number {
            color: #94a3b8;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 1px;
        }

        .card h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .card p {
            color: var(--muted);
            font-size: 14px;
            line-height: 1.8;
            min-height: 50px;
        }

        .card-link {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            margin-top: 22px;
            padding: 12px 16px;
            background: var(--primary);
            color: white;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 700;
            transition: background 0.2s;
        }

        .card-link:hover {
            background: var(--primary-dark);
        }

        .footer {
            padding: 25px 15px;
            text-align: center;
            color: #8793a7;
            font-size: 12px;
        }

        @media (max-width: 700px) {
            .navbar {
                padding: 15px 5%;
            }

            .page {
                width: 92%;
                margin-top: 25px;
            }

            .welcome {
                padding: 26px 23px;
            }

            .welcome-icon {
                display: none;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .card {
                padding: 23px;
            }

            .section-heading {
                align-items: flex-start;
                flex-direction: column;
            }
        }

        @media (max-width: 420px) {
            .brand {
                font-size: 21px;
            }

            .nav-right {
                width: 100%;
                justify-content: space-between;
            }

            .welcome {
                padding: 23px 19px;
            }

            .card p {
                min-height: auto;
            }
        }
    </style>
</head>

<body>

<nav class="navbar">
    <a href="<%= contextPath %>/admin/dashboard.jsp" class="brand">
        <span class="brand-icon">✈</span>
        <span class="brand-name">Travel<span>Go</span></span>
    </a>

    <div class="nav-right">
        <div class="admin-label">
            <span class="avatar">A</span>
            <span>Administrator</span>
        </div>

        <a class="logout" href="<%= contextPath %>/logout">
            Logout &nbsp; ↗
        </a>
    </div>
</nav>

<main class="page">

    <div class="breadcrumb">
        Home &nbsp; / &nbsp; <span>Admin Dashboard</span>
    </div>

    <section class="welcome">
        <div class="welcome-content">
            <div class="eyebrow">TravelGo Administration</div>

            <h1>Welcome, <%= user.getName() %>! 👋</h1>

            <p>
                Manage your travel platform from one place.
                Review users, oversee travel listings, monitor bookings
                and manage your application settings.
            </p>
        </div>

        <div class="welcome-icon">⚙</div>
    </section>

    <section>
        <div class="section-heading">
            <div>
                <h2>Management Center</h2>
                <p>Choose a section to manage your TravelGo platform.</p>
            </div>

            <span class="section-tag">ADMIN ACCESS</span>
        </div>

        <div class="cards">

            <article class="card">
                <div class="card-top">
                    <div class="card-icon blue">♙</div>
                    <span class="card-number">01 / USERS</span>
                </div>

                <h3>User Management</h3>

                <p>
                    Manage travelers and travel agents and access
                    the existing user management tools.
                </p>

                <a class="card-link"
                   href="<%= contextPath %>/admin/users">
                    Manage Users <span>→</span>
                </a>
            </article>

            <article class="card">
                <div class="card-top">
                    <div class="card-icon purple">▤</div>
                    <span class="card-number">02 / LISTINGS</span>
                </div>

                <h3>Listing Approval</h3>

                <p>
                    Review flights, hotels and rental cars,
                    and access listing approval controls.
                </p>

                <a class="card-link"
                   href="<%= contextPath %>/admin/listings">
                    Manage Listings <span>→</span>
                </a>
            </article>

            <article class="card">
                <div class="card-top">
                    <div class="card-icon green">▥</div>
                    <span class="card-number">03 / BOOKINGS</span>
                </div>

                <h3>Booking Management</h3>

                <p>
                    View traveler bookings and access the existing
                    booking status management page.
                </p>

                <a class="card-link"
                   href="<%= contextPath %>/admin/bookings">
                    Manage Bookings <span>→</span>
                </a>
            </article>

            <article class="card">
                <div class="card-top">
                    <div class="card-icon orange">⚙</div>
                    <span class="card-number">04 / SETTINGS</span>
                </div>

                <h3>System Settings</h3>

                <p>
                    Open the application settings page to manage
                    the options already supported by your project.
                </p>

                <a class="card-link"
                   href="<%= contextPath %>/admin/settings.jsp">
                    Open Settings <span>→</span>
                </a>
            </article>

        </div>
    </section>

</main>

<footer class="footer">
    © TravelGo · Administration Portal
</footer>

</body>
</html>


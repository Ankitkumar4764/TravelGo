
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.travel.model.User" %>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}

if (!"TRAVEL_AGENT".equals(user.getRole())) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Travel Agent Dashboard | TravelGo</title>

<style>
* {
    box-sizing: border-box;
}

:root {
    --primary: #059669;
    --primary-dark: #047857;
    --background: #f4f7fb;
    --text: #172033;
    --muted: #64748b;
    --border: #e5eaf1;
}

body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: var(--background);
    color: var(--text);
}

.header {
    background: #101828;
    color: white;
    padding: 19px 5%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
    flex-wrap: wrap;
}

.brand {
    font-size: 25px;
    font-weight: 800;
    letter-spacing: -0.5px;
}

.brand span {
    color: #34d399;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 16px;
}

.role-label {
    font-size: 13px;
    color: #cbd5e1;
}

.logout {
    text-decoration: none;
    color: white;
    background: #dc2626;
    padding: 10px 16px;
    border-radius: 9px;
    font-size: 13px;
    font-weight: 700;
}

.logout:hover {
    background: #b91c1c;
}

.container {
    max-width: 1250px;
    margin: 0 auto;
    padding: 32px 24px 50px;
}

.welcome {
    background: linear-gradient(115deg, #065f46, #059669, #10b981);
    color: white;
    padding: 32px;
    border-radius: 18px;
    margin-bottom: 28px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    flex-wrap: wrap;
    box-shadow: 0 10px 28px rgba(5, 150, 105, 0.14);
}

.welcome h1 {
    font-size: 29px;
    margin: 0 0 10px;
}

.welcome p {
    margin: 0;
    color: #d1fae5;
    line-height: 1.7;
    font-size: 14px;
}

.welcome-badge {
    background: rgba(255,255,255,0.15);
    border: 1px solid rgba(255,255,255,0.25);
    padding: 11px 15px;
    border-radius: 30px;
    font-size: 13px;
    font-weight: 700;
}

.section-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    flex-wrap: wrap;
    margin: 30px 0 17px;
}

.section-heading h2 {
    margin: 0;
    font-size: 21px;
}

.section-heading p {
    color: var(--muted);
    margin: 6px 0 0;
    font-size: 13px;
}

.cards {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 18px;
}

.card {
    background: white;
    padding: 23px;
    border: 1px solid var(--border);
    border-radius: 15px;
    box-shadow: 0 4px 14px rgba(15, 23, 42, 0.035);
    transition: transform 0.2s, box-shadow 0.2s;
    min-width: 0;
}

.card:hover {
    transform: translateY(-3px);
    box-shadow: 0 9px 22px rgba(15, 23, 42, 0.08);
}

.card-top {
    display: flex;
    align-items: center;
    gap: 13px;
    margin-bottom: 17px;
}

.card-icon {
    height: 48px;
    width: 48px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #ecfdf5;
    border-radius: 13px;
    font-size: 23px;
    flex-shrink: 0;
}

.card h3 {
    font-size: 17px;
    margin: 0;
}

.card p {
    color: var(--muted);
    font-size: 13px;
    line-height: 1.7;
    min-height: 43px;
    margin: 0 0 18px;
}

.card-link {
    display: inline-block;
    padding: 10px 14px;
    background: var(--primary);
    color: white;
    border-radius: 8px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 700;
}

.card-link:hover {
    background: var(--primary-dark);
}

.add-section {
    margin-top: 35px;
}

.add-intro {
    margin-bottom: 20px;
}

.add-intro h2 {
    margin: 0 0 8px;
    font-size: 22px;
}

.add-intro p {
    color: var(--muted);
    font-size: 14px;
    line-height: 1.7;
    margin: 0;
}

.forms-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 20px;
}

.form-card {
    background: white;
    border: 1px solid var(--border);
    border-radius: 15px;
    padding: 25px;
    box-shadow: 0 4px 14px rgba(15, 23, 42, 0.035);
    min-width: 0;
}

.form-card h3 {
    margin: 0 0 8px;
    font-size: 19px;
}

.form-description {
    color: var(--muted);
    font-size: 13px;
    line-height: 1.6;
    margin: 0 0 22px;
}

.form-group {
    margin-bottom: 17px;
}

label {
    display: block;
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 7px;
    color: #334155;
}

input {
    display: block;
    width: 100%;
    min-width: 0;
    padding: 12px 13px;
    border: 1px solid #d7dee8;
    border-radius: 9px;
    font-family: inherit;
    font-size: 14px;
    color: var(--text);
    background: white;
    outline: none;
}

input:focus {
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.1);
}

.submit-btn {
    display: inline-block;
    width: 100%;
    padding: 13px 16px;
    border: none;
    border-radius: 9px;
    background: var(--primary);
    color: white;
    font-family: inherit;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    margin-top: 4px;
}

.submit-btn:hover {
    background: var(--primary-dark);
}

.approval-note {
    margin-top: 22px;
    padding: 17px 19px;
    background: #fffbeb;
    border: 1px solid #fde68a;
    color: #92400e;
    border-radius: 11px;
    font-size: 13px;
    line-height: 1.7;
}

.footer {
    text-align: center;
    color: #94a3b8;
    padding: 25px 15px;
    font-size: 12px;
}

@media (max-width: 900px) {
    .cards {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .forms-grid {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 580px) {
    .header {
        padding: 17px 20px;
    }

    .container {
        padding: 22px 15px 35px;
    }

    .welcome {
        padding: 23px;
    }

    .welcome h1 {
        font-size: 24px;
    }

    .cards {
        grid-template-columns: 1fr;
    }

    .card, .form-card {
        padding: 20px;
    }

    .header-right {
        width: 100%;
        justify-content: space-between;
    }
}
</style>
</head>

<body>

<header class="header">
    <div class="brand">Travel<span>Go</span></div>

    <div class="header-right">
        <span class="role-label">Travel Agent Console</span>
        <a class="logout"
           href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</header>

<main class="container">

    <section class="welcome">
        <div>
            <h1>Welcome, <%= user.getName() %>!</h1>
            <p>Manage your travel listings, track bookings and connect with travelers.</p>
        </div>

        <div class="welcome-badge">&#10003; Travel Agent</div>
    </section>

    <div class="section-heading">
        <div>
            <h2>Your Workspace</h2>
            <p>Quick access to your travel management tools.</p>
        </div>
    </div>

    <section class="cards">

        <div class="card">
            <div class="card-top">
                <div class="card-icon">&#9992;</div>
                <h3>Flight Listings</h3>
            </div>
            <p>View and manage flight listings, routes and travel details.</p>
            <a class="card-link"
               href="<%= request.getContextPath() %>/agent/listings">
                Manage Flights &#8594;
            </a>
        </div>

        <div class="card">
            <div class="card-top">
                <div class="card-icon">&#127976;</div>
                <h3>Hotel Listings</h3>
            </div>
            <p>Manage hotel listings, locations and available rooms.</p>
            <a class="card-link"
               href="<%= request.getContextPath() %>/agent/listings">
                Manage Hotels &#8594;
            </a>
        </div>

        <div class="card">
            <div class="card-top">
                <div class="card-icon">&#128663;</div>
                <h3>Rental Cars</h3>
            </div>
            <p>View and manage rental car listings and availability.</p>
            <a class="card-link"
               href="<%= request.getContextPath() %>/agent/listings">
                Manage Cars &#8594;
            </a>
        </div>

        <div class="card">
            <div class="card-top">
                <div class="card-icon">&#128203;</div>
                <h3>My Listings</h3>
            </div>
            <p>Access your flights, hotels and rental cars in one place.</p>
            <a class="card-link"
               href="<%= request.getContextPath() %>/agent/listings">
                View Listings &#8594;
            </a>
        </div>

        <div class="card">
            <div class="card-top">
                <div class="card-icon">&#128202;</div>
                <h3>Bookings</h3>
            </div>
            <p>Track traveler bookings associated with your listings.</p>
            <a class="card-link"
               href="<%= request.getContextPath() %>/agent/bookings">
                Track Bookings &#8594;
            </a>
        </div>

        <div class="card">
            <div class="card-top">
                <div class="card-icon">&#128172;</div>
                <h3>Messages</h3>
            </div>
            <p>Open the messaging page to communicate with travelers.</p>
            <a class="card-link"
               href="<%= request.getContextPath() %>/messages">
                View Messages &#8594;
            </a>
        </div>

    </section>

    <section class="add-section">

        <div class="add-intro">
            <h2>Add New Listing</h2>
            <p>Enter the details below to submit a flight, hotel or rental car.</p>
        </div>

        <div class="forms-grid">

            <!-- ADD FLIGHT -->
            <section class="form-card">
                <h3>&#9992; Add New Flight</h3>
                <p class="form-description">
                    Provide airline and journey information.
                </p>

                <form action="<%= request.getContextPath() %>/agent/add-flight"
                      method="post">

                    <div class="form-group">
                        <label for="airline">Airline</label>
                        <input id="airline" type="text" name="airline" required>
                    </div>

                    <div class="form-group">
                        <label for="origin">Origin</label>
                        <input id="origin" type="text" name="origin" required>
                    </div>

                    <div class="form-group">
                        <label for="destination">Destination</label>
                        <input id="destination" type="text" name="destination" required>
                    </div>

                    <div class="form-group">
                        <label for="travelDate">Travel Date</label>
                        <input id="travelDate" type="date" name="travelDate" required>
                    </div>

                    <div class="form-group">
                        <label for="flightPrice">Price</label>
                        <input id="flightPrice" type="number" name="price"
                               step="0.01" min="0" required>
                    </div>

                    <div class="form-group">
                        <label for="seats">Seats</label>
                        <input id="seats" type="number" name="seats"
                               min="1" required>
                    </div>

                    <button class="submit-btn" type="submit">Add Flight</button>
                </form>
            </section>

            <!-- ADD HOTEL -->
            <section class="form-card">
                <h3>&#127976; Add New Hotel</h3>
                <p class="form-description">
                    Provide the hotel location, dates and room availability.
                </p>

                <form action="<%= request.getContextPath() %>/agent/add-hotel"
                      method="post">

                    <div class="form-group">
                        <label for="hotelName">Hotel Name</label>
                        <input id="hotelName" type="text" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="hotelLocation">Location</label>
                        <input id="hotelLocation" type="text" name="location" required>
                    </div>

                    <div class="form-group">
                        <label for="checkIn">Check-in Date</label>
                        <input id="checkIn" type="date" name="checkIn" required>
                    </div>

                    <div class="form-group">
                        <label for="checkOut">Check-out Date</label>
                        <input id="checkOut" type="date" name="checkOut" required>
                    </div>

                    <div class="form-group">
                        <label for="hotelPrice">Price</label>
                        <input id="hotelPrice" type="number" name="price"
                               step="0.01" min="0" required>
                    </div>

                    <div class="form-group">
                        <label for="rooms">Rooms</label>
                        <input id="rooms" type="number" name="rooms"
                               min="1" required>
                    </div>

                    <button class="submit-btn" type="submit">Add Hotel</button>
                </form>
            </section>

            <!-- ADD CAR -->
            <section class="form-card">
                <h3>&#128663; Add New Rental Car</h3>
                <p class="form-description">
                    Provide the car name, location and availability dates.
                </p>

                <form action="<%= request.getContextPath() %>/agent/add-car"
                      method="post">

                    <div class="form-group">
                        <label for="carName">Car Name</label>
                        <input id="carName" type="text" name="carName" required>
                    </div>

                    <div class="form-group">
                        <label for="carLocation">Location</label>
                        <input id="carLocation" type="text" name="location" required>
                    </div>

                    <div class="form-group">
                        <label for="availableFrom">Available From</label>
                        <input id="availableFrom" type="date"
                               name="availableFrom" required>
                    </div>

                    <div class="form-group">
                        <label for="availableTo">Available To</label>
                        <input id="availableTo" type="date"
                               name="availableTo" required>
                    </div>

                    <div class="form-group">
                        <label for="carPrice">Price</label>
                        <input id="carPrice" type="number" name="price"
                               step="0.01" min="0" required>
                    </div>

                    <button class="submit-btn" type="submit">Add Rental Car</button>
                </form>
            </section>

        </div>

        <div class="approval-note">
            <strong>Listing approval:</strong> Your new listings are intended
            to be submitted for admin approval. Their actual approval status
            depends on the existing Java servlet and database implementation.
        </div>

    </section>

</main>

<footer class="footer">
    TravelGo &bull; Travel Agent Console
</footer>

</body>
</html>


# ✈️ TravelGo – Online Travel Booking Platform

TravelGo is a Java-based web application that allows users to explore travel services and manage their travel bookings through a simple and user-friendly interface.

## 📌 Project Overview

The platform supports three types of users: Admin, Travel Agent, and Traveler. Each role has specific features to manage travel listings, bookings, and user activities.

## ✨ Features

### 👤 Traveler

* User registration and login
* Browse available flights, hotels, and rental cars
* Book travel services
* Manage bookings and itineraries
* Send and receive messages

### 🧑‍💼 Travel Agent

* Manage flight listings
* Manage hotel listings
* Manage rental car listings
* View and manage bookings
* Communicate with travelers

### 🛡️ Admin

* Manage users and user roles
* Review and manage travel listings
* Manage bookings
* Access administrative dashboard and settings

## 🛠️ Technologies Used

* **Backend:** Java, Servlets
* **Frontend:** HTML, CSS, JSP
* **Database:** MySQL
* **Database Connectivity:** JDBC
* **Build Tool:** Apache Maven
* **Server:** Apache Tomcat 10
* **Version Control:** Git and GitHub

## 📂 Project Structure

```text
OnlineTravelBooking/
├── pom.xml
├── .gitignore
└── src/
    └── main/
        ├── java/
        │   └── com/travel/
        │       ├── dao/
        │       ├── interfaces/
        │       ├── model/
        │       ├── service/
        │       ├── servlet/
        │       └── util/
        └── webapp/
            ├── admin/
            ├── agent/
            ├── traveler/
            ├── WEB-INF/
            ├── index.jsp
            ├── login.jsp
            ├── register.jsp
            └── messages.jsp
```

## ⚙️ Prerequisites

Install the following software before running the project:

* Java JDK
* Apache Maven
* MySQL Server
* Apache Tomcat 10

## 🚀 Setup and Installation

### 1. Clone the Repository

```bash
git clone https://github.com/Ankitkumar4764/TravelGo.git
cd TravelGo
```

### 2. Configure the Database

1. Start MySQL Server.
2. Create the database named `travel_booking`.
3. Configure your database connection settings in `DBConnection.java` as required by your local environment.

**Security note:** Do not publish database passwords or other credentials in a public repository.

### 3. Build the Project

Run the following command from the project root:

```bash
mvn clean package
```

The WAR file will be generated inside the `target/` directory.

### 4. Run Using Apache Tomcat

1. Copy the generated WAR file into Tomcat's `webapps` directory.
2. Start the Tomcat server.
3. Open the application in your browser:

```text
http://localhost:8080/OnlineTravelBooking/
```

The exact URL may depend on the deployed WAR filename and Tomcat configuration.

## 🔐 User Roles

| Role         | Responsibilities                           |
| ------------ | ------------------------------------------ |
| Admin        | User management and listing administration |
| Travel Agent | Travel listing and booking management      |
| Traveler     | Browse services and manage travel bookings |

## 🎯 Project Objective

The main objective of TravelGo is to provide a centralized platform for managing travel services and simplifying the booking process for travelers, travel agents, and administrators.

## 🔮 Future Improvements

* Online payment integration
* Email booking confirmations
* Live flight and hotel availability
* Enhanced search and filtering
* Cloud deployment

## 👨‍💻 Developer

**Ankit Kumar**

GitHub: [@Ankitkumar4764](https://github.com/Ankitkumar4764)

---

*TravelGo — Plan your journey, your way!*

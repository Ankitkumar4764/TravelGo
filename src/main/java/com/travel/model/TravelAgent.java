package com.travel.model;

public class TravelAgent extends User {

    public TravelAgent() {
        super();
        setRole("TRAVEL_AGENT");
    }

    public TravelAgent(int id, String name, String email,
                       String password, String status) {

        super(id, name, email, password, "TRAVEL_AGENT", status);
    }

    public void manageListings() {
        System.out.println("Travel Agent is managing travel listings.");
    }

    public void trackBookings() {
        System.out.println("Travel Agent is tracking bookings.");
    }
}
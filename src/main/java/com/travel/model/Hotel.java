package com.travel.model;

import com.travel.interfaces.Bookable;

public class Hotel implements Bookable {

    private int id;
    private String name;
    private String location;
    private String checkIn;
    private String checkOut;
    private double price;
    private int rooms;
    private String status;

    public Hotel() {
    }

    public Hotel(String name, String location,
                 String checkIn, String checkOut,
                 double price, int rooms) {

        this.name = name;
        this.location = location;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.price = price;
        this.rooms = rooms;
        this.status = "PENDING";
    }

    @Override
    public double calculatePrice() {
        return price;
    }

    @Override
    public String getBookingDetails() {
        return name + " | " + location
                + " | " + checkIn + " to " + checkOut;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
    this.id = id;
}

    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }

    public String getCheckIn() {
    return checkIn;
    }

    public String getCheckOut() {
    return checkOut;
    }

    public double getPrice() {
        return price;
    }

    public int getRooms() {
        return rooms;
    }

    public String getStatus() {
        return status;
    }
}
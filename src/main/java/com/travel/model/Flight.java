package com.travel.model;

import com.travel.interfaces.Bookable;

public class Flight implements Bookable {

    private int id;
    private String airline;
    private String origin;
    private String destination;
    private String travelDate;
    private double price;
    private int seats;
    private String status;

    public Flight() {
    }

    public Flight(String airline, String origin,
                  String destination, String travelDate,
                  double price, int seats) {

        this.airline = airline;
        this.origin = origin;
        this.destination = destination;
        this.travelDate = travelDate;
        this.price = price;
        this.seats = seats;
        this.status = "PENDING";
    }

    // Constructor for database records
    public Flight(int id, String airline, String origin,
                  String destination, String travelDate,
                  double price, int seats, String status) {

        this.id = id;
        this.airline = airline;
        this.origin = origin;
        this.destination = destination;
        this.travelDate = travelDate;
        this.price = price;
        this.seats = seats;
        this.status = status;
    }

    @Override
    public double calculatePrice() {
        return price;
    }

    @Override
    public String getBookingDetails() {
        return airline + " : " + origin + " -> "
                + destination + " | " + travelDate;
    }

    public int getId() {
        return id;
    }

    public String getAirline() {
        return airline;
    }

    public String getOrigin() {
        return origin;
    }

    public String getDestination() {
        return destination;
    }

    public String getTravelDate() {
        return travelDate;
    }

    public double getPrice() {
        return price;
    }

    public int getSeats() {
        return seats;
    }

    public String getStatus() {
        return status;
    }
}
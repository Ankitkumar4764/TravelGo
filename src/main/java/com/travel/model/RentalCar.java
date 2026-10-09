package com.travel.model;

import com.travel.interfaces.Bookable;

public class RentalCar implements Bookable {

    private int id;
    private String carName;
    private String location;
    private String availableFrom;
    private String availableTo;
    private double price;
    private String status;

    public RentalCar() {
    }

    public RentalCar(String carName, String location,
                     String availableFrom, String availableTo,
                     double price) {

        this.carName = carName;
        this.location = location;
        this.availableFrom = availableFrom;
        this.availableTo = availableTo;
        this.price = price;
        this.status = "PENDING";
    }
    public RentalCar(int id, String carName, String location,
                 String availableFrom, String availableTo,
                 double price, String status) {

    this.id = id;
    this.carName = carName;
    this.location = location;
    this.availableFrom = availableFrom;
    this.availableTo = availableTo;
    this.price = price;
    this.status = status;
}

    @Override
    public double calculatePrice() {
        return price;
    }

    @Override
    public String getBookingDetails() {
        return carName + " | " + location
                + " | " + availableFrom + " to " + availableTo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarName() {
        return carName;
    }

    public String getLocation() {
        return location;
    }

    public String getAvailableFrom() {
        return availableFrom;
    }

    public String getAvailableTo() {
        return availableTo;
    }

    public double getPrice() {
        return price;
    }

    public String getStatus() {
        return status;
    }
}
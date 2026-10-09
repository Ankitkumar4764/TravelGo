package com.travel.model;

public class Booking {

    private int id;
    private int userId;
    private String listingType;
    private int listingId;
    private String bookingDate;
    private String status;
    private double totalPrice;

    public Booking() {
    }

    public Booking(int userId, String listingType,
                   int listingId, double totalPrice) {
        this.userId = userId;
        this.listingType = listingType;
        this.listingId = listingId;
        this.totalPrice = totalPrice;
        this.status = "CONFIRMED";
    }

    public Booking(int id, int userId, String listingType,
                   int listingId, String bookingDate,
                   String status, double totalPrice) {

        this.id = id;
        this.userId = userId;
        this.listingType = listingType;
        this.listingId = listingId;
        this.bookingDate = bookingDate;
        this.status = status;
        this.totalPrice = totalPrice;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public String getListingType() {
        return listingType;
    }

    public int getListingId() {
        return listingId;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public String getStatus() {
        return status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
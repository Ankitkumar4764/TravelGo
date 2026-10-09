package com.travel.model;

public class Itinerary {

    private int id;
    private int userId;
    private int bookingId;
    private String travelDate;
    private String description;

    public Itinerary() {
    }

    public Itinerary(int userId, int bookingId,
                     String travelDate, String description) {
        this.userId = userId;
        this.bookingId = bookingId;
        this.travelDate = travelDate;
        this.description = description;
    }

    public Itinerary(int id, int userId, int bookingId,
                     String travelDate, String description) {
        this.id = id;
        this.userId = userId;
        this.bookingId = bookingId;
        this.travelDate = travelDate;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public String getTravelDate() {
        return travelDate;
    }

    public String getDescription() {
        return description;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public void setTravelDate(String travelDate) {
        this.travelDate = travelDate;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
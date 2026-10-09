package com.travel.model;

public class Traveler extends User {

    public Traveler() {
        super();
        setRole("TRAVELER");
    }

    public Traveler(int id, String name, String email,
                    String password, String status) {

        super(id, name, email, password, "TRAVELER", status);
    }

    public void bookTravel() {
        System.out.println("Traveler can book flights, hotels and cars.");
    }
}
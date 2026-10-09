package com.travel.model;

public class Admin extends User {

    public Admin() {
        super();
        setRole("ADMIN");
    }

    public Admin(int id, String name, String email,
                 String password, String status) {

        super(id, name, email, password, "ADMIN", status);
    }

    public void manageUsers() {
        System.out.println("Admin is managing users.");
    }

    public void manageListings() {
        System.out.println("Admin is managing travel listings.");
    }
}
package com.travel.util;

import com.travel.dao.UserDAO;
import com.travel.model.User;

public class TestUserDAO {

    public static void main(String[] args) {

        UserDAO userDAO = new UserDAO();

        // Test user
        User user = new User(
                "Test Traveler",
                "testtraveler@gmail.com",
                "test123",
                "TRAVELER"
        );

        // Register
        boolean registered = userDAO.registerUser(user);

        if (registered) {
            System.out.println("User Registered Successfully!");
        } else {
            System.out.println("User Registration Failed!");
        }

        // Login
        User loggedInUser =
                userDAO.loginUser(
                        "testtraveler@gmail.com",
                        "test123"
                );

        if (loggedInUser != null) {
            System.out.println("Login Successful!");
            System.out.println("Welcome, " + loggedInUser.getName());
            System.out.println("Role: " + loggedInUser.getRole());
        } else {
            System.out.println("Login Failed!");
        }
    }
}
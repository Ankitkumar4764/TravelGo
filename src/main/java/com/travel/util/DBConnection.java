package com.travel.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/travel_booking";

    private static final String USER = "root";

    private static final String PASSWORD = "Ankit@0022";
    
    public static Connection getConnection() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found!", e);
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void main(String[] args) {

        try {
            Connection connection = getConnection();

            System.out.println("Database Connected Successfully!");

            connection.close();

        } catch (SQLException e) {

            System.out.println("Database Connection Failed!");

            e.printStackTrace();
        }
    }
}
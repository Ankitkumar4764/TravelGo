package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travel.model.Flight;
import com.travel.util.DBConnection;

public class FlightDAO {

    // Add a new flight
    public boolean addFlight(Flight flight, int agentId) {

        String sql = "INSERT INTO flights " +
                "(agent_id, airline, origin, destination, travel_date, price, seats, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, 'PENDING')";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, agentId);
            ps.setString(2, flight.getAirline());
            ps.setString(3, flight.getOrigin());
            ps.setString(4, flight.getDestination());
            ps.setString(5, flight.getTravelDate());
            ps.setDouble(6, flight.getPrice());
            ps.setInt(7, flight.getSeats());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all approved flights
    public List<Flight> getApprovedFlights() {

        List<Flight> flights = new ArrayList<>();

        String sql = "SELECT * FROM flights WHERE status = 'APPROVED'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Flight flight = new Flight(
                        rs.getInt("id"),
                        rs.getString("airline"),
                        rs.getString("origin"),
                        rs.getString("destination"),
                        rs.getString("travel_date"),
                        rs.getDouble("price"),
                        rs.getInt("seats"),
                        rs.getString("status")
                );

                flights.add(flight);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flights;
    }
}
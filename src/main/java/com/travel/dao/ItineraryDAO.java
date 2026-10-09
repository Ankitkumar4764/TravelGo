package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.travel.model.Itinerary;
import com.travel.util.DBConnection;

public class ItineraryDAO {

    public boolean createItinerary(Itinerary itinerary) {

        String sql = "INSERT INTO itineraries " +
                     "(user_id, booking_id, travel_date, description) " +
                     "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, itinerary.getUserId());
            ps.setInt(2, itinerary.getBookingId());
            ps.setString(3, itinerary.getTravelDate());
            ps.setString(4, itinerary.getDescription());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Itinerary> getItinerariesByUser(int userId) {

        List<Itinerary> itineraries = new ArrayList<>();

        String sql = "SELECT * FROM itineraries " +
                     "WHERE user_id = ? " +
                     "ORDER BY travel_date";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Itinerary itinerary = new Itinerary(
                            rs.getInt("id"),
                            rs.getInt("user_id"),
                            rs.getInt("booking_id"),
                            rs.getString("travel_date"),
                            rs.getString("description")
                    );

                    itineraries.add(itinerary);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return itineraries;
    }
}
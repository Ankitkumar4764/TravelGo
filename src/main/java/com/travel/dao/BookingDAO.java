package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travel.model.Booking;
import com.travel.util.DBConnection;

public class BookingDAO {

    public boolean createBooking(Booking booking) {

        String sql = "INSERT INTO bookings " +
                "(user_id, listing_type, listing_id, total_price, status) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, booking.getUserId());
            ps.setString(2, booking.getListingType());
            ps.setInt(3, booking.getListingId());
            ps.setDouble(4, booking.getTotalPrice());
            ps.setString(5, booking.getStatus());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getBookingsByUser(int userId) {

    List<Booking> bookings = new ArrayList<>();

    String sql = "SELECT * FROM bookings " +
                 "WHERE user_id = ? ORDER BY booking_date DESC";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userId);

        try (ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("listing_type"),
                        rs.getInt("listing_id"),
                        rs.getString("booking_date"),
                        rs.getString("status"),
                        rs.getDouble("total_price")
                );

                bookings.add(booking);
            }
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return bookings;
}
public List<Booking> getAllBookings() {

    List<Booking> bookings = new ArrayList<>();

    String sql = "SELECT * FROM bookings " +
                 "ORDER BY booking_date DESC";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {

            Booking booking = new Booking(
                    rs.getInt("id"),
                    rs.getInt("user_id"),
                    rs.getString("listing_type"),
                    rs.getInt("listing_id"),
                    rs.getString("booking_date"),
                    rs.getString("status"),
                    rs.getDouble("total_price")
            );

            bookings.add(booking);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return bookings;
}
}
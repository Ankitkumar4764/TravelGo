package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travel.model.Hotel;
import com.travel.util.DBConnection;

public class HotelDAO {

    public boolean addHotel(Hotel hotel, int agentId) {

        String sql = "INSERT INTO hotels " +
                "(agent_id, name, location, check_in, check_out, price, rooms, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, 'PENDING')";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, agentId);
            ps.setString(2, hotel.getName());
            ps.setString(3, hotel.getLocation());
            ps.setString(4, hotel.getCheckIn());
            ps.setString(5, hotel.getCheckOut());
            ps.setDouble(6, hotel.getPrice());
            ps.setInt(7, hotel.getRooms());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Hotel> getApprovedHotels() {

        List<Hotel> hotels = new ArrayList<>();

        String sql = "SELECT * FROM hotels WHERE status = 'APPROVED'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Hotel hotel = new Hotel(
                        rs.getString("name"),
                        rs.getString("location"),
                        rs.getString("check_in"),
                        rs.getString("check_out"),
                        rs.getDouble("price"),
                        rs.getInt("rooms")
                );

                hotel.setId(rs.getInt("id"));

                hotels.add(hotel);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hotels;
    }
}
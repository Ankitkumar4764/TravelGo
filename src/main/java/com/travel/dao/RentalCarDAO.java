package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.travel.model.RentalCar;
import com.travel.util.DBConnection;

public class RentalCarDAO {

    public boolean addRentalCar(RentalCar car, int agentId) {

        String sql = "INSERT INTO rental_cars " +
                "(agent_id, car_name, location, available_from, " +
                "available_to, price, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, 'PENDING')";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, agentId);
            ps.setString(2, car.getCarName());
            ps.setString(3, car.getLocation());
            ps.setString(4, car.getAvailableFrom());
            ps.setString(5, car.getAvailableTo());
            ps.setDouble(6, car.getPrice());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<RentalCar> getApprovedCars() {

        List<RentalCar> cars = new ArrayList<>();

        String sql = "SELECT * FROM rental_cars " +
                     "WHERE status = 'APPROVED'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
RentalCar car = new RentalCar(
        rs.getInt("id"),
        rs.getString("car_name"),
        rs.getString("location"),
        rs.getString("available_from"),
        rs.getString("available_to"),
        rs.getDouble("price"),
        rs.getString("status")
);

                cars.add(car);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cars;
    }
}

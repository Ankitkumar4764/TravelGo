package com.travel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.travel.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/agent/listings")
public class AgentListingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            !"TRAVEL_AGENT".equals(session.getAttribute("role"))) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        int agentId =
                (Integer) session.getAttribute("userId");

        List<String[]> listings = new ArrayList<>();

        String sql =
                "SELECT id, airline AS name, origin AS location, " +
                "destination AS details, price, status, " +
                "'FLIGHT' AS type " +
                "FROM flights WHERE agent_id = ? " +

                "UNION ALL " +

                "SELECT id, name, location, " +
                "CONCAT(check_in, ' to ', check_out), " +
                "price, status, 'HOTEL' " +
                "FROM hotels WHERE agent_id = ? " +

                "UNION ALL " +

                "SELECT id, car_name, location, " +
                "CONCAT(available_from, ' to ', available_to), " +
                "price, status, 'CAR' " +
                "FROM rental_cars WHERE agent_id = ? " +

                "ORDER BY type, id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setInt(1, agentId);
            ps.setInt(2, agentId);
            ps.setInt(3, agentId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    String[] listing = {
                        String.valueOf(rs.getInt("id")),
                        rs.getString("type"),
                        rs.getString("name"),
                        rs.getString("location"),
                        rs.getString("details"),
                        String.valueOf(rs.getDouble("price")),
                        rs.getString("status")
                    };

                    listings.add(listing);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("listings", listings);

        request.getRequestDispatcher(
                "/agent/listings.jsp")
                .forward(request, response);
    }
}
package com.travel.servlet;

import com.travel.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/admin/listing-action")
public class AdminListingActionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            !"ADMIN".equals(session.getAttribute("role"))) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        String type = request.getParameter("type");
        String idParameter = request.getParameter("id");
        String action = request.getParameter("action");

        if (type == null || idParameter == null || action == null) {
            response.sendRedirect(
                    request.getContextPath() + "/admin/listings");
            return;
        }

        int id;

        try {
            id = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            response.sendRedirect(
                    request.getContextPath() + "/admin/listings");
            return;
        }

        String tableName;

        if ("FLIGHT".equals(type)) {
            tableName = "flights";
        } else if ("HOTEL".equals(type)) {
            tableName = "hotels";
        } else if ("CAR".equals(type)) {
            tableName = "rental_cars";
        } else {
            response.sendRedirect(
                    request.getContextPath() + "/admin/listings");
            return;
        }

        String status;

        if ("APPROVE".equals(action)) {
            status = "APPROVED";
        } else if ("REJECT".equals(action)) {
            status = "REJECTED";
        } else {
            response.sendRedirect(
                    request.getContextPath() + "/admin/listings");
            return;
        }

        String sql = "UPDATE " + tableName +
                     " SET status = ? WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(
                request.getContextPath() + "/admin/listings");
    }
}
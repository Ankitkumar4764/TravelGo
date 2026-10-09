package com.travel.servlet;

import java.io.IOException;
import java.util.List;

import com.travel.dao.BookingDAO;
import com.travel.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/bookings")
public class AdminBookingServlet extends HttpServlet {

    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            !"ADMIN".equals(session.getAttribute("role"))) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        List<Booking> bookings =
                bookingDAO.getAllBookings();

        request.setAttribute("bookings", bookings);

        request.getRequestDispatcher(
                "/admin/bookings.jsp")
                .forward(request, response);
    }
}
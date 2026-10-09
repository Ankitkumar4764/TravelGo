package com.travel.servlet;

import java.io.IOException;
import java.util.List;

import com.travel.dao.BookingDAO;
import com.travel.dao.HotelDAO;
import com.travel.model.Booking;
import com.travel.model.Hotel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/book-hotel")
public class BookHotelServlet extends HttpServlet {

    private final HotelDAO hotelDAO = new HotelDAO();
    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        // Get hotel ID
        String idParameter = request.getParameter("id");

        if (idParameter == null) {

            response.sendRedirect(
                    request.getContextPath() + "/hotels");

            return;
        }

        int hotelId;

        try {
            hotelId = Integer.parseInt(idParameter);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath() + "/hotels");

            return;
        }

        // Find selected hotel
        List<Hotel> hotels = hotelDAO.getApprovedHotels();

        Hotel selectedHotel = null;

        for (Hotel hotel : hotels) {

            if (hotel.getId() == hotelId) {
                selectedHotel = hotel;
                break;
            }
        }

        // Hotel not found
        if (selectedHotel == null) {

            response.sendRedirect(
                    request.getContextPath() + "/hotels");

            return;
        }

        // Get logged-in user
        int userId = (Integer) session.getAttribute("userId");

        // Create booking
        Booking booking = new Booking(
                userId,
                "HOTEL",
                selectedHotel.getId(),
                selectedHotel.getPrice()
        );

        boolean booked = bookingDAO.createBooking(booking);

        if (booked) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/traveler/bookings.jsp?success=true");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/traveler/hotels.jsp?error=true");
        }
    }
}
package com.travel.servlet;

import com.travel.dao.BookingDAO;
import com.travel.dao.FlightDAO;
import com.travel.model.Booking;
import com.travel.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/book-flight")
public class BookFlightServlet extends HttpServlet {

    private final FlightDAO flightDAO = new FlightDAO();
    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        String idParameter = request.getParameter("id");

        if (idParameter == null) {
            response.sendRedirect(
                    request.getContextPath() + "/flights");
            return;
        }

        int flightId;

        try {
            flightId = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            response.sendRedirect(
                    request.getContextPath() + "/flights");
            return;
        }

        List<Flight> flights = flightDAO.getApprovedFlights();

        Flight selectedFlight = null;

        for (Flight flight : flights) {

            if (flight.getId() == flightId) {
                selectedFlight = flight;
                break;
            }
        }

        if (selectedFlight == null) {
            response.sendRedirect(
                    request.getContextPath() + "/flights");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        Booking booking = new Booking(
                userId,
                "FLIGHT",
                selectedFlight.getId(),
                selectedFlight.getPrice()
        );

        boolean booked = bookingDAO.createBooking(booking);

        if (booked) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/traveler/bookings.jsp?success=true");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/traveler/flights.jsp?error=true");
        }
    }
}
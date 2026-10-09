package com.travel.servlet;

import java.io.IOException;
import java.util.List;

import com.travel.dao.BookingDAO;
import com.travel.dao.RentalCarDAO;
import com.travel.model.Booking;
import com.travel.model.RentalCar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/book-car")
public class BookCarServlet extends HttpServlet {

    private final RentalCarDAO rentalCarDAO = new RentalCarDAO();
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
                    request.getContextPath() + "/cars");
            return;
        }

        int carId;

        try {
            carId = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            response.sendRedirect(
                    request.getContextPath() + "/cars");
            return;
        }

        List<RentalCar> cars = rentalCarDAO.getApprovedCars();

        RentalCar selectedCar = null;

        for (RentalCar car : cars) {

            if (car.getId() == carId) {
                selectedCar = car;
                break;
            }
        }

        if (selectedCar == null) {
            response.sendRedirect(
                    request.getContextPath() + "/cars");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        Booking booking = new Booking(
                userId,
                "CAR",
                selectedCar.getId(),
                selectedCar.getPrice()
        );

        boolean booked = bookingDAO.createBooking(booking);

        if (booked) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/traveler/bookings.jsp?success=true");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/traveler/cars.jsp?error=true");
        }
    }
}
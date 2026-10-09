package com.travel.servlet;

import java.io.IOException;

import com.travel.dao.ItineraryDAO;
import com.travel.model.Itinerary;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/create-itinerary")
public class CreateItineraryServlet extends HttpServlet {

    private final ItineraryDAO itineraryDAO =
            new ItineraryDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        int userId =
                (Integer) session.getAttribute("userId");

        String bookingIdParameter =
                request.getParameter("bookingId");

        String travelDate =
                request.getParameter("travelDate");

        String description =
                request.getParameter("description");

        int bookingId;

        try {

            bookingId =
                    Integer.parseInt(bookingIdParameter);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/itinerary?error=true");

            return;
        }

        Itinerary itinerary = new Itinerary(
                userId,
                bookingId,
                travelDate,
                description
        );

        boolean created =
                itineraryDAO.createItinerary(itinerary);

        if (created) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/itinerary?success=true");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/itinerary?error=true");
        }
    }
}
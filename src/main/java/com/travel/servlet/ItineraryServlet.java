package com.travel.servlet;

import java.io.IOException;
import java.util.List;

import com.travel.dao.ItineraryDAO;
import com.travel.model.Itinerary;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/itinerary")
public class ItineraryServlet extends HttpServlet {

    private final ItineraryDAO itineraryDAO = new ItineraryDAO();

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

        int userId =
                (Integer) session.getAttribute("userId");

        List<Itinerary> itineraries =
                itineraryDAO.getItinerariesByUser(userId);

        request.setAttribute("itineraries", itineraries);

        request.getRequestDispatcher(
                "/traveler/itinerary.jsp")
                .forward(request, response);
    }
}
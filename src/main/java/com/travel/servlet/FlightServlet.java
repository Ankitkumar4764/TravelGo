package com.travel.servlet;

import java.io.IOException;
import java.util.List;

import com.travel.dao.FlightDAO;
import com.travel.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/flights")
public class FlightServlet extends HttpServlet {

    private final FlightDAO flightDAO = new FlightDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Flight> flights = flightDAO.getApprovedFlights();

        request.setAttribute("flights", flights);

        request.getRequestDispatcher("/traveler/flights.jsp")
                .forward(request, response);
    }
}
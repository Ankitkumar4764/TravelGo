package com.travel.servlet;

import java.io.IOException;

import com.travel.dao.FlightDAO;
import com.travel.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/agent/add-flight")
public class AgentFlightServlet extends HttpServlet {

    private final FlightDAO flightDAO = new FlightDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        int agentId = (Integer) session.getAttribute("userId");

        String airline = request.getParameter("airline");
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String travelDate = request.getParameter("travelDate");
        double price = Double.parseDouble(request.getParameter("price"));
        int seats = Integer.parseInt(request.getParameter("seats"));

        Flight flight = new Flight(
                airline,
                origin,
                destination,
                travelDate,
                price,
                seats
        );

        boolean added = flightDAO.addFlight(flight, agentId);

        if (added) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/agent/dashboard.jsp?success=flight");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/agent/dashboard.jsp?error=flight");
        }
    }
}
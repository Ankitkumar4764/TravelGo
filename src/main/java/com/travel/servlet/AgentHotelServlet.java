package com.travel.servlet;

import java.io.IOException;

import com.travel.dao.HotelDAO;
import com.travel.model.Hotel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/agent/add-hotel")
public class AgentHotelServlet extends HttpServlet {

    private final HotelDAO hotelDAO = new HotelDAO();

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

        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        double price = Double.parseDouble(request.getParameter("price"));
        int rooms = Integer.parseInt(request.getParameter("rooms"));

        Hotel hotel = new Hotel(
                name,
                location,
                checkIn,
                checkOut,
                price,
                rooms
        );

        boolean added = hotelDAO.addHotel(hotel, agentId);

        if (added) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/agent/dashboard.jsp?success=hotel");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/agent/dashboard.jsp?error=hotel");
        }
    }
}

package com.travel.servlet;

import java.io.IOException;
import java.util.List;

import com.travel.dao.HotelDAO;
import com.travel.model.Hotel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hotels")
public class HotelServlet extends HttpServlet {

    private final HotelDAO hotelDAO = new HotelDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Hotel> hotels = hotelDAO.getApprovedHotels();

        request.setAttribute("hotels", hotels);

        request.getRequestDispatcher("/traveler/hotels.jsp")
                .forward(request, response);
    }
}
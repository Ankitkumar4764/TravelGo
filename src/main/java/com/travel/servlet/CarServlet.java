package com.travel.servlet;

import java.io.IOException;
import java.util.List;

import com.travel.dao.RentalCarDAO;
import com.travel.model.RentalCar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cars")
public class CarServlet extends HttpServlet {

    private final RentalCarDAO rentalCarDAO = new RentalCarDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<RentalCar> cars = rentalCarDAO.getApprovedCars();

        request.setAttribute("cars", cars);

        request.getRequestDispatcher("/traveler/cars.jsp")
                .forward(request, response);
    }
}
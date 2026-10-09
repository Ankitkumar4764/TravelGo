package com.travel.servlet;

import java.io.IOException;

import com.travel.dao.RentalCarDAO;
import com.travel.model.RentalCar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/agent/add-car")
public class AgentCarServlet extends HttpServlet {

    private final RentalCarDAO rentalCarDAO = new RentalCarDAO();

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

        String carName = request.getParameter("carName");
        String location = request.getParameter("location");
        String availableFrom = request.getParameter("availableFrom");
        String availableTo = request.getParameter("availableTo");
        double price = Double.parseDouble(request.getParameter("price"));

        RentalCar car = new RentalCar(
                carName,
                location,
                availableFrom,
                availableTo,
                price
        );

        boolean added = rentalCarDAO.addRentalCar(car, agentId);

        if (added) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/agent/dashboard.jsp?success=car");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/agent/dashboard.jsp?error=car");
        }
    }
}
package com.travel.servlet;

import com.travel.dao.UserDAO;
import com.travel.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("role", user.getRole());

            if ("ADMIN".equals(user.getRole())) {

                response.sendRedirect("admin/dashboard.jsp");

            } else if ("TRAVEL_AGENT".equals(user.getRole())) {

                response.sendRedirect("agent/dashboard.jsp");

            } else {

                response.sendRedirect("traveler/dashboard.jsp");
            }

        } else {

            response.sendRedirect("login.jsp?error=true");
        }
    }
}
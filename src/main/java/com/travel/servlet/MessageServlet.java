package com.travel.servlet;

import java.io.IOException;
import java.util.List;

import com.travel.dao.MessageDAO;
import com.travel.model.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/messages")
public class MessageServlet extends HttpServlet {

    private final MessageDAO messageDAO = new MessageDAO();

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

        List<Message> messages =
                messageDAO.getMessagesForUser(userId);

        request.setAttribute("messages", messages);

        request.getRequestDispatcher(
                "/messages.jsp")
                .forward(request, response);
    }

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

        int senderId =
                (Integer) session.getAttribute("userId");

        String receiverParameter =
                request.getParameter("receiverId");

        String messageText =
                request.getParameter("message");

        int receiverId;

        try {

            receiverId =
                    Integer.parseInt(receiverParameter);

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/messages?error=true");

            return;
        }

        if (messageText == null ||
            messageText.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/messages?error=true");

            return;
        }

        Message message = new Message(
                senderId,
                receiverId,
                messageText.trim()
        );

        boolean sent =
                messageDAO.sendMessage(message);

        if (sent) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/messages?success=true");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/messages?error=true");
        }
    }
}

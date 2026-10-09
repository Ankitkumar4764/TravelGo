package com.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.travel.model.Message;
import com.travel.util.DBConnection;

public class MessageDAO {

    public boolean sendMessage(Message message) {

        String sql = "INSERT INTO messages " +
                     "(sender_id, receiver_id, message) " +
                     "VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, message.getSenderId());
            ps.setInt(2, message.getReceiverId());
            ps.setString(3, message.getMessage());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Message> getConversation(int user1, int user2) {

        List<Message> messages = new ArrayList<>();

        String sql = "SELECT * FROM messages " +
                     "WHERE (sender_id = ? AND receiver_id = ?) " +
                     "OR (sender_id = ? AND receiver_id = ?) " +
                     "ORDER BY created_at ASC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, user1);
            ps.setInt(2, user2);
            ps.setInt(3, user2);
            ps.setInt(4, user1);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Message message = new Message(
                            rs.getInt("id"),
                            rs.getInt("sender_id"),
                            rs.getInt("receiver_id"),
                            rs.getString("message"),
                            rs.getString("created_at")
                    );

                    messages.add(message);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return messages;
    }

    public List<Message> getMessagesForUser(int userId) {

        List<Message> messages = new ArrayList<>();

        String sql = "SELECT * FROM messages " +
                     "WHERE sender_id = ? OR receiver_id = ? " +
                     "ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, userId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Message message = new Message(
                            rs.getInt("id"),
                            rs.getInt("sender_id"),
                            rs.getInt("receiver_id"),
                            rs.getString("message"),
                            rs.getString("created_at")
                    );

                    messages.add(message);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return messages;
    }
}
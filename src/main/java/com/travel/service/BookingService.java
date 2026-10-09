package com.travel.service;

import com.travel.model.Booking;
import com.travel.model.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookingService {

    // Collection: stores all bookings
    private final List<Booking> bookings = new ArrayList<>();

    // Collection: stores users using user ID
    private final Map<Integer, User> users = new HashMap<>();

    // Generic Repository
    private final Repository<Booking> bookingRepository =
            new Repository<>();

    public void addUser(User user) {
        users.put(user.getId(), user);
    }

    public void addBooking(Booking booking) {
        bookings.add(booking);
        bookingRepository.add(booking);
    }

    public List<Booking> getAllBookings() {
        return new ArrayList<>(bookings);
    }

    public User getUser(int userId) {
        return users.get(userId);
    }

    public int getBookingCount() {
        return bookings.size();
    }

    public void cancelBooking(int bookingIndex) {

        if (bookingIndex >= 0 && bookingIndex < bookings.size()) {
            bookings.get(bookingIndex).setStatus("CANCELLED");
        }
    }
}
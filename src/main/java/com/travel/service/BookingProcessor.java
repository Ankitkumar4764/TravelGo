package com.travel.service;

public class BookingProcessor implements Runnable {

    private static int processedBookings = 0;

    private final String bookingName;

    public BookingProcessor(String bookingName) {
        this.bookingName = bookingName;
    }

    @Override
    public void run() {

        processBooking(bookingName);

    }

    public static synchronized void processBooking(
            String bookingName) {

        processedBookings++;

        System.out.println(
                Thread.currentThread().getName()
                + " processing: "
                + bookingName
                + " | Total processed: "
                + processedBookings
        );

        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public static int getProcessedBookings() {
        return processedBookings;
    }
}

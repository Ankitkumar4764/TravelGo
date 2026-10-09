package com.travel.service;

public class BookingProcessorTest {

    public static void main(String[] args) {

        Thread t1 = new Thread(
                new BookingProcessor("Flight Booking"),
                "Thread-1"
        );

        Thread t2 = new Thread(
                new BookingProcessor("Hotel Booking"),
                "Thread-2"
        );

        Thread t3 = new Thread(
                new BookingProcessor("Car Booking"),
                "Thread-3"
        );

        t1.start();
        t2.start();
        t3.start();

        try {
            t1.join();
            t2.join();
            t3.join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        System.out.println(
                "Total bookings processed: "
                + BookingProcessor.getProcessedBookings()
        );
    }
}
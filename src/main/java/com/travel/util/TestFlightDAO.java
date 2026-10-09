package com.travel.util;

import com.travel.dao.FlightDAO;
import com.travel.model.Flight;

import java.util.List;

public class TestFlightDAO {

    public static void main(String[] args) {

        FlightDAO flightDAO = new FlightDAO();

        List<Flight> flights = flightDAO.getApprovedFlights();

        System.out.println("Number of approved flights: " + flights.size());

        for (Flight flight : flights) {

            System.out.println("-----------------------------");
            System.out.println("Airline: " + flight.getAirline());
            System.out.println("From: " + flight.getOrigin());
            System.out.println("To: " + flight.getDestination());
            System.out.println("Date: " + flight.getTravelDate());
            System.out.println("Price: " + flight.getPrice());
            System.out.println("Seats: " + flight.getSeats());
        }
    }
}
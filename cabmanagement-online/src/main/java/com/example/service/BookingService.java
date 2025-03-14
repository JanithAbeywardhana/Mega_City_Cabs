package com.example.service;

import java.util.List;

import com.example.dao.BookingDAO;
import com.example.dao.customerDAO;
import com.example.model.Booking;

public class BookingService {

	private BookingDAO bookingDao = new BookingDAO();
	private customerDAO custdao = new customerDAO();
	
	 public boolean createBooking(Booking booking) {
		
		    String customerName = custdao.getCustomerNameById(booking.getCustomerId());
		    booking.setCustomerName(customerName);

		    
		    return bookingDao.addBooking(booking);
	    }
	 
	 
	 public double calculateFare(double distanceKm, String vehicleType) {
	        double ratePerKm;
	        switch (vehicleType) {
	            case "4-passenger":
	                ratePerKm = 100;
	                break;
	            case "8-passenger":
	                ratePerKm = 200;
	                break;
	            case "14-passenger":
	                ratePerKm = 400;
	                break;
	            default:
	                ratePerKm = 0;
	        }
	        return distanceKm * ratePerKm;
	    }
	 
	 
	 public double calculateDriverEarnings(int driverId) {
	        List<Booking> bookings = BookingDAO.getBookingsByDriverId(driverId);
	        double totalFare = 0;
	        for (Booking booking : bookings) {
	            // Optionally, consider only bookings with a specific status (e.g., "Paid")
	            if ("Paid".equalsIgnoreCase(booking.getBookingStatus())) {
	                totalFare += booking.getFare();
	            }
	        }
	        return totalFare * 0.10;  // Driver earns 10% of total fare
	    }
	 
	 
	 
	 public List<Booking> getBookingsByCustomerId(int customerId) {
		    return BookingDAO.getBookingsByCustomerId(customerId);
		}
	 
	 
	 public boolean assignDriverToBooking(int bookingId, int driverId, String newStatus) {
		    return BookingDAO.assignDriverToBooking(bookingId, driverId, newStatus);
		}
	 
	 public Booking getBookingById(int bookingId) {
		    return BookingDAO.getBookingById(bookingId);
		}
	 
	 public List<Booking> getAllBookings() {
	        return BookingDAO.getAllBookings();
	    }
	 
	 public boolean updateBookingStatus(int bookingId, String status) {
	        return BookingDAO.updateBookingStatus(bookingId, status);
	    }
	 
	 
	 public List<Booking> getBookingsByDriverId(int driverId) {
		    return BookingDAO.getBookingsByDriverId(driverId);
		}

}

package com.example.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Booking;

public class BookingDAO {

	public static boolean addBooking(Booking booking) {
		String query = "INSERT INTO bookings (customer_id, pickup_location, drop_location, distance_km, vehicle_type, fare, booking_date, payment_status, booking_time, passenger_count, luggage_count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = DBConnectionFactory.getConnection();
	        PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)){
			stmt.setInt(1, booking.getCustomerId());
            stmt.setString(2, booking.getPickupLocation());
            stmt.setString(3, booking.getDropLocation());
            stmt.setDouble(4, booking.getDistanceKm());
            stmt.setString(5, booking.getVehicleType());
            stmt.setDouble(6, booking.getFare());
            stmt.setDate(7, Date.valueOf(booking.getBookingDate()));
            stmt.setString(8, booking.getPaymentStatus());
            stmt.setTimestamp(9, booking.getBookingTime());
            stmt.setInt(10, booking.getPassengerCount());
            stmt.setInt(11, booking.getLuggageCount());

			
            
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                // Retrieve the generated key
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    int bookingId = rs.getInt(1);
                    booking.setBookingId(bookingId);
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}
	
	
	public static boolean updatePaymentStatus(int bookingId, String status) {
	    String query = "UPDATE bookings SET payment_status = ? WHERE booking_id = ?";
	    try (Connection conn = DBConnectionFactory.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {

	        stmt.setString(1, status);
	        stmt.setInt(2, bookingId);

	        int rowsUpdated = stmt.executeUpdate();
	        return rowsUpdated > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	
	
	public static List<Booking> getBookingsByCustomerId(int customerId) {
	    List<Booking> bookings = new ArrayList<>();
	    String query = "SELECT * FROM bookings WHERE customer_id = ?";
	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(query)) {
	        stmt.setInt(1, customerId);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Booking booking = new Booking(
	                rs.getInt("booking_id"),
	                rs.getInt("customer_id"),
	                 
	                rs.getString("pickup_location"),
	                rs.getString("drop_location"),
	                rs.getDouble("distance_km"),
	                rs.getString("vehicle_type"),
	                rs.getDouble("fare"),
	                rs.getDate("booking_date").toLocalDate(),
	                rs.getTimestamp("booking_time"),
	                rs.getString("payment_status"),
	                rs.getInt("passenger_count"),
	                rs.getInt("luggage_count"),
	                rs.getString("booking_status")
	            );
	            bookings.add(booking);
	        }
	        System.out.println("Bookings retrieved for customer " + customerId + ": " + bookings.size());
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return bookings;
	}
	
	
	public static boolean assignDriverToBooking(int bookingId, int driverId, String newStatus) {
	    
	    String query = "UPDATE bookings SET driver_id = ?, booking_status = ? WHERE booking_id = ?";
	    try (Connection conn = DBConnectionFactory.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {
	        stmt.setInt(1, driverId);
	        stmt.setString(2, newStatus);
	        stmt.setInt(3, bookingId);
	        int rowsUpdated = stmt.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public static Booking getBookingById(int bookingId) {
	    String query = "SELECT * FROM bookings WHERE booking_id = ?";
	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(query)) {
	         
	         stmt.setInt(1, bookingId);
	         ResultSet rs = stmt.executeQuery();
	         
	         if (rs.next()) {
	            
	             Booking booking = new Booking(
	                 rs.getInt("booking_id"),
	                 rs.getInt("customer_id"),
	                  
	                 rs.getString("pickup_location"),
	                 rs.getString("drop_location"),
	                 rs.getDouble("distance_km"),
	                 rs.getString("vehicle_type"),
	                 rs.getDouble("fare"),
	                 rs.getDate("booking_date").toLocalDate(),
	                 rs.getTimestamp("booking_time"),
	                 rs.getString("payment_status"),
	                 rs.getInt("passenger_count"),
	                 rs.getInt("luggage_count"),
	                 rs.getString("booking_status")
	                 
	             );
	             return booking;
	         }
	    } catch (SQLException e) {
	         e.printStackTrace();
	    }
	    return null;
	}
	
	
	public static List<Booking> getAllBookings() {
	    List<Booking> bookings = new ArrayList<>();
	    String query = "SELECT * FROM bookings";
	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(query)) {
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Booking booking = new Booking(
	            		rs.getInt("booking_id"),
		                 rs.getInt("customer_id"),
		                   
		                 rs.getString("pickup_location"),
		                 rs.getString("drop_location"),
		                 rs.getDouble("distance_km"),
		                 rs.getString("vehicle_type"),
		                 rs.getDouble("fare"),
		                 rs.getDate("booking_date").toLocalDate(),
		                 rs.getTimestamp("booking_time"),
		                 rs.getString("payment_status"),
		                 rs.getInt("passenger_count"),
		                 rs.getInt("luggage_count"),
		                 rs.getString("booking_status")
	            );
	            
	            bookings.add(booking);
	        }
	        System.out.println("Total bookings retrieved: " + bookings.size());
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return bookings;
	}
	
	
	public static boolean updateBookingStatus(int bookingId, String status) {
	    String query = "UPDATE bookings SET booking_status = ? WHERE booking_id = ?";
	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(query)) {
	        
	        stmt.setString(1, status);
	        stmt.setInt(2, bookingId); 
	        
	        int rowsUpdated = stmt.executeUpdate();
	        
	        return rowsUpdated > 0; 
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	
	
	public static List<Booking> getBookingsByDriverId(int driverId) {
	    List<Booking> bookings = new ArrayList<>();
	    String query = "SELECT * FROM bookings WHERE driver_id = ?";
	    try (Connection connection = DBConnectionFactory.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(query)) {
	        stmt.setInt(1, driverId);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Booking booking = new Booking(
	                rs.getInt("booking_id"),
	                rs.getInt("customer_id"),
	                
	                rs.getString("pickup_location"),
	                rs.getString("drop_location"),
	                rs.getDouble("distance_km"),
	                rs.getString("vehicle_type"),
	                rs.getDouble("fare"),
	                rs.getDate("booking_date").toLocalDate(),
	                rs.getTimestamp("booking_time"),
	                rs.getString("payment_status"),
	                rs.getInt("passenger_count"),
	                rs.getInt("luggage_count"),
	                rs.getString("booking_status") 
	            );
	            bookings.add(booking);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return bookings;
	}
	
	
	public static boolean confirmBooking(int bookingId, String paymentMethod, String newStatus) {
	    String query = "UPDATE bookings SET payment_status = ?, booking_status = ? WHERE booking_id = ?";
	    try (Connection conn = DBConnectionFactory.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {

	        stmt.setString(1, paymentMethod);
	        stmt.setString(2, newStatus);
	        stmt.setInt(3, bookingId);

	        int rowsUpdated = stmt.executeUpdate();
	        System.out.println("Rows updated: " + rowsUpdated);

	       
	        if (rowsUpdated == 0) {
	            Booking existing = getBookingById(bookingId);
	            if (existing != null) {
	                System.out.println("Existing payment_status: " + existing.getPaymentStatus());
	                System.out.println("Existing booking_status: " + existing.getBookingStatus());
	                if (paymentMethod.equals(existing.getPaymentStatus()) && newStatus.equals(existing.getBookingStatus())) {
	                    return true;
	                }
	            }
	        }
	        return rowsUpdated > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	}






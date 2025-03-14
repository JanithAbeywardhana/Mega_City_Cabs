package com.example.model;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Booking {
	
	
	private int bookingId;
    private int customerId;
    private String customerName; 
    private String pickupLocation;
    private String dropLocation;
    private double distanceKm;
    private String vehicleType;
    private double fare;
    private LocalDate bookingDate; 
    private Timestamp bookingTime;
    private String paymentStatus;
    private int passengerCount;
	private int luggageCount;
	private String bookingStatus;

	public Booking(int bookingId, int customerId,String pickupLocation, String dropLocation, double distanceKm, String vehicleType, double fare, LocalDate bookingDate, Timestamp bookingTime, String paymentStatus, int passengerCount, int luggageCount, String bookingStatus) {
		this.bookingId = bookingId;
		this.customerId = customerId;
		
		this.pickupLocation = pickupLocation;
		this.dropLocation = dropLocation;
		this.distanceKm = distanceKm;
		this.vehicleType = vehicleType;
		this.fare = fare;
		this.bookingDate = bookingDate;
		this.bookingTime = bookingTime;
		this.paymentStatus =  paymentStatus;
		this.passengerCount = passengerCount;
		this.luggageCount = luggageCount;
		this.bookingStatus = bookingStatus;
				
		
	}
	
	
	public Booking() {
		
	}
	

	public String getBookingStatus() {
		return bookingStatus;
	}


	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}


	public int getPassengerCount() {
		return passengerCount;
	}

	public void setPassengerCount(int passengerCount) {
		this.passengerCount = passengerCount;
	}

	public int getLuggageCount() {
		return luggageCount;
	}

	public void setLuggageCount(int luggageCount) {
		this.luggageCount = luggageCount;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}





	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getPickupLocation() {
		return pickupLocation;
	}

	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}

	public String getDropLocation() {
		return dropLocation;
	}

	public void setDropLocation(String dropLocation) {
		this.dropLocation = dropLocation;
	}

	public double getDistanceKm() {
		return distanceKm;
	}

	public void setDistanceKm(double distanceKm) {
		this.distanceKm = distanceKm;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public double getFare() {
		return fare;
	}

	public void setFare(double fare) {
		this.fare = fare;
	}

	public LocalDate getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(LocalDate bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Timestamp getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(Timestamp bookingTime) {
		this.bookingTime = bookingTime;
	}
	
	
	

}

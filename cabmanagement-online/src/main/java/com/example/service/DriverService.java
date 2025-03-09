package com.example.service;

import java.util.List;

import com.example.dao.DriverDAO;
import com.example.model.Driver;

public class DriverService {
	
	private static DriverService instance;
	private DriverDAO driverDAO;

	public DriverService() {
		this.driverDAO = new DriverDAO();
	}
	
	
	public static DriverService getInstance() {
		if(instance == null) {
			synchronized (DriverService.class) {
				if(instance == null)
					instance = new DriverService();
			}
		}
		return instance;
	}
	
	public boolean registerDriver(Driver driver) {
		if(driver.getName() == null || driver.getName().isEmpty()) {
			throw new IllegalArgumentException("Name cannot be empty");
		}
		if(driver.getEmail() == null || driver.getEmail().isEmpty()) {
			throw new IllegalArgumentException("Emial cannot be empty");
		}
		if(!driver.getEmail().contains("@")) {
			throw new IllegalArgumentException("Email must contain the '@' symbol");
		}
		
		if(driver.getAddress() == null || driver.getAddress().isEmpty()) {
			throw new IllegalArgumentException("Address cannot be empty");
		}
		if(driver.getPassword() == null || driver.getPassword().isEmpty()) {
			throw new IllegalArgumentException("Password cannot be empty");
		}
		
		String password = driver.getPassword();
	    String passwordChar = "^(?=.*[A-Za-z])(?=.*[!@#$%^&*]).{8,}$";
	    if(!password.matches(passwordChar)) {
	    	throw new IllegalArgumentException("Password must be at least 8 characters long, contain at least one letter, and one symbol.");
	    }
	    
	    Driver existingDriver = driverDAO.getDriverByEmail(driver.getEmail());
	    if(existingDriver !=null) {
	    	throw new IllegalArgumentException("Email is already rregisterd to the System.");
	    }
		return false;
	    
	}
	    
	    
	    public boolean registerDriver(Driver driver, int[] generatedId) {
	    
	    boolean isRegisterd = DriverDAO.addDriver(driver, generatedId);
	    if(!isRegisterd) {
	    	System.err.println("Failed to register as driver");
	    }else {
	    	 int driverId = generatedId[0];
	    	 System.out.println("Driver registered successfully with ID: " + driverId);
	    }
	    return isRegisterd;
	    
	    
	}
	
	
	public Driver authenticateDriver(String email, String password) {
		if(email == null || email.isEmpty()) {
			throw new IllegalArgumentException("Email cannot be empty");
		}
		if(password == null || password.isEmpty()) {
			throw new IllegalArgumentException("password cannot be empty");
		}
		
		Driver driver = DriverDAO.getDriverByEmail(email);
		if(driver == null) {
			throw new IllegalArgumentException("Email not found");
		}
		
		if(!driver.getPassword().equals(password)) {
			throw new IllegalArgumentException("Invalid Password");
		}
		
		return driver;
	}
	
	
	 public List<Driver> getAllDrivers() {
	        return DriverDAO.getAllDrivers();
	    }

}

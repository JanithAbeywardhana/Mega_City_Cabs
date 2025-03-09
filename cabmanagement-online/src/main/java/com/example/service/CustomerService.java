package com.example.service;



import java.sql.SQLException;
import java.util.List;

import com.example.dao.customerDAO;
import com.example.model.Customer;


public class CustomerService {
	
	private static  CustomerService instance;
	private customerDAO customerdao;

	public CustomerService() {
		this.customerdao = new customerDAO();
	}
	
	
	public static CustomerService getInstance() {
		if(instance == null) {
			synchronized (CustomerService.class) {
				if(instance == null) {
					instance = new CustomerService();
				}
			}
		}
		return instance;
	}
	
	
	
	
	
	public boolean registerCustomer(Customer customer) {
		if (customer.getName() == null || customer.getName().isEmpty()){
			throw new IllegalArgumentException("Name Cannot be empty");
		}
		if (customer.getEmail() == null || customer.getEmail().isEmpty()){
			throw new IllegalArgumentException("Email Cannot be empty");
		}
		if (! customer.getEmail().contains("@")) {
			throw new IllegalArgumentException("Email must contain the '@' symbol");
		}
		if(customer.getPassword() == null || customer.getPassword().isEmpty()) {
			throw new IllegalArgumentException("Password Section Cannot be empty");
		}
	    if(customer.getAddress() == null || customer.getAddress().isEmpty()) {
	    	throw new IllegalArgumentException("Address Section cannot be empty");
	    	
	    }
	    if(customer.getPhone_number() == null || customer.getPhone_number().isEmpty()) {
	    	throw new IllegalArgumentException("Phone  number cannot be empty");
	    }
	    
	    if(customer.getNic() == null || customer.getNic().isEmpty()) {
	    	throw new IllegalArgumentException("NIC Section cannot be empty");
	    }
	    
	    String password = customer.getPassword();
	    String passwordChar = "^(?=.*[A-Za-z])(?=.*[!@#$%^&*]).{8,}$";
	    if(!password.matches(passwordChar)) {
	    	throw new IllegalArgumentException("Password must be at least 8 characters long, contain at least one letter, and one symbol.");
	    }
	    
	    
	    Customer existingCustomer = customerdao.getCustomerByEmail(customer.getEmail());
	    if(existingCustomer !=null) {
	    	throw new IllegalArgumentException("Email is already Registerd to the System.");
	    }
		
	    
	    boolean isRegistered = customerDAO.addCustomer(customer);
	    if (!isRegistered) {
	        System.err.println("Failed to register customer in the database."); 
	    }
	    return isRegistered;
	}
	
	
	//Login method
	public Customer authenticateCustomer(String email, String password) {
		if(email == null || email.isEmpty()) {
			throw new IllegalArgumentException("Email cannot be empty");
		}
		if(password == null || password.isEmpty()) {
			throw new IllegalArgumentException("password cannot be empty");
		}
		
		Customer customer = customerDAO.getCustomerByEmail(email);
	    if (customer == null) {
	        throw new IllegalArgumentException("Email not found");
	    }

	    
	    if (!customer.getPassword().equals(password)) {
	        throw new IllegalArgumentException("Invalid password");
	    }

	    return customer;
	}
	
	
	public List<Customer> getAllCustomers() throws SQLException{
        return customerDAO.getAllCustomers();
    }
    
    public boolean deleteCustomer(int customerId) {
        return customerDAO.deleteCustomer(customerId);
    }
    
    
    public Customer getCustomerById(int customerId) {
        return customerDAO.getCustomerById(customerId);
    }
    
    public boolean updateCustomerProfile(Customer customer) {
        
        return customerDAO.updateCustomer(customer);
    }


	

	
	

}

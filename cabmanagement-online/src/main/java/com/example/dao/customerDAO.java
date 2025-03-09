package com.example.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Customer;

public class customerDAO {
	
	
	
	public customerDAO() {
		
	}
	
	
	
		public static boolean addCustomer(Customer customer) {
			
			String query ="INSERT INTO customers (name, email, password, address, phone_number, nic) VALUES (?, ?, ?, ?, ?, ?)";
			
			try 
			{ 
				Connection connection = DBConnectionFactory.getConnection();
				PreparedStatement statement = connection.prepareStatement(query);
				statement.setString(1, customer.getName());
				statement.setString(2, customer.getEmail());
				statement.setString(3, customer.getPassword());
				statement.setString(4, customer.getAddress());                statement.setString(5, customer.getPhone_number());
				statement.setString(6, customer.getNic());
				
				System.out.println("Customer added successfully");
				int rowsInserted = statement.executeUpdate();
				return  rowsInserted >0;				
				
			}catch (SQLException e)
			{
				e.printStackTrace();
			}
			return false;
        }
		
		
		
		
		
		public static Customer getCustomerByEmail(String email) {
			String query = "SELECT * FROM customers WHERE email = ?";
			try(Connection connection = DBConnectionFactory.getConnection();
					PreparedStatement statement = connection.prepareStatement(query)){
				
				statement.setString(1, email);
				ResultSet rset = statement.executeQuery();
				
				
				if(rset.next()) {
					
					return new Customer(
							rset.getInt("customer_id"),
							rset.getString("name"),
							rset.getString("email"),
							rset.getString("password"),
							rset.getString("address"),
							rset.getString("phone_number"),
							rset.getString("nic")
							);
					}
				} catch(SQLException e) {
				e.printStackTrace();
			}
			return null;
	}
		
		
		public String getCustomerNameById(int customerId) {
		    String query = "SELECT name FROM customers WHERE customer_id = ?";
		    try (Connection conn = DBConnectionFactory.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(query)) {

		        stmt.setInt(1, customerId);
		        ResultSet rs = stmt.executeQuery();

		        if (rs.next()) {
		            return rs.getString("name");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return null;
		}
		
		
		public static List<Customer> getAllCustomers() {
		    List<Customer> customers = new ArrayList<>();
		    String query = "SELECT * FROM customers";
		    try (Connection connection = DBConnectionFactory.getConnection();
		         PreparedStatement stmt = connection.prepareStatement(query)) {
		        
		       
		        System.out.println("Executing query: " + query);
		        
		        ResultSet rs = stmt.executeQuery();
		        while (rs.next()) {
		            Customer customer = new Customer(
		                rs.getInt("customer_id"),
		                rs.getString("name"),
		                rs.getString("email"),
		                rs.getString("password"),
		                rs.getString("address"),
		                rs.getString("phone_number"),
		                rs.getString("nic")
		            );
		            customers.add(customer);
		        }
		        
		       
		        System.out.println("Customers retrieved from DB: " + customers.size());
		    } catch (SQLException e) {
		        
		        System.err.println("Error retrieving customers: " + e.getMessage());
		        e.printStackTrace();
		    }
		    return customers;
		}
		
		
		public static boolean deleteCustomer(int customerId) {
	        String query = "DELETE FROM customers WHERE customer_id = ?";
	        try (Connection connection = DBConnectionFactory.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setInt(1, customerId);
	            int rowsDeleted = stmt.executeUpdate();
	            return rowsDeleted > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
		
		
		
		
		public static Customer getCustomerById(int customerId) {
		    String query = "SELECT * FROM customers WHERE customer_id = ?";
		    try (Connection connection = DBConnectionFactory.getConnection();
		         PreparedStatement stmt = connection.prepareStatement(query)) {
		        stmt.setInt(1, customerId);
		        ResultSet rs = stmt.executeQuery();
		        if (rs.next()) {
		            return new Customer(
		                rs.getInt("customer_id"),
		                rs.getString("name"),
		                rs.getString("email"),
		                rs.getString("password"),
		                rs.getString("address"),
		                rs.getString("phone_number"),
		                rs.getString("nic")
		            );
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return null;
		}
		
		
		public static boolean updateCustomer(Customer customer) {
		    String query = "UPDATE customers SET name = ?, email = ?, password = ?, address = ?, phone_number = ?, nic = ? WHERE customer_id = ?";
		    try (Connection connection = DBConnectionFactory.getConnection();
		         PreparedStatement stmt = connection.prepareStatement(query)) {
		        stmt.setString(1, customer.getName());
		        stmt.setString(2, customer.getEmail());
		        stmt.setString(3, customer.getPassword());
		        stmt.setString(4, customer.getAddress());
		        stmt.setString(5, customer.getPhone_number());
		        stmt.setString(6, customer.getNic());
		        stmt.setInt(7, customer.getCustomer_id());
		        int rowsUpdated = stmt.executeUpdate();
		        return rowsUpdated > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;
		}


		
		
		
}
		




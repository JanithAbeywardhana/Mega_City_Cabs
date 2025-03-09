package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Driver;

public class DriverDAO {

	

	public DriverDAO() {
		
	}	
	public static boolean  addDriver (Driver driver, int[] generatedId) {
		String query ="INSERT INTO drivers (name, email, license_number, address, password, ride_time, gender) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection connection = DBConnectionFactory.getConnection();
			PreparedStatement statement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
			statement.setString(1, driver.getName());
			statement.setString(2, driver.getEmail());
			statement.setString(3, driver.getLicense_number());
			statement.setString(4, driver.getAddress());
			statement.setString(5, driver.getPassword());
			statement.setString(6, driver.getRide_time());
			statement.setString(7, driver.getGender());
			
			int rowsInserted = statement.executeUpdate();
			if (rowsInserted > 0) {
				
	            ResultSet rs = statement.getGeneratedKeys();
	            if (rs.next()) {
	            	generatedId[0] = rs.getInt(1);
	            	return true; 
			}
	            
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		generatedId[0] = -1; 
	    return false;
	}
		
		public static Driver getDriverByEmail(String email) {
			String query = "SELECT * FROM drivers WHERE email = ?";
			try(Connection connection = DBConnectionFactory.getConnection();
					PreparedStatement statement = connection.prepareStatement(query)){
				statement.setString(1, email);
				ResultSet rset = statement.executeQuery();
				
				if(rset.next()) {
					
					return new Driver(
							rset.getInt("driver_id"),
							rset.getString("name"),
							rset.getString("email"),
							rset.getString("license_number"),
							rset.getString("address"),
							rset.getString("password"),
							rset.getString("ride_time"),
							rset.getString("gender"),
							rset.getString("profile_pic")
							);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		
		public static List<Driver> getAllDrivers() {
		    List<Driver> drivers = new ArrayList<>();
		    String query = "SELECT * FROM drivers";
		    try (Connection connection = DBConnectionFactory.getConnection();
		         PreparedStatement statement = connection.prepareStatement(query)) {
		         
		         ResultSet rs = statement.executeQuery();
		         while (rs.next()) {
		             Driver driver = new Driver(
		                 rs.getInt("driver_id"),
		                 rs.getString("name"),
		                 rs.getString("email"),
		                 rs.getString("license_number"),
		                 rs.getString("address"),
		                 rs.getString("password"),
		                 rs.getString("ride_time"),
		                 rs.getString("gender"),
		                 rs.getString("profile_pic")
		             );
		             drivers.add(driver);
		         }
		    } catch (SQLException e) {
		         e.printStackTrace();
		    }
		    return drivers;
		}
		
		
		
		public static boolean updateDriverProfile(Driver driver) {
		    String query = "UPDATE drivers SET name=?, license_number=?, address=?, password=?, ride_time=?, gender=? WHERE driver_id=?";
		    
		    try (Connection connection = DBConnectionFactory.getConnection();
		         PreparedStatement statement = connection.prepareStatement(query)) {
		         
		        statement.setString(1, driver.getName());
		        statement.setString(2, driver.getLicense_number());
		        statement.setString(3, driver.getAddress());
		        statement.setString(4, driver.getPassword());
		        statement.setString(5, driver.getRide_time());
		        statement.setString(6, driver.getGender());
		        statement.setInt(7, driver.getDriver_id());

		        int rowsUpdated = statement.executeUpdate();
		        return rowsUpdated > 0;

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;
		}
		
		
		public static boolean updateDriverProfilePicture(int driverId, String profilePicPath) {
	        String query = "UPDATE drivers SET profile_pic = ? WHERE driver_id = ?";
	        try (Connection connection = DBConnectionFactory.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, profilePicPath);
	            stmt.setInt(2, driverId);
	            int rowsUpdated = stmt.executeUpdate();
	            return rowsUpdated > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
		
		
		
		public static boolean deleteDriver(int driverId) {
		    String query = "DELETE FROM drivers WHERE driver_id = ?";
		    try (Connection connection = DBConnectionFactory.getConnection();
		         PreparedStatement stmt = connection.prepareStatement(query)) {
		        stmt.setInt(1, driverId);
		        int rowsDeleted = stmt.executeUpdate();
		        return rowsDeleted > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return false;
		}
	}



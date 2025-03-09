package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.model.Admin;

public class AdminDAO {
	
	
	public static Admin authenticate(String username, String password) {
		Admin admin = null;
		String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
		try {
			Connection connection = DBConnectionFactory.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			
			statement.setString(1, username);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                admin = new Admin(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
	
	}
	




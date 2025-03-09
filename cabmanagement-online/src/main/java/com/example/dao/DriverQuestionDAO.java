package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.example.model.DriverQuestion;

public class DriverQuestionDAO {

	public DriverQuestionDAO() {
		
	}
	
	public static  boolean addDriverQuestion(DriverQuestion driverQuestion) {
		String query = "INSERT INTO driverquestion (first_question, second_question, third_question, forth_question, fifth_question, driver_id) VALUES (?, ?, ?, ?, ?, ?)";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = DBConnectionFactory.getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, driverQuestion.getFirst_question());
            statement.setString(2, driverQuestion.getSecond_question());
            statement.setString(3, driverQuestion.getThird_question());
            statement.setString(4, driverQuestion.getForth_question());
            statement.setString(5, driverQuestion.getFifth_question());
            statement.setInt(6, driverQuestion.getDriver_id());
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                return true; 
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return false; 
    }

}

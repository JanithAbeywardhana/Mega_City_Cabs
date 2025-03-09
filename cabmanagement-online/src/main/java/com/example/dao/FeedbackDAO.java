package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.model.Feedback;

public class FeedbackDAO {

	public static boolean addFeedback(Feedback feedback) {
        String query = "INSERT INTO feedback (email, subject, message) VALUES (?, ?, ?)";
        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
             
            stmt.setString(1, feedback.getEmail());
            stmt.setString(2, feedback.getSubject());
            stmt.setString(3, feedback.getMessage());
            
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    feedback.setFeedbackId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	
	
	public static List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        String query = "SELECT * FROM feedback ORDER BY created_at DESC";
        try (Connection conn = DBConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
             
            while (rs.next()) {
                Feedback feedback = new Feedback(
                    rs.getInt("feedback_id"),
                    rs.getString("email"),
                    rs.getString("subject"),
                    rs.getString("message"),
                    rs.getTimestamp("created_at")
                );
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

}

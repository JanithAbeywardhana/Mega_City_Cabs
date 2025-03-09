package com.example.service;

import com.example.dao.FeedbackDAO;
import com.example.model.Feedback;

public class FeedbackService {
	private static FeedbackService instance;
	private FeedbackDAO feedbackdao;

	public FeedbackService() {
		this.feedbackdao = new FeedbackDAO();
	}
	
	public static FeedbackService getInstnace() {
		if(instance == null) {
			synchronized(FeedbackService.class) {
				if(instance == null) {
					instance = new FeedbackService();
				}
			}
		}
		return instance;
	}
	
	
	
	public boolean submitFeedback(Feedback feedback) {
        
        if (feedback.getEmail() == null || feedback.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be empty");
        }
        if (feedback.getSubject() == null || feedback.getSubject().trim().isEmpty()) {
            throw new IllegalArgumentException("Subject cannot be empty");
        }
        if (feedback.getMessage() == null || feedback.getMessage().trim().isEmpty()) {
            throw new IllegalArgumentException("Message cannot be empty");
        }
        return FeedbackDAO.addFeedback(feedback);
    }

}

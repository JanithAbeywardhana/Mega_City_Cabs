package com.example.model;

import java.sql.Timestamp;

public class Feedback {
	
	
	 private int feedbackId;
	    private String email;
	    private String subject;
	    private String message;
	    private Timestamp createdAt;

	public Feedback() {
		
	}
	
	public Feedback(int feedbackId, String email, String subject, String message, Timestamp createdAt) {
        this.feedbackId = feedbackId;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.createdAt = createdAt;
    }

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
	
	

}

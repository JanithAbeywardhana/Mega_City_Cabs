package com.example.service;

import com.example.dao.DriverQuestionDAO;
import com.example.model.DriverQuestion;

public class DriverQuestionService {
	private static DriverQuestionService instance;
	private DriverQuestionDAO driverQuestionDAO;

	public DriverQuestionService() {
		this.driverQuestionDAO = new DriverQuestionDAO();
	}
	
	public static DriverQuestionService getInstance() {
		if(instance ==  null) {
			synchronized (DriverQuestionService.class) {
				if(instance == null) {
					instance = new DriverQuestionService();
				}
			}
		}
		return instance;
	}
	
	public boolean addDriverQuestion(DriverQuestion driverQuestion) {
		try {
            boolean isAdded = DriverQuestionDAO.addDriverQuestion(driverQuestion);
            if (isAdded) {
                System.out.println("Driver questions added successfully.");
                return true;
            } else {
                System.err.println("Failed to add driver questions.");
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return false;
        
	}

}

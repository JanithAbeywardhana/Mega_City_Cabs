package com.example.model;

public class DriverQuestion {
	
	private int question_id;
	private String first_question;
	private String second_question;
	private String third_question;
	private String forth_question;
	private String fifth_question;
	private int driver_id;
	

	public DriverQuestion(int question_id, String first_question, String second_question, String third_question, String forth_question, String fifth_question, int driver_id ) {
		this.question_id = question_id;
		this.first_question = first_question;
		this.second_question = second_question;
		this.third_question = third_question;
		this.forth_question = forth_question;
		this.fifth_question = fifth_question;
		this.driver_id = driver_id;
	}


	public DriverQuestion() {
		// TODO Auto-generated constructor stub
	}


	public int getQuestion_id() {
		return question_id;
	}


	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}


	public String getFirst_question() {
		return first_question;
	}


	public void setFirst_question(String first_question) {
		this.first_question = first_question;
	}


	public String getSecond_question() {
		return second_question;
	}


	public void setSecond_question(String second_question) {
		this.second_question = second_question;
	}


	public String getThird_question() {
		return third_question;
	}


	public void setThird_question(String third_question) {
		this.third_question = third_question;
	}


	public String getForth_question() {
		return forth_question;
	}


	public void setForth_question(String forth_question) {
		this.forth_question = forth_question;
	}


	public String getFifth_question() {
		return fifth_question;
	}


	public void setFifth_question(String fifth_question) {
		this.fifth_question = fifth_question;
	}


	public int getDriver_id() {
		return driver_id;
	}


	public void setDriver_id(int driver_id) {
		this.driver_id = driver_id;
	}
	
	
	

}

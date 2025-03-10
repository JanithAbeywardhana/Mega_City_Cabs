package com.example.model;

public class Driver {
	
	private int driver_id;
	private String name;
	private String email;
	private String license_number;
	private String address;
	private String password;
	private String ride_time;
	private String gender;
	private String profilePic;

	public Driver(int driver_id, String name, String email, String license_number, String address, String password, String ride_time,String gender, String profilePic) {
		this.driver_id = driver_id;
		this.name = name;
		this.email = email;
		this.license_number = license_number;
		this.address = address;
		this.password = password;
		this.ride_time = ride_time;
		this.gender = gender;
		this.profilePic = profilePic;
		
	}
	
	public Driver() {
	    // Default constructor
	}
	
	

	public String getProfilePic() {
		return profilePic;
	}



	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}



	public int getDriver_id() {
		return driver_id;
	}

	public void setDriver_id(int driver_id) {
		this.driver_id = driver_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLicense_number() {
		return license_number;
	}

	public void setLicense_number(String license_number) {
		this.license_number = license_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRide_time() {
		return ride_time;
	}

	public void setRide_time(String ride_time) {
		this.ride_time = ride_time;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

	
	
	

}

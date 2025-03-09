package com.example.model;

public class Customer {
	
	private int customer_id;
	private String name;
	private String email;
	private String password;
	private String address;
	private String phone_number;
	private String nic;

	public Customer(int customer_id, String name, String email, String password, String address, String phone_number, String nic) {
		this.customer_id = customer_id;
		this.name = name;
		this.email =  email;
		this.password = password;
		this.address = address;
		this.phone_number = phone_number;
		this.nic = nic;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	
	
	
	
	
}	

	
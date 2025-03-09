package com.example.service;

import com.example.dao.AdminDAO;
import com.example.model.Admin;

public class AdminService {

	public Admin login(String username, String password) {
		return AdminDAO.authenticate(username, password);
	}
}

package com.example.dao;

import java.sql.Connection;

public class DBConnectionFactory {

   public static Connection getConnection(){
	   Connection connection = DBConnection.getInstance().getConnection();  
	   
	   return connection;
   }
}

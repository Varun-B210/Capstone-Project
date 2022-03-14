package com;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	
	private String dbUrl="jdbc:mysql://localhost:3306/foodbox";
	private String dbUname="root";
	private String dbPassword="#0210mysql";
	private String dbDriver="com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver){
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		
		Connection con=null;
		try {
			con=DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return con;
	}
	
	public boolean validate(LoginBean lb) {
		loadDriver(dbDriver);
		Connection con=getConnection();
		boolean status=false;
		String qry="select * from userdetails where email = ? and pswd = ?";
		PreparedStatement ps;
		try {
			ps=con.prepareStatement(qry);
			ps.setString(1, lb.getEmail());
			ps.setString(2, lb.getPswd());
			
			ResultSet rs=ps.executeQuery();
			
		status=rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	
}

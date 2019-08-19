package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCon {
	public static  Connection getConnection() {
		Connection con=null;
	//	if(con==null) {
			try {
				
			//	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			//	con= DriverManager.getConnection("jdbc:mysql://localhost:8889/questionbank", "root", "root");
				 Context initContext  = new InitialContext();
		         Context envContext  = (Context)initContext.lookup("java:/comp/env");
		         DataSource dataSource = (DataSource)envContext.lookup("jdbc/qbmysql");
		         con= dataSource.getConnection(); 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	//	}
		return con;
	}

}

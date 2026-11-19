package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConn {

	private static Connection conn;
	
	public static Connection getConn() throws ClassNotFoundException, SQLException {
		
		if(conn == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/ENotes";
			String username = System.getenv("DB_USERNAME");
            String password = System.getenv("DB_PASSWORD");

            if (username == null || password == null) {
                throw new IllegalStateException(
                    "Database environment variables are not configured."
                );
            }

            conn = DriverManager.getConnection(
                url, username, password
            );
		}
		
		return conn;
	}
}

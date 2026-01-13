package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.User;

public class UserDao {

	private Connection conn;
	private String query;
	private PreparedStatement ps, ps1, ps2, ps3;
	private ResultSet rs, rs1;

	public UserDao(Connection conn) {
		this.conn = conn;
	}

	public User addUser(String name, String email, String password) {
		User u1 = null;

		try {
			query = "insert into users(name,email,password) values(?,?,?)";
			ps = conn.prepareStatement("select name from users where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (rs.next()) {
				return u1;
			} else {
				ps1 = conn.prepareStatement(query);
				ps1.setString(1, name);
				ps1.setString(2, email);
				ps1.setString(3, password);
				ps1.executeUpdate();

				ps2 = conn.prepareStatement("select * from users");
				rs1 = ps2.executeQuery();
				if (rs1.next()) {
					u1 = new User();
					u1.setId(rs1.getInt("id"));
					u1.setName(rs1.getString("name"));
					u1.setEmail(rs1.getString("email"));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u1;
	}

	public User loginUser(String email, String password) {
		User u2 = null;

		try {

			query = "select * from users where email=? and password=?";
			ps3 = conn.prepareStatement(query);
			ps3.setString(1, email);
			ps3.setString(2, password);
			ResultSet rs2 = ps3.executeQuery();

			if (rs2.next()) {
				u2 = new User();
				u2.setId(rs2.getInt("id"));
				u2.setName(rs2.getString("name"));
				u2.setEmail(rs2.getString("email"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u2;
	}

	public boolean forgotPass(String email, String pass) {
		boolean b = false;

		try {

			query = "update users set password=? where email=?";
			String query1 = "select email from users where email=?";
			ps = conn.prepareStatement(query1);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (rs.next()) {
				ps1 = conn.prepareStatement(query);
				ps1.setString(1, pass);
				ps1.setString(2, email);
				int i = ps1.executeUpdate();

				if (i > 0) {
					b = true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

}

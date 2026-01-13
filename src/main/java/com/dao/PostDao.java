package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import com.model.Post;
import com.model.User;

public class PostDao {

	private Connection conn;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;

	public PostDao(Connection conn) {
		this.conn = conn;
	}

	public boolean addNotes(String title, String content, int uid) {
		boolean x = false;

		LocalDate currDate = LocalDate.now();
		Date sqlDate = Date.valueOf(currDate);

		try {

			String query = "insert into post(title,content,p_date,uid) values(?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setDate(3, sqlDate);
			ps.setInt(4, uid);

			int i = ps.executeUpdate();

			if (i > 0) {
				x = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return x;
	}

	public List<Post> getData(int id) {

		List<Post> list = new ArrayList<Post>();

		Post p = null;

		try {

			query = "select * from post where uid=? order by id desc";
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				p = new Post();
				p.setId(rs.getInt("id"));
				p.setTitle(rs.getString("title"));
				p.setContent(rs.getString("content"));
				p.setP_date(rs.getString("p_date"));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Post getDataById(int note_id) {
		Post p = null;

		try {

			query = "select * from post where id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, note_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				p = new Post();
				p.setId(rs.getInt("id"));
				p.setTitle(rs.getString("title"));
				p.setContent(rs.getString("content"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	public boolean postUpdate(int n_id, String title, String content) {
		boolean x = false;

		try {

			query = "update post set title=?,content=? where id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, n_id);

			int i = ps.executeUpdate();

			if (i > 0) {
				x = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return x;
	}

	public boolean noteDelete(int note_id) {
		boolean x = false;

		try {

			query = "delete from post where id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, note_id);

			int i = ps.executeUpdate();

			if (i > 0) {
				x = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return x;
	}

}

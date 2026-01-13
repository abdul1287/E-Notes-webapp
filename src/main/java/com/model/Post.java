package com.model;

import java.util.Date;

public class Post {

	private int id;
	private String title;
	private String content;
	private String p_date;
	private User us;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getUs() {
		return us;
	}
	public void setUs(User us) {
		this.us = us;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	 
}

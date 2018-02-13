package com.data;

public class User {
	// stores user information/progress
	public int id;
	public String username;
	public String password;
	public int categoryProgress;
	public int lessonProgress;
	public int gameLevel;
	public boolean admin;
	
	public User(int id, String username, String password, int categoryProgress, int lessonProgress, boolean admin) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.categoryProgress = categoryProgress;
		this.lessonProgress = lessonProgress;
		this.admin = admin;
	}
	
	public User() {
		this.id = -1;
		this.username = null;
		this.password = null;
		this.categoryProgress = -1;
		this.lessonProgress = -1;
		this.gameLevel = -1;
		this.admin = false;
	}
}

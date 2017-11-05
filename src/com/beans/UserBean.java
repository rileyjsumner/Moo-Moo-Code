package com.beans;

public class UserBean {
	public int id;
	public String username;
	public String password;
	public int categoryProgress;
	public int lessonProgress;
	public int gameLevel;
	public boolean admin;
	
	public UserBean(int id, String username, String password, int categoryProgress, int lessonProgress, int gameLevel, boolean admin) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.categoryProgress = categoryProgress;
		this.lessonProgress = lessonProgress;
		this.gameLevel = gameLevel;
		this.admin = admin;
	}
	
	public UserBean() {
		this.id = -1;
		this.username = null;
		this.password = null;
		this.categoryProgress = -1;
		this.lessonProgress = -1;
		this.gameLevel = -1;
		this.admin = false;
	}
	
	public int getId() {
		return id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public int getCategoryProgress() {
		return categoryProgress;
	}
	
	public int getLessonProgress() {
		return lessonProgress;
	}
	
	public int getGameLevel() {
		return gameLevel;
	}
	
	public boolean isAdmin() {
		return admin;
	}
}

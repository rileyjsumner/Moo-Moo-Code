package com.dao;

import com.data.Lesson.LessonId;
import com.util.DbUtil;
import com.data.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDao {
	public static int TestLogin(String username,String password)
	{
		if(username != null && password != null)
		{
			Connection con = DbUtil.getConnection();
			PreparedStatement preparedStatement;
			try {
				preparedStatement = con.prepareStatement("SELECT id FROM users WHERE username = ? AND password = ?");
				preparedStatement.setString(1, username);
				preparedStatement.setString(2, password);
				ResultSet set = preparedStatement.executeQuery();
				if(set.first()){
					return set.getInt("id");
				}
			}
			catch (SQLException ex) {
				Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return -1;
	}
	public static boolean isAdmin(int user_id) {
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT admin FROM users WHERE id = ?");
			preparedStatement.setInt(1, user_id);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()) {
				return set.getInt("admin") == 1;
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
	public static boolean TestUserExists(String username)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT id FROM users WHERE username = ?");
			preparedStatement.setString(1, username);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return true;
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
	public static void AddUser(String username, String password, int categoryProgress, int lessonProgress, int admin) {
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			if(!TestUserExists(username))
			{
				preparedStatement = con.prepareStatement("INSERT INTO users (username,password, progress_learn_category, progress_learn_lesson, admin) VALUES (?,?,?,?,?)");
				preparedStatement.setString(1, username);
				preparedStatement.setString(2, password);
				preparedStatement.setInt(3, categoryProgress);
				preparedStatement.setInt(4, lessonProgress);
				preparedStatement.setInt(5, admin);
				preparedStatement.execute();
			}
			
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static boolean AddUser(String username,String password)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			if(!TestUserExists(username))
			{
				preparedStatement = con.prepareStatement("INSERT INTO users (username,password) VALUES (?,?)");
				preparedStatement.setString(1, username);
				preparedStatement.setString(2, password);
				preparedStatement.execute();
				return true;
			}
			
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
	public static LessonId GetUserLessonProgress(int id)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT progress_learn_category, progress_learn_lesson FROM users WHERE id = ?");
			preparedStatement.setInt(1, id);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return new LessonId(set.getInt("progress_learn_category"),set.getInt("progress_learn_lesson"));
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return new LessonId(-1,-1);
	}
	public static int GetUserGameLevel(int id)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT progress_game_level FROM users WHERE id = ?");
			preparedStatement.setInt(1, id);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return set.getInt("progress_game_level");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return -1;
	}
	public static List<User> GetUsers()
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		List<User> users = new ArrayList<User>();
		try
		{
			preparedStatement = con.prepareStatement("SELECT * FROM users");
			ResultSet set = preparedStatement.executeQuery();
			while(set.next()) {
				users.add(
						new User(
								set.getInt("id"),
								set.getString("username"),
								set.getString("password"),
								set.getInt("progress_learn_category"),
								set.getInt("progress_learn_lesson"),
								set.getInt("admin") == 1
						)
				);
			}
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return users;
	}
	public static void UpdateUsers(int userID, String column, String value)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		PreparedStatement preparedStatement2;
		try
		{
			if(column.equals("username") || column.equals("password")) {
				preparedStatement = con.prepareStatement("UPDATE users SET " + column + " = ? WHERE id=?");
				preparedStatement.setString(1, value);
				preparedStatement.setInt(2, userID);
				preparedStatement.executeQuery();
			} else {
				preparedStatement2 = con.prepareStatement("UPDATE users SET " + column + " = ? WHERE id=?");
				preparedStatement2.setInt(1, Integer.parseInt(value));
				preparedStatement2.setInt(2, userID);
				preparedStatement2.execute();
			}
			
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void DeleteUser(int userID)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("DELETE FROM users WHERE id = ?");
			preparedStatement.setInt(1, userID);
			preparedStatement.execute();
			
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
}

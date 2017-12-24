package com.dao;

import com.data.Lesson.Binding;
import com.data.Lesson.Lesson;
import com.data.Lesson.LessonCategory;
import com.data.Lesson.LessonId;
import com.util.DbUtil;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LessonDao {
	public static ArrayList<LessonCategory> GetAllLessonCategories()
	{
		ArrayList<LessonCategory> lessonCategories = new ArrayList<>();
		
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT id FROM lesson_categories");
			ResultSet set = preparedStatement.executeQuery();
			
			while (set.next())
			{
				lessonCategories.add(GetLessonCategory(set.getInt("id")));
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return lessonCategories;
	}
	public static LessonCategory GetLessonCategory(int category)
	{
		LessonCategory lessonCategories = new LessonCategory();
		
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT * FROM lessons WHERE category_id = ? ORDER BY lesson_num ASC");
			preparedStatement.setInt(1, category);
			ResultSet set = preparedStatement.executeQuery();
			
			while (set.next())
			{
				lessonCategories.newLesson(new Lesson(set.getInt("id"),set.getString("lesson_name"),set.getInt("lesson_num")));
			}
			preparedStatement = con.prepareStatement("SELECT * FROM lesson_categories WHERE id = ?");
			preparedStatement.setInt(1, category);
			set = preparedStatement.executeQuery();
			if(set.first()){
				lessonCategories.Id = category;
				lessonCategories.Num = set.getInt("lesson_num");
				lessonCategories.Name = set.getString("name");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return lessonCategories;
	}
	public static LessonId GetLessonFromId(int lessonId)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(
					"SELECT l.lesson_num AS lesson_num, lc.lesson_num AS category_num FROM lessons l " +
							"JOIN lesson_categories lc ON lc.id = l.category_id " +
							"WHERE l.id = ?");
			preparedStatement.setInt(1, lessonId);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return new LessonId(set.getInt("category_num"),set.getInt("lesson_num"));
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return new LessonId(-1,-1);
	}
	public static int GetIdFromLesson(LessonId lesson)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(
					"SELECT l.id FROM lessons l " +
							"JOIN lesson_categories lc ON lc.id = l.category_id " +
							"WHERE l.lesson_num = ? AND lc.lesson_num = ?");
			preparedStatement.setInt(1, lesson.Lesson);
			preparedStatement.setInt(2, lesson.Category);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return set.getInt("id");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return -1;
	}
	public static boolean CheckLessonAccessible(LessonId lesson,LessonId userProgress)
	{
		// Check validity
		if(lesson.Lesson != -1 && lesson.Category != -1 && userProgress.Lesson != -1 && userProgress.Category != -1)
		{
			// Check that progress >= requested lesson
			if(userProgress.Category > lesson.Category || (userProgress.Category == lesson.Category && userProgress.Lesson >= lesson.Lesson))
			{
				return true;
			}
		}
		return false;
	}
	public static boolean CheckLessonAccessible(int lessonId,int userId)
	{
		return CheckLessonAccessible(GetLessonFromId(lessonId),UserDao.GetUserLessonProgress(userId));
	}
	public static void UpdateLessonAccessible(int lessonId, int userId) {
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		int lessonProg = -1;
		int categoryProg = -1;
		try {
			preparedStatement = con.prepareStatement("SELECT progress_learn_lesson, progress_learn_category FROM users WHERE id = ?");
			preparedStatement.setInt(1, userId);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				lessonProg = set.getInt("progress_learn_lesson");
				categoryProg = set.getInt("progress_learn_lesson");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		PreparedStatement preparedStatement1;
		try {
			if(lessonId >= lessonProg && lessonProg != -1) {
				preparedStatement1 = con.prepareStatement("UPDATE users SET progress_learn_lesson = ? WHERE id = ?");
				preparedStatement1.setInt(1, lessonProg+1);
				preparedStatement1.setInt(2, userId);
				preparedStatement1.execute();
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static String GetLessonText(int lesson)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT lesson_text FROM lessons WHERE id = ?");
			preparedStatement.setInt(1, lesson);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return set.getString("lesson_text");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return "No lesson here";
	}
	public static String GetLessonCode(int id)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		PreparedStatement preparedStatement1;
		try {
			preparedStatement1 = con.prepareStatement("SELECT code_save FROM lessons WHERE id = ?");
			preparedStatement1.setInt(1, id);
			ResultSet set = preparedStatement1.executeQuery();
			if(set.first()){
				String save_code = set.getString("code_save");
				if(save_code != null) {
					return save_code;
				} else {
					try
					{
						preparedStatement = con.prepareStatement("SELECT start_code FROM lessons WHERE id = ?");
						preparedStatement.setInt(1, id);
						ResultSet set1 = preparedStatement.executeQuery();
						if (set1.first())
						{
							String start_code = set1.getString("start_code");
							if (start_code != null)
							{
								return start_code;
							}
						}
					}
					catch (SQLException ex)
					{
						Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
					}
				}
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		
		return "No start code here";
	}
	public static String GetLessonTitle(int id) {
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT lesson_name FROM lessons WHERE id = ?");
			preparedStatement.setInt(1, id);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return set.getString("lesson_name");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return "No title code here";
	}
	public static String GetLessonOutput(int id) {
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT lesson_output FROM lessons WHERE id = ?");
			preparedStatement.setInt(1, id);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return set.getString("lesson_output");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return "No output code here";
	}
	public static void SetLessonContent(int id, String title, String lesson_content, int category, String start_code, String output)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("UPDATE lessons SET " +
					"lesson_name = ?, " +
					"lesson_text = ?, " +
					"category_id = ?, " +
					"start_code = ?," +
					"lesson_output = ? " +
					"WHERE id = ?;");
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, lesson_content);
			preparedStatement.setInt(3, category);
			preparedStatement.setString(4, start_code);
			preparedStatement.setString(5, output);
			preparedStatement.setInt(6, id);
			
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void UpdateLessonCode(int id, String code)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("UPDATE lessons SET code_save = ? WHERE id = ?;");
			preparedStatement.setString(1, code);
			preparedStatement.setInt(2, id);
			
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void DeleteLesson(int id)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("DELETE FROM lessons WHERE id = ?");
			preparedStatement.setInt(1, id);
			
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static int AddLesson(String title, String lesson_content, int category, String start_code, String output)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(
					"INSERT INTO lessons (lesson_name, lesson_text, category_id, start_code, lesson_output) " +
						 "VALUES (?, ?, ?, ?, ?)");
			
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, lesson_content);
			preparedStatement.setInt(3, category);
			preparedStatement.setString(4, start_code);
			preparedStatement.setString(5, output);
			
			preparedStatement.execute();
			
			preparedStatement = con.prepareStatement("SELECT MAX(id) AS max_id FROM lessons");
			ResultSet set = preparedStatement.executeQuery();
			if(set.first())
			{
				return set.getInt("max_id");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return -1;
	}
	public static int AddBinding(String title, String value, int lesson_id)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement(
					"INSERT INTO lesson_bindings (binding_title, binding_value, lesson_id) " +
							"VALUES (?, ?, ?)");
			
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, value);
			preparedStatement.setInt(3, lesson_id);
			
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return -1;
	}
	public static void UpdateBinding(String col, String value, int bind_id, int lesson_id) {
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("UPDATE lesson_bindings SET " + col + " = ?, lesson_id = ? WHERE id = ?;");
			preparedStatement.setString(1, value);
			preparedStatement.setInt(2, lesson_id);
			preparedStatement.setInt(3, bind_id);
			
			System.out.println(preparedStatement);
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void AddCategory(String categoryName)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("INSERT INTO lesson_categories (name) VALUES (?)");
			
			preparedStatement.setString(1, categoryName);
			
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static int GetCategoryId(int lesson_id)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT category_id FROM lessons WHERE id = ?");
			
			preparedStatement.setInt(1, lesson_id);
			
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()) {
				return set.getInt("category_id");
			}
			
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return -1;
	}
	public static ArrayList<Binding> getLessonBindings(int lesson_id) {
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		ArrayList<Binding> bindings = new ArrayList<>();
		try {
			preparedStatement = con.prepareStatement("SELECT * FROM lesson_bindings WHERE lesson_id = ?");
			
			preparedStatement.setInt(1, lesson_id);
			
			ResultSet set = preparedStatement.executeQuery();
			while(set.next()) {
				bindings.add(new Binding(set.getInt("id"), set.getInt("lesson_id"), set.getString("binding_title"), set.getString("binding_value")));
			}
			
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return bindings;
	}
	public static void DeleteBinding(int bind) {
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("DELETE FROM lesson_bindings WHERE id = ?");
			preparedStatement.setInt(1, bind);
			
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
}

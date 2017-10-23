package com.dao;

import com.data.Lesson;
import com.data.LessonCategory;
import com.data.UserProgress;
import com.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	public static UserProgress GetLessonFromId(int lessonId)
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
				return new UserProgress(set.getInt("category_num"),set.getInt("lesson_num"));
			}
			con.close();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return new UserProgress(-1,-1);
	}
	public static int GetIdFromLesson(UserProgress lesson)
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
			con.close();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return -1;
	}
	public static boolean CheckLessonAccessible(UserProgress lesson,UserProgress userProgress)
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
		return CheckLessonAccessible(GetLessonFromId(lessonId),UserDao.GetUserProgress(userId));
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
			con.close();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return "No lesson here";
	}
}

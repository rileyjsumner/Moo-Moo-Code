package com.dao;

import com.data.Lesson;
import com.data.LessonCategory;
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
				lessonCategories.newLesson(new Lesson(set.getString("lesson_name"),set.getInt("lesson_num")));
			}
			preparedStatement = con.prepareStatement("SELECT * FROM lesson_categories WHERE id = ?");
			preparedStatement.setInt(1, category);
			set = preparedStatement.executeQuery();
			if(set.first()){
				lessonCategories.Num = set.getInt("lesson_num");
				lessonCategories.Name = set.getString("name");
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return lessonCategories;
	}
}

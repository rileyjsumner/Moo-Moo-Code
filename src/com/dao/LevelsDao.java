package com.dao;

import com.data.LevelId;
import com.data.LevelIds;
import com.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LevelsDao {
	public static LevelIds GetAllLevels()
	{
		LevelIds levels = new LevelIds();
		
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT * FROM levels");
			ResultSet set = preparedStatement.executeQuery();
			
			while (set.next())
			{
				levels.add(new LevelId(set.getInt("id"),set.getString("name"),
						set.getInt("unlock_from"),set.getInt("unlock_from_2"),set.getInt("unlock_from_3"),
						set.getInt("pos_x"),set.getInt("pos_y")));
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return levels;
	}
	public static boolean LevelExists(int levelId)
	{
		LevelIds levels = new LevelIds();
		
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT id FROM levels WHERE id = ?");
			preparedStatement.setInt(1,levelId);
			ResultSet set = preparedStatement.executeQuery();
			
			if (set.first())
			{
				return true;
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
}

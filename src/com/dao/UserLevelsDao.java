package com.dao;

import com.data.LevelId;
import com.data.LevelIds;
import com.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserLevelsDao {
	public static LevelIds GetAllUserLevels(int userId)
	{
		LevelIds levelIds = LevelsDao.GetAllLevels();
		
		// Set the Hello world level to a minimum of unlocked
		levelIds.levels.get(levelIds.findRef(1)).State = 1;
		
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT level_id FROM user_levels WHERE user_id = ?");
			preparedStatement.setInt(1,userId);
			ResultSet set = preparedStatement.executeQuery();
			
			while (set.next()) // For each level the user has finished
			{
				int userLevel = set.getInt("level_id");
				
				for(int i=0;i<levelIds.levels.size();i++) // go through all available levels to update their state
				{
					// If the level exists in userLevel, it is complete
					if(levelIds.levels.get(i).Id == userLevel)
					{
						levelIds.levels.get(i).State = 2;
					}
					// If the level unlocks from a finished level, unlock it
					else if(levelIds.levels.get(i).UnlocksFrom_1 == userLevel || levelIds.levels.get(i).UnlocksFrom_2 == userLevel || levelIds.levels.get(i).UnlocksFrom_3 == userLevel)
					{
						levelIds.levels.get(i).State = 1;
					}
				}
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return levelIds;
		
	}
	public static boolean UserCanAccessLevel(int userId,int levelId)
	{
		LevelIds levels = LevelsDao.GetAllLevels();
		
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT * FROM user_levels WHERE user_id = ?");
			preparedStatement.setInt(1,userId);
			ResultSet set = preparedStatement.executeQuery();
			
			if (set.first())
			{
				levels.add(new LevelId(set.getInt("id"),set.getString("name"),
						set.getInt("unlock_from"),set.getInt("unlock_from_2"),set.getInt("unlock_from_3"),
						set.getInt("pos_x"),set.getInt("pos_y")));
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
}

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
		
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT level_id FROM user_levels WHERE user_id = ?");
			preparedStatement.setInt(1,userId);
			ResultSet set = preparedStatement.executeQuery();
			
			while (set.next()) // For each level the user has finished
			{
				int userLevel = set.getInt("level_id");
				
				for(LevelId level : levelIds.levels) // go through all available levels to update their state
				{
					
					// If the level exists in userLevel, it is complete
					if(level.Id == userLevel)
					{
						level.State = 2;
					}// otherwise update the paths
					else if(level.UnlocksFrom_1 == userLevel)
					{
						level.PathState_1 = 1;
					}
					else if(level.UnlocksFrom_2 == userLevel)
					{
						level.PathState_2 = 1;
					}
					else if(level.UnlocksFrom_3 == userLevel)
					{
						level.PathState_3 = 1;
					}
					else{
						continue; // If nothing changed, skip the next part
					}
					if(level.State == 2)
					{
						level.PathState_1 = 2;level.PathState_2 = 2;level.PathState_3 = 2;
					}
					else// If it isn't already complete, check to see if it's active yet
					{
						// Check to see if all necessary paths are complete
						if(level.PathState_1 == 1)
						{
							if(level.PathState_2 == 1)
							{
								if(level.PathState_3 == 1)
								{
									level.State = 1; // All 3 paths are complete
								}
								else if(level.UnlocksFrom_3 == -1)
								{
									level.State = 1; // 2 paths are complete, the third isn't required
								}
							}
							else if(level.UnlocksFrom_2 == -1)
							{
								level.State = 1; // 1 path is complete, the second isn't required
							}
						}
						else if(level.UnlocksFrom_1 == -1)
						{
							level.State = 1; // No paths are complete, none are required
						}
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

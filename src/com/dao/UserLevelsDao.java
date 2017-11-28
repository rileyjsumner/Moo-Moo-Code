package com.dao;

import com.data.Level.LevelId;
import com.data.Level.LevelIds;
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
		
		// Set the default hello world to active at minimum
		for(LevelId level : levelIds.levels){if(level.UnlocksFrom_1 == -1){level.State = 2;}}
		
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
					if (level.State != 3)// Skip the whole thing if it's already complete
					{
						if(level.Id == userLevel) // If it exists, complete it
						{
							level.State = 3;level.PathState_1 = 2;level.PathState_2 = 2;level.PathState_3 = 2;continue;
						}
						else if(level.UnlocksFrom_1 == userLevel) // otherwise update the paths
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
						else // If nothing changed, skip the next part
						{
							continue;
						}
						// Check to see if all necessary paths are complete
						if(level.PathState_1 == 1)
						{
							if(level.PathState_2 == 1)
							{
								if(level.PathState_3 == 1)
								{
									level.State = 2; // All 3 paths are complete
								}
								else if(level.UnlocksFrom_3 == -1)
								{
									level.State = 2; // 2 paths are complete, the third isn't required
								}
							}
							else if(level.UnlocksFrom_2 == -1)
							{
								level.State = 2; // 1 path is complete, the second isn't required
							}
						}
						else if(level.UnlocksFrom_1 == -1)
						{
							level.State = 2; // No paths are complete, none are required
						}
					}
					
				}
			}
			// Now that the preliminary active check is done, add locked levels as well
			for(LevelId level : levelIds.levels)
			{
				if(level.State==0) // If it's currently an invisible level that could become locked,
				{
					// Go through all the levels again and check if any it unlocks from are active
					for(LevelId levelCheck : levelIds.levels)
					{
						if(levelCheck.State >= 2 && (level.UnlocksFrom_1 == levelCheck.Id || level.UnlocksFrom_2 == levelCheck.Id || level.UnlocksFrom_3 == levelCheck.Id)) // If a level it unlocks from is active, set to locked
						{
							level.State=1;
							break;// Then we don't need this loop anymore, we already found the level.
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
		LevelIds levelIds = GetAllUserLevels(userId);
		for(LevelId level : levelIds.levels)
		{
			if(level.Id==levelId && level.State >=2)
			{
				return true;
			}
		}
		return false;
	}
	public static void UnlockLevel(int userId,int levelId,int time,String code)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement = null;
		try
		{
			preparedStatement = con.prepareStatement("SELECT time FROM user_levels WHERE user_id = ? AND level_id = ?");
			preparedStatement.setInt(1,userId);
			preparedStatement.setInt(2,levelId);
			ResultSet set = preparedStatement.executeQuery();
			if(!set.first())
			{
				preparedStatement = con.prepareStatement("INSERT INTO user_levels (user_id, level_id, time,code) VALUES (?,?,?,?)");
				preparedStatement.setInt(1,userId);
				preparedStatement.setInt(2,levelId);
				preparedStatement.setInt(3,time);
				preparedStatement.setString(4,code);
				preparedStatement.execute();
			}
			else if(set.getInt("time") > time)
			{
				preparedStatement = con.prepareStatement("UPDATE user_levels SET time = ?,code = ? WHERE user_id = ? AND level_id = ?");
				preparedStatement.setInt(1,time);
				preparedStatement.setString(2,code);
				preparedStatement.setInt(3,userId);
				preparedStatement.setInt(4,levelId);
				preparedStatement.execute();
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
	}
}

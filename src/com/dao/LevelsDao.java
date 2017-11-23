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
	public static void UpdateLevel(int id,String name, int pos_x,int pos_y,int unlock_1,int unlock_2,int unlock_3)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("UPDATE levels SET name = ?, unlock_from = ?, unlock_from_2 = ?, unlock_from_3 = ?, pos_x = ?, pos_y = ? WHERE id = ?");
			preparedStatement.setString(1,name);
			preparedStatement.setInt(2,unlock_1);
			preparedStatement.setInt(3,unlock_2);
			preparedStatement.setInt(4,unlock_3);
			preparedStatement.setInt(5,pos_x);
			preparedStatement.setInt(6,pos_y);
			preparedStatement.setInt(7,id);
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void DeleteLevel(int id)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("DELETE FROM levels WHERE id = ?");
			preparedStatement.setInt(1,id);
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void AddLevel(String name, int pos_x,int pos_y,int unlock_1,int unlock_2,int unlock_3)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("INSERT INTO levels (name, unlock_from, unlock_from_2, unlock_from_3, pos_x, pos_y) VALUES (?,?,?,?,?,?)");
			preparedStatement.setString(1,name);
			preparedStatement.setInt(2,unlock_1);
			preparedStatement.setInt(3,unlock_2);
			preparedStatement.setInt(4,unlock_3);
			preparedStatement.setInt(5,pos_x);
			preparedStatement.setInt(6,pos_y);
			preparedStatement.execute();
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
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

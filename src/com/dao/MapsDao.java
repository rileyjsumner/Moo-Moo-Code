package com.dao;

import com.data.Map.*;
import com.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MapsDao {
	public static MapData GetMap(int id)
	{
		MapData map = new MapData(); // Make the blank map with valid = false
		
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT * FROM levels WHERE id = ?");
			preparedStatement.setInt(1,id);
			ResultSet set = preparedStatement.executeQuery();
			
			if(set.first()) // The level exists
			{
				//      --------
				//      Settings
				//      --------
				
				TileMap tileMap = new TileMap(id,set.getInt("dim_x"),set.getInt("dim_y"),set.getString("desc"),set.getString("help"),set.getString("start_code"),set.getInt("time"));
				
				preparedStatement = con.prepareStatement("SELECT x,y,id,tile_type FROM level_tiles WHERE level_id = ?");
				preparedStatement.setInt(1,id);
				set = preparedStatement.executeQuery();
				
				while (set.next()) // Add data to the map
				{
					int x = set.getInt("x");int y = set.getInt("y");
					if(x < tileMap.DimX && y < tileMap.DimY)
					{
						tileMap.AddTile(x,y,new MapTile(set.getInt("id"),set.getInt("tile_type")));
					}
				}
				
				//      -----
				//      Tiles
				//      -----
				
				Tiles tiles = new Tiles();
				preparedStatement = con.prepareStatement("SELECT * FROM tiles");
				set = preparedStatement.executeQuery();
				while(set.next())
				{
					tiles.add(set.getInt("id"),set.getString("name"),set.getString("icon"),set.getInt("type"));
				}
				
				//      --------
				//      Entities
				//      --------
				
				preparedStatement = con.prepareStatement("" +
						"SELECT * FROM level_entities WHERE level_id = ? ORDER BY name");
				preparedStatement.setInt(1,id);
				set = preparedStatement.executeQuery();
				
				ArrayList<Entity> mapEntities = new ArrayList<>();
				
				while(set.next())
				{
					mapEntities.add(new Entity(set.getFloat("pos_x"),set.getFloat("pos_y"),set.getInt("entity_type"),set.getInt("id"),set.getString("name")));
				}
				
				preparedStatement = con.prepareStatement("SELECT * FROM entities ORDER BY type");
				set = preparedStatement.executeQuery();
				
				ArrayList<Entity> entities = new ArrayList<>();
				
				while(set.next())
				{
					entities.add(new Entity(set.getInt("type"),set.getInt("id"),set.getString("name"),set.getString("icon")));
				}
				
				//      -----------
				//      Decorations
				//      -----------
				
				preparedStatement = con.prepareStatement("SELECT * FROM level_decorations WHERE level_id = ? ORDER BY `order` ASC");
				preparedStatement.setInt(1,id);
				set = preparedStatement.executeQuery();
				
				ArrayList<MapDeco> mapDeco = new ArrayList<>();
				
				while(set.next())
				{
					mapDeco.add(new MapDeco(set.getFloat("pos_x"),set.getFloat("pos_y"),set.getInt("type"),set.getInt("id")));
				}
				
				preparedStatement = con.prepareStatement("SELECT * FROM decorations");
				set = preparedStatement.executeQuery();
				
				ArrayList<Deco> deco = new ArrayList<>();
				
				while(set.next())
				{
					deco.add(new Deco(set.getInt("id"),set.getInt("type"),set.getString("icon"),set.getString("name"),set.getInt("behind")==1));
				}
				
				// Combine them, and set valid = true
				map = new MapData(tileMap,tiles,mapEntities,entities,deco,mapDeco);
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return map;
	}
	public static void SetMapTile(int mapId, int x, int y, int tileType)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("INSERT INTO level_tiles (level_id, x,y,tile_type) VALUES ( ?, ?, ?, ?) ON DUPLICATE KEY UPDATE tile_type = ?");
			preparedStatement.setInt(1,mapId);
			preparedStatement.setInt(2,x);
			preparedStatement.setInt(3,y);
			preparedStatement.setInt(4,tileType);
			preparedStatement.setInt(5,tileType);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void SetMapSettings(int mapId, int x, int y,int time, String desc,String help,String code)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("UPDATE levels SET dim_x = ?, dim_y = ?, `desc` = ?, help = ?,start_code = ?,time = ? WHERE id = ?");
			preparedStatement.setInt(1,x);
			preparedStatement.setInt(2,y);
			preparedStatement.setString(3,desc);
			preparedStatement.setString(4,help);
			preparedStatement.setString(5,code);
			preparedStatement.setInt(6,time);
			preparedStatement.setInt(7,mapId);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void SetMapDim(int mapId, int x, int y)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("UPDATE levels SET dim_x = ?, dim_y = ? WHERE id = ?");
			preparedStatement.setInt(1,x);
			preparedStatement.setInt(2,y);
			preparedStatement.setInt(3,mapId);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void AddEntity(int mapId, int type)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("SELECT name FROM entities WHERE type = ?");
			preparedStatement.setInt(1,type);
			ResultSet set = preparedStatement.executeQuery();
			
			if(set.first())
			{
				String defaultName = set.getString("name");
				preparedStatement = con.prepareStatement("INSERT INTO level_entities (level_id, pos_x, pos_y, entity_type, name) VALUES (?,0,0,?,?)");
				preparedStatement.setInt(1,mapId);
				preparedStatement.setInt(2,type);
				preparedStatement.setString(3,defaultName);
				preparedStatement.execute();
			}
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void DeleteEntity(int id)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("DELETE FROM level_entities WHERE id = ?");
			preparedStatement.setInt(1,id);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void AddEntity(int mapId, int type,String name)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("INSERT INTO level_entities (level_id, pos_x, pos_y, entity_type, name) VALUES (?,0,0,?,?)");
			preparedStatement.setInt(1,mapId);
			preparedStatement.setInt(2,type);
			preparedStatement.setString(3,name);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void UpdateEntity(int id,  int type, String name,float spawnX,float spawnY)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("UPDATE level_entities SET entity_type = ?, name = ?, pos_x = ?,pos_y = ? WHERE id = ?");
			preparedStatement.setInt(1,type);
			preparedStatement.setString(2,name);
			preparedStatement.setFloat(3,spawnX);
			preparedStatement.setFloat(4,spawnY);
			preparedStatement.setInt(5,id);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void MoveEntity(int id,float x,float y)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("UPDATE level_entities SET pos_x = ?,pos_y = ? WHERE id = ?");
			preparedStatement.setFloat(1,x);
			preparedStatement.setFloat(2,y);
			preparedStatement.setInt(3,id);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void DeleteAllDeco(int mapId)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("DELETE FROM level_decorations WHERE level_id = ?");
			preparedStatement.setInt(1,mapId);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	public static void AddDeco(int mapId, int type, float x, float y,int order)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try
		{
			preparedStatement = con.prepareStatement("INSERT INTO level_decorations (level_id, type, pos_x, pos_y,`order`) VALUES (?,?,?,?,?)");
			preparedStatement.setInt(1,mapId);
			preparedStatement.setInt(2,type);
			preparedStatement.setFloat(3,x);
			preparedStatement.setFloat(4,y);
			preparedStatement.setInt(5,order);
			preparedStatement.execute();
		}
		catch(SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
}

package com.dao;

import com.data.MapData;
import com.data.MapTile;
import com.data.TileMap;
import com.data.Tiles;
import com.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				// Make the blank map
				TileMap tileMap = new TileMap(id,set.getInt("dim_x"),set.getInt("dim_y"),set.getFloat("start_x"),set.getFloat("start_y"));
				
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
				// Now that the map is loaded with tile ids, get the data for the tiles
				Tiles tiles = new Tiles();
				preparedStatement = con.prepareStatement("SELECT * FROM tiles");
				set = preparedStatement.executeQuery();
				while(set.next())
				{
					tiles.add(set.getInt("id"),set.getString("name"),set.getString("icon"),set.getInt("type"));
				}
				
				// Combine them, and set valid = true
				map = new MapData(tileMap,tiles);
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
}

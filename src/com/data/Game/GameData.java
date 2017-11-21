package com.data.Game;

import com.data.Map.Entity;
import com.data.Map.MapData;

import java.util.ArrayList;

public class GameData
{
	public GameTiles Map;
	public ArrayList<Entity> Entities;
	
	public float PlayerX;
	public float PlayerY;
	
	public float PlayerVelX;
	public float PlayerVelY;
	public GameData(GameData data)
	{
		Map = data.Map;
		Entities = data.Entities;
		
		PlayerX = data.PlayerX;
		PlayerY = data.PlayerY;
		
		PlayerVelX = data.PlayerVelX;
		PlayerVelY = data.PlayerVelY;
	}
	public GameData(GameTiles map,ArrayList<Entity> entities,float playerX,float playerY)
	{
		Map = map;
		Entities = entities;
		
		PlayerX = playerX;
		PlayerY = playerY;
		
		PlayerVelX = 0;
		PlayerVelY = 0;
	}
	public GameData(GameTiles map, ArrayList<Entity> entities, float playerX, float playerY, float playerVelX, float playerVelY)
	{
		Map = map;
		Entities = entities;
		
		PlayerX = playerX;
		PlayerY = playerY;
		
		PlayerVelX = playerVelX;
		PlayerVelY = playerVelY;
	}
	public GameData(MapData mapData)
	{
		Map = new GameTiles(mapData.Map);
		Entities = mapData.MapEntities;
		
		PlayerX = mapData.Map.SpawnX;
		PlayerY = mapData.Map.SpawnY;
		
		PlayerVelX = 0;
		PlayerVelY = 0;
	}
}

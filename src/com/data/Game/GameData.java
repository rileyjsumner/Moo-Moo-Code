package com.data.Game;

import com.data.Map.Entity;
import com.data.Map.MapData;
import com.util.NumUtil;

import java.math.BigDecimal;
import java.util.ArrayList;

public class GameData
{
	public GameTiles Map;
	public ArrayList<Entity> Entities;
	
	public BigDecimal PlayerX;
	public BigDecimal PlayerY;
	
	public BigDecimal PlayerVelX;
	public BigDecimal PlayerVelY;
	public GameData(GameData data)
	{
		Map = data.Map;
		Entities = data.Entities;
		
		PlayerX = data.PlayerX;
		PlayerY = data.PlayerY;
		
		PlayerVelX = data.PlayerVelX;
		PlayerVelY = data.PlayerVelY;
	}
	public GameData(GameTiles map,ArrayList<Entity> entities,BigDecimal playerX,BigDecimal playerY)
	{
		Map = map;
		Entities = entities;
		
		PlayerX = playerX;
		PlayerY = playerY;
		
		PlayerVelX = BigDecimal.valueOf(0);
		PlayerVelY = BigDecimal.valueOf(0);
	}
	public GameData(GameTiles map, ArrayList<Entity> entities, BigDecimal playerX, BigDecimal playerY, BigDecimal playerVelX, BigDecimal playerVelY)
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
		
		PlayerX = NumUtil.TrimTrailing(BigDecimal.valueOf(mapData.Map.SpawnX));
		PlayerY = NumUtil.TrimTrailing(BigDecimal.valueOf(mapData.Map.SpawnY));
		
		PlayerVelX = BigDecimal.ZERO;
		PlayerVelY = BigDecimal.ZERO;
	}
}

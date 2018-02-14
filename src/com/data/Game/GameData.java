package com.data.Game;

import com.data.Map.Entity;
import com.data.Map.MapData;
import com.util.NumUtil;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;
// Stores data about the current state of the level and player
public class GameData
{
	public GameTiles Map;
	public ArrayList<Entity> Entities;
	public String oof = "oof";
	
	public BigDecimal PlayerX;
	public BigDecimal PlayerY;
	
	public boolean PlayerHasPitchFork;
	
	public int lastSwing;
	
	public BigDecimal PlayerVelX;
	public BigDecimal PlayerVelY;
	public GameData(GameData data)
	{
		lastSwing=1000000000;
		Map = data.Map;
		Entities = new ArrayList<>(data.Entities);
		
		PlayerX = data.PlayerX;
		PlayerY = data.PlayerY;
		
		PlayerVelX = data.PlayerVelX;
		PlayerVelY = data.PlayerVelY;
	}
	public GameData(GameTiles map,ArrayList<Entity> entities,BigDecimal playerX,BigDecimal playerY)
	{
		lastSwing=1000000000;
		Map = map;
		Entities = new ArrayList<>(entities);
		
		PlayerX = playerX;
		PlayerY = playerY;
		
		PlayerVelX = BigDecimal.valueOf(0);
		PlayerVelY = BigDecimal.valueOf(0);
	}
	public GameData(GameTiles map, ArrayList<Entity> entities, BigDecimal playerX, BigDecimal playerY, BigDecimal playerVelX, BigDecimal playerVelY)
	{
		lastSwing=1000000000;
		Map = map;
		Entities = new ArrayList<>(entities);
		
		PlayerX = playerX;
		PlayerY = playerY;
		
		PlayerVelX = playerVelX;
		PlayerVelY = playerVelY;
	}
	public GameData(MapData mapData)
	{
		lastSwing=10000000;
		Map = new GameTiles(mapData.Map);
		Entities = new ArrayList<>(mapData.MapEntities);
		
		Iterator<Entity> entities = Entities.iterator();
		ArrayList<Entity> PlayerSpawns = new ArrayList<>();
		// Get the player-spawn entities, pick a random one to turn into the player, then remove the rest
		while(entities.hasNext())
		{
			Entity entity = entities.next();
			if(entity.Type==0)//It's a player spawn
			{
				PlayerSpawns.add(entity);
				entities.remove();
			}
		}
		if(PlayerSpawns.size()>0)
		{
			Entity newPlayer = PlayerSpawns.get((new Random()).nextInt(PlayerSpawns.size()));
			PlayerX = NumUtil.GetClean(newPlayer.X);
			PlayerY = NumUtil.GetClean(newPlayer.Y);
		}
		else
		{
			PlayerX = NumUtil.GetClean(0);
			PlayerY = NumUtil.GetClean(0);
		}
		
		PlayerVelX = BigDecimal.ZERO;
		PlayerVelY = BigDecimal.ZERO;
	}
}

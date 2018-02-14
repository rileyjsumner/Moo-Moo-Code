package com.data.Map;
// stores all tile types
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

public class Tiles {
	public HashMap<Integer,Tile> Tiles;
	public Tiles()
	{
		Tiles = new HashMap<>();
	}
	public void add(int type, Tile data)
	{
		Tiles.put(type,data);
	}
	public void add(int id, String name, String icon,int type)
	{
		Tiles.put(type,new Tile(id,name,icon,type));
	}
	public Tile get(int type)
	{
		return Tiles.get(type);
	}
	public ArrayList<Tile> getAllTiles()
	{
		Set<Integer> tileSet =  Tiles.keySet();
		ArrayList<Tile> tiles = new ArrayList<>();
		for(int tileId : tileSet)
		{
			tiles.add(Tiles.get(tileId));
		}
		return tiles;
	}
}

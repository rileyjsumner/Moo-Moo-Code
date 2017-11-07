package com.data;

import java.util.HashMap;

public class Tiles {
	public HashMap<Integer,Tile> Tiles;
	public Tiles()
	{
		Tiles = new HashMap<>();
	}
	public void add(int id, Tile data)
	{
		Tiles.put(id,data);
	}
	public void add(int id, String name, String icon)
	{
		Tiles.put(id,new Tile(id,name,icon));
	}
	public Tile get(int id)
	{
		return Tiles.get(id);
	}
}

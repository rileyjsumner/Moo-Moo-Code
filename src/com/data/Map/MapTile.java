package com.data.Map;
// Stores tiles on the map
public class MapTile {
	public int Id;
	public int TileType;
	public MapTile()
	{
		Id=-1;TileType=-1;
	}
	public MapTile(int id, int tileType)
	{
		Id=id;TileType=tileType;
	}
}

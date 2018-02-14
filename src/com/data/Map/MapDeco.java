package com.data.Map;
// Stores decoration on the map
public class MapDeco
{
	public int Id;
	public int Type;
	public float X;
	public float Y;
	
	public MapDeco(float x, float y, int type, int id)
	{
		X = x;
		Y = y;
		Type = type;
		Id = id;
	}
}
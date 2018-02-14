package com.data.Game;

import com.data.Map.MapTile;
import com.data.Map.TileMap;
// Stores an array of all the tiles that make up a level
public class GameTiles
{
	public int DimX;
	public int DimY;
	public int Time;
	public MapTile[][] Data;
	public GameTiles(int dimX,int dimY,int time)
	{
		DimX=dimX;DimY=dimY;Time =time;
		Data=new MapTile[DimX][DimY];
	}
	public GameTiles(TileMap mapTiles)
	{
		DimX = mapTiles.DimX;
		DimY = mapTiles.DimY;
		Data = mapTiles.Data;
		Time = mapTiles.Time;
	}
}

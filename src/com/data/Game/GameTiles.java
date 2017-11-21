package com.data.Game;

import com.data.Map.MapTile;
import com.data.Map.TileMap;

public class GameTiles
{
	public int DimX;
	public int DimY;
	public MapTile[][] Data;
	public GameTiles(int dimX,int dimY)
	{
		DimX=dimX;DimY=dimY;
		Data=new MapTile[DimX][DimY];
	}
	public GameTiles(TileMap mapTiles)
	{
		DimX = mapTiles.DimX;
		DimY = mapTiles.DimY;
		Data = mapTiles.Data;
	}
}

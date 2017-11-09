package com.data;

public class TileMap {
	public int DimX;
	public int DimY;
	public int Id;
	public float SpawnX;
	public float SpawnY;
	public MapTile[][] Data;
	public TileMap(int id, int dimX,int dimY)
	{
		DimX=dimX;DimY=dimY;Id = id;
		Data=new MapTile[DimX][DimY];
	}
	public TileMap(int id,int dimX,int dimY,float spawnX,float spawnY)
	{
		DimX=dimX;DimY=dimY;SpawnX = spawnX;SpawnY = spawnY;
		Data=new MapTile[DimX][DimY];Id = id;
	}
	public void AddTile(int x,int y,MapTile tile)
	{
		Data[x][y] = tile;
	}
	
	public MapTile GetTile(int x,int y)
	{
		if(Data[x][y]!=null)
		{
			return Data[x][y];
		}
		else
		{
			return new MapTile(-1,0);
		}
	}
}

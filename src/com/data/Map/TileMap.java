package com.data.Map;
// stores all tiles on a map
public class TileMap {
	public int DimX;
	public int DimY;
	public int Time;
	public int Id;
	public MapTile[][] Data;
	public String Desc;
	public String Help;
	public String Code;
	public TileMap(int id, int dimX,int dimY)
	{
		DimX=dimX;DimY=dimY;Id = id;
		Data=new MapTile[DimX][DimY];
	}
	public TileMap(int id,int dimX,int dimY,String desc,String help,String code,int time)
	{
		DimX=dimX;DimY=dimY;Code=code;
		Data=new MapTile[DimX][DimY];Id = id;Desc = desc;Help = help;Time = time;
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

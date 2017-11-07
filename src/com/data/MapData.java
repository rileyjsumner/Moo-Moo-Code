package com.data;

public class MapData {
	public TileMap Map;
	public com.data.Tiles Tiles;
	public boolean Valid;
	public MapData()
	{
		Valid=false;
	}
	public MapData(TileMap map, com.data.Tiles tiles)
	{
		Map = map;Tiles=tiles;Valid=true;
	}
	public Tile GetTile(int x,int y)
	{
		int tile = Map.GetTile(x,y).Id;
		
		if(tile != -1){return Tiles.get(tile);}
		else{return null;}
	}
}

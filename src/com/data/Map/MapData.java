package com.data.Map;

import java.util.ArrayList;

public class MapData {
	public TileMap Map;
	public com.data.Map.Tiles Tiles;
	public ArrayList<Entity> MapEntities;
	public ArrayList<Entity> Entities;
	public boolean Valid;
	
	public MapData()
	{
		Valid=false;
	}
	public MapData(TileMap map, com.data.Map.Tiles tiles, ArrayList<Entity> mapEntities, ArrayList<Entity> entities)
	{
		Map = map;Tiles=tiles;Entities = entities;Valid=true;MapEntities=mapEntities;
	}
	public Tile GetTile(int x,int y)
	{
		int tile = Map.GetTile(x,y).TileType;
		
		if(tile != -1){return Tiles.get(tile);}
		else{return null;}
	}
	public String GetTypeDD(int typeSelected)
	{
		return GetTypeDD(typeSelected,false,true);
	}
	public String GetTypeDD(int typeSelected,boolean submitOnChange)
	{
		return GetTypeDD(typeSelected,submitOnChange,true);
	}
	public String GetTypeDD(int typeSelected,boolean submitOnChange,boolean hasNone)
	{
		StringBuilder ddBuilder = new StringBuilder("<select class = 'entity-select admin-levels-input' name = 'type'");
		if (submitOnChange){ddBuilder.append("onchange='this.form.submit()'");}
		if(hasNone){ddBuilder.append("><option value='-1'>Select a Type</option>");}else{ddBuilder.append(">");}
		for(Entity entity:Entities)
		{
			ddBuilder.append("<option value = '").append(entity.Type).append("' ");
			if(entity.Type == typeSelected){ddBuilder.append("selected = 'selected' ");}
			ddBuilder.append(">").append(entity.Name).append("</option>");
		}
		ddBuilder.append("</select>");
		return ddBuilder.toString();
	}
}

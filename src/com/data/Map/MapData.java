package com.data.Map;

import com.util.NumUtil;

import java.util.ArrayList;
import java.util.Random;
// Stores all the entities and decorations to visualize a level
// different from the gamedata class in that it stores all static decorations that take a lot of space
public class MapData {
	public TileMap Map;
	public com.data.Map.Tiles Tiles;
	public ArrayList<Entity> MapEntities;
	public ArrayList<Entity> Entities;
	public ArrayList<Deco> Decorations;
	public ArrayList<MapDeco> MapDecorations;
	public boolean Valid;
	
	public MapData()
	{
		Valid = false;
	}
	public MapData(TileMap map, com.data.Map.Tiles tiles, ArrayList<Entity> mapEntities, ArrayList<Entity> entities,ArrayList<Deco> decorations,ArrayList<MapDeco> mapDecorations)
	{
		Map = map;
		Tiles = tiles;
		Entities = entities;
		MapEntities = mapEntities;
		MapDecorations = mapDecorations;
		Decorations = decorations;
		Valid = true;
	}
	public MapData(TileMap map, com.data.Map.Tiles tiles, ArrayList<Entity> mapEntities, ArrayList<Entity> entities,ArrayList<Deco> decorations)
	{
		Map = map;
		Tiles = tiles;
		Entities = entities;
		MapEntities = mapEntities;
		Decorations = decorations;
		PopulateDeco();
		Valid = true;
	}
	public Tile GetTile(int x,int y)
	{
		int tile = Map.GetTile(x, y).TileType;
		
		if (tile != -1) {return Tiles.get(tile);} else {return null;}
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
		if (submitOnChange) {ddBuilder.append("onchange='this.form.submit()'");}
		if (hasNone) {ddBuilder.append("><option value='-1'>Select a Type</option>");} else {ddBuilder.append(">");}
		for (Entity entity : Entities)
		{
			ddBuilder.append("<option value = '").append(entity.Type).append("' ");
			if (entity.Type == typeSelected) {ddBuilder.append("selected = 'selected' ");}
			ddBuilder.append(">").append(entity.Name).append("</option>");
		}
		ddBuilder.append("</select>");
		return ddBuilder.toString();
	}
	public String GetDecoTypeDD(int typeSelected,boolean submitOnChange,boolean hasNone)
	{
		StringBuilder ddBuilder = new StringBuilder("<select class = 'entity-select admin-levels-input' name = 'type'");
		if (submitOnChange) {ddBuilder.append("onchange='this.form.submit()'");}
		if (hasNone) {ddBuilder.append("><option value='-1'>Select a Type</option>");} else {ddBuilder.append(">");}
		for (Deco decoration : Decorations)
		{
			ddBuilder.append("<option value = '").append(decoration.Type).append("' ");
			if (decoration.Type == typeSelected) {ddBuilder.append("selected = 'selected' ");}
			ddBuilder.append(">").append(decoration.Name).append("</option>");
		}
		ddBuilder.append("</select>");
		return ddBuilder.toString();
	}
	public String GetDecoIcon(int type)
	{
		for (Deco deco : Decorations)
		{
			if (deco.Id == type) {return deco.Icon;}
		}
		return "null_icon";
	}
	public String GetDecoName(int type)
	{
		for (Deco deco : Decorations)
		{
			if (deco.Id == type) {return deco.Name;}
		}
		return "null_icon";
	}
	public boolean GetDecoBehind(int type)
	{
		for (Deco deco : Decorations)
		{
			if (deco.Id == type) {return deco.Behind;}
		}
		return false;
	}
	public void PopulateDeco()
	{
		MapDecorations = new ArrayList<>();
		Random random = new Random();
		int fakeId = 100;
		Deco newDeco;
		MapDeco newMapDeco;
		for(int x = 0;x<Map.DimX;x++)
		{
			for(int y = 0;y<Map.DimY;y++)
			{
				MapTile tile = Map.Data[x][y];
				if(tile == null || tile.TileType==0) // If it's normal grass
				{
					// Populate flowers & such
				}
				else if(tile.TileType == 1) // It's a forest edge
				{
					// Populate forest
					//----------------
					
					// First tree
					newDeco = PickRandomDecoOfType(0);// Background tree type
					if(newDeco!=null)
					{
						newMapDeco = new MapDeco((float)x+random.nextFloat(),(float)y+random.nextFloat(),newDeco.Id,fakeId);
						newMapDeco.Y+=.5;
						newMapDeco.Y = NumUtil.Clamp(newMapDeco.Y,(float).5,Map.DimY-(float).5);
						newMapDeco.X = NumUtil.Clamp(newMapDeco.X,(float).25,Map.DimX-(float).25);
						MapDecorations.add(newMapDeco);
						fakeId++;
					}
					// Second tree
					newDeco = PickRandomDecoOfType(0);// Background tree type
					if(newDeco!=null)
					{
						newMapDeco = new MapDeco((float)x+random.nextFloat(),(float)y+random.nextFloat(),newDeco.Id,fakeId);
						newMapDeco.Y+=.5;
						newMapDeco.Y = NumUtil.Clamp(newMapDeco.Y,(float).5,(float)Map.DimY-(float).25);
						newMapDeco.X = NumUtil.Clamp(newMapDeco.X,(float).25,(float)Map.DimX-(float).25);
						MapDecorations.add(newMapDeco);
						fakeId++;
					}
					// Bush
					newDeco = PickRandomDecoOfType(1);// Background tree type
					if(newDeco!=null)
					{
						newMapDeco = new MapDeco((float)x+random.nextFloat(),(float)y+random.nextFloat(),newDeco.Id,fakeId);
						newMapDeco.Y+=.5;
						newMapDeco.Y = NumUtil.Clamp(newMapDeco.Y,(float).5,(float)Map.DimY-(float).1);
						newMapDeco.X = NumUtil.Clamp(newMapDeco.X,(float).25,(float)Map.DimX-(float).25);
						MapDecorations.add(newMapDeco);
						fakeId++;
					}
				}
			}
		}
		// Reorder deco front to back, so deco doesn't clip
		MapDecorations.sort((a, b) -> -(Float.compare(a.Y, b.Y)));
	}
	public Deco PickRandomDecoOfType(int type)
	{
		ArrayList<Deco> decoOfType = new ArrayList<>();
		for(Deco deco:Decorations)
		{
			if(deco.Type==type)
			{
				decoOfType.add(deco);
			}
		}
		if(decoOfType.size()>0)
		{
			return decoOfType.get((new Random()).nextInt(decoOfType.size()));
		}
		return null;
	}
}

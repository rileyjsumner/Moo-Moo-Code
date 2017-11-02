package com.data;

import java.util.ArrayList;

public class LevelIds {
	public ArrayList<LevelId> levels;
	public LevelIds(){levels = new ArrayList<>();}
	public void add(LevelId level){levels.add(level);}
	public LevelId find(int id)
	{
		for(LevelId level : levels)
		{
			if(level.Id == id)
			{
				return level;
			}
		}
		return new LevelId();
	}
}

package com.data.Game;

import java.util.ArrayList;

public class GameOutput
{
	public ArrayList<GameFrame> GameChanges;
	public float spawnX;
	public float spawnY;
	public boolean Success;
	public int time;
	public GameOutput()
	{
		GameChanges = new ArrayList<>();
		Success = false;
		time = -1;
	}
}

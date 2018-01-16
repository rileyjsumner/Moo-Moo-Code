package com.data.Game;

import java.util.ArrayList;

public class GameOutput
{
	public GameData GameStart;
	public ArrayList<GameFrame> GameFrames;
	public String EndText;
	public float spawnX;
	public float spawnY;
	public boolean Success;
	public int time;
	public GameOutput()
	{
		GameFrames = new ArrayList<>();
		Success = false;
		time = -1;
	}
}

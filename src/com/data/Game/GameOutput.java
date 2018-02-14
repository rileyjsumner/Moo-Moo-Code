package com.data.Game;

import java.util.ArrayList;
// The output of running a game, contains all frames, entity movement, the starting level, and player details
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

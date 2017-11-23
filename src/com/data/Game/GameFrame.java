package com.data.Game;

public class GameFrame
{
	public GameData Data;
	public String ConsoleOut;
	public boolean ConsoleError;
	public int GameState;
	public int TimeLeft;
	public GameFrame(GameData data,String out, boolean error,int timeLeft,int gameState)
	{
		Data = data; ConsoleOut = out; ConsoleError = error;TimeLeft =timeLeft;GameState = gameState;
	}
	public GameFrame(int timeLeft)
	{
		TimeLeft = timeLeft;GameState =0;
	}
}

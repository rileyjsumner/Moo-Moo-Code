package com.data.Game;

public class GameFrame
{
	public GameData Data;
	public String ConsoleOut;
	public boolean ConsoleError;
	public int TimeLeft;
	public GameFrame(GameData data,String out, boolean error,int timeLeft)
	{
		Data = data; ConsoleOut = out; ConsoleError = error;TimeLeft =timeLeft;
	}
	public GameFrame(int timeLeft)
	{
		TimeLeft = timeLeft;
	}
}

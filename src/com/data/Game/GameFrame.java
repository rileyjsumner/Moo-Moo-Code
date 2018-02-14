package com.data.Game;
// Stores all of the data about a specific frame while the game runs
public class GameFrame
{
	public GameChanges Changes;
	public String ConsoleOut;
	public boolean ConsoleError;
	public int GameState;
	public int TimeLeft;
	public GameFrame(GameChanges data,String out, boolean error,int timeLeft,int gameState)
	{
		Changes = data; ConsoleOut = out; ConsoleError = error;TimeLeft =timeLeft;GameState = gameState;
	}
	public GameFrame(int timeLeft)
	{
		TimeLeft = timeLeft;GameState =0;Changes = new GameChanges();
	}
}

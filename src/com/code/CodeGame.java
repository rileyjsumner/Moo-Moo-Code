package com.code;

import com.dao.MapsDao;
import com.data.Game.GameData;
import com.data.Game.GameFrame;
import com.data.Game.GameOutput;
import com.data.Map.MapData;

import java.util.HashMap;

public class CodeGame
{
	public static GameOutput RunGame(String code, int mapId)
	{
		return RunGame(code, MapsDao.GetMap(mapId));
	}
	public static GameOutput RunGame(String code, MapData map)
	{
		return RunGame(code,new GameData(map));
	}
	public static GameOutput RunGame(String code, GameData map)
	{
		GameOutput output = new GameOutput();
		
		GameData lastData = map;
		GameFrame frame;
		CodeEngine engine;
		
		for(int timeLeft = 10;timeLeft > 0;timeLeft --)
		{
			engine = new CodeEngine();
			frame = new GameFrame(timeLeft);
			frame.Data = lastData;
			// Load data into the engine:
			
			// Set default values:
			engine.SetBinding("x",0);
			engine.SetBinding("y",0);
			
			// Execute code and deal with output
			HashMap engineOutput = engine.Exec(code);
			if((boolean)engineOutput.get("error"))
			{
				frame.ConsoleError=true;
				frame.ConsoleOut = (String)engineOutput.get("message");
			}
			else
			{
				frame.ConsoleError=false;
				frame.ConsoleOut = (String)engineOutput.get("output");
			}
			
			// Process Input
			HashMap<String,Object> bindings = engine.GetBindings();
			
			// Process X AND Y
			float moveX=0;float moveY=0;
			
			// Set moveX and moveY if they are valid
			if(bindings.containsKey("x")){Object input_x = bindings.get("x");if (input_x instanceof Integer || input_x instanceof Double)
				{if (input_x instanceof Integer) {moveX = (float) ((int) input_x);} else{moveX = ((Double) input_x).floatValue();}}}
				
			if(bindings.containsKey("y")){Object input_y = bindings.get("y");if(input_y instanceof Integer || input_y instanceof Double)
				{if (input_y instanceof Integer) {moveY = (float) ((int) input_y);} else{moveY = ((Double) input_y).floatValue();}}}
			
			// Cap movement speed
			if(moveX>1){moveX=1;}else if(moveX<-1){moveX=-1;}
			if(moveY>1){moveY=1;}else if(moveY<-1){moveY=-1;}
			
			// Move position
			frame.Data.PlayerX +=moveX;
			frame.Data.PlayerY +=moveY;
			
			// Make sure the player doesn't go off the edge
			if(frame.Data.PlayerX>frame.Data.Map.DimX){frame.Data.PlayerX=frame.Data.Map.DimX;}
			else if(frame.Data.PlayerX<0){frame.Data.PlayerX=0;}
			if(frame.Data.PlayerY>frame.Data.Map.DimY-1){frame.Data.PlayerY=frame.Data.Map.DimY-1;}
			else if(frame.Data.PlayerY<0){frame.Data.PlayerY=0;}
			
			lastData = new GameData(frame.Data);
			output.GameChanges.add(frame);
		}
		return output;
	}
}
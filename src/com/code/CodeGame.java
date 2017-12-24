package com.code;

import com.dao.MapsDao;
import com.data.Game.GameData;
import com.data.Game.GameFrame;
import com.data.Game.GameOutput;
import com.data.Map.Entity;
import com.data.Map.MapData;
import com.util.Collision;
import com.util.NumUtil;
import js.Player;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashMap;
/*= 1000 ms
  = 1 Second
  = 10 Ticks
  
  = 1 x
  = 2 x/s
  = .2 x/Tick
*
* */
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
		output.spawnX=map.PlayerX.floatValue();
		output.spawnY=map.PlayerY.floatValue();
		GameData lastData = map;
		GameFrame frame;
		CodeEngine engine;
		
		for(int timeLeft = map.Map.Time-1;timeLeft >= 0;timeLeft --)
		{
			engine = new CodeEngine();
			frame = new GameFrame(timeLeft);
			frame.Data = lastData;
			// Load data into the engine:
			Player player = new Player(frame.Data.PlayerX,frame.Data.PlayerY);
			engine.SetBinding("player",player);
			engine.SetBinding("time",NumUtil.GetClean(timeLeft*.1));
			// Set default values:
			engine.SetBinding("x",0);
			engine.SetBinding("y",0);
			
			// Execute code and deal with output
			CodeOutput engineOutput = engine.Exec(code);
			if(engineOutput.Error)
			{
				frame.ConsoleError=true;
				frame.GameState = -1;
				frame.ConsoleOut = engineOutput.Text;
				output.GameChanges.add(frame);
				return output;
			}
			else
			{
				frame.ConsoleError=false;
				frame.ConsoleOut = engineOutput.Text;
			}
			
			// Process Input
			HashMap<String,Object> bindings = engine.GetBindings();
			
			// Process X AND Y
			// ---------------
			
			BigDecimal moveX= BigDecimal.ZERO;BigDecimal moveY= BigDecimal.ZERO;
			
			// Set moveX and moveY if they are valid
			if(bindings.containsKey("x")){Object input_x = bindings.get("x");if (input_x instanceof Integer || input_x instanceof Double)
				{if (input_x instanceof Integer) {moveX = BigDecimal.valueOf((int) input_x);} else{moveX = BigDecimal.valueOf(((Double) input_x).floatValue());}}}
				
			if(bindings.containsKey("y")){Object input_y = bindings.get("y");if(input_y instanceof Integer || input_y instanceof Double)
				{if (input_y instanceof Integer) {moveY = BigDecimal.valueOf((int) input_y);} else{moveY = BigDecimal.valueOf(((Double) input_y).floatValue());}}}
			
			// Cap movement speed
			if(moveX.compareTo(BigDecimal.ONE) > 0){moveX= BigDecimal.ONE;}else if(moveX.compareTo(BigDecimal.valueOf(-1)) <0){moveX= BigDecimal.valueOf(-1);}
			if(moveY.compareTo(BigDecimal.ONE) > 0){moveY= BigDecimal.ONE;}else if(moveY.compareTo(BigDecimal.valueOf(-1)) <0){moveY= BigDecimal.valueOf(-1);}
			
			// Set move speed for animation
			frame.Data.PlayerVelX = NumUtil.TrimTrailing(moveX.multiply(BigDecimal.valueOf(.2)));
			frame.Data.PlayerVelY = NumUtil.TrimTrailing(moveY.multiply(BigDecimal.valueOf(.2)));
			
			// Move position
			frame.Data.PlayerX = frame.Data.PlayerX.add(frame.Data.PlayerVelX);
			frame.Data.PlayerY = frame.Data.PlayerY.add(frame.Data.PlayerVelY);
			
			// Make sure the player doesn't go off the edge
			frame.Data.PlayerX = NumUtil.Clamp(frame.Data.PlayerX,.5,(frame.Data.Map.DimX-.5));
			frame.Data.PlayerY = NumUtil.Clamp(frame.Data.PlayerY,.5,(frame.Data.Map.DimY-.5));
			
			//Make sure the player doesn't collide with the map
			
			Collision mapCollision = NumUtil.Collision_entity_MapTiles(frame.Data.PlayerX.floatValue(),frame.Data.PlayerY.floatValue(),.5,frame.Data.Map);
			if(mapCollision.IsCollision)
			{
				frame.Data.PlayerX = NumUtil.GetClean(mapCollision.Pos.X);
				frame.Data.PlayerY = NumUtil.GetClean(mapCollision.Pos.Y);
			}
			
			Collision entityCollision = NumUtil.Collision_entity_MapEntities(frame.Data.PlayerX.floatValue(),frame.Data.PlayerY.floatValue(),.5,frame.Data.Entities);
			if(entityCollision.IsCollision)
			{
				frame.Data.PlayerX = NumUtil.GetClean(entityCollision.Pos.X);
				frame.Data.PlayerY = NumUtil.GetClean(entityCollision.Pos.Y);
			}
			
			// Cap position to 5 decimals
			frame.Data.PlayerX = NumUtil.TrimTrailing(frame.Data.PlayerX);
			frame.Data.PlayerY = NumUtil.TrimTrailing(frame.Data.PlayerY);
			
			// Check if Game is won by touching a cow:
			// ---------------------------------------
			
			for(Entity entity : frame.Data.Entities)
			{
				if(entity.Type==1) // It's a cow
				{
					if (Math.hypot(entity.X - frame.Data.PlayerX.floatValue(), entity.Y - frame.Data.PlayerY.floatValue()) <= 1) // It's touching the player
					{
						frame.GameState = 1;
						output.GameChanges.add(frame);
						output.Success = true;
						output.time = map.Map.Time - timeLeft;
						DecimalFormat df = new DecimalFormat();
						df.setMaximumFractionDigits(1);
						output.EndText = "You found the cow in " + df.format(output.time * .1) + " seconds";
						return output;
					}
				}
			}
			
			// Check if Game is lost by time running out:
			
			if(timeLeft ==0)
			{
				frame.GameState = -1;
				output.GameChanges.add(frame);
				output.EndText = "You ran out of time";
				return output;
			}
			
			lastData = new GameData(frame.Data);
			output.GameChanges.add(frame);
		}
		return output;
	}
}
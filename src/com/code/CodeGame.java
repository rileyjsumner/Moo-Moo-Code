package com.code;

import com.dao.MapsDao;
import com.data.Game.EntityDelete;
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
import java.util.Iterator;

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
		output.GameStart = new GameData(map);
		GameData currentData = new GameData(map);
		
		GameFrame frame;
		CodeEngine engine;
		
		for(int timeLeft = map.Map.Time-1;timeLeft >= 0;timeLeft --)
		{
			engine = new CodeEngine();
			frame = new GameFrame(timeLeft);
			
			// Load data into the engine:
			Player player = new Player(currentData.PlayerX,currentData.PlayerY);
			engine.SetBinding("player",player);
			engine.SetBinding("time",NumUtil.GetClean(timeLeft*.1));
			
			// Set default values:
			engine.SetBinding("swing",false);
			engine.SetBinding("x",0);
			engine.SetBinding("y",0);
			
			// Execute code and deal with output
			CodeOutput engineOutput = engine.Exec(code);
			if(engineOutput.Error)
			{
				frame.ConsoleError=true;
				frame.GameState = -1;
				frame.ConsoleOut = engineOutput.Text;
				frame.Changes.PlayerHasPitchFork = currentData.PlayerHasPitchFork;
				frame.Changes.PlayerX = currentData.PlayerX;
				frame.Changes.PlayerY = currentData.PlayerY;
				frame.Changes.PlayerVelX = currentData.PlayerVelX;
				frame.Changes.PlayerVelY = currentData.PlayerVelY;
				output.EndText = "Code Stopped: Error";
				output.GameFrames.add(frame);
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
			currentData.PlayerVelX = NumUtil.TrimTrailing(moveX.multiply(BigDecimal.valueOf(.2)));
			currentData.PlayerVelY = NumUtil.TrimTrailing(moveY.multiply(BigDecimal.valueOf(.2)));
			
			// Move position
			currentData.PlayerX = currentData.PlayerX.add(currentData.PlayerVelX);
			currentData.PlayerY = currentData.PlayerY.add(currentData.PlayerVelY);
			
			// Make sure the player doesn't go off the edge
			currentData.PlayerX = NumUtil.Clamp(currentData.PlayerX,.5,(currentData.Map.DimX-.5));
			currentData.PlayerY = NumUtil.Clamp(currentData.PlayerY,.5,(currentData.Map.DimY-.5));
			
			//Make sure the player doesn't collide with the map
			
			Collision mapCollision = NumUtil.Collision_entity_MapTiles(currentData.PlayerX.floatValue(),currentData.PlayerY.floatValue(),.5,currentData.Map);
			if(mapCollision.IsCollision)
			{
				currentData.PlayerX = NumUtil.GetClean(mapCollision.Pos.X);
				currentData.PlayerY = NumUtil.GetClean(mapCollision.Pos.Y);
			}
			
			Collision entityCollision = NumUtil.Collision_entity_MapEntities(currentData.PlayerX.floatValue(),currentData.PlayerY.floatValue(),.5,currentData.Entities);
			if(entityCollision.IsCollision)
			{
				currentData.PlayerX = NumUtil.GetClean(entityCollision.Pos.X);
				currentData.PlayerY = NumUtil.GetClean(entityCollision.Pos.Y);
			}
			
			// Cap position to 5 decimals
			currentData.PlayerX = NumUtil.TrimTrailing(currentData.PlayerX);
			currentData.PlayerY = NumUtil.TrimTrailing(currentData.PlayerY);
			
			frame.Changes.PlayerX = currentData.PlayerX;
			frame.Changes.PlayerY = currentData.PlayerY;
			frame.Changes.PlayerVelX = currentData.PlayerVelX;
			frame.Changes.PlayerVelY = currentData.PlayerVelY;
			
			// Check for pitchfork swinging
			if(bindings.containsKey("swing"))
			{
				Object input_swing = bindings.get("swing");
				if (input_swing instanceof Boolean && (Boolean)input_swing)
				{   // The pitchfork is trying to be swung
					if(currentData.PlayerHasPitchFork){ // they have the pitchfork
						if(currentData.lastSwing>timeLeft+20) // the cooldown is over
						{
							currentData.lastSwing= timeLeft;
							
							// Swing the pitchfork:
							// --------------------
							Iterator<Entity> entities = currentData.Entities.iterator();
							while(entities.hasNext())
							{
								Entity entity = entities.next();
								
								if(entity.Type==4 || entity.Type == 5) // if the nearby object is a hay bale
								{
									if (Math.hypot(entity.X - currentData.PlayerX.floatValue(), entity.Y - currentData.PlayerY.floatValue()) <= 1.5) // It's close to the player
									{
										System.out.println("REMOVED");
										entities.remove();
										frame.Changes.EntityDeletes.add(new EntityDelete(entity.Id));
									}
								}
							}
						}
					}
				}
			}
			
			
			// Check if Game is won by touching a cow:
			// ---------------------------------------
			Iterator<Entity> entities = currentData.Entities.iterator();
			while(entities.hasNext())
			{
				Entity entity = entities.next();
				if(entity.Type==1) // It's a cow
				{
					if (Math.hypot(entity.X - currentData.PlayerX.floatValue(), entity.Y - currentData.PlayerY.floatValue()) <= 1) // It's touching the player
					{
						frame.GameState = 1;
						output.GameFrames.add(frame);
						output.Success = true;
						output.time = map.Map.Time - timeLeft;
						DecimalFormat df = new DecimalFormat();
						df.setMaximumFractionDigits(1);
						output.EndText = "You found the cow in " + df.format(output.time * .1) + " seconds";
						return output;
					}
				}
				else if(entity.Type==2) // It's a pitchfork
				{
					if (Math.hypot(entity.X - currentData.PlayerX.floatValue(), entity.Y - currentData.PlayerY.floatValue()) <= 1) // It's touching the player
					{
						currentData.PlayerHasPitchFork=true;
						frame.Changes.EntityDeletes.add(new EntityDelete(entity.Id));
						entities.remove();
					}
				}
			}
			
			// Check if Game is lost by time running out:
			
			if(timeLeft ==0)
			{
				frame.GameState = -1;
				output.GameFrames.add(frame);
				output.EndText = "You ran out of time";
				return output;
			}
			frame.Changes.PlayerHasPitchFork = currentData.PlayerHasPitchFork;
			output.GameFrames.add(frame);
		}
		return output;
	}
}
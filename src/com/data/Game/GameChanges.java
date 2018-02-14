package com.data.Game;

import java.math.BigDecimal;
import java.util.ArrayList;
// Stores All of the actions entities are doing in the current frame
public class GameChanges
{
	public ArrayList<EntityAdd> EntityAdds;
	public ArrayList<EntityMove> EntityMoves;
	public ArrayList<EntityDelete> EntityDeletes;
	
	public BigDecimal PlayerX;
	public BigDecimal PlayerY;
	
	public boolean PlayerHasPitchFork;
	
	public BigDecimal PlayerVelX;
	public BigDecimal PlayerVelY;
	public GameChanges()
	{
		EntityAdds = new ArrayList<>();
		EntityMoves = new ArrayList<>();
		EntityDeletes = new ArrayList<>();
	}
}

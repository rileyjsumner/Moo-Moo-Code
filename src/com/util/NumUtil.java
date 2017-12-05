package com.util;

import com.data.Game.GameTiles;
import com.data.Map.MapTile;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class NumUtil
{
	
	public static  Collision Collision_entity_MapTiles(double entityX, double entityY, double entityRadius, GameTiles tiles)
	{
		Collision newPos;
		boolean hadCollision = false;
		for(int x =0;x<tiles.DimX;x++)
		{
			for(int y=0;y<tiles.DimY;y++)
			{
				if(tiles.Data[x][y]!=null)
				{
					MapTile tile = tiles.Data[x][y];
					if(tile.TileType == 1)
					{
						newPos = Collision_entity_MapTile(entityX,entityY,entityRadius,x,y);
						if(newPos.IsCollision)
						{
							entityX = newPos.Pos.X;
							entityY = newPos.Pos.Y;
							hadCollision = true;
						}
					}
				}
				
			}
		}
		return new Collision(hadCollision,new Vec2(entityX,entityY));
	}
	public static Collision Collision_entity_MapTile(double entityX,double entityY,double entityRadius,int tileX,int tileY)
	{
		// Find the closest point to the circle within the rectangle
		double closestX = Clamp(entityX, tileX, tileX+1);
		double closestY = Clamp(entityY, tileY, tileY+1);
		
		// Calculate the distance between the circle's center and this closest point
		double distanceX = entityX - closestX;
		double distanceY = entityY - closestY;
		
		// If the distance is less than the circle's radius, an intersection occurs
		double distanceSquared = (distanceX * distanceX) + (distanceY * distanceY);
		if( distanceSquared < (entityRadius * entityRadius))
		{
			// Normalize the distance to the entity center (make = to 1)
			Vec2 normalizedVec = new Vec2(distanceX,distanceY).Normalized();
			
			// Multiply by the entity radius, giving the needed offset
			normalizedVec.multiply(entityRadius);
			
			// Add the old position back
			normalizedVec.add(new Vec2(closestX,closestY));
			
			return new Collision(normalizedVec);
		}
		else{return new Collision();} // No collision occurs
	}
	public static float Distance(float p1,float p2)
	{
		return Math.abs(p1 - p2);
	}
	public static double Distance(double p1,double p2)
	{
		return Math.abs(p1 - p2);
	}
	public static double Distance(double x1,double x2,double y1,double y2)
	{
		return Math.hypot(x1-x2,y1-y2);
	}
	public static BigDecimal GetClean(double i)
	{
		BigDecimal r = BigDecimal.valueOf(i).setScale(5, RoundingMode.HALF_UP).stripTrailingZeros();
		if(r.scale()<0){r = r.setScale(0, RoundingMode.HALF_UP);}
		return r;
	}
	public static BigDecimal GetClean(float i)
	{
		BigDecimal r = BigDecimal.valueOf(i).setScale(5, RoundingMode.HALF_UP).stripTrailingZeros();
		if(r.scale()<0){r = r.setScale(0, RoundingMode.HALF_UP);}
		return r;
	}
	public static BigDecimal TrimTrailing(BigDecimal i)
	{
		i = i.setScale(5, RoundingMode.HALF_UP).stripTrailingZeros();
		if(i.scale()<0){i = i.setScale(0, RoundingMode.HALF_UP);}
		return i;
	}
	public static BigDecimal Clamp(BigDecimal initial,BigDecimal low,BigDecimal high)
	{
		if(initial.compareTo(high) > 0){return high;}
		else if(initial.compareTo(low) < 0 ){return low;}
		return initial;
	}
	public static BigDecimal Clamp(BigDecimal initial,BigDecimal low,double high)
	{
		return Clamp(initial,low,BigDecimal.valueOf(high));
	}
	public static BigDecimal Clamp(BigDecimal initial,double low,double high)
	{
		return Clamp(initial,BigDecimal.valueOf(low),BigDecimal.valueOf(high));
	}
	public static float Clamp(float val,float min,float max)
	{
		if(val > max){return max;}else if(val<min){return min;}return val;
	}
	public static double Clamp(double val,double min,double max)
	{
		if(val > max){return max;}else if(val<min){return min;}return val;
	}
}

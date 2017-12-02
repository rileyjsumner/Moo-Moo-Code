package com.util;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class NumUtil
{
	public static Collision Collision_Entity_MapTile(double entityX,double entityY, double entityRadius, int mapX, int mapY)
	{
		// Check if the circle center is inside the tile
		return new Collision();
	}
	public static boolean Collision_resolve_Maptile(double circleX,double circleY,double circleRadius,int tileX,int tileY)
	{
		float DeltaX = (float)circleX - Math.max(tileX, (float)Math.min(circleX, (tileX + 1)));
		float DeltaY = (float)circleY - Math.max(tileY, (float)Math.min(circleY, (tileY + 1)));
		System.out.println("Dx:"+DeltaX+", Dy:"+DeltaY);
		return (DeltaX * DeltaX + DeltaY * DeltaY) < (circleRadius * circleRadius);
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
	public static BigDecimal Cap(BigDecimal initial,BigDecimal low,BigDecimal high)
	{
		if(initial.compareTo(high) > 0){return high;}
		else if(initial.compareTo(low) < 0 ){return low;}
		return initial;
	}
	public static BigDecimal Cap(BigDecimal initial,BigDecimal low,float high)
	{
		return Cap(initial,low,BigDecimal.valueOf(high));
	}
	public static BigDecimal Cap(BigDecimal initial,float low,float high)
	{
		return Cap(initial,BigDecimal.valueOf(low),BigDecimal.valueOf(high));
	}
}

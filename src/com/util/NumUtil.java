package com.util;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class NumUtil
{
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

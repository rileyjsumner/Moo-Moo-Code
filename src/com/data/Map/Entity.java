package com.data.Map;
// Stores a dynamic entity (player, cow, hay bale)
public class Entity
{
	public int Type;
	public int Id;
	public String Name;
	public String Icon;
	
	public float X;
	public float Y;
	
	public float VelX;
	public float VelY;
	
	public Entity(float x,float y,int type,int id,String name)
	{
		X=x;Y=y;Type=type;Id=id;Name=name;VelX=0;VelY=0;
	}
	public Entity(int type, int id,String name,String icon)
	{
		Type=type;Id=id;Name=name;Icon=icon;VelX=0;VelY=0;
	}
}
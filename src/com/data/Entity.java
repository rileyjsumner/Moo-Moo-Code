package com.data;

public class Entity
{
	public int Type;
	public int Id;
	public String Name;
	public String Icon;
	
	public float X;
	public float Y;
	
	public Entity(float x,float y,int type,int id,String name)
	{
		X=x;Y=y;Type=type;Id=id;Name=name;
	}
	public Entity(int type,int id,String name,String icon)
	{
		Type=type;Id=id;Name=name;Icon=icon;
	}
}
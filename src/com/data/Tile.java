package com.data;

public class Tile {
	public String Name;
	public String Icon;
	public int Id;
	public int Type;
	public Tile()
	{
		Name="";Id=-1;Type = -1;
	}
	public Tile(int id, String name, String icon,int type)
	{
		Name=name;Icon=icon;Id = id;Type = type;
	}
}

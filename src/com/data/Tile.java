package com.data;

public class Tile {
	public String Name;
	public String Icon;
	public int Id;
	public Tile()
	{
		Name="";Id=-1;
	}
	public Tile(int id, String name, String icon)
	{
		Name=name;Icon=icon;Id = id;
	}
}

package com.data;

public class Lesson {
	public String Name;
	public int Num;
	public int CategoryNum;
	public int Id;
	public Lesson()
	{
		Name="unknown";Num=0;
	}
	public Lesson(int id,String name,int num)
	{
		Name=name;Num=num;Id = id;
	}
	public Lesson(int id,int num,int categoryNum)
	{
		Name="";Num=num;Id = id;CategoryNum=categoryNum;
	}
}

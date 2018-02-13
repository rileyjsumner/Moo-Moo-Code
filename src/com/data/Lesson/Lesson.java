package com.data.Lesson;

public class Lesson {
	public String Name;
	public int Num;
	public int CategoryNum;
	public int Id;
	public String text;
	public String startCode;
	
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
	public Lesson(int id, String name, int category_id, int lesson_id, String lesson_text, String start_code) {
		this.Id = id;
		this.Name = name;
		this.CategoryNum = category_id;
		this.Num = lesson_id;
		this.text = lesson_text;
		this.startCode = start_code;
	}
	public Lesson(int id, String name, int num, String text) {
		this.Id = id;
		this.Name = name;
		this.Num = num;
		this.text = text;
	}
}

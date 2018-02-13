package com.data.Lesson;

public class Binding
{
	public int id;
	public int lesson_id;
	public String title;
	public String value;
	
	public Binding(int b_id, int l_id, String name, String val)
	{ // binding class -> stores lesson bindings
		this.id = b_id;
		this.lesson_id = l_id;
		this.title = name;
		this.value = val;
	}
}

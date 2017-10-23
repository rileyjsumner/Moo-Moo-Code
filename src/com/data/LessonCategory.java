package com.data;

import java.util.ArrayList;

public class LessonCategory {
	public ArrayList<Lesson> Lessons;
	public String Name;
	public int Num;
	public int Id;
	public LessonCategory()
	{
		Lessons = new ArrayList<>();
	}
	public LessonCategory(String name,int num,int id)
	{
		Lessons = new ArrayList<>();Name = name;Num = num;Id = id;
	}
	public LessonCategory(ArrayList<Lesson> lessons)
	{
		Lessons = lessons;
	}
	public void newLesson(Lesson lesson)
	{
		Lessons.add(lesson);
	}
	public ArrayList<Lesson> getLessons()
	{
		return Lessons;
	}
}

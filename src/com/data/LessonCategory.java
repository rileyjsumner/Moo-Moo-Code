package com.data;

import java.util.ArrayList;

public class LessonCategory {
	public ArrayList<Lesson> Lessons;
	public String Name;
	public int Num;
	public LessonCategory()
	{
		Lessons = new ArrayList<>();
	}
	public LessonCategory(String name,int num)
	{
		Lessons = new ArrayList<>();Name = name;Num = num;
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

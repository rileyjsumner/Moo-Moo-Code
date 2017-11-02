package com.data;

public class LevelId {
	public int Id;
	public String Name;
	public int UnlocksFrom_1;
	public int UnlocksFrom_2;
	public int UnlocksFrom_3;
	public int PosX;
	public int PosY;
	public int State;// 0 = Invisible, 1 = Active, 2 = Complete
	public LevelId(){}
	public LevelId(int id,String name,int unlocksFrom_1,int unlocksFrom_2,int unlocksFrom_3,int posX,int posY)
	{
		Id = id;Name=name;UnlocksFrom_1=unlocksFrom_1;UnlocksFrom_2=unlocksFrom_2;UnlocksFrom_3=unlocksFrom_3;PosX=posX;PosY=posY;State = 0;
	}
}

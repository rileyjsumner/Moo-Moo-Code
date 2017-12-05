package com.util;

public class Collision
{
	public boolean IsCollision;
	public Vec2 Pos;
	public Collision(){IsCollision=false;}
	public Collision(Vec2 pos){IsCollision=true;Pos=pos;}
	public Collision(boolean isCollision,Vec2 pos){IsCollision=isCollision;Pos=pos;}
}

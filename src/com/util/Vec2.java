package com.util;

public class Vec2
{
	public double X;
	public double Y;
	public Vec2(double x,double y){X=x;Y=y;}
	public Vec2(){X=0;Y=0;}
	double Length(){
		return Math.sqrt(X * X + Y * Y);
	}
	void add(double scalar)
	{
		X+=scalar;Y+=scalar;
	}
	void add(Vec2 vec)
	{
		X+=vec.X;Y+=vec.Y;
	}
	void multiply(double scalar)
	{
		X*=scalar;Y*=scalar;
	}
	void multiply(Vec2 vec)
	{
		X*=vec.X;Y*=vec.Y;
	}
	void Normalize(){
		double length = Length();
		if(length != 0){
			X = X/length;
			Y = Y/length;
		}
	}
	Vec2 Normalized(){
		double length = Length();
		if(length != 0){
			return new Vec2(X/length,Y/length);
		}
		return new Vec2();
	}
}

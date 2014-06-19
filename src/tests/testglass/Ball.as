package tests.testglass
{
	import flash.display.Sprite;
	
	public class Ball extends Sprite
	{
		public function Ball(R:Number,color:Number):void
		{
			var ball_out:Ball_out=new Ball_out(R,color);
			addChild(ball_out);
			
			var ball_in:Ball_in=new Ball_in(0.72*R,0xFFFFFF);
			addChild(ball_in);
			ball_in.y=-0.28*R;
			ball_in.height=ball_in.height*0.93;
		}
	}
}

import flash.display.GradientType;
import flash.display.Sprite;
import flash.geom.Matrix;

class Ball_out extends Sprite
{
	public function Ball_out(R:Number,color:Number):void
	{
		var matrix:Matrix= new Matrix();
		matrix.createGradientBox(3*R,3*R,0,-1.5*R,-1.3*R);
		graphics.beginGradientFill(GradientType.RADIAL,[color,0x666666],[1,1],[110,255],matrix);
		graphics.drawCircle(0,0,R);
		graphics.endFill();
	}
}

import flash.display.Sprite;
import flash.geom.Matrix;
import flash.display.GradientType;

class Ball_in extends Sprite
{
	public function Ball_in(R:Number,color:Number):void
	{
		var matrix:Matrix= new Matrix();
		matrix.createGradientBox(R,2*R,0.5*Math.PI,0,-1.2*R);
		graphics.beginGradientFill(GradientType.LINEAR,[color,color],[0.9,0],[0,210],matrix);
		graphics.drawCircle(0,0,R);
		graphics.endFill();
	}
}
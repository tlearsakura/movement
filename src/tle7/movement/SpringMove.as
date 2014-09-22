package tle7.movement
{
	public class SpringMove
	{
		private var px:Number = 0, py:Number = 0;
		private var _targetX:Number = 0, _targetY:Number = 0;
		private var vx:Number = 0, vy:Number = 0;
		
		public var spring:Number = 0;
		public var friction:Number = 0;
		public var gravityX:Number = 0, gravityY:Number = 0;
		
		public function SpringMove()
		{
		}
		
		////////////////////////////////////////////////////////////////////////////////
		/////////////////////    setting  up    ////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
		public function set startX(sx:Number):void {
			px = sx;
		}
		public function set startY(sy:Number):void {
			px = sy;
		}
		
		public function set targetX(tx:Number):void {
			_targetX = tx;
		}
		public function set targetY(ty:Number):void {
			_targetY = ty;
		}
		
		/////////////////////////////////////////////////////////////////////
		///////////////////////  getting  up    /////////////////////////////
		/////////////////////////////////////////////////////////////////////
		public function get posX():Number {
			return px;
		}
		public function get posY():Number {
			return py;
		}
		
		public function update():void {
			var ax:Number = (_targetX - px) * spring;
			var ay:Number = (_targetY - py) * spring;
			vx += ax;
			vy += ay;
			vx += gravityX;
			vy += gravityY;
			vx *= friction;
			vy *= friction;
			px += vx;
			py += vy;
		}
	}
}
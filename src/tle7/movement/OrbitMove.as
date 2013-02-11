package tle7.movement
{
	public class OrbitMove
	{
		private var px:Number = 0;
		private var py:Number = 0;
		private var fromX:Number = 0;
		private var fromY:Number = 0;
		private var _speedX:Number = 0;
		private var _speedY:Number = 0;
		private var _radiusX:Number = 0;
		private var _radiusY:Number = 0;
		private var _angleX:Number = 0;
		private var _angleY:Number = 0;
		private var radX:Number;
		private var radY:Number;
		
		public function OrbitMove()
		{
		}
		
		////////////////////////////////////////////////////////////////////////////////
		/////////////////////    setting  up    ////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
		public function set startX(sx:Number):void {
			fromX = sx;
		}
		public function set startY(sy:Number):void {
			fromY = sy;
		}
		
		public function set radiusX(val:Number):void {
			_radiusX = val;
		}
		public function set radiusY(val:Number):void {
			_radiusY = val;
		}
		
		public function set speedX(val:Number):void {
			_speedX = val;
		}
		public function set speedY(val:Number):void {
			_speedY = val;
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
			_angleX += _speedX;
			radX = _angleX * (Math.PI / 180);
			_angleY += _speedY;
			radY = _angleY * (Math.PI / 180);
			px = fromX + (Math.cos(radX) * _radiusX);
			py = fromY + (Math.sin(radY) * _radiusY);
		}
	}
}
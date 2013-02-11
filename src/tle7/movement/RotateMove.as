package tle7.movement
{
	public class RotateMove
	{
		private var px:Number = 0;
		private var py:Number = 0;
		private var _targetX:Number;
		private var _targetY:Number;
		private var fromX:Number = 0;
		private var fromY:Number = 0;
		private var _speed:Number = 0;
		
		private var l1:Number;
		private var l2:Number;
		private var _distance:Number;
		private var _rotation:Number = NaN;
		
		public function RotateMove()
		{
		}
		
		////////////////////////////////////////////////////////////////////////////////
		/////////////////////    setting  up    ////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
		public function set startX(sx:Number):void {
			fromX = sx;
			px = sx;
		}
		public function set startY(sy:Number):void {
			fromY = sy;
			py = sy;
		}
		
		public function set targetX(tx:Number):void {
			_targetX = tx;
		}
		public function set targetY(ty:Number):void {
			_targetY = ty;
		}
		
		public function set speed(val:Number):void {
			_speed = val;
		}
		
		public function set rotation(val:Number):void {
			_rotation = val;
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
		public function get distance():Number {
			return _distance;
		}
		public function get rotation():Number {
			return _rotation;
		}
		
		public function clearTarget():void {
			_targetX = NaN;
			_targetY = NaN;
		}
		
		public function update():void {
			if(_targetX==0 || _targetX>0 || _targetX<0 && 
				_targetY==0 || _targetY>0 || _targetY<0){
				l1 = _targetX - px;
				l2 = _targetY - py;
				_rotation = Math.atan2(l2, l1);
				_distance = Math.sqrt((l1*l1) + (l2*l2));
			}
			px += Math.cos(_rotation) * _speed;
			py += Math.sin(_rotation) * _speed;
		}
	}
}
package tle7.movement
{
	import tle7.movement.easing.Linear;

	public class NormalMove
	{
		private var px:Number = 0;
		private var py:Number = 0;
		private var _targetX:Number = 0;
		private var _targetY:Number = 0;
		private var fromX:Number = 0;
		private var fromY:Number = 0;
		private var _easeX:Function = Linear.easeNone;
		private var _easeY:Function = Linear.easeNone;
		private var _time:int = 1;
		
		private var curtime:uint = 0;
		private var factorX:Number;
		private var factorY:Number;
		private var l1:Number;
		private var l2:Number;
		private var _distance:Number;
		
		public function NormalMove()
		{
		}
		
		////////////////////////////////////////////////////////////////////////////////
		/////////////////////    setting  up    ////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
		public function set startX(sx:Number):void {
			fromX = sx;
			curtime = 0;
			_distance = -1;
		}
		public function set startY(sy:Number):void {
			fromY = sy;
			curtime = 0;
			_distance = -1;
		}
		
		public function set targetX(tx:Number):void {
			_targetX = tx;
		}
		public function set targetY(ty:Number):void {
			_targetY = ty;
		}
		
		public function set easeX(ea:Function):void {
			_easeX = ea;
		}
		public function set easeY(ea:Function):void {
			_easeY = ea;
		}
		
		public function set time(t:Number):void {
			_time = t;
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
		
		public function update():void {
			if(curtime==_time) return;
			curtime++;
			factorX = _easeX(curtime, 0, 1, _time);
			factorY = _easeY(curtime, 0, 1, _time);
			px = fromX + ((_targetX - fromX) * factorX);
			py = fromY + ((_targetY - fromY) * factorY);
			l1 = _targetX - px;
			l2 = _targetY - py;
			_distance = Math.sqrt((l1*l1) + (l2*l2));
		}
	}
}
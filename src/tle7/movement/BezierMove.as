package tle7.movement
{
	import flash.geom.Point;
	
	import tle7.movement.easing.Back;
	import tle7.movement.easing.Elastic;
	import tle7.movement.easing.Linear;

	public class BezierMove
	{
		private var px:Number = 0;
		private var py:Number = 0;
		private var _nodes:Vector.<Object> = new Vector.<Object>;
		private var _quality:uint = 100;
		private var ind:uint = 0;
		private var _target:Number;
		private var step:Number;
		private var _ease:Function = Linear.easeNone;
		private var curtime:uint = 0;
		private var _time:Number = 1;
		private var factor:Number;
		private var _isfinish:Boolean = false;
		private var _orient:Boolean = false;
		private var _rotation:Number = 0;
		private var beforePoint:Point;
		
		private var s:Number;
		private var current:Object;
		private var next:Object;
		private var lengthB:uint;
		private var lx:Number;
		private var ly:Number;
		
		public function BezierMove()
		{
		}
		
		////////////////////////////////////////////////////////////////////////////////
		/////////////////////    setting  up    ////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
		public function set ease(ea:Function):void {
			_ease = ea;
		}
		
		public function set setCurve(set:Array):void {
			reset();
			_nodes.length = 0;
			var length:uint = set.length;
			var obj:Object;
			var ind:int = -1;
			for(var i:uint=0; i<length; i+=2){
				ind++;
				obj = new Object();
				obj.position = new Point(set[i][0],set[i][1]);
				if(i+1 < length) obj.control = new Point(set[i+1][0],set[i+1][1]);
				_nodes[ind] = obj;
			}
			lengthB = _nodes.length - 1;
			_target = lengthB * _quality;
		}
		
		public function set time(t:Number):void {
			_time = t;
		}
		
		public function set orient(val:Boolean):void {
			_orient = val;
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
		
		public function reset():void {
			ind = 0;
			curtime = 0;
			step = 0;
			beforePoint = null;
			_isfinish = false;
		}
		
		public function get isFinish():Boolean {
			return _isfinish;
		}
		
		public function get rotation():Number {
			return _rotation;
		}
		
		public function update():void {
			if(curtime==_time){
				_isfinish = true;
				return;
			}
			
			curtime++;
			factor = _ease(curtime, 0, 1, _time);
			step = 0 + ((_target - 0) * factor);
			
			if(step > (ind+1)*_quality && ind<lengthB-1) ind++;
			current = _nodes[ind];
			next = _nodes[ind + 1];
			s = ((step-(ind*_quality))/_quality*100)/100;
			px = (1 - s) * (1 - s) * current.position.x + (2 - 2 * s) * s * current.control.x + s * s * next.position.x;
			py = (1 - s) * (1 - s) * current.position.y + (2 - 2 * s) * s * current.control.y + s * s * next.position.y;
			
			if(_orient){
				if(!beforePoint){
					beforePoint = new Point(px,py);
				}else {
					lx = px - beforePoint.x;
					ly = py - beforePoint.y;
					beforePoint.x = px;
					beforePoint.y = py;
					_rotation = Math.atan2(ly, lx);
				}
			}
		}
	}
}
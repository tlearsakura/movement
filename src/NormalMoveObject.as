package
{
	import tle7.movement.NormalMove;
	import tle7.movement.easing.Bounce;
	import tle7.movement.easing.Circ;
	import tle7.movement.easing.Cubic;
	import tle7.movement.easing.Elastic;
	import tle7.movement.easing.Expo;
	import tle7.movement.easing.Quart;
	
	public final class NormalMoveObject extends MoveObject
	{
		
		private var move:NormalMove;
		private var _distance:Number;
		
		public function NormalMoveObject()
		{
			super();
			move = new NormalMove();
			move.easeX = Elastic.easeInOut;
			move.easeY = Elastic.easeInOut; /*Bounce.easeOut*/;
		}
		
		public function setTarget(tx:Number,ty:Number,time:Number):void {
			move.startX = this.x;
			move.startY = this.y;
			move.targetX = tx;
			move.targetY = ty;
			move.time = time;
		}
		
		public function setStart(sx:Number,sy:Number):void {
			this.x = sx;
			this.y = sy;
			move.startX = sx;
			move.startY = sy;
		}
		
		public function get distance():Number {
			return _distance;
		}
		
		override public function update():void {
			move.update();
			this.x = move.posX;
			this.y = move.posY;
			_distance = move.distance;
		}
	}
}
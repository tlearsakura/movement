package
{
	import tle7.movement.NormalMove;
	import tle7.movement.easing.Bounce;
	
	public final class MoveObject1 extends MoveObject
	{
		
		private var move:NormalMove;
		private var _distance:Number;
		
		public function MoveObject1()
		{
			super();
			move = new NormalMove();
			move.easeY = Bounce.easeOut;
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
package
{
	import tle7.movement.SpringMove;

	public final class SpringMoveObject extends MoveObject
	{
		private var move:SpringMove;
		
		public function SpringMoveObject()
		{
			super();
			move = new SpringMove();
			move.friction = .9;
			move.spring = .1;
			//move.gravityX = 10;
			//move.gravityY = 20;
		}
		
		public function setStart(sx:Number,sy:Number):void {
			this.x = sx;
			this.y = sy;
			move.startX = sx;
			move.startY = sy;
		}
		
		public function setTarget(tx:Number,ty:Number):void {
			move.targetX = tx;
			move.targetY = ty;
		}
		
		override public function update():void {
			move.update();
			this.x = move.posX;
			this.y = move.posY;
		}
	}
}
package
{
	import tle7.movement.OrbitMove;

	public final class OrbitMoveObject extends MoveObject
	{
		private var move:OrbitMove;
		
		public function OrbitMoveObject()
		{
			super();
			move = new OrbitMove();
			move.speedX = 3;
			move.speedY = 3;
		}
		
		public function setMove(px:Number,py:Number,rx:Number,ry:Number):void {
			move.startX = px;
			move.startY = py;
			move.radiusX = rx;
			move.radiusY = ry;
		}
		
		override public function update():void {
			move.update();
			this.x = move.posX;
			this.y = move.posY;
		}
	}
}
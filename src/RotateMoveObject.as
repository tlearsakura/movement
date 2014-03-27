package
{
	import tle7.movement.RotateMove;

	public final class RotateMoveObject extends MoveObject
	{
		private var move:RotateMove;
		
		public function RotateMoveObject()
		{
			super();
			move = new RotateMove();
		}
		
		public function set rotate(val:Number):void {
			move.rotation = val;
		}
		
		public function setMove(ro:Number,speed:Number):void {
			move.startX = this.x;
			move.startY = this.y;
			move.rotation = ro;
			move.speed = speed;
		}
		
		override public function update():void {
			move.update();
			this.x = move.posX;
			this.y = move.posY;
		}
	}
}
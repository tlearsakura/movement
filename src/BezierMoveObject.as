package
{
	import tle7.movement.BezierMove;
	import tle7.movement.easing.Back;
	import tle7.movement.easing.Bounce;
	import tle7.movement.easing.Circ;
	import tle7.movement.easing.Cubic;
	import tle7.movement.easing.Elastic;
	import tle7.movement.easing.Expo;
	import tle7.movement.easing.Linear;
	import tle7.movement.easing.Quad;
	import tle7.movement.easing.Quart;
	import tle7.movement.easing.Quint;
	import tle7.movement.easing.Sine;
	import tle7.movement.easing.Strong;

	public final class BezierMoveObject extends MoveObject
	{
		private var move:BezierMove;
		
		public function BezierMoveObject()
		{
			super();
			move = new BezierMove();
			move.orient = true;
			move.time = 5*30;
			move.ease = Back.easeInOut;
		}
		
		public function setCurve(ar:Array):void {
			move.setCurve = ar;
		}
		
		public function get isFinish():Boolean {
			return move.isFinish;
		}
		
		public function reStart():void {
			move.reset();
		}
		
		override public function update():void {
			move.update();
			this.x = move.posX;
			this.y = move.posY;
			this.rotation = move.rotation * 180 / Math.PI;
		}
	}
}
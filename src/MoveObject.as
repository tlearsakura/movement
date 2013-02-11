package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class MoveObject extends Sprite
	{
		private var shape:Shape;
		
		public function MoveObject()
		{
			shape = new Shape();
			shape.graphics.beginFill(0);
			shape.graphics.drawCircle(0,0,20);
			shape.graphics.endFill();
			shape.x = -(10);
			shape.y = -(10);
			this.addChild(shape);
		}
		
		public function update():void {
			
		}
	}
}
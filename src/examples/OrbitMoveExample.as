package examples
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class OrbitMoveExample extends Sprite
	{
		private var allobj:Vector.<OrbitMoveObject> = new Vector.<OrbitMoveObject>;
		
		public function OrbitMoveExample()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onInit);
			
		}
		
		protected function onInit(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onInit);
			
			var obj:OrbitMoveObject;
			//for(var i:int=0; i<5; i++){
				obj = new OrbitMoveObject();
				obj.x = .5 * stage.stageWidth;
				obj.y = .5 * stage.stageHeight;
				obj.setMove(obj.x,obj.y,200,200);
				allobj[allobj.length] = obj;
				this.addChild(obj);
			//}
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		protected function loop(e:Event):void {
			for(var i:uint; i<allobj.length; i++){
				allobj[i].update();
			}
		}
	}
}
package examples
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public final class SpringMoveExample extends Sprite
	{
		private var allobj:Vector.<SpringMoveObject> = new Vector.<SpringMoveObject>;
		
		public function SpringMoveExample()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onInit);
		}
		
		protected function onInit(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onInit);
			
			var obj:SpringMoveObject;
			//for(var i:int=0; i<5; i++){
				obj = new SpringMoveObject();
				obj.x = Math.random() * stage.stageWidth;
				obj.y = Math.random() * stage.stageHeight;
				obj.setStart(obj.x,obj.y);
				allobj[allobj.length] = obj;
				this.addChild(obj);
			//}
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		protected function loop(e:Event):void {
			for(var i:uint; i<allobj.length; i++){
				allobj[i].setTarget(mouseX,mouseY);
				allobj[i].update();
			}
		}
	}
}
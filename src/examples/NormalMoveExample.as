package examples
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public final class NormalMoveExample extends Sprite
	{
		private var allobj:Vector.<NormalMoveObject> = new Vector.<NormalMoveObject>;
		
		public function NormalMoveExample()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onInit);
		}
		
		protected function onInit(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onInit);
			
			var obj:NormalMoveObject;
			for(var i:int=0; i<5; i++){
				obj = new NormalMoveObject();
				obj.x = Math.random() * stage.stageWidth;
				obj.y = Math.random() * stage.stageHeight;
				obj.setTarget(Math.random()*stage.stageWidth, Math.random()*stage.stageHeight, 3*30);
				allobj[allobj.length] = obj;
				this.addChild(obj);
			}
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		protected function loop(e:Event):void {
			for(var i:uint; i<allobj.length; i++){
				allobj[i].update();
				if(allobj[i].distance == 0){
					allobj[i].setStart(Math.random()*stage.stageWidth, Math.random()*stage.stageHeight);
				}
			}
		}
	}
}
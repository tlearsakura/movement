package examples
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import tle7.movement.Utils;
	
	public class RotateMoveExample extends Sprite
	{
		private var allobj:Vector.<RotateMoveObject> = new Vector.<RotateMoveObject>;
		
		public function RotateMoveExample()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onInit);
		}
		
		protected function onInit(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onInit);
			
			var obj:RotateMoveObject;
			for(var i:int=0; i<5; i++){
				obj = new RotateMoveObject();
				obj.x = Math.random() * stage.stageWidth;
				obj.y = Math.random() * stage.stageHeight;
				obj.rotation = Math.random()*360;
				obj.setMove(Utils.deg2rad(obj.rotation), Math.random()*5);
				allobj[allobj.length] = obj;
				this.addChild(obj);
			}
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		protected function loop(e:Event):void {
			for(var i:uint; i<allobj.length; i++){
				allobj[i].update();
			}
		}
	}
}
package examples
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class BezierMoveExample extends Sprite
	{
		private var allobj:Vector.<BezierMoveObject> = new Vector.<BezierMoveObject>;
		
		public function BezierMoveExample()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onInit);
		}
		
		protected function onInit(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onInit);
			
			var obj:BezierMoveObject;
			for(var i:int=0; i<5; i++){
				obj = new BezierMoveObject();
				obj.x = stage.stageWidth * .9;
				obj.y = 300;
				obj.setCurve([[obj.x,obj.y],[600,600],[450,200],[300,0],[100,300]]);
				allobj[allobj.length] = obj;
				this.addChild(obj);
			}
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		protected function loop(e:Event):void {
			for(var i:uint; i<allobj.length; i++){
				allobj[i].update();
				if(allobj[i].isFinish) allobj[i].reStart();
			}
		}
	}
}
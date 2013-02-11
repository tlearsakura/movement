package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="960", height="640", frameRate="30")]
	public class Example1 extends Sprite
	{
		private var obj1:MoveObject1;
		private var obj2:MoveObject2;
		private var obj3:MoveObject3;
		private var obj4:MoveObject4;
		
		private var allobj:Vector.<MoveObject> = new Vector.<MoveObject>;
		
		public function Example1()
		{
			obj1 = new MoveObject1();
			obj1.x = 50;
			obj1.y = 50;
			obj1.setTarget(700,500,2*30);
			allobj[allobj.length] = obj1;
			this.addChild(obj1);
			
			obj2 = new MoveObject2();
			obj2.x = 800;
			obj2.y = 600;
			obj2.rotation = 240;
			obj2.setMove(obj2.rotation*Math.PI/180,1);
			allobj[allobj.length] = obj2;
			this.addChild(obj2);
			
			obj3 = new MoveObject3();
			obj3.x = 480;
			obj3.y = 320;
			obj3.setMove(obj3.x,obj3.y,200,200);
			allobj[allobj.length] = obj3;
			this.addChild(obj3);
			
			obj4 = new MoveObject4();
			obj4.x = 900;
			obj4.y = 300;
			obj4.setCurve([[900,300],[700,600],[500,200],[300,0],[100,300]]);
			allobj[allobj.length] = obj4;
			this.addChild(obj4);
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		protected function loop(e:Event):void
		{
			for(var i:uint; i<allobj.length; i++){
				allobj[i].update();
				if(allobj[i] is MoveObject1){
					if(MoveObject1(allobj[i]).distance == 0){
						MoveObject1(allobj[i]).setStart(50,50);
					}
				}else if(allobj[i] is MoveObject4){
					if(MoveObject4(allobj[i]).isFinish){
						MoveObject4(allobj[i]).reStart();
					}
				}
			}
		}
	}
}
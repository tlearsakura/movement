package
{
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	
	import examples.*;
	
	[SWF(width="800", height="600", frameRate="30")]
	public class Example extends Sprite
	{
		
		private var ex:Sprite;
		private var ex_path:String = 'examples.';
		
		NormalMoveExample; RotateMoveExample; OrbitMoveExample; BezierMoveExample;
		public function Example()
		{
			ex_path += 'BezierMoveExample';
			
			var tmpClass:Class = getDefinitionByName(ex_path) as Class;
			ex = new tmpClass();
			this.addChild(ex);
			
			/*
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
			
			this.addEventListener(Event.ENTER_FRAME, loop);*/
		}
		
		/*protected function loop(e:Event):void
		{
			for(var i:uint; i<allobj.length; i++){
				allobj[i].update();
				if(allobj[i] is NormalMoveObject){
					if(NormalMoveObject(allobj[i]).distance == 0){
						NormalMoveObject(allobj[i]).setStart(50,50);
					}
				}else if(allobj[i] is MoveObject4){
					if(MoveObject4(allobj[i]).isFinish){
						MoveObject4(allobj[i]).reStart();
					}
				}
			}
		}*/
	}
}
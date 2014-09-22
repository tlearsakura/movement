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
		
		NormalMoveExample; RotateMoveExample; OrbitMoveExample; BezierMoveExample; SpringMoveExample;
		public function Example()
		{
			
			ex_path += 'SpringMoveExample';
			
			var tmpClass:Class = getDefinitionByName(ex_path) as Class;
			ex = new tmpClass();
			this.addChild(ex);
			
		}
	}
}
package tle7.movement
{
	public class Utils
	{
		public function Utils()
		{
		}
		
		public static function deg2rad(deg:Number):Number {
			return deg * Math.PI / 180;
		}
		
		public static function rad2deg(rad:Number):Number {
			return rad * 180 / Math.PI;
		}
	}
}
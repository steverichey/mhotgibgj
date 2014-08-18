package;

import flixel.FlxG;
import flixel.math.FlxPoint;

class RNG
{
	static public function flo(Value:Float):Float
	{
		return FlxG.random.float(Value * 0.9, Value * 1.1);
	}
	
	static public function int(Value:Int):Int
	{
		return FlxG.random.int(Math.round(Value * 0.9), Math.round(Value * 1.1));
	}
	
	static public function str(Value:String):String
	{
		pos = FlxG.random.int(0, Value.length);
		char = String.fromCharCode(FlxG.random.int(0, 127));
		replace = FlxG.random.bool();
		
		return Value.substring(0, pos) + char + Value.substring(replace ? pos + 1 : pos, Value.length);
	}
	
	static public function ver():Array<FlxPoint>
	{
		var result:Array<FlxPoint> = [];
		
		for (i in 0...FlxG.random.int(10, 100))
		{
			result.push(FlxPoint.get(FlxG.random.float(-10, FlxG.width + 10), FlxG.random.float(-10, FlxG.height + 10)));
		}
		
		return result;
	}
	
	static private var char:String = "";
	static private var pos:Int = 0;
	static private var replace:Bool = false;
}
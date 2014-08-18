package;

import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.addons.effects.FlxGlitchSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Text extends FlxGlitchSprite
{
	public var text(get, set):String;
	
	private var flixeltext:FlxText;
	private var initial:String = "";
	private var spawn:FlxPoint = FlxPoint.get();
	
	inline static private var ANGLE_MAX:Int = 10;
	inline static private var SCALE_MAX:Float = 1.1;
	inline static private var SPEED:Float = 1.2;
	inline static private var CHAR_INSERT_CHANCE:Float = 10;
	inline static private var JIGGLE_CHANCE:Float = 5;
	
	public function new(X:Float = 0, Y:Float = 0, Content:String = "Hi", Size:Int = 16)
	{
		flixeltext = new FlxText(RNG.flo(X), RNG.flo(Y), RNG.flo(FlxG.width), Content, RNG.int(Size));
		flixeltext.alignment = "center";
		
		super(flixeltext, 1, 2);
		
		angle = RNG.flo(ANGLE_MAX * FlxG.random.sign());
		color = FlxG.random.color();
		initial = Content;
		spawn.set(X, Y);
		
		FlxTween.tween(this, {angle: RNG.flo(angle * -1)}, RNG.flo(SPEED), { ease: FlxEase.sineInOut, type: FlxTween.PINGPONG } );
		FlxTween.tween(scale, { x: RNG.flo(SCALE_MAX) }, RNG.flo(SPEED), { ease: FlxEase.sineInOut, type: FlxTween.PINGPONG } );
		FlxTween.tween(scale, { y: RNG.flo(SCALE_MAX) }, RNG.flo(SPEED), { ease: FlxEase.sineInOut, type: FlxTween.PINGPONG } );
		FlxTween.color(this, RNG.flo(SPEED), this.color, FlxG.random.color(), { ease: FlxEase.sineInOut, type: FlxTween.PINGPONG } );
	}
	
	override public function update():Void
	{
		if (FlxG.random.bool(CHAR_INSERT_CHANCE))
		{
			shiftText(RNG.str(initial));
		}
		else if (text != initial)
		{
			text = initial;
		}
		
		if (FlxG.random.bool(JIGGLE_CHANCE))
		{
			if (FlxG.random.bool())
			{
				x += FlxG.random.float( -2, 2);
			}
			else
			{
				y += FlxG.random.float( -2, 2);
			}
		}
		else
		{
			x = spawn.x;
			y = spawn.y;
		}
		
		super.update();
	}
	
	public function shiftText(Value:String, Destructive:Bool = false):String
	{
		if (Destructive)
		{
			initial = Value;
		}
		
		flixeltext.text = Value;
		initPixels();
		
		return Value;
	}
	
	private inline function get_text():String
	{
		return flixeltext.text;
	}
	
	private function set_text(Value:String):String
	{
		flixeltext.text = initial = Value;
		initPixels();
		
		return Value;
	}
}
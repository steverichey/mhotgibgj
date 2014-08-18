package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil;

class Player extends FlxSprite
{
	inline static private var ACCEL:Float = 100;
	inline static private var MAXVEL:Float = 200;
	inline static private var DRAG:Float = 800;
	
	public function new()
	{
		super();
		loadGraphic("assets/images/player.png");
		
		maxVelocity.set(MAXVEL, MAXVEL);
		drag.set(DRAG, DRAG);
		
		FlxSpriteUtil.screenCenter(this);
	}
	
	override public function update()
	{
		if (FlxG.keys.pressed.LEFT)
		{
			acceleration.x -= ACCEL;
			acceleration.y = 0;
			velocity.y = 0;
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			acceleration.x += ACCEL;
			acceleration.y = 0;
			velocity.y = 0;
		}
		else if (FlxG.keys.pressed.UP)
		{
			acceleration.y -= ACCEL;
			acceleration.x = 0;
			velocity.x = 0;
		}
		else if (FlxG.keys.pressed.DOWN)
		{
			acceleration.y += ACCEL;
			acceleration.x = 0;
			velocity.x = 0;
		}
		else
		{
			acceleration.set(0, 0);
		}
		
		super.update();
	}
}
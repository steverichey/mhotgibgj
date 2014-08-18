package;

import flash.display.BitmapData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxVersion;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;
import flixel.math.FlxPoint;

/**
 * You carry a door. If an enemy get close, the door will open, sucking it in. If the door is closed, enemies can damage the door.
 * Metroidvania. All doors are in the wrong places & can only be opened & walked through when carried & placed in the right places.
 */
class MenuState extends FlxState
{
	private var info:FlxText;
	private var title:Text;
	private var start:Text;
	private var bg:FlxSprite;
	private var grad:FlxSprite;
	private var glitch:FlxSprite;
	
	inline static private var GAME_NAME:String = "ALT-STAB-DELETE";
	inline static private var INFO:String = "A GAME BY STVR / FOR MOSHBOY'S HYPOCRITICAL\nONE THOUSAND GAME IDEA BIRTHDAY GAME JAM \n MADE WITH ";
	
	override public function create():Void
	{
		super.create();
		
		FlxG.autoPause = false;
		
		info = new FlxText(0, 0, FlxG.width, INFO + FlxG.VERSION.toString().toUpperCase());
		info.alignment = "center";
		info.alpha = 0;
		
		new FlxTimer(0.5, fadeInfo);
		
		title = new Text(0, 0, GAME_NAME, 48);
		FlxSpriteUtil.screenCenter(title);
		
		start = new Text(0, FlxG.height - 32, "PRESS SPACE");
		
		bg = new FlxSprite();
		bg.color = FlxG.random.color();
		bg.makeGraphic(FlxG.width, FlxG.height);
		FlxSpriteUtil.drawPolygon(bg, RNG.ver(), bg.color.getInverted());
		
		grad = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [FlxG.random.color(), FlxG.random.color()]);
		grad.alpha = RNG.flo(0.4);
		
		FlxTween.color(bg, RNG.flo(4), bg.color, FlxG.random.color(), { ease: FlxEase.sineInOut, type: FlxTween.PINGPONG } );
		FlxTween.tween(grad, {alpha: RNG.flo(0.2)}, RNG.flo(1), { ease: FlxEase.sineInOut, type: FlxTween.PINGPONG } );
		
		add(bg);
		add(title);
		add(start);
		add(grad);
		add(info);
	}

	override public function update():Void
	{
		#if debug
		if (FlxG.keys.justPressed.R)
		{
			FlxG.resetGame();
		}
		#end
		
		if (FlxG.keys.justPressed.ANY && !FlxG.keys.justPressed.SPACE)
		{
			start.text = "I SAID PRESS SPACE";
		}
		else if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new PlayState());
		}
		
		super.update();
	}
	
	private function fadeInfo(t:FlxTimer):Void
	{
		FlxTween.tween(info, { alpha: RNG.flo(0.5) }, RNG.flo(1));
	}
}
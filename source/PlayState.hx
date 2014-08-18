package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var player:Player;
	private var level:Level;
	
	override public function create():Void
	{
		super.create();
		
		player = new Player();
		level = new Level();
		
		add(level);
		add(player);
	}

	override public function update():Void
	{
		FlxG.collide(player, level);
		
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MenuState());
		}
		
		if (player.x < 0)
		{
			// pan left
		}
		
		if (player.x > FlxG.width)
		{
			// pan right
		}
		
		if (player.y < 0)
		{
			// pan up
		}
		
		if (player.y > FlxG.height)
		{
			// pan down
		}
		
		super.update();
	}	
}
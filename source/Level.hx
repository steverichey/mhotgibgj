package;

import openfl.Assets;

import flixel.FlxG;
import flixel.tile.FlxTilemap;

class Level extends FlxTilemap
{
	private var data:String = "";
	
	public function new()
	{
		super();
		
		data = Assets.getText("assets/data/lvl" + GridX + GridY + ".txt");
		
		loadMap(data, "assets/images/tiles.png", 16, 16, null, 1, 0, 2);
	}
	
	public static var GridX:Int = 5;
	public static var GridY:Int = 5;
}
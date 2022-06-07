package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import Song.SwagSong;

class BackgroundDancer extends FlxSprite
{
	
	public static var curStage:String = '';
	public static var SONG:SwagSong = null;
	
	public function new(x:Float, y:Float)
	{
		super(x, y);
				
        var songName:String = Paths.formatToSongPath(SONG.song);
		curStage = PlayState.SONG.stage;
		switch (curStage)
		{
			case 'limoVitas': 
				frames = Paths.getSparrowAtlas("limo/limoDancer");
		    case 'limoThank': 
				frames = Paths.getSparrowAtlas("limoThank/limoDancer");
			case 'limoJp': 
				frames = Paths.getSparrowAtlas("limoJp/limoDancer");
			default:
			    frames = Paths.getSparrowAtlas("limoJp/limo");
		}
		animation.addByIndices('danceLeft', 'bg dancer sketch PINK', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'bg dancer sketch PINK', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.play('danceLeft');
		antialiasing = ClientPrefs.globalAntialiasing;
	}

	var danceDir:Bool = false;

	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('danceRight', true);
		else
			animation.play('danceLeft', true);
	}
}

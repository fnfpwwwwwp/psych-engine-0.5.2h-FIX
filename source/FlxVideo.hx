package;

import flixel.FlxBasic;
import flixel.FlxG;

class FlxVideo extends FlxBasic
{
	public var finishCallback:Void->Void = null;

	#if VIDEOS_ALLOWED
	public function new(path:String)
	{
		super();

		var video:VideoHandler = new VideoHandler();
		video.finishCallback = function()
		{
			if (finishCallback != null)
				finishCallback();
		}
		video.playVideo(SUtil.getPath() + path, false, false);
		#else
		if (finishCallback != null)
			finishCallback();
	}
	#end
}

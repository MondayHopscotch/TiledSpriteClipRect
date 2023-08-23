package;

import bitdecay.flixel.debug.DebugDraw;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.display.FlxTiledSprite;
import flixel.math.FlxRect;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var tiler:FlxTiledSprite;
	var testClip = FlxRect.get(-10, -10, 0, 0);

	override public function create()
	{
		super.create();

		tiler = new FlxTiledSprite(AssetPaths.tile_base__png, 250, 150);
		FlxTween.tween(testClip, {x: 260}, 2, {type: FlxTweenType.PINGPONG});
		FlxTween.tween(testClip, {y: 160}, 2.3, {type: FlxTweenType.PINGPONG});
		FlxTween.tween(testClip, {width: 200}, 1.3, {type: FlxTweenType.PINGPONG});
		FlxTween.tween(testClip, {height: 125}, 1.76, {type: FlxTweenType.PINGPONG});
		add(tiler);

		DebugDraw.init();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.SPACE)
		{
			tiler.clipRect = null;
		}
		else
		{
			tiler.clipRect = testClip;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			tiler.x -= 1;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			tiler.x += 1;
		}
		if (FlxG.keys.pressed.UP)
		{
			tiler.y -= 1;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			tiler.y += 1;
		}

		if (FlxG.keys.pressed.W)
		{
			camera.zoom += .01;
		}
		if (FlxG.keys.pressed.S)
		{
			camera.zoom -= .01;
		}

		if (FlxG.keys.pressed.E)
		{
			tiler.scale.scale(1.01);
		}
		if (FlxG.keys.pressed.D)
		{
			tiler.scale.scale(0.99);
		}

		DebugDraw.ME.drawWorldRect(testClip.x + tiler.x, testClip.y + tiler.y, testClip.width, testClip.height);
		DebugDraw.ME.drawWorldRect(tiler.x, tiler.y, tiler.width, tiler.height, null, FlxColor.YELLOW);
	}
}

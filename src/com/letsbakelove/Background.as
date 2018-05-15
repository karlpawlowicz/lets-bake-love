package com.letsbakelove
{
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.events.Event;
	
	public class Background extends Sprite
	{
		public var bg:Sprite;
		public var pattern:BitmapData;
		
		public function Background():void
		{
			bg = new Sprite();
			pattern = new Pattern(1, 1);
			alpha = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();
			
			addChild(bg);
			
			Tweener.addTween(this, {alpha:1, time:1});
		}
		
		private function onResize(e:Event = null):void
		{
			bg.graphics.clear();
			bg.graphics.beginBitmapFill(pattern);
			bg.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			bg.graphics.endFill();
		}
	}
}
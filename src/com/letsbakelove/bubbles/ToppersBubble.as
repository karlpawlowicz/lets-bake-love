package com.letsbakelove.bubbles
{
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ToppersBubble extends Sprite
	{
		public function ToppersBubble():void
		{
			alpha = scaleX = scaleY = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();
			
			Tweener.addTween(this, {alpha:1, scaleX:1, scaleY:1, time:1, delay:5.5, transition:'easeOutElastic'});
		}
		
		private function onResize(e:Event = null):void
		{
			x = Math.round(stage.stageWidth * .5 + 251);
			y = 195;
		}
		
		public function show():void
		{
			Tweener.addTween(this, {alpha:1, scaleX:1, scaleY:1, time:1, delay:.5, transition:'easeOutElastic'});
		}
		
		public function hide():void
		{
			Tweener.addTween(this, {alpha:0, scaleX:0, scaleY:0, time:1});
		}
	}
}
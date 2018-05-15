package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Spider extends MovieClip
	{
		public var id:Number = 19;
		
		public var image:MovieClip;
		
		public function Spider():void
		{
			alpha = 0;
			scaleX = scaleY = .95;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			Tweener.addTween(this, {alpha:1, time:1});
		}
		
		public function slide_in():void
		{
			x = -57;
			y = 430;
			
			Tweener.addTween(this, {x:9, y:430, time:1, delay:2});
		}
	}
}
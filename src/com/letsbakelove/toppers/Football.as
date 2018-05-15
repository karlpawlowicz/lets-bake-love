package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Football extends MovieClip
	{
		public var id:Number = 11;
		
		public var image:MovieClip;
		
		public function Football():void
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
			x = 1019;
			y = 47;
			
			Tweener.addTween(this, {x:926, y:47, time:1, delay:2});
		}
	}
}
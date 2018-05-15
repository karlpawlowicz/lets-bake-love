package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Broccoli extends MovieClip
	{
		public var id:Number = 4;
		
		public var image:MovieClip;
		
		public function Broccoli():void
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
			x = 985;
			y = 222;
			
			Tweener.addTween(this, {x:749, y:222, time:1, delay:2});
		}
	}
}
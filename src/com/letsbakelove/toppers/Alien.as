package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Alien extends MovieClip
	{
		public var id:Number = 0;
		
		public var image:MovieClip;
		
		public function Alien():void
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
			x = -49;
			y = 262;
			
			Tweener.addTween(this, {x:182, y:262, time:1, delay:2});
		}
	}
}
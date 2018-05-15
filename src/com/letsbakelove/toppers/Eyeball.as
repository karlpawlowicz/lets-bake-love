package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Eyeball extends MovieClip
	{
		public var id:Number = 10;
		
		public var image:MovieClip;
		
		public function Eyeball():void
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
			x = -37;
			y = 397;
			
			Tweener.addTween(this, {x:101, y:397, time:1, delay:2});
		}
	}
}
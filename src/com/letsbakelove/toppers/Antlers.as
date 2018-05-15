package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Antlers extends MovieClip
	{
		public var id:Number = 1;
		
		public var image:MovieClip;
		
		public function Antlers():void
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
			x = 1058;
			y = 143;
			
			Tweener.addTween(this, {x:965, y:143, time:1, delay:2});
		}
	}
}
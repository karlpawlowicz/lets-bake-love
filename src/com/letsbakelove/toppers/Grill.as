package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Grill extends MovieClip
	{
		public var id:Number = 12;
		
		public var image:MovieClip;
		
		public function Grill():void
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
			x = 1007;
			y = 243;
			
			Tweener.addTween(this, {x:856, y:243, time:1, delay:2});
		}
	}
}
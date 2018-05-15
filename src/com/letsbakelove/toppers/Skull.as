package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Skull extends MovieClip
	{
		public var id:Number = 18;
		
		public var image:MovieClip;
		
		public function Skull():void
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
			x = 979;
			y = 359;
			
			Tweener.addTween(this, {x:835, y:359, time:1, delay:2});
		}
	}
}
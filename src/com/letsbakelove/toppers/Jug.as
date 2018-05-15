package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Jug extends MovieClip
	{
		public var id:Number = 15;
		
		public var image:MovieClip;
		
		public function Jug():void
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
			x = 995;
			y = 167;
			
			Tweener.addTween(this, {x:869, y:167, time:1, delay:2});
		}
	}
}
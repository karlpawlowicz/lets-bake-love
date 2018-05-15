package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class JustMarried extends MovieClip
	{
		public var id:Number = 16;
		
		public var image:MovieClip;
		
		public function JustMarried():void
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
			x = 369;
			y = 579;
			
			Tweener.addTween(this, {x:369, y:482, time:1, delay:2});
		}
	}
}
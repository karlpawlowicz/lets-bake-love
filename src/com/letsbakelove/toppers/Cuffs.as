package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Cuffs extends MovieClip
	{
		public var id:Number = 8;
		
		public var image:MovieClip;
		
		public function Cuffs():void
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
			x = 996;
			y = 318;
			
			Tweener.addTween(this, {x:777, y:318, time:1, delay:2});
		}
	}
}
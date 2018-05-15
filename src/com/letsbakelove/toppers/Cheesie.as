package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Cheesie extends MovieClip
	{
		public var id:Number = 6;
		
		public var image:MovieClip;
		
		public function Cheesie():void
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
			x = -50;
			y = 128;
			
			Tweener.addTween(this, {x:54, y:128, time:1, delay:2});
		}
	}
}
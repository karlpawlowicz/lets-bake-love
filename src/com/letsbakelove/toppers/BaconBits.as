package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class BaconBits extends MovieClip
	{
		public var id:Number = 2;
		
		public var image:MovieClip;
		
		public function BaconBits():void
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
			x = -70;
			y = 57;
			
			Tweener.addTween(this, {x:3, y:57, time:1, delay:2});
		}
	}
}
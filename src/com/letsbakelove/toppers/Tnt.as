﻿package com.letsbakelove.toppers
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Tnt extends MovieClip
	{
		public var id:Number = 20;
		
		public var image:MovieClip;
		
		public function Tnt():void
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
			x = 735;
			y = 561;
			
			Tweener.addTween(this, {x:735, y:446, time:1, delay:2});
		}
	}
}
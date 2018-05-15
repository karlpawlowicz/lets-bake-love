package com.letsbakelove
{
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Loading extends Sprite
	{
		private var _content:Content;
		
		public var dial:MovieClip;
		public var needle:MovieClip;
		public var text:TextField;
		
		public function Loading(content:Content):void
		{
			_content = content;
			visible = false;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();
		}
		
		private function onResize(e:Event = null):void
		{
			x = Math.round(stage.stageWidth * .5 - 938 * .5);
			y = 5;
		}
		
		public function show():void
		{
			visible = true;
			
			addEventListener(Event.ENTER_FRAME, enter_frame);
		}
		
		private function enter_frame(e:Event):void
		{
			needle.rotation += 5;
		}
		
		public function hide():void
		{
			removeEventListener(Event.ENTER_FRAME, enter_frame);
			
			visible = false;
		}
	}
}
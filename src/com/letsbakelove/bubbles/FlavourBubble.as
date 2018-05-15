package com.letsbakelove.bubbles
{
	import com.letsbakelove.Content;
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class FlavourBubble extends Sprite
	{
		private var _content:Content;
		
		public function FlavourBubble(content:Content):void
		{
			_content = content;
			alpha = scaleX = scaleY = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();
			
			_content._table.mouseChildren = false;
			
			Tweener.addTween(this, {alpha:1, scaleX:1, scaleY:1, time:1, delay:5, transition:'easeOutElastic'});
		}
		
		private function onResize(e:Event = null):void
		{
			x = Math.round(stage.stageWidth * .5 - 405);
			y = 250;
		}
		
		public function show():void
		{
			Tweener.addTween(this, {alpha:1, scaleX:1, scaleY:1, time:1, transition:'easeOutElastic', onStart:function():void {
				_content._table.mouseChildren = false;
			}});
		}
		
		public function hide():void
		{
			Tweener.addTween(this, {alpha:0, scaleX:0, scaleY:0, time:1, onComplete:function():void {
				_content._table.mouseChildren = true;
			}});
		}
	}
}
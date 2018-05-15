package com.letsbakelove
{
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Preloader extends Sprite
	{
		private var _application:Application;
		
		public var french:MovieClip;
		public var needle:MovieClip;
		public var loading:MovieClip;
		public var button:MovieClip;
		
		public function Preloader(application:Application):void
		{
			_application = application;
			alpha = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();
			
			french.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			french.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			french.addEventListener(MouseEvent.CLICK, function():void {
				var request:URLRequest = new URLRequest("http://www.repandonslamour.com");
				
				navigateToURL(request, '_blank');
			});
			french.buttonMode = true;
			
			Tweener.addTween(this, {alpha:1, time:1});
		}
		
		private function onResize(e:Event = null):void
		{
			x = Math.round(stage.stageWidth * .5 - width * .5 - 118);
			y = 45;
		}
		
		public function set percent(to:Number):void
		{
			needle.rotation = to * 367;
		}
		
		public function create_button():void
		{
			Tweener.addTween(loading, {alpha:0, time:1});
			
			button.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			button.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			button.addEventListener(MouseEvent.CLICK, _application.create_content);
			button.buttonMode = true;
			
			Tweener.addTween(button, {alpha:1, x:396, time:1, transition:'easeInExpo'});
		}
		
		private function roll_over(e:MouseEvent):void
		{
			Tweener.addTween(e.target, {alpha:.5, time:1});
		}
		
		private function roll_out(e:MouseEvent):void
		{
			Tweener.addTween(e.target, {alpha:1, time:1});
		}
		
		public function hide():void
		{
			Tweener.addTween(this, {alpha:0, time:1, onComplete:function():void {
				this.visible = false;
			}});
		}
	}
}
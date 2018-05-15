package com.letsbakelove
{
	import com.letsbakelove.sounds.Icing;
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.events.Event;
	import flash.display.StageQuality;
	
	public class Animation extends MovieClip
	{
		private var _table:Table;
		private var sound:Sound;
		
		public function Animation(table:Table):void
		{
			_table = table;
			sound = new Icing();
			x = 0;
			y = 1;
			visible = false;
			
			gotoAndStop(1);
		}
		
		public function play_animation():void
		{
			stage.quality = StageQuality.LOW;
			visible = true;
			
			if (!_table._content.mute) sound.play();
			
			addEventListener(Event.ENTER_FRAME, enter_frame);
			gotoAndPlay(1);
		}
		
		private function enter_frame(e:Event):void
		{
			if (currentFrame == 50) _table._cake.write();
			
			if (currentFrame == 90) {
				removeEventListener(Event.ENTER_FRAME, enter_frame);
				
				visible = false;
				stage.quality = StageQuality.HIGH;
				
				Tweener.addTween(_table.icepipe, {x:35, y:348, time:1, onComplete:function():void {
					_table.mouseChildren = true;
				}});
			}
		}
	}
}
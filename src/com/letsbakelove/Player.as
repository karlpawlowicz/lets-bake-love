package com.letsbakelove
{
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	public class Player extends Sprite
	{
		private var _table:Table;
		private var songs:Array;
		private var sound_active:Boolean = false;
		private var active_sound:Number;
		private var sound:Sound;
		private var sound2:Sound;
		private var sound_channel:SoundChannel = new SoundChannel();
		private var sound_transform:SoundTransform = new SoundTransform();
		private var position:uint;
		private var paused:Boolean = false;
		
		public var song:MovieClip;
		public var song2:MovieClip;
		public var song3:MovieClip;
		public var mute:MovieClip;
		public var animation:MovieClip;
		public var unpause:MovieClip;
		public var pause:MovieClip;
		
		public function Player(table:Table):void
		{
			_table = table;
			songs = [song, song2];
			x = 205;
			y = -304;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			for (var i:uint = 0; i < songs.length; i++) {
				songs[i].id = i;
				songs[i].addEventListener(MouseEvent.CLICK, click);
				songs[i].buttonMode = true;
			}
			
			sound = new Sound();
			sound2 = new Sound();
			
			sound.load(new URLRequest("song.mp3"));
			sound2.load(new URLRequest("song2.mp3"));
			
			unpause.addEventListener(MouseEvent.CLICK, unpause_click);
			pause.addEventListener(MouseEvent.CLICK, pause_click);
			mute.addEventListener(MouseEvent.CLICK, mute_click);
			
			unpause.buttonMode = pause.buttonMode = mute.buttonMode = true;
			
			Tweener.addTween(this, {x:205, y:11, time:1, delay:3});
		}
		
		private function click(e:MouseEvent):void
		{
			if (sound_active) {
				Tweener.addTween(songs[active_sound].roll_over, {alpha:0, time:1});
				
				if (paused) {
					Tweener.addTween(pause.roll_over, {alpha:0, time:1});
					
					paused = false;
				}
				
				if (active_sound == e.currentTarget.id) {
					sound_channel.stop();
					removeEventListener(Event.ENTER_FRAME, enter_frame);
					
					Tweener.addTween(animation, {y:86, time:.25, transition:'easeInExpo'});
					Tweener.addTween(unpause.roll_over, {alpha:0, time:1});
					Tweener.addTween(pause.roll_over, {alpha:0, time:1});
					
					sound_active = false;
					
					return;
				}
			}
			
			sound_channel.stop();
			
			if (e.currentTarget.id == 0) sound_channel = sound.play(0, 999);
			else sound_channel = sound2.play(0, 999);
			if (mute.alpha == 1) {
				sound_transform.volume = 0;
				sound_channel.soundTransform = sound_transform;
			}
			
			addEventListener(Event.ENTER_FRAME, enter_frame);
			
			Tweener.addTween(songs[e.currentTarget.id].roll_over, {alpha:1, time:1});
			Tweener.addTween(unpause.roll_over, {alpha:1, time:1});
			
			active_sound = e.currentTarget.id;
			sound_active = true;
		}
		
		private function enter_frame(e:Event):void
		{
			if (animation.y == 86) Tweener.addTween(animation, {y:52, time:.2, transition:'easeInExpo'});
			else if (animation.y == 52) Tweener.addTween(animation, {y:86, time:.2, transition:'easeInExpo'});
		}
		
		private function unpause_click(e:MouseEvent):void
		{
			if (!paused) return;
			
			if (active_sound == 0) sound_channel = sound.play(position);
			else sound_channel = sound2.play(position);
			if (mute.alpha == 1) {
				sound_transform.volume = 0;
				sound_channel.soundTransform = sound_transform;
			}
			
			Tweener.addTween(unpause.roll_over, {alpha:1, time:1});
			Tweener.addTween(pause.roll_over, {alpha:0, time:1});
			
			addEventListener(Event.ENTER_FRAME, enter_frame);
			
			paused = false;
		}
		
		private function pause_click(e:MouseEvent):void
		{
			if (paused) return;
			
			position = sound_channel.position;
			
			if (active_sound == 0) sound_channel.stop();
			else sound_channel.stop();
			
			Tweener.addTween(unpause.roll_over, {alpha:0, time:1});
			Tweener.addTween(pause.roll_over, {alpha:1, time:1});
			
			removeEventListener(Event.ENTER_FRAME, enter_frame);
			
			Tweener.addTween(animation, {y:86, time:.25, transition:'easeInExpo'});
			
			paused = true;
		}
		
		private function mute_click(e:MouseEvent):void
		{
			if (mute.alpha == 0) {
				_table._content.mute = true;
				sound_transform.volume = 0;
				sound_channel.soundTransform = sound_transform;
				
				Tweener.addTween(mute, {alpha:1, time:1});
			} else if (mute.alpha == 1) {
				_table._content.mute = false;
				sound_transform.volume = 1;
				sound_channel.soundTransform = sound_transform;
				
				Tweener.addTween(mute, {alpha:0, time:1});
			}
		}
		
		public function play_song():void
		{
			sound_channel = sound.play(0, 999);
			
			addEventListener(Event.ENTER_FRAME, enter_frame);
			
			Tweener.addTween(songs[0].roll_over, {alpha:1, time:1});
			Tweener.addTween(unpause.roll_over, {alpha:1, time:1});
			
			active_sound = 0;
			sound_active = true;
		}
	}
}
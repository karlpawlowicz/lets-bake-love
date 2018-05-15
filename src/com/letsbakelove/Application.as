package com.letsbakelove
{
	import com.letsbakelove.chrome.Chrome;
	import com.letsbakelove.sounds.Tick;
	import com.letsbakelove.sounds.Ding;
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.media.SoundTransform;
	import flash.media.SoundMixer;
	import flash.utils.Timer;
	import flash.media.Sound;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.ProgressEvent;
	
	public class Application extends Sprite
	{
		private var sound_transform:SoundTransform = new SoundTransform();
		private var _background:Background;
		public var _chrome:Chrome;
		private var _preloader:Preloader;
		private var timer:Timer = new Timer(1000);
		private var sound:Sound;
		private var sound2:Sound;
		public var _content:Content;
		
		public function Application():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			sound_transform.volume = .25;
			SoundMixer.soundTransform = sound_transform;
			_background = new Background();
			_chrome = new Chrome(this);
			
			addChild(_background);
			addChild(_chrome);
			
			root.loaderInfo.addEventListener(Event.COMPLETE, load_content);
		}
		
		private function load_content(e:Event):void
		{
			_preloader = new Preloader(this);
			addChild(_preloader);
			
			timer.addEventListener("timer", function():void {
				sound = new Tick();
				
				sound.play();
			});
			timer.start();
			
			var loader:Loader = new Loader();
			var request:URLRequest = new URLRequest("content.swf");
			
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, function(e:ProgressEvent):void {
				_preloader.percent = e.bytesLoaded / e.bytesTotal;
			});
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
				timer.stop();
				
				sound2 = new Ding();
				_content = e.target.content as Content;
				
				sound2.play();
				_preloader.create_button();
			});
			loader.load(request);
		}
		
		public function create_content(e:Event):void
		{
			_preloader.hide();
			
			addChild(_content);
			swapChildren(_content, _chrome);
			
			_content.init(this);
		}
	}
}
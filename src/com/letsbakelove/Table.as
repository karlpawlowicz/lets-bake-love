package com.letsbakelove
{
	import com.letsbakelove.toppers.*;
	import com.letsbakelove.toppers2.*;
	import com.letsbakelove.sounds.RollOver;
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.KeyboardEvent;
	
	public class Table extends Sprite
	{
		public var _content:Content;
		private var toppers:Array;
		private var objects:Array;
		private var objects2:Array;
		private var flavours:Array;
		private var themes:Array;
		private var themes_x:Array;
		private var themes_y:Array;
		private var alien:Alien;
		private var antlers:Antlers;
		private var baconbits:BaconBits;
		private var bat:Bat;
		private var broccoli:Broccoli;
		private var candyhearts:CandyHearts;
		private var cheesie:Cheesie;
		private var croutons:Croutons;
		private var cuffs:Cuffs;
		private var dollar:Dollar;
		private var eyeball:Eyeball;
		private var football:Football;
		private var grill:Grill;
		private var heart:Heart;
		private var hoodornament:HoodOrnament;
		private var jug:Jug;
		private var justmarried:JustMarried;
		private var pimpshat:PimpsHat;
		private var skull:Skull;
		private var spider:Spider;
		private var tnt:Tnt;
		private var trophy:Trophy;
		private var turd:Turd;
		public var _player:Player;
		public var _cake:Cake;
		public var _animation:Animation;
		private var roll_over_sound:Sound;
		private var active:Boolean = false;
		private var timer:Timer = new Timer(2500);
		private var type:String;
		
		public var vanilla:MovieClip;
		public var chocolate:MovieClip;
		public var strawberry:MovieClip;
		public var itsallyou:MovieClip;
		public var yikes:MovieClip;
		public var yeehaw:MovieClip;
		public var itsoversucka:MovieClip;
		public var yayteam:MovieClip;
		public var unsweetened:MovieClip;
		public var blingbling:MovieClip;
		public var foreveryours:MovieClip;
		public var wood:MovieClip;
		public var icepipe:MovieClip;
		public var envelope:MovieClip;
		public var reset:MovieClip;
		private var active_topper:MovieClip;
		
		public function Table(content:Content):void
		{
			_content = content;
			toppers = [alien, antlers, baconbits, bat, broccoli, candyhearts, cheesie, croutons, cuffs, dollar, eyeball, football, grill, heart, hoodornament, jug, justmarried, pimpshat, skull, spider, tnt, trophy, turd];
			objects = [Alien, Antlers, BaconBits, Bat, Broccoli, CandyHearts, Cheesie, Croutons, Cuffs, Dollar, Eyeball, Football, Grill, Heart, HoodOrnament, Jug, JustMarried, PimpsHat, Skull, Spider, Tnt, Trophy, Turd];
			objects2 = [Anthony, Cam, Gaetano, Giancarlo, Karl, Scott]
			flavours = [vanilla, strawberry, chocolate];
			themes = [itsallyou, yikes, yeehaw, itsoversucka, yayteam, unsweetened, blingbling, foreveryours];
			themes_x = [359, 636, 787, 554, 691, 841, 462, 756];
			themes_y = [91, 42, 19, 79, 99, 74, 22, 124];
			for (var i:uint = 0; i < toppers.length; i++) {
				toppers[i] = new objects[i]();
			}
			_player = new Player(this);
			_cake = new Cake(this);
			_animation = new Animation(this);
			roll_over_sound = new RollOver();
			alpha = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();
			
			/*timer.addEventListener("timer", function():void {
				type = "";
			});
			timer.start();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void {
				type = String(type + e.keyCode);
				
				if (type == "65788472797889" || type == "676577" || type == "71656984657879" || type == "717365786765827679" || type == "75658276" || type == "8367798484") {
					var duplicate:MovieClip;
					
					if (type == "65788472797889") duplicate = new objects2[0]();
					else if (type == "676577") duplicate = new objects2[1]();
					else if (type == "71656984657879") duplicate = new objects2[2]();
					else if (type == "717365786765827679") duplicate = new objects2[3]();
					else if (type == "75658276") duplicate = new objects2[4]();
					else if (type == "8367798484") duplicate = new objects2[5]();
					
					duplicate.x = 250;
					duplicate.y = 250;
					
					duplicate.addEventListener(MouseEvent.MOUSE_DOWN, cake_drag);
					duplicate.addEventListener(MouseEvent.MOUSE_UP, cake_stop_drag);
					duplicate.buttonMode = true;
					
					_cake.addChild(duplicate);
					
					Tweener.addTween(duplicate, {scaleX:1, scaleY:1, time:1});
					
					type = "";
				}
			});*/
			
			envelope.mouseEnabled = envelope.image.mouseEnabled = flavours[1].mouseEnabled = flavours[1].image.mouseEnabled = false;
			
			icepipe.addEventListener(MouseEvent.ROLL_OVER, function(e:MouseEvent):void {
				if (!_content.mute) roll_over_sound.play();
				
				Tweener.addTween(e.target.image, {x:-25, y:25, rotation:5, time:1});
			});
			icepipe.addEventListener(MouseEvent.ROLL_OUT, function(e:MouseEvent):void {
				Tweener.addTween(e.target.image, {x:0, y:0, rotation:0, time:1});
			});
			icepipe.addEventListener(MouseEvent.CLICK, function():void {
				_content._write.show();
			});
			envelope.addEventListener(MouseEvent.ROLL_OVER, function(e:MouseEvent):void {
				if (!_content.mute) roll_over_sound.play();
				
				Tweener.addTween(e.target.image, {x:-25, y:-22, rotation:-5, time:1});
			});
			envelope.addEventListener(MouseEvent.ROLL_OUT, function(e:MouseEvent):void {
				Tweener.addTween(e.target.image, {x:0, y:3, rotation:0, time:1});
			});
			envelope.addEventListener(MouseEvent.CLICK, function():void {
				_content._send.show(_cake);
			});
			reset.addEventListener(MouseEvent.ROLL_OVER, function(e:MouseEvent):void {
				Tweener.addTween(e.target.arrow, {rotation:-360, time:1});
			});
			reset.addEventListener(MouseEvent.ROLL_OUT, function(e:MouseEvent):void {
				Tweener.addTween(e.target.arrow, {rotation:0, time:1});
			});
			reset.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
				Tweener.addTween(e.target.arrow, {rotation:-360, time:1});
				
				_cake.reset();
			});
			
			icepipe.buttonMode = envelope.buttonMode = reset.buttonMode = true;
			
			Tweener.addTween(this, {alpha:1, time:1});
			Tweener.addTween(wood, {x:-59, y:-68, time:1});
			Tweener.addTween(wood.shadow, {alpha:.73, time:1, delay:1});
			Tweener.addTween(wood.shadow2, {alpha:.51, time:1, delay:2});
			Tweener.addTween(icepipe, {x:35, y:348, time:1, delay:3});
			Tweener.addTween(envelope, {x:788, y:347, time:1, delay:3});
			Tweener.addTween(reset, {alpha:1, time:1, delay:5, onComplete:function():void {
				addEventListener(MouseEvent.CLICK, bubble_click);
			}});
			
			for (var i:uint = 0; i < toppers.length; i++) {
				toppers[i].mouseEnabled = toppers[i].image.mouseEnabled = false;
				
				addChild(toppers[i]);
				
				if (i == 2) swapChildren(toppers[i], reset);
				if (i == 20) swapChildren(toppers[i], toppers[3]);
				if (i == 21) {
					swapChildren(toppers[i], envelope);
					swapChildren(toppers[21], toppers[12]);
				}
				
				toppers[i].addEventListener(MouseEvent.ROLL_OVER, function(e:MouseEvent):void {
					if (!_content.mute) roll_over_sound.play();
					
					if (e.target.id == 13) Tweener.addTween(e.target.image, {rotation:15, time:1});
					else Tweener.addTween(e.target.image, {rotation:5, time:1});
				});
				toppers[i].addEventListener(MouseEvent.ROLL_OUT, function(e:MouseEvent):void {
					Tweener.addTween(e.target.image, {rotation:0, time:1});
				});
				toppers[i].addEventListener(MouseEvent.MOUSE_DOWN, drag);
				toppers[i].buttonMode = true;
				toppers[i].slide_in();
			}
			
			addChild(_player);
			addChild(_cake);
			addChild(_animation);
			
			swapChildren(toppers[15], _player);
			swapChildren(toppers[16], _cake);
			
			_cake.init();
			_cake.slide_in();
			
			for (var j:uint = 0; j < flavours.length; j++) {
				flavours[j].id = j;
				flavours[j].addEventListener(MouseEvent.ROLL_OVER, function(e:MouseEvent):void {
					if (!_content.mute) roll_over_sound.play();
					
					Tweener.addTween(e.target, {x:0, time:1});
				});
				flavours[j].addEventListener(MouseEvent.ROLL_OUT, function(e:MouseEvent):void {
					Tweener.addTween(e.target, {x:-15, time:1});
				});
				flavours[j].addEventListener(MouseEvent.CLICK, _cake.create_flavour);
				flavours[j].buttonMode = true;
				
				Tweener.addTween(flavours[j], {x:-15, time:1, delay:3 + j * .25});
			}
			
			for (var k:uint = 0; k < themes.length; k++) {
				themes[k].mouseEnabled = themes[k].image.mouseEnabled = false;
				themes[k].id = k;
				themes[k].addEventListener(MouseEvent.ROLL_OVER, theme_roll_over);
				themes[k].addEventListener(MouseEvent.ROLL_OUT, theme_roll_out);
				themes[k].addEventListener(MouseEvent.CLICK, _cake.create_theme);
				themes[k].buttonMode = true;
				
				Tweener.addTween(themes[k], {y:themes_y[k], time:1, delay:3 + k * .25});
			}
		}
		
		private function onResize(e:Event = null):void
		{
			x = Math.round(stage.stageWidth * .5 - 938 * .5);
			y = 5;
		}
		
		public function bubble_click(e:MouseEvent):void
		{
			if (!active) {
				_content._table._player.play_song();
				
				active = true;
			}
			
			_content._bubble.hide();
			_content._bubble2.hide();
			_content._bubble3.hide();
			_content._bubble4.hide();
			_content._bubble5.hide();
			
			removeEventListener(MouseEvent.CLICK, bubble_click);
		}
		
		private function drag(e:MouseEvent):void
		{
			var duplicate:MovieClip = new objects[e.currentTarget.id]();
			
			duplicate.addEventListener(MouseEvent.MOUSE_UP, stop_drag);
			duplicate.startDrag(true);
			
			addChild(duplicate);
			
			Tweener.addTween(duplicate, {scaleX:1, scaleY:1, time:1});
		}
		
		private function stop_drag(e:MouseEvent):void
		{
			e.currentTarget.stopDrag();
			e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, stop_drag);
			
			if (e.currentTarget.id == 0 || e.currentTarget.id == 1 || e.currentTarget.id == 14 || e.currentTarget.id == 15 || e.currentTarget.id == 16 || e.currentTarget.id == 20 || e.currentTarget.id == 21) {
				if (mouseX < 265 + Math.round(e.target.width * .25) || mouseX > 698 || mouseY < 65 || mouseY > 450 - Math.round(e.target.height * .5)) {
					Tweener.addTween(e.currentTarget, {alpha:0, scaleX:0, scaleY:0, rotation:360, time:1, onComplete:function():void {
						removeChild(this);
					}});
					
					return;
				}
			} else if (mouseX < 265 + Math.round(e.target.width * .5) || mouseX > 698 - Math.round(e.target.width * .5) || mouseY < 65 + Math.round(e.target.height * .5) || mouseY > 450 - Math.round(e.target.height * .5)) {
				Tweener.addTween(e.currentTarget, {alpha:0, scaleX:0, scaleY:0, rotation:360, time:1, onComplete:function():void {
					removeChild(this);
				}});
				
				return;
			}
			
			var x:Number = e.currentTarget.x;
			var y:Number = e.currentTarget.y;
			
			e.currentTarget.x = x - 197;
			e.currentTarget.y = y + 46;
			
			e.currentTarget.addEventListener(MouseEvent.MOUSE_DOWN, cake_drag);
			e.currentTarget.addEventListener(MouseEvent.MOUSE_UP, cake_stop_drag);
			e.currentTarget.buttonMode = true;
			
			_cake.addChild(MovieClip(e.currentTarget));
		}
		
		private function cake_drag(e:MouseEvent):void
		{
			active_topper = e.currentTarget as MovieClip;
			
			e.currentTarget.startDrag(true);
			addEventListener(Event.ENTER_FRAME, enter_frame);
		}
		
		private function enter_frame(e:Event):void
		{
			var good:Boolean = true;
			
			if (active_topper.id == 0 || active_topper.id == 1 || active_topper.id == 14 || active_topper.id == 15 || active_topper.id == 16 || active_topper.id == 20 || active_topper.id == 21 || active_topper.id == 23 || active_topper.id == 24 || active_topper.id == 25 || active_topper.id == 26 || active_topper.id == 27 || active_topper.id == 28) {
				if (_cake.mouseX < 68 + Math.round(active_topper.width * .25) || _cake.mouseX > 510 || _cake.mouseY < 112 || _cake.mouseY > 510 - Math.round(active_topper.height * .5)) {
					good = false;
				}
			} else if (_cake.mouseX < 68 + Math.round(active_topper.width * .5) || _cake.mouseX > 510 - Math.round(active_topper.width * .5) || _cake.mouseY < 112 + Math.round(active_topper.height * .5) || _cake.mouseY > 510 - Math.round(active_topper.height * .5)) {
				good = false;
			}
			
			if (!good) {
				removeEventListener(Event.ENTER_FRAME, enter_frame);
				
				active_topper.removeEventListener(MouseEvent.MOUSE_DOWN, cake_drag);
				active_topper.removeEventListener(MouseEvent.MOUSE_UP, cake_stop_drag);
				active_topper.buttonMode = false;
				
				Tweener.addTween(active_topper, {alpha:0, scaleX:0, scaleY:0, rotation:360, time:1, onComplete:function():void {
					removeChild(this);
				}});
			}
		}
		
		private function cake_stop_drag(e:MouseEvent):void
		{
			removeEventListener(Event.ENTER_FRAME, enter_frame);
			e.target.stopDrag();
		}
		
		private function theme_roll_over(e:MouseEvent):void
		{
			if (!_content.mute) roll_over_sound.play();
			
			if (e.target.id == 0) {
				Tweener.addTween(e.target.image, {x:-25, y:-40, rotation:-5, time:1});
			} else if (e.target.id == 1) {
				Tweener.addTween(e.target.image, {y:-15, rotation:5, time:1});
				Tweener.addTween(themes[4].image, {x:25, y:25, rotation:5, time:1});
			} else if (e.target.id == 2) {
				Tweener.addTween(e.target.image, {x:-10, rotation:-5, time:1});
				Tweener.addTween(themes[7].image, {x:25, y:25, rotation:5, time:1});
				Tweener.addTween(themes[5].image, {x:15, y:15, rotation:-5, time:1});
			} else if (e.target.id == 3) {
				Tweener.addTween(e.target.image, {x:15, y:-55, rotation:-5, time:1});
			} else if (e.target.id == 4) {
				Tweener.addTween(e.target.image, {rotation:5, time:1});
				Tweener.addTween(themes[7].image, {x:25, y:25, rotation:5, time:1});
			} else if (e.target.id == 5 || e.target.id == 6 || e.target.id == 7) {
				Tweener.addTween(e.target.image, {y:-15, rotation:5, time:1});
			}
		}
		
		private function theme_roll_out(e:MouseEvent):void
		{
			if (e.target.id == 0) {
				Tweener.addTween(e.target.image, {x:0, y:0, rotation:0, time:1});
			} else if (e.target.id == 1) {
				Tweener.addTween(e.target.image, {y:0, rotation:0, time:1});
				Tweener.addTween(themes[4].image, {x:0, y:0, rotation:0, time:1});
			} else if (e.target.id == 2) {
				Tweener.addTween(e.target.image, {x:0, rotation:0, time:1});
				Tweener.addTween(themes[7].image, {x:0, y:0, rotation:0, time:1});
				Tweener.addTween(themes[5].image, {x:0, y:0, rotation:0, time:1});
			} else if (e.target.id == 3) {
				Tweener.addTween(e.target.image, {x:0, y:0, rotation:0, time:1});
			} else if (e.target.id == 4) {
				Tweener.addTween(e.target.image, {rotation:0, time:1});
				Tweener.addTween(themes[7].image, {x:0, y:0, rotation:0, time:1});
			} else if (e.target.id == 5 || e.target.id == 6 || e.target.id == 7) {
				Tweener.addTween(e.target.image, {y:0, rotation:0, time:1});
			}
		}
		
		public function add_cake():void
		{
			_cake.alpha = _cake.scaleX = _cake.scaleY = 1;
			_cake.x = 197;
			_cake.y = -46;
			_cake.mouseChildren = true;
			
			addChild(_cake);
			swapChildren(_cake, _animation);
			swapChildren(toppers[16], _cake);
		}
	}
}
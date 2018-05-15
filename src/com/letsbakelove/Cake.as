package com.letsbakelove
{
	import com.letsbakelove.sounds.Flavour;
	import com.letsbakelove.sounds.Theme;
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.text.TextFormat;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.StageQuality;
	
	public class Cake extends Sprite
	{
		private var _table:Table;
		public var flavours:Array;
		public var themes:Array;
		private var breakups:Array;
		private var flavour_sound:Sound;
		private var theme_sound:Sound;
		private var flavour_active:Boolean = false;
		private var active_flavour:Number;
		private var theme_active:Boolean = false;
		private var active_theme:Number;
		private var breakup_active:Boolean = false;
		private var active_breakup:Number;
		private var format:TextFormat = new TextFormat();
		
		public var vanilla:MovieClip;
		public var strawberry:MovieClip;
		public var chocolate:MovieClip;
		public var virgin:MovieClip;
		public var weird:MovieClip;
		public var hick:MovieClip;
		public var breakup:MovieClip;
		public var cheerleader:MovieClip;
		public var goth:MovieClip;
		public var bling:MovieClip;
		public var love:MovieClip;
		public var breakup2:MovieClip;
		public var breakup3:MovieClip;
		public var sponge_cake:MovieClip;
		public var reset_animation:MovieClip;
		public var theme_animation:MovieClip;
		public var text:TextField;
		
		public function Cake(table:Table):void
		{
			_table = table;
			flavours = [vanilla, strawberry, chocolate];
			themes = [virgin, weird, hick, breakup, cheerleader, goth, bling, love];
			breakups = [breakup, breakup2, breakup3];
			flavour_sound = new Flavour();
			theme_sound = new Theme();
			mouseEnabled = false;
			x = -390;
			y = 565;
		}
		
		public function init():void
		{
			sponge_cake.mouseEnabled = text.mouseEnabled = reset_animation.visible = theme_animation.visible = false;
			for (var i:uint = 0; i < flavours.length; i++) {
				flavours[i].mouseEnabled = false;
			}
			for (var j:uint = 0; j < themes.length; j++) {
				themes[j].mouseEnabled = false;
				
				if (j == 2) themes[j].mouseChildren = false;
			}
			for (var k:uint = 0; k < breakups.length; k++) {
				breakups[k].mouseEnabled = false;
			}
			text.autoSize = TextFieldAutoSize.LEFT;
			
			reset_animation.gotoAndStop(1);
			theme_animation.gotoAndStop(1);
		}
		
		public function slide_in():void
		{
			Tweener.addTween(this, {x:197, y:-46, time:1, delay:1});
		}
		
		public function create_flavour(e:MouseEvent):void
		{
			if (flavour_active) {
				if (theme_active && active_theme == 0) return;
				
				flavours[active_flavour].alpha = 0;
				
				if (e.currentTarget.id == active_flavour) {
					if (!_table._content.mute) flavour_sound.play();
					
					sponge_cake.visible = reset_animation.visible = true;
					flavour_active = false;
					stage.quality = StageQuality.LOW;
					reset_animation.alpha = 1;
					
					reset_animation.gotoAndPlay(1);
					addEventListener(Event.ENTER_FRAME, flavour_animation_enter_frame);
					
					return;
				}
			} else {
				flavour_active = true;
				sponge_cake.visible = false;
			}
			
			if (!_table._content.mute) flavour_sound.play();
			
			flavours[e.currentTarget.id].alpha = 1;
			active_flavour = e.currentTarget.id;
			
			if (breakup_active) check_breakup();
			
			Tweener.addTween(e.currentTarget, {x:-15, time:1});
			
			stage.quality = StageQuality.LOW;
			reset_animation.alpha = 1;
			reset_animation.visible = true;
			
			reset_animation.gotoAndPlay(1);
			addEventListener(Event.ENTER_FRAME, flavour_animation_enter_frame);
		}
		
		private function flavour_animation_enter_frame(e:Event):void
		{
			if (reset_animation.currentFrame == 25) {
				removeEventListener(Event.ENTER_FRAME, flavour_animation_enter_frame);
				
				Tweener.addTween(reset_animation, {alpha:0, time:1, onComplete:function():void {
					this.visible = false;
					
					this.gotoAndStop(1);
					
					stage.quality = StageQuality.HIGH;
				}});
			}
		}
		
		public function create_theme(e:MouseEvent):void
		{
			if (theme_active) {
				if (active_theme == 3) destroy_breakup();
				else Tweener.addTween(themes[active_theme], {alpha:0, time:1});
				
				if (e.currentTarget.id == active_theme) {
					if (!_table._content.mute) theme_sound.play();
					
					theme_active = false;
					stage.quality = StageQuality.LOW;
					theme_animation.alpha = 1;
					theme_animation.visible = true;
					
					theme_animation.gotoAndPlay(1);
					addEventListener(Event.ENTER_FRAME, theme_animation_enter_frame);
					
					return;
				}
			} else {
				theme_active = true;
			}
			
			if (!_table._content.mute) theme_sound.play();
			
			if (!flavour_active) {
				flavour_active = true;
				sponge_cake.visible = false;
				
				if (e.currentTarget.id == 0) {
					flavours[1].alpha = active_flavour = 1;
				} else {
					flavours[0].alpha = 1;
					active_flavour = 0;
				}
			}
			
			if (e.currentTarget.id == 3) create_breakup();
			else Tweener.addTween(themes[e.currentTarget.id], {alpha:1, time:1});
			
			stage.quality = StageQuality.LOW;
			theme_animation.alpha = 1;
			theme_animation.visible = true;
			
			theme_animation.gotoAndPlay(1);
			addEventListener(Event.ENTER_FRAME, theme_animation_enter_frame);
			
			active_theme = e.currentTarget.id;
		}
		
		private function create_breakup():void
		{
			breakup_active = true;
			
			Tweener.addTween(breakups[active_flavour], {alpha:1, time:1});
			
			active_breakup = active_flavour;
		}
		
		private function check_breakup():void
		{
			Tweener.removeTweens(breakups[active_breakup]);
			
			breakups[active_breakup].alpha = 0;
			breakups[active_flavour].alpha = 1;
			active_breakup = active_flavour;
		}
		
		private function destroy_breakup():void
		{
			Tweener.addTween(breakups[active_breakup], {alpha:0, time:1});
			
			breakup_active = false;
		}
		
		private function theme_animation_enter_frame(e:Event):void
		{
			if (theme_animation.currentFrame == 15) {
				Tweener.addTween(theme_animation, {alpha:0, time:.25, onComplete:function():void {
					this.visible = false;
					
					this.gotoAndStop(1);
					
					stage.quality = StageQuality.HIGH;
				}});
			} else if (theme_animation.currentFrame == 20) {
				removeEventListener(Event.ENTER_FRAME, theme_animation_enter_frame);
				theme_animation.gotoAndStop(1);
			}
		}
		
		public function write():void
		{
			format.size = 0;
			
			text.setTextFormat(format);
			
			text.text = _table._content._write.message.text;
			text.textColor = _table._content._write.message.textColor;
			
			var best:Number;
			
			if (text.text.search(" ") > 0) {
				var words:Array = text.text.split(" ");
				
				for (var j:uint = 0; j < words.length; j++) {
					if (j + 1 != words.length) {
						if (best) {
							if (best < words[j].length) best = words[j].length; 
						} else {
							if (words[j].length > words[j+1].length) best = words[j].length;
							else best = words[j + 1].length;
						} 
					}
				}
			} else {
				best = text.text.length;
			}
			
			var size:Number;
			
			if (best <= 5) size = 75;
			else if (best > 5 && best <= 10) size = 35;
			else if (best > 10 && best <= 15) size = 30;
			else if (best > 15 && best <= 20) size = 25;
			else if (best > 20 && best <= 25) size = 20;
			else if (best > 25 && best <= 30) size = 15;
			else if (best > 30 && best <= 35) size = 10;
			else if (best > 35 && best <= 40 || best > 40) size = 5;
			
			if (text.text.length <= 5) size = 75;
			else if (text.text.length > 5 && text.text.length <= 10 && size > 70) size = 70;
			else if (text.text.length > 10 && text.text.length <= 15 && size > 65) size = 65;
			else if (text.text.length > 15 && text.text.length <= 20 && size > 60) size = 60;
			else if (text.text.length > 20 && text.text.length <= 25 && size > 55) size = 55;
			else if (text.text.length > 25 && text.text.length <= 30 && size > 50) size = 50;
			else if (text.text.length > 30 && text.text.length <= 35 && size > 45) size = 45;
			else if (text.text.length > 35 && text.text.length <= 40 && size > 40) size = 40;
			else if (text.text.length > 40 && size > 35) size = 35;
			
			format.size = Number(format.size) + size;
			
			text.setTextFormat(format);
			
			text.y = Math.round(285 - text.height * .5);
		}
		
		public function reset():void
		{
			if (!_table._content.mute) flavour_sound.play();
			
			swapChildren(reset_animation, getChildAt(numChildren - 1));
			
			stage.quality = StageQuality.LOW;
			reset_animation.alpha = 1;
			reset_animation.visible = true;
			
			reset_animation.gotoAndPlay(1);
			addEventListener(Event.ENTER_FRAME, reset_animation_enter_frame);
		}
		
		private function reset_animation_enter_frame(e:Event):void
		{
			if (reset_animation.currentFrame == 25) {
				text.text = _table._content._write.message.text = "";
				_table._content._write.message.textColor = 0xFF0000;
				_table._content._write.border.x = -61;
				
				if (flavour_active) {
					flavours[active_flavour].alpha = 0;
					sponge_cake.visible = true;
					flavour_active = false;
				}
				
				if (theme_active) {
					if (active_theme == 3) {
						Tweener.removeTweens(breakups[active_breakup]);
						
						breakups[active_flavour].alpha = 0;
						breakup_active = false;
					} else {
						Tweener.removeTweens(themes[active_theme]);
						
						themes[active_theme].alpha = 0;
					}
					
					theme_active = false;
				}
				
				active_flavour = active_theme = active_breakup = NaN;
				
				while (numChildren > 17) {
					removeChildAt(numChildren - 2);
				}
				
				removeEventListener(Event.ENTER_FRAME, reset_animation_enter_frame);
				
				Tweener.addTween(reset_animation, {alpha:0, time:1, onComplete:function():void {
					this.visible = false;
					
					this.gotoAndStop(1);
					
					stage.quality = StageQuality.HIGH;
				}});
			}
		}
	}
}
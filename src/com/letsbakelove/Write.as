package com.letsbakelove
{
	import com.letsbakelove.sounds.PopUp;
	import com.letsbakelove.sounds.Errors;
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Write extends Sprite
	{
		private var _content:Content;
		private var items:Array;
		private var colour_names:Array;
		private var colours:Array;
		private var messages:Array;
		private var drop_down_open:Boolean = false;
		private var message_max:Number;
		private var pop_up_sound:Sound;
		private var errors_sound:Sound;
		
		public var title:MovieClip;
		public var close:MovieClip;
		public var text:MovieClip;
		public var input_bg:MovieClip;
		public var message:TextField;
		public var border:MovieClip;
		public var text2:MovieClip;
		public var choose:MovieClip;
		public var clear:MovieClip;
		public var write:MovieClip;
		public var colour:MovieClip;
		public var colour2:MovieClip;
		public var colour3:MovieClip;
		public var colour4:MovieClip;
		public var colour5:MovieClip;
		public var colour6:MovieClip;
		public var colour7:MovieClip;
		public var colour8:MovieClip;
		public var colour9:MovieClip;
		public var colour10:MovieClip;
		public var drop_down:MovieClip;
		public var roll_over:MovieClip;
		
		public function Write(content:Content):void
		{
			_content = content;
			items = [title, close, text, input_bg, message, border, text2, choose, clear, write];
			colour_names = [colour, colour2, colour3, colour4, colour5, colour6, colour7, colour8, colour9, colour10];
			colours = [0xFFFFFF, 0xFF0000, 0xB35400, 0xFFA200, 0xFFF000, 0x96FF00, 0x00E4FF, 0x526AFF, 0xAA4FFF, 0x000000];
			messages = ["Aww, you remembered my name.",
						"Thanks for the foreplay.",
						"You were hotter online.",
						"Thanks for calling my booty.",
						"I want to be your rebound.",
						"I believe in true love, but you’ll do for now.",
						"You’re almost hot enough to turn me gay.",
						"You’re almost hot enough to turn me straight.",
						"I miss your morning breath.",
						"If you were a beer I’d chug you.",
						"I’m so happy you match your dating profile.",
						"I love making out with you at keg parties.",
						"I love it when your nose whistles.",
						"Your snoring is like a love song.",
						"I’d love to someday call you my ex.",
						"Your bald spot feels like velvet.",
						"You make me want to be faithful.",
						"Thanks for hooking me up with your Mom.",
						"Thanks for always pulling my finger.",
						"Thanks for holding back my hair when I barf.",
						"Congratulations on ending your dry spell.",
						"If you ever want to talk, I’ll pretend to listen.",
						"It’s ok to throw up after eating this.",
						"You can always count on me sometimes.",
						"So you run like a girl, at least you stand up to pee.",
						"I love that you pretend to know how to dance.",
						"Congrats on finding just the right barb wire tattoo.",
						"You make me feel better about myself."];
			pop_up_sound = new PopUp();
			errors_sound = new Errors();
			alpha = scaleX = scaleY = 0;
			visible = false;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();
			
			drop_down.alpha = 0;
			drop_down.visible = false;
			
			close.addEventListener(MouseEvent.CLICK, click);
			choose.addEventListener(MouseEvent.CLICK, choose_click);
			drop_down.text.addEventListener(MouseEvent.ROLL_OVER, drop_down_text_roll_over);
			drop_down.text.addEventListener(MouseEvent.ROLL_OUT, drop_down_text_roll_out);
			drop_down.text.addEventListener(MouseEvent.CLICK, function():void {
				drop_down.visible = drop_down_open = false;
				message.text = messages[message_max - 4];
			});
			drop_down.text2.addEventListener(MouseEvent.ROLL_OVER, drop_down_text_roll_over);
			drop_down.text2.addEventListener(MouseEvent.ROLL_OUT, drop_down_text_roll_out);
			drop_down.text2.addEventListener(MouseEvent.CLICK, function():void {
				drop_down.visible = drop_down_open = false;
				message.text = messages[message_max - 3];
			});
			drop_down.text3.addEventListener(MouseEvent.ROLL_OVER, drop_down_text_roll_over);
			drop_down.text3.addEventListener(MouseEvent.ROLL_OUT, drop_down_text_roll_out);
			drop_down.text3.addEventListener(MouseEvent.CLICK, function():void {
				drop_down.visible = drop_down_open = false;
				message.text = messages[message_max - 2];
			});
			drop_down.text4.addEventListener(MouseEvent.ROLL_OVER, drop_down_text_roll_over);
			drop_down.text4.addEventListener(MouseEvent.ROLL_OUT, drop_down_text_roll_out);
			drop_down.text4.addEventListener(MouseEvent.CLICK, function():void {
				drop_down.visible = drop_down_open = false;
				message.text = messages[message_max - 1];
			});
			drop_down.text5.addEventListener(MouseEvent.ROLL_OVER, drop_down_text_roll_over);
			drop_down.text5.addEventListener(MouseEvent.ROLL_OUT, drop_down_text_roll_out);
			drop_down.text5.addEventListener(MouseEvent.CLICK, function():void {
				drop_down.visible = drop_down_open = false;
				message.text = messages[message_max];
			});
			drop_down.up.addEventListener(MouseEvent.CLICK, function():void {
				if (message_max > 4) {
					message_max--;
					
					render_messages();
				} else {
					return;
				}
			});
			drop_down.down.addEventListener(MouseEvent.CLICK, function():void {
				if (message_max < messages.length - 1) {
					message_max++;
					
					render_messages();
				} else {
					return;
				}
			});
			clear.addEventListener(MouseEvent.CLICK, click);
			write.addEventListener(MouseEvent.CLICK, click);
			
			close.buttonMode = choose.buttonMode = drop_down.up.buttonMode = drop_down.down.buttonMode = clear.buttonMode = write.buttonMode = true;
			
			for (var i:uint = 0; i < colour_names.length; i++) {
				colour_names[i].id = i;
				colour_names[i].addEventListener(MouseEvent.ROLL_OVER, colour_roll_over);
				colour_names[i].addEventListener(MouseEvent.ROLL_OUT, colour_roll_out);
				colour_names[i].addEventListener(MouseEvent.CLICK, colour_click);
				colour_names[i].buttonMode = true;
			}
		}
		
		private function onResize(e:Event = null):void
		{
			x = Math.round(stage.stageWidth * .5 - 160);
			y = 262;
		}
		
		private function click(e:MouseEvent):void
		{
			if (e.target.name == "clear") {
				message.text = _content._table._cake.text.text = "";
			} else if (e.target.name == "write") {
				if (message.text == "") {
					if (!_content.mute) errors_sound.play();
					
					message.text = "Please write or select your message.";
					
					return;
				} else if (message.text == _content._table._cake.text.text || message.text == "Please write or select your message.") {
					if (message.textColor == _content._table._cake.text.textColor) {
						if (!_content.mute) errors_sound.play();
						
						return;
					}
				}
				
				Tweener.addTween(_content._table.icepipe, {x:-93, y:506, time:1, onComplete:function():void {
					_content._table._animation.play_animation();
				}});
			}
			
			if (!_content.mute) pop_up_sound.play();
			
			if (e.target.name == "write") _content._table.mouseChildren = false;
			else _content._table.mouseChildren = true;
			
			drop_down.visible = drop_down_open = false;
			
			Tweener.addTween(this, {alpha:0, scaleX:0, scaleY:0, rotation:360, time:1, onComplete:function():void {
				visible = false;
			}});
		}
		
		private function choose_click(e:MouseEvent):void
		{
			if (drop_down_open) {
				Tweener.addTween(drop_down, {alpha:0, time:1, onComplete:function():void {
					this.visible = false;
				}});
				Tweener.addTween(choose.arrow, {rotation:0, time:1});
				
				drop_down_open = false;
			} else {
				drop_down_open = true;
				message_max = 4;
				
				Tweener.addTween(choose.arrow, {rotation:180, time:1});
				Tweener.addTween(drop_down, {alpha:1, time:1, onStart:function():void {
					this.visible = true;
				}});
				
				render_messages();
			}
		}
		
		public function render_messages():void
		{
			drop_down.text.text.text = messages[message_max - 4];
			drop_down.text2.text.text = messages[message_max - 3];
			drop_down.text3.text.text = messages[message_max - 2];
			drop_down.text4.text.text = messages[message_max - 1];
			drop_down.text5.text.text = messages[message_max];
		}
		
		private function colour_roll_over(e:MouseEvent):void
		{
			Tweener.removeTweens(roll_over);
			
			roll_over.alpha = 0;
			roll_over.x = e.target.x - 2;
			
			Tweener.addTween(roll_over, {alpha:1, time:1});
		}
		
		private function colour_roll_out(e:MouseEvent):void
		{
			Tweener.addTween(roll_over, {alpha:0, time:1});
		}
		
		private function colour_click(e:MouseEvent):void
		{
			border.alpha = 1;
			border.x = e.target.x - 2;
			message.textColor = colours[e.target.id];
		}
		
		private function drop_down_text_roll_over(e:MouseEvent):void
		{
			Tweener.addTween(e.target.bg, {alpha:1, time:1});
		}
		
		private function drop_down_text_roll_out(e:MouseEvent):void
		{
			Tweener.addTween(e.target.bg, {alpha:0, time:1});
		}
		
		public function show():void
		{
			if (!_content.mute) pop_up_sound.play();
			
			_content._table.mouseChildren = false;
			for (var i:uint = 0; i < items.length; i++) {
				items[i].alpha = 0;
			}
			for (var j:uint = 0; j < colour_names.length; j++) {
				colour_names[j].alpha = 0;
			}
			choose.arrow.rotation = 0;
			visible = true;
			
			Tweener.addTween(this, {alpha:1, scaleX:1, scaleY:1, rotation:360, time:1, transition:'easeInOutElastic'});
			for (var k:uint = 0; k < items.length; k++) {
				Tweener.addTween(items[k], {alpha:1, time:1, delay:1 + k * .05});
			}
			for (var l:uint = 0; l < colour_names.length; l++) {
				Tweener.addTween(colour_names[l], {alpha:1, time:1, delay:1 + l * .05});
			}
		}
	}
}
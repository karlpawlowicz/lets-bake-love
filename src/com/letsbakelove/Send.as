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
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Send extends Sprite
	{
		public var _content:Content;
		private var items:Array;
		private var items2:Array;
		private var items3:Array;
		private var _email:Email;
		private var pop_up_sound:Sound;
		private var errors_sound:Sound;
		private var _cake:Cake;
		public var delivery_person:String;
		
		public var title:MovieClip;
		public var back:MovieClip;
		public var divider:MovieClip;
		public var divider2:MovieClip;
		public var arrow:MovieClip;
		public var text12:MovieClip;
		public var text9:MovieClip;
		public var text10:MovieClip;
		public var text11:MovieClip;
		public var download:MovieClip;
		public var view:MovieClip;
		public var pink:MovieClip;
		public var blue:MovieClip;
		public var send:MovieClip;
		public var input_bg:MovieClip;
		public var input_bg2:MovieClip;
		public var input_bg3:MovieClip;
		public var input_bg4:MovieClip;
		public var input_bg5:MovieClip;
		public var input_bg6:MovieClip;
		public var input_bg7:MovieClip;
		public var input_bg8:MovieClip;
		public var text:MovieClip;
		public var text2:MovieClip;
		public var text3:MovieClip;
		public var text4:MovieClip;
		public var text5:MovieClip;
		public var text6:MovieClip;
		public var text7:MovieClip;
		public var text8:MovieClip;
		public var field:TextField;
		public var field2:TextField;
		public var field3:TextField;
		public var field4:TextField;
		public var field5:TextField;
		public var field6:TextField;
		public var field7:TextField;
		public var field8:TextField;
		public var check:MovieClip;
		public var error:TextField;
		public var error2:TextField;
		public var error3:TextField;
		public var error4:TextField;
		public var error5:TextField;
		public var error6:TextField;
		public var error7:TextField;
		public var error8:TextField;
		public var error9:TextField;
		public var confirmation:MovieClip;
		public var bg:MovieClip;
		
		public function Send(content:Content):void
		{
			_content = content;
			_email = new Email(this);
			items = [title, back, divider, divider2, arrow, text12, text9, text10, text11, download, view, pink, blue, send];
			items2 = [input_bg, input_bg2, input_bg3, input_bg4, input_bg5, input_bg6, input_bg7, input_bg8];
			items3 = [text, text2, text3, text4, text5, text6, text7, text8];
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
			
			pink.image.mouseEnabled = false;
			
			back.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			back.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			back.addEventListener(MouseEvent.CLICK, hide);
			download.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			download.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			download.addEventListener(MouseEvent.CLICK, function():void {
				_content._loading.text.text = "LOADING";
				
				_content._loading.show();
				_email.download();
			});
			view.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			view.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			view.addEventListener(MouseEvent.CLICK, view_click);
			pink.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			pink.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			pink.addEventListener(MouseEvent.CLICK, click);
			blue.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			blue.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			blue.addEventListener(MouseEvent.CLICK, click);
			send.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			send.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			send.addEventListener(MouseEvent.CLICK, send_click);
			confirmation.button.addEventListener(MouseEvent.CLICK, hide);
			confirmation.button2.addEventListener(MouseEvent.CLICK, function():void {
				var request:URLRequest = new URLRequest("http://www.virginmobile.ca");
				
				navigateToURL(request, '_blank');
			});
			
			back.buttonMode = download.buttonMode = view.buttonMode = pink.buttonMode = blue.buttonMode = send.buttonMode = confirmation.button.buttonMode = confirmation.button2.buttonMode = true;
			
			field.tabIndex = 0;
			field2.tabIndex = 1;
			field3.tabIndex = 2;
			field4.tabIndex = 3;
			field5.tabIndex = 4;
			field6.tabIndex = 5;
			field7.tabIndex = 6;
			field8.tabIndex = 7;
		}
		
		private function onResize(e:Event = null):void
		{
			x = Math.round(stage.stageWidth * .5);
			y = 258;
		}
		
		private function roll_over(e:MouseEvent):void
		{
			if (e.target.name == "back") Tweener.addTween(e.target, {scaleX:1.25, scaleY:1.25, rotation:360, time:1});
			else if (e.target.name == "pink" || e.target.name == "blue") Tweener.addTween(e.target.image, {rotation:360, time:1});
			else Tweener.addTween(e.target, {scaleX:1.05, scaleY:1.05, time:1});
		}
		
		private function roll_out(e:MouseEvent):void
		{
			if (e.target.name == "back") Tweener.addTween(e.target, {scaleX:1, scaleY:1, rotation:0, time:1});
			else if (e.target.name == "pink" || e.target.name == "blue") Tweener.addTween(e.target, {rotation:0, time:1});
			else Tweener.addTween(e.target, {scaleX:1, scaleY:1, time:1});
		}
		
		private function hide(e:MouseEvent):void
		{
			if (!_content.mute) pop_up_sound.play();
			
			if (e.currentTarget.name == "back") {
				Tweener.removeTweens(_cake);
				_content._table.add_cake();
			}
			
			Tweener.addTween(this, {alpha:0, scaleX:0, scaleY:0, rotation:360, time:1, onComplete:function():void {
				visible = false;
				_content._table.mouseChildren = true;
			}});
		}
		
		private function view_click(e:MouseEvent):void
		{
			var good:Boolean = true;
			var emailExpression:RegExp = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
			var emailValid:Boolean = emailExpression.test(field2.text);
			var emailValid2:Boolean = emailExpression.test(field4.text);
			if (field6.text != "") var emailValid3:Boolean = emailExpression.test(field6.text);
			if (field8.text != "") var emailValid4:Boolean = emailExpression.test(field8.text);
			
			if (field.text == "") {
				good = false;
				error.text = "Please enter your name.";
			} else {
				error.text = "";
			}
			if (field2.text == "") {
				good = false;
				error2.text = "Please enter your email address.";
			} else if (!emailValid) {
				good = false;
				error2.text = "Invalid email format. Try again.";
			} else {
				error2.text = "";
			}
			if (field3.text == "") {
				good = false;
				error3.text = "Please enter your friend's name.";
			} else {
				error3.text = "";
			}
			if (field4.text == "") {
				good = false;
				error4.text = "Please enter your friend's email address.";
			} else if (!emailValid2) {
				good = false;
				error4.text = "Invalid email format. Try again.";
			} else {
				error4.text = "";
			}
			if (delivery_person == "") {
				good = false;
				error9.text = "Select either “hot delivery girl”\nor “hot delivery guy”";
			} else {
				error9.text = "";
			}
			
			if (good) {
				_content._loading.text.text = "LOADING";
				
				_content._loading.show();
				_email.view_cake();
			} else {
				if (!_content.mute) errors_sound.play();
			}
		}
		
		private function click(e:MouseEvent):void
		{
			check.alpha = check.scaleX = check.scaleY = 0;
			
			if (e.target.name == "pink") {
				delivery_person = "f";
				check.y = -99;
			} else {
				delivery_person = "m";
				check.y = -2;
			}
			
			Tweener.addTween(check, {alpha:1, scaleX:1, scaleY:1, time:1, transition:'easeOutElastic'});
		}
		
		private function send_click(e:MouseEvent):void
		{
			var good:Boolean = true;
			var emailExpression:RegExp = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
			var emailValid:Boolean = emailExpression.test(field2.text);
			var emailValid2:Boolean = emailExpression.test(field4.text);
			if (field6.text != "") var emailValid3:Boolean = emailExpression.test(field6.text);
			if (field8.text != "") var emailValid4:Boolean = emailExpression.test(field8.text);
			
			if (field.text == "") {
				good = false;
				error.text = "Please enter your name.";
			} else {
				error.text = "";
			}
			if (field2.text == "") {
				good = false;
				error2.text = "Please enter your email address.";
			} else if (!emailValid) {
				good = false;
				error2.text = "Invalid email format. Try again.";
			} else {
				error2.text = "";
			}
			if (field3.text == "") {
				good = false;
				error3.text = "Please enter your friend's name.";
			} else {
				error3.text = "";
			}
			if (field4.text == "") {
				good = false;
				error4.text = "Please enter your friend's email address.";
			} else if (!emailValid2) {
				good = false;
				error4.text = "Invalid email format. Try again.";
			} else {
				error4.text = "";
			}
			if (field5.text == "" && field6.text != "") {
				error5.text = "Please enter your friend's name.";
			} else {
				error5.text = "";
			}
			if (field5.text != "") {
				if (field6.text == "") {
					good = false;
					error6.text = "Please enter your friend's email address.";
				}
				else if (!emailValid3) {
					good = false;
					error6.text = "Invalid email format. Try again.";
				}
			} else {
				error6.text = "";
			}
			if (field7.text == "" && field8.text != "") {
				good = false;
				error7.text = "Please enter your friend's name.";
			} else {
				error7.text = "";
			}
			if (field7.text != "") {
				if (field8.text == "") {
					good = false;
					error8.text = "Please enter your friend's email address.";
				}
				else if (!emailValid3) {
					good = false;
					error8.text = "Invalid email format. Try again.";
				}
			} else {
				error8.text = "";
			}
			if (delivery_person == "") {
				good = false;
				error9.text = "Select either “hot delivery girl”\nor “hot delivery guy”";
			} else {
				error9.text = "";
			}
			
			if (good) {
				_content._loading.text.text = "SENDING";
				
				_content._loading.show();
				_email.test();
			} else {
				if (!_content.mute) errors_sound.play();
			}
		}
		
		public function show(cake:Cake):void
		{
			if (!_content.mute) pop_up_sound.play();
			
			delivery_person = field.text = field2.text = field3.text = field4.text = field5.text = field6.text = field7.text = field8.text = error.text = error2.text = error3.text = error4.text = error5.text = error6.text = error7.text = error8.text = error9.text = "";
			bg.width = 739;
			bg.height = 494;
			for (var i:uint = 0; i < items.length; i++) {
				items[i].alpha = 0;
				items[i].visible = true;
				
				if (i > 8) items[i].scaleX = items[i].scaleY = 0;
			}
			for (var j:uint = 0; j < items2.length; j++) {
				items2[j].alpha = items2[j].scaleX = items2[j].scaleY = 0;
			}
			for (var k:uint = 0; k < items3.length; k++) {
				items3[k].alpha = 0;
			}
			confirmation.alpha = check.alpha = 0;
			confirmation.visible = false;
			
			Tweener.addTween(title, {alpha:1, time:1, delay:1});
			Tweener.addTween(back, {alpha:1, time:1, delay:1.25});
			Tweener.addTween(divider, {alpha:1, time:1, delay:1.5});
			Tweener.addTween(divider2, {alpha:1, time:1, delay:1.75});
			for (var l:uint = 0; l < items2.length; l++) {
				Tweener.addTween(items2[l], {alpha:1, scaleX:1, scaleY:1, time:1, delay:1 + l * .05});
			}
			for (var m:uint = 0; m < items3.length; m++) {
				Tweener.addTween(items3[m], {alpha:1, time:1, delay:1 + m * .05});
			}
			Tweener.addTween(download, {alpha:1, scaleX:1, scaleY:1, rotation:360, time:1, delay:1, transition:'easeOutElastic'});
			Tweener.addTween(arrow, {alpha:1, time:1, delay:1.25});
			Tweener.addTween(text12, {alpha:1, time:1, delay:1.75});
			Tweener.addTween(view, {alpha:1, scaleX:1, scaleY:1, rotation:360, time:1, delay:2, transition:'easeOutElastic'});
			Tweener.addTween(text9, {alpha:1, time:1, delay:1});
			Tweener.addTween(pink, {alpha:1, scaleX:1, scaleY:1, rotation:360, time:1, delay:1.25, transition:'easeOutElastic'});
			Tweener.addTween(text10, {alpha:1, time:1, delay:1.25});
			Tweener.addTween(blue, {alpha:1, scaleX:1, scaleY:1, rotation:360, time:1, delay:1.5, transition:'easeOutElastic'});
			Tweener.addTween(text11, {alpha:1, time:1, delay:1.5});
			Tweener.addTween(send, {alpha:1, scaleX:1, scaleY:1, rotation:360, time:1, delay:1.75, transition:'easeOutElastic'});
			
			_cake = cake;
			_content._table.mouseChildren = false;
			visible = true;
			
			Tweener.addTween(this, {alpha:1, scaleX:1, scaleY:1, rotation:360, time:1, transition:'easeInOutElastic', onComplete:function():void {
				_cake.alpha = _cake.scaleX = _cake.scaleY = 0;
				_cake.x = -119;
				_cake.y = -150;
				_cake.mouseChildren = false;
				
				addChild(_cake);
				
				Tweener.addTween(_cake, {alpha:1, scaleX:.5, scaleY:.5, time:1, delay:.5, transition:'easeOutElastic'});
			}});
		}
		
		public function show_confirmation():void
		{
			delivery_person = field.text = field2.text = field3.text = field4.text = field5.text = field6.text = field7.text = field8.text = error.text = error2.text = error3.text = error4.text = error5.text = error6.text = error7.text = error8.text = error9.text = "";
			for (var i:uint = 0; i < items.length; i++) {
				Tweener.addTween(items[i], {alpha:0, time:1, onComplete:function():void {
					this.visible = false;
				}});
			}
			for (var j:uint = 0; j < items2.length; j++) {
				Tweener.addTween(items2[j], {alpha:0, time:1});
			}
			for (var k:uint = 0; k < items3.length; k++) {
				Tweener.addTween(items3[k], {alpha:0, time:1});
			}
			check.alpha = 0;
			
			Tweener.removeTweens(_cake);
			_content._table.add_cake();
			
			Tweener.addTween(bg, {width:423, height:282, time:1, delay:1, transition:'easeOutElastic'});
			Tweener.addTween(confirmation, {alpha:1, time:1, delay:2, onStart:function():void {
				this.visible = true;
			}});
		}
	}
}
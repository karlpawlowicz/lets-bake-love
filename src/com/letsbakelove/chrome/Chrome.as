package com.letsbakelove.chrome
{
	import com.letsbakelove.Application;
	import caurina.transitions.Tweener;
	
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Chrome extends Sprite
	{
		private var _application:Application;
		private var urls:Array;
		private var icons:Array;
		private var icons_x:Array;
		private var icon_urls:Array;
		private var repositioned:Boolean = false;
		private var help_active:Boolean = false;
		
		public var share:MovieClip;
		public var help:MovieClip;
		public var terms:MovieClip;
		public var privacy:MovieClip;
		public var virgin:MovieClip;
		public var line:MovieClip;
		public var copyright:MovieClip;
		public var logo:MovieClip;
		public var tm:MovieClip;
		
		public function Chrome(application:Application):void
		{
			_application = application;
			urls = ["http://www.virginmobile.ca/vmc/en/howDoI/hd_termsConditions.html", "http://www.virginmobile.ca/vmc/en/howDoI/hd_privacyPolicy.html", "http://www.virginmobile.ca/vmc/en/home/index.html"];
			icons = [share.expanded.facebook, share.expanded.furl, share.expanded.live, share.expanded.google, share.expanded.myspace, share.expanded.magnolia, share.expanded.yahoo, share.expanded.taggly, share.expanded.stumbleupon, share.expanded.piczo, share.expanded.digg, share.expanded.delicious, share.expanded.ask, share.expanded.diigo];
			icons_x = [18, 37, 57, 75, 94, 113, 133, 152, 172, 191, 211, 231, 250, 277];
			icon_urls = ["http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.letsbakelove.com",
						"http://www.furl.net/storeIt.jsp?t=letsbakelove&u=http://www.letsbakelove.com",
						"https://favorites.live.com/quickadd.aspx?marklet=1&mkt=en-us &url=http://www.letsbakelove.com&title=letsbakelove",
						"https://www.google.com/accounts/ServiceLogin?hl=en&continue=http://www.google.com/bookmarks/mark%3Fop%3Dadd%26bkmk%3Dhttp%253A%252F%252Fwww.letsbakelove.com%252F%26title%3Dletsbakelove%2520%2520&service=bookmarks",
						"http://www.myspace.com/Modules/PostTo/Pages/?u=http%3A%2F%2Fwww.letsbakelove.com&t=letsbakelove&c=",
						"http://ma.gnolia.com/bookmarklet/add?url=http://www.letsbakelove.com&title=letsbakelove",
						"http://myweb.yahoo.com/myresults/bookmarklet?&ei=UTF-8&u=http%3A%2F%2Fwww.letsbakelove.com&a25=1&t=letsbakelove", 
						"http://taggly.com/bookmarks.php/pass?action=add&address=www.letsbakelove.com",
						"http://www.stumbleupon.com/submit?url=www.letsbakelove.com&title=letsbakelove",
						"http://www.piczo.com/go/redirect?url=www.letsbakelove.com",
						"http://digg.com/submit/?url=www.letsbakelove.com&title=letsbakelove",
						"http://del.icio.us/chambola?url=http%3A%2F%2Fwww.letsbakelove.com&title=letsbakelove",
						"http://myjeeves.ask.com/mysearch/BookmarkIt?v=1.2&t=webpages&title=letsbakelove&url=www.letsbakelove.com",
						"http://www.diigo.com/post?url=www.letsbakelove.com&title=letsbakelove"];
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, onResize);
			onResize();
			
			help.visible = share.visible = false;
			terms.id = 0;
			privacy.id = 1;
			virgin.id = 2;
			
			help.addEventListener(MouseEvent.CLICK, help_click);
			share.collapsed.addEventListener(MouseEvent.ROLL_OVER, share_roll_over);
			share.expanded.addEventListener(MouseEvent.ROLL_OUT, share_roll_out);
			terms.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			terms.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			terms.addEventListener(MouseEvent.CLICK, click);
			privacy.addEventListener(MouseEvent.ROLL_OVER, roll_over);
			privacy.addEventListener(MouseEvent.ROLL_OUT, roll_out);
			privacy.addEventListener(MouseEvent.CLICK, click);
			virgin.addEventListener(MouseEvent.CLICK, click);
			
			help.buttonMode = share.buttonMode = terms.buttonMode = privacy.buttonMode = virgin.buttonMode = true;
			
			for (var i:uint = 0; i < icons.length; i++) {
				icons[i].id = i;
				icons[i].addEventListener(MouseEvent.ROLL_OVER, icon_roll_over);
				icons[i].addEventListener(MouseEvent.ROLL_OUT, icon_roll_out);
				icons[i].addEventListener(MouseEvent.CLICK, click);
				icons[i].buttonMode = true;
			}
		}
		
		private function onResize(e:Event = null):void
		{
			if (repositioned) x = Math.round(stage.stageWidth * .5 - width * .5 - 16);
			else x = Math.round(stage.stageWidth * .5 - width * .5 - 9);
			
			y = 490;
		}
		
		private function help_click(e:MouseEvent):void
		{
			if (help_active) {
				_application._content._bubble.hide();
				_application._content._bubble2.hide();
				_application._content._bubble3.hide();
				_application._content._bubble4.hide();
				_application._content._bubble5.hide();
				
				help_active = false;
			} else {
				help_active = true;
				
				_application._content._table.addEventListener(MouseEvent.CLICK, _application._content._table.bubble_click);
				
				_application._content._bubble.show();
				_application._content._bubble2.show();
				_application._content._bubble3.show();
				_application._content._bubble4.show();
				_application._content._bubble5.show();
			}
		}
		
		private function share_roll_over(e:MouseEvent):void
		{
			Tweener.addTween(e.target, {alpha:0, time:1, onComplete:function():void {
				this.visible = false;
			}});
			Tweener.addTween(share.expanded, {alpha:1, time:1, onStart:function():void {
				this.visible = true;
			}});
		}
		
		private function share_roll_out(e:MouseEvent):void
		{
			Tweener.addTween(e.target, {alpha:0, time:1, onComplete:function():void {
				this.visible = false;
			}});
			Tweener.addTween(share.collapsed, {alpha:1, time:1, onStart:function():void {
				this.visible = true;
			}});
		}
		
		private function roll_over(e:MouseEvent):void
		{
			Tweener.addTween(e.target, {alpha:.5, time:1});
		}
		
		private function roll_out(e:MouseEvent):void
		{
			Tweener.addTween(e.target, {alpha:1, time:1});
		}
		
		private function click(e:MouseEvent):void
		{
			var request:URLRequest;
			
			if (e.target.name == "privacy" || e.target.name == "terms" || e.target.name == "virgin") {
				request = new URLRequest(urls[e.target.id]);
			} else {
				request = new URLRequest(icon_urls[e.target.id]);
			}
			
			navigateToURL(request, '_blank');
		}
		
		private function icon_roll_over(e:MouseEvent):void
		{
			for (var j:uint = 0; j < icons.length; j++) {
				if (j != e.target.id) {
					if (j < e.target.id) Tweener.addTween(icons[j], {x:icons_x[j] - 5, time:1});
					else Tweener.addTween(icons[j], {x:icons_x[j] + 5, time:1});
				}
			}
			Tweener.addTween(icons[e.target.id - 1], {scaleX:1.05, scaleY:1.05, time:1});
			Tweener.addTween(e.target, {scaleX:1.5, scaleY:1.25, time:25});	
			Tweener.addTween(icons[e.target.id + 1], {scaleX:1.05, scaleY:1.05, time:1});
		}
		
		private function icon_roll_out(e:MouseEvent):void
		{
			for (var k:uint = 0; k < icons.length; k++) {
				if (k != e.target.id) {
					if (k < e.target.id) Tweener.addTween(icons[k], {x:icons_x[k], time:1});
					else Tweener.addTween(icons[k], {x:icons_x[k], time:1});
				}
			}
			Tweener.addTween(icons[e.target.id - 1], {scaleX:1, scaleY:1, time:1});
			Tweener.addTween(e.target, {scaleX:1, scaleY:1, time:1});	
			Tweener.addTween(icons[e.target.id + 1], {scaleX:1, scaleY:1, time:1});
		}
		
		public function reposition():void
		{
			repositioned = help.visible = share.visible = true;
			
			Tweener.addTween(privacy, {x:697, time:1});
			Tweener.addTween(line, {x:691, time:1, delay:.25});
			Tweener.addTween(terms, {x:583, time:1, delay:.5});
			Tweener.addTween(copyright, {x:291, time:1, delay:.75});
			Tweener.addTween(logo, {alpha:1, time:1, delay:1});
			Tweener.addTween(help, {alpha:1, time:1, delay:1.25});
			Tweener.addTween(share, {alpha:1, time:1, delay:1.5});
			Tweener.addTween(tm, {alpha:0, time:1, delay:1.75});
		}
	}
}
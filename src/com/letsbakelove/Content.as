package com.letsbakelove
{
	import com.letsbakelove.bubbles.*;
	
	import flash.display.Sprite;
	
	public class Content extends Sprite
	{
		private var _application:Application;
		public var _table:Table;
		public var _write:Write;
		public var _send:Send;
		public var _loading:Loading;
		public var _bubble:FlavourBubble;
		public var _bubble2:ThemeBubble;
		public var _bubble3:ToppersBubble;
		public var _bubble4:SendBubble;
		public var _bubble5:WriteBubble;
		public var mute:Boolean = false;
		
		public function Content():void {}
		
		public function init(application:Application):void
		{
			_application = application;
			_table = new Table(this);
			_write = new Write(this);
			_send = new Send(this);
			_loading = new Loading(this);
			_bubble = new FlavourBubble(this);
			_bubble2 = new ThemeBubble();
			_bubble3 = new ToppersBubble();
			_bubble4 = new SendBubble();
			_bubble5 = new WriteBubble();
			
			addChild(_table);
			addChild(_write);
			addChild(_send);
			addChild(_loading);
			addChild(_bubble);
			addChild(_bubble2);
			addChild(_bubble3);
			addChild(_bubble4);
			addChild(_bubble5);
			
			_application._chrome.reposition();
		}
	}
}
package com.letsbakelove {
	
import flash.display.Stage;
import flash.display.Sprite;
import flash.display.MovieClip;
import flash.net.navigateToURL;
import flash.events.*;
import flash.net.*;
import flash.display.BitmapData;
import flash.utils.ByteArray;
import flash.net.URLLoader;
import flash.net.URLVariables;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLLoaderDataFormat;
import flash.net.navigateToURL;
import flash.events.*;
import com.adobe.images.*;


	public class Email
	{
		private var _send:Send;
		
		public function Email(send:Send):void
		{
			_send = send;
		}
		
		public function test():void {
			
			
			var pngSource:BitmapData = new BitmapData (570, 570, true, 0x00000000);
			pngSource.draw(_send._content._table._cake);
			var pngStream:ByteArray = PNGEncoder.encode(pngSource);
			
			var pngURLRequest:URLRequest = new URLRequest ("png_encoding.php?who_sent="+_send.delivery_person+"&sender_name="+_send.field.text+"&sender_email="+_send.field2.text+"&rec_name="+_send.field3.text+"&rec_email="+_send.field4.text+"&rec2_name="+_send.field5.text+"&rec2_email="+_send.field6.text+"&rec3_name="+_send.field7.text+"&rec3_email="+_send.field8.text);			
			
				 
			var header:URLRequestHeader = new URLRequestHeader ("Content-type", "application/octet-stream");
			pngURLRequest.requestHeaders.push(header);				
			pngURLRequest.method = URLRequestMethod.POST;				
			pngURLRequest.data = pngStream;
			
			
			var pngURLLoader:URLLoader = new URLLoader();
			pngURLLoader.dataFormat = URLLoaderDataFormat.BINARY;
			addLoaderListeners(pngURLLoader);
			pngURLLoader.load( pngURLRequest );
			
		}
		
		
				function download():void
		{
			
			var pngSource:BitmapData = new BitmapData (570, 570, true, 
			0x00000000);
			pngSource.draw(_send._content._table._cake);
			var pngStream:ByteArray = PNGEncoder.encode(pngSource);
			
			var pngURLRequest:URLRequest = new URLRequest ("create_wallpaper.php?mc_height="+570+"&mc_width="+570);			
			var header:URLRequestHeader = new URLRequestHeader ("Content-type", "application/octet-stream");
			pngURLRequest.requestHeaders.push(header);				
			pngURLRequest.method = URLRequestMethod.POST;				
			pngURLRequest.data = pngStream;
			
			
			var pngURLLoader:URLLoader = new URLLoader();
			pngURLLoader.dataFormat = URLLoaderDataFormat.BINARY;
			addLoaderListeners_d(pngURLLoader);
			pngURLLoader.load( pngURLRequest );
}


							function view_cake():void
		{
			
			var pngSource:BitmapData = new BitmapData (570, 570, true, 
			0x00000000);
			pngSource.draw(_send._content._table._cake);
			var pngStream:ByteArray = PNGEncoder.encode(pngSource);
			
			var pngURLRequest:URLRequest = new URLRequest ("view_cake.php?who_sent="+_send.delivery_person+"&sender_name="+_send.field.text+"&sender_email="+_send.field2.text+"&rec_name="+_send.field3.text+"&rec_email="+_send.field4.text+"&rec2_name="+_send.field5.text+"&rec2_email="+_send.field6.text+"&rec3_name="+_send.field7.text+"&rec3_email="+_send.field8.text);			
			var header:URLRequestHeader = new URLRequestHeader ("Content-type", "application/octet-stream");
			pngURLRequest.requestHeaders.push(header);				
			pngURLRequest.method = URLRequestMethod.POST;				
			pngURLRequest.data = pngStream;
			
			
			var pngURLLoader:URLLoader = new URLLoader();
			pngURLLoader.dataFormat = URLLoaderDataFormat.BINARY;
			addLoaderListeners_v(pngURLLoader);
			pngURLLoader.load( pngURLRequest );
}
		
//////////////////////////////////////////// listeners for sending ecard
		
		private function addLoaderListeners(d:IEventDispatcher):void
		{
			d.addEventListener(Event.OPEN,inizio);
			d.addEventListener(ProgressEvent.PROGRESS,inProgresso);
			d.addEventListener(Event.COMPLETE,completato);
			//d.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityError);
		}
		
		public function inizio(e:Event):void 
		{
			trace('start');
		}
		
		public function inProgresso(e:ProgressEvent):void 
		{
			
		}
		
		 private function completato(e:Event):void
		{
			_send._content._loading.hide();
			_send.show_confirmation();
			//conWindow.visible=true
			//conWindow.x=100
			//conWindow.y=100
			//conWindow.confirmation.text="done";
			//var vars:URLVariables=new URLVariables(e.target.data);
			//var req:URLRequest=new URLRequest('http://www.pushstage.ca/virgin/ecard/'+vars.imageurl);
			//navigateToURL(req,'_self');
		}
		
//////////////////////////////////////////// listeners for download
		
		private function addLoaderListeners_d(d:IEventDispatcher):void
		{
			d.addEventListener(Event.OPEN,inizio_d);
			d.addEventListener(ProgressEvent.PROGRESS,inProgresso_d);
			d.addEventListener(Event.COMPLETE,completato_d);
			d.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityError_d);
		}
		
		private function inizio_d(e:Event):void 
		{
			trace('start');
		}
		
		private function inProgresso_d(e:ProgressEvent):void 
		{
			
		}
		
		private function completato_d(e:Event):void
		{

			_send._content._loading.hide();
			var vars:URLVariables=new URLVariables(e.target.data);
			var req:URLRequest=new URLRequest('http://www.letsbakelove.com/download/'+vars.imageurl);
			navigateToURL(req,'_blank');
			
		}
		
		private function securityError_d(e:SecurityErrorEvent):void 
		{
			trace('errore sicurezza: '+e+'\n');
		}
		
////////////////////////////////////////////listeners for view cake
private function addLoaderListeners_v(d:IEventDispatcher):void
		{
			d.addEventListener(Event.OPEN,inizio_v);
			d.addEventListener(ProgressEvent.PROGRESS,inProgresso_v);
			d.addEventListener(Event.COMPLETE,completato_v);
			d.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityError_v);
		}
		
		private function inizio_v(e:Event):void 
		{
			trace('start');
		}
		
		private function inProgresso_v(e:ProgressEvent):void 
		{
			
		}
		
		private function completato_v(e:Event):void
		{

			_send._content._loading.hide();
			var vars:URLVariables=new URLVariables(e.target.data);
			var req:URLRequest=new URLRequest(vars.imageurl+"&sender="+vars.sender+"&receiver="+vars.receiver+"&del="+vars.del);
			navigateToURL(req,'_blank');
		}
		
		private function securityError_v(e:SecurityErrorEvent):void 
		{
			trace('errore sicurezza: '+e+'\n');
		}
		
		
		
		
		
}


		

}
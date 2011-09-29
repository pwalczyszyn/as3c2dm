package com.riaspace.c2dm.events
{
	import flash.events.Event;
	
	public class C2DMRegistrationEvent extends Event
	{
		
		public static const REGISTERED:String = "registered";
		
		public static const UNREGISTERED:String = "unregistered";
		
		public static const ERROR:String = "error";
		
		public var text:String;
		
		public function C2DMRegistrationEvent(type:String, text:String = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.text = text;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new C2DMRegistrationEvent(type, text, bubbles, cancelable);
		}
	}
}
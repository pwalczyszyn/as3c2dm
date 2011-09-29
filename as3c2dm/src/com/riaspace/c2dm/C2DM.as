package com.riaspace.c2dm
{
	import com.riaspace.c2dm.events.C2DMRegistrationEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;

	[Event(name="registered", type="com.riaspace.c2dm.events.C2DMRegistrationEvent")]
	[Event(name="unregistered", type="com.riaspace.c2dm.events.C2DMRegistrationEvent")]
	[Event(name="error", type="com.riaspace.c2dm.events.C2DMRegistrationEvent")]
	
	public class C2DM extends EventDispatcher
	{
		private static var extContext:ExtensionContext = null;

		public function C2DM()
		{
			extContext = ExtensionContext.createExtensionContext("com.riaspace.c2dm", null);
			extContext.addEventListener(StatusEvent.STATUS, onStatus);
		}

		public function register(emailOfSender:String):void
		{
			extContext.call("register", emailOfSender);
		}
		
		public function unregister():void
		{
			extContext.call("unregister");
		}

		private function onStatus(event:StatusEvent):void
		{
			if (["registered", "unregistered", "error"].indexOf(event.level) >= 0)
			{
				dispatchEvent(new C2DMRegistrationEvent(event.level, event.code));
			}
			else
			{
				throw new Error("Received unknown event type from native extension: " + event.level);
			}
		}
	}
}
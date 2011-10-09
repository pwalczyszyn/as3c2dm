//////////////////////////////////////////////////////////////////////////////////////
//
//	Copyright 2011 Piotr Walczyszyn (http://riaspace.com | @pwalczyszyn)
//	
//	Licensed under the Apache License, Version 2.0 (the "License");
//	you may not use this file except in compliance with the License.
//	You may obtain a copy of the License at
//	
//		http://www.apache.org/licenses/LICENSE-2.0
//	
//	Unless required by applicable law or agreed to in writing, software
//	distributed under the License is distributed on an "AS IS" BASIS,
//	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//	See the License for the specific language governing permissions and
//	limitations under the License.
//	
//////////////////////////////////////////////////////////////////////////////////////

package com.riaspace.c2dm
{
	import com.riaspace.c2dm.events.C2DMErrorEvent;
	import com.riaspace.c2dm.events.C2DMRegistrationEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;

	[Event(name="error", type="com.riaspace.c2dm.events.C2DMErrorEvent")]
	[Event(name="registered", type="com.riaspace.c2dm.events.C2DMRegistrationEvent")]
	[Event(name="unregistered", type="com.riaspace.c2dm.events.C2DMRegistrationEvent")]
	
	public class C2DM extends EventDispatcher
	{
		private static var extContext:ExtensionContext = null;

		public function C2DM()
		{
			extContext = ExtensionContext.createExtensionContext("com.riaspace.c2dm", null);
			extContext.addEventListener(StatusEvent.STATUS, onStatus);
		}

		public static function get isSupported():Boolean
		{
			var manufacturer:String = Capabilities.manufacturer.toLowerCase();
			return manufacturer.indexOf("android") >= 0; 
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
				if (event.level == "error")
					dispatchEvent(new C2DMErrorEvent(C2DMErrorEvent.ERROR, event.code));
				else
					dispatchEvent(new C2DMRegistrationEvent(event.level, event.code));
			}
			else
			{
				throw new Error("Received unknown event type from native extension: " + event.level);
			}
		}
	}
}
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
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
	public final class C2DMErrorCodes
	{
		/**
		 * The device can't read the response, or there was a 500/503 from the server that can be retried later. The application should use exponential back off and retry.
		 */
		public static const SERVICE_NOT_AVAILABLE:String = "SERVICE_NOT_AVAILABLE";
		
		/**
		 * There is no Google account on the phone. The application should ask the user to open the account manager and add a Google account. Fix on the device side.
		 */
		public static const ACCOUNT_MISSING:String = "ACCOUNT_MISSING";
		
		/**
		 * Bad password. The application should ask the user to enter his/her password, and let user retry manually later. Fix on the device side.
		 */
		public static const AUTHENTICATION_FAILED:String = "AUTHENTICATION_FAILED";
		
		/**
		 * The user has too many applications registered. The application should tell the user to uninstall some other applications, let user retry manually. Fix on the device side.
		 */
		public static const TOO_MANY_REGISTRATIONS:String = "TOO_MANY_REGISTRATIONS";
		
		/**
		 * The sender account is not recognized.
		 */
		public static const INVALID_SENDER:String = "INVALID_SENDER";
	
		/**
		 * Incorrect phone registration with Google. This phone doesn't currently support C2DM.
		 */
		public static const PHONE_REGISTRATION_ERROR:String = "PHONE_REGISTRATION_ERROR";
	}
}
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

package com.riaspace.c2dm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class C2DMRegisterFunction implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		Log.d("as3c2dm", "C2DMRegisterFunction.call");
		try {
			Context appContext = context.getActivity().getApplicationContext();
			Intent registrationIntent = new Intent(
					"com.google.android.c2dm.intent.REGISTER");
			registrationIntent.putExtra("app",
					PendingIntent.getBroadcast(appContext, 0, new Intent(), 0));
			registrationIntent.putExtra("sender", args[0].getAsString());
			appContext.startService(registrationIntent);
		} catch (Exception e) {
			Log.e("as3c2dm", "Error sending registration intent.", e);
		}
		return null;
	}
}

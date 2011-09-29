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

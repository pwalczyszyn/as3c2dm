package com.riaspace.c2dm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class C2DMUnregisterFunction implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		Log.d("as3c2dm", "C2DMUnregisterFunction.call");
		try {
			Context appContext = context.getActivity().getApplicationContext();
			Intent unregIntent = new Intent(
					"com.google.android.c2dm.intent.UNREGISTER");
			unregIntent.putExtra("app",
					PendingIntent.getBroadcast(appContext, 0, new Intent(), 0));
			appContext.startService(unregIntent);
		} catch (Exception e) {
			Log.e("as3c2dm", "Error sending unregister intent.", e);
		}
		return null;
	}
}

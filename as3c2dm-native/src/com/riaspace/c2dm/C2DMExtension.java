package com.riaspace.c2dm;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class C2DMExtension implements FREExtension {

	public static FREContext context;
	
	@Override
	public FREContext createContext(String extId) {
		Log.d("as3c2dm", "C2DMExtension.createContext extId: " + extId);
		return context = new C2DMExtensionContext();
	}

	@Override
	public void dispose() {
		Log.d("as3c2dm", "C2DMExtension.dispose");
		context = null;
	}

	@Override
	public void initialize() {
		Log.d("as3c2dm", "C2DMExtension.initialize");
	}
}

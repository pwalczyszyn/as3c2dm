package com.riaspace.c2dm;

import java.util.HashMap;
import java.util.Map;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class C2DMExtensionContext extends FREContext {

	public C2DMExtensionContext() {
		Log.d("as3c2dm", "C2DMExtensionContext.C2DMExtensionContext");
	}
	
	@Override
	public void dispose() {
		Log.d("as3c2dm", "C2DMExtensionContext.dispose");
		C2DMExtension.context = null;
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Log.d("as3c2dm", "C2DMExtensionContext.getFunctions");
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		functionMap.put("register", new C2DMRegisterFunction());
		functionMap.put("unregister", new C2DMUnregisterFunction());
		return functionMap;	
	}

}

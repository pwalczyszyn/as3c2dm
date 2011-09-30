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

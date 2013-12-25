package com.mobilestation.util;

import android.content.Context;
import android.content.Intent;

public class IntentUtils {
	
	public static void sendActivity(Context context, Class<?> cls) {
		Intent intent = new Intent(context, cls);
		intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
		context.startActivity(intent);
	}

}

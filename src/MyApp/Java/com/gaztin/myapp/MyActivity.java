
package com.gaztin.myapp;

import android.app.NativeActivity;
import android.os.Bundle;

public class MyActivity extends NativeActivity
{
	@Override
	protected void onCreate( Bundle savedInstanceState )
	{
		super.onCreate( savedInstanceState );

		System.loadLibrary( "MyApp" );
	}
}

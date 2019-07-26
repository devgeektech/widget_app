package com.example.widgetapp;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
     /* GeneratedPluginRegistrant.registerWith(this)
      FlutterWebviewPlugin.registerWith(this.registrarFor("com.flutter_webview_plugin.FlutterWebviewPlugin"))
    */
     GeneratedPluginRegistrant.registerWith(MainActivity.this);
  }
}

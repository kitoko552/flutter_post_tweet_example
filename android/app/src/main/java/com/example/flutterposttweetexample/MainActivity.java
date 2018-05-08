package com.example.flutterposttweetexample;

import android.os.Bundle;
import android.content.Intent;
import android.net.Uri;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.kitoko552.flutter_post_tweet_example/tweet";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall methodCall, Result result) {
                if (methodCall.method.equals("tweet")) {
                  openTwitter();
                } else {
                  result.notImplemented();
                }
              }
            }
    );
  }

  private void openTwitter() {
    Intent intent = new Intent(Intent.ACTION_VIEW);
    String message= Uri.encode("This tweet is posted on Flutter app!");
    intent.setData(Uri.parse("twitter://post?message=" + message));
    startActivity(intent);
  }
}

package com.wxx.bytedance_pangolin;

import android.app.Activity;
import android.content.Context;
import android.widget.FrameLayout;

import java.util.List;


import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;


import androidx.annotation.NonNull;
import androidx.recyclerview.widget.GridLayoutManager;

import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.TTAdNative;
import com.bytedance.sdk.openadsdk.TTAppDownloadListener;
import com.bytedance.sdk.openadsdk.TTNativeExpressAd;
import com.bytedance.sdk.openadsdk.TTFullScreenVideoAd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** BytedancePangolinPlugin */
public class BytedancePangolinPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context applicationContext;
  private Activity activity;

  //bannerAd parameter
  private TTAdNative mTTAdNative;
  private Context mContext;
  private FrameLayout mExpressContainer;
  private TTNativeExpressAd mTTAd;
  private TTFullScreenVideoAd mFSVAd;
  private long startTime = 0;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "bytedance_pangolin");
    channel.setMethodCallHandler(this);
    onAttachedToEngine(flutterPluginBinding.getApplicationContext(), flutterPluginBinding.getBinaryMessenger());
  }

  public static void registerWith(Registrar registrar) {
    final BytedancePangolinPlugin instance = new BytedancePangolinPlugin();
    instance.onAttachedToEngine(registrar.context(),registrar.messenger(),registrar.activity());
  }

  private void onAttachedToEngine(Context applicationContext , BinaryMessenger messenger) {
    this.applicationContext = applicationContext;

  }

  private void onAttachedToEngine(Context applicationContext , BinaryMessenger messenger, Activity activity) {
    this.applicationContext = applicationContext;

    this.activity = activity;
  }


  public void onAttachedToActivity(ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }




  public void onDetachedFromActivityForConfigChanges() {

  }


  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {

  }


  public void onDetachedFromActivity() {

  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }else if (call.method.equals("register")) {

      System.out.println("注册穿山甲sdk");

      String appId = call.argument("appId");
      Boolean useTextureView = call.argument("useTextureView");
      String appName = call.argument("appName");
      Boolean allowShowNotify = call.argument("allowShowNotify");
      Boolean allowShowPageWhenScreenLock = call.argument("allowShowPageWhenScreenLock");
      Boolean debug = call.argument("debug");
      Boolean supportMultiProcess = call.argument("supportMultiProcess");
      List<Integer> directDownloadNetworkType = call.argument("directDownloadNetworkType");
      if(useTextureView == null)
      {
        useTextureView = false;
      }
      if (allowShowNotify == null)
      {
        allowShowNotify = true;
      }
      if (allowShowPageWhenScreenLock == null)
      {
        allowShowPageWhenScreenLock = true;
      }
      if (debug == null)
      {
        debug = true;
      }
      if (supportMultiProcess == null)
      {
        supportMultiProcess = false;
      }
      if (appId == null || appId.trim().isEmpty())
      {
        result.error("500","appId can't be null",null);
      }
      else {
        if (appName == null || appName.trim().isEmpty()) {
          result.error("600", "appName can't be null", null);
        } else {
          TTAdManagerHolder.init(applicationContext, appId, useTextureView, appName, allowShowNotify, allowShowPageWhenScreenLock, debug, supportMultiProcess,directDownloadNetworkType);
          result.success(true);
        }
      }

    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}

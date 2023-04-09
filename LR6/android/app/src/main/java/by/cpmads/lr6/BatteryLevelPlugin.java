package by.cpmads.lr6;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** BatteryLevelPlugin */
public class BatteryLevelPlugin implements FlutterPlugin, MethodCallHandler {

    private Context applicationContext;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        this.applicationContext = flutterPluginBinding.getApplicationContext();
        final MethodChannel channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "battery");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getBatteryLevel")) {
            int batteryLevel = getBatteryLevel();
            if (batteryLevel != -1) {
                result.success(batteryLevel);
            } else {
                result.error("UNAVAILABLE", "Battery level not available.", null);
            }
        } else {
            result.notImplemented();
        }
    }

    private int getBatteryLevel() {
        Intent batteryIntent = applicationContext.getApplicationContext()
                .registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
        if (batteryIntent == null) {
            return -1;
        } else {
            int level = batteryIntent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
            int scale = batteryIntent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
            return (int) Math.floor(level * 100 / (float) scale);
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }
}

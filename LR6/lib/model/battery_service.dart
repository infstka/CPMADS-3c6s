import 'package:flutter/services.dart';

class BatteryService {
  static const MethodChannel _channel = const MethodChannel('battery');

  static Future<int> getBatteryLevel() async {
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel');
      return result;
    } on PlatformException catch (e) {
      throw 'Failed to get battery level: ${e.message}';
    }
  }
}

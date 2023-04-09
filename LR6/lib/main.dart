import 'package:flutter/services.dart';
import 'package:lr6/model/battery_service.dart';
import 'package:lr6/screen/discover_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // обязательно вызываем эту функцию
  // Для Android
  const MethodChannel batteryChannelAndroid = MethodChannel('battery');
  batteryChannelAndroid.setMethodCallHandler((MethodCall call) async {
    if (call.method == 'getBatteryLevel') {
      int batteryLevel = await BatteryService.getBatteryLevel();
      return batteryLevel;
    }
    return null;
  });

  // Для iOS
  const MethodChannel batteryChannelIOS = MethodChannel('battery');
  batteryChannelIOS.setMethodCallHandler((MethodCall call) async {
    if (call.method == 'getBatteryLevel') {
      int batteryLevel = await BatteryService.getBatteryLevel();
      return batteryLevel;
    }
    return null;
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const DiscoverScreen(),
    );
  }
}

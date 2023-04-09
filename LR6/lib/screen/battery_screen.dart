import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lr6/model/battery_service.dart';

class BatteryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Battery Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  int batteryLevel = await BatteryService.getBatteryLevel();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Battery Level'),
                        content: Text('$batteryLevel%'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Get Battery Level'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

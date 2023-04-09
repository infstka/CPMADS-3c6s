import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PVScreen extends StatelessWidget {
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Demo'),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Container(
            color: _colors[index],
            child: Center(
              child: Text(
                'Page ${index + 1}',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          );
        },
        itemCount: _colors.length,
      ),
    );
  }
}

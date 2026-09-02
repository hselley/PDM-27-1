// App0302.dart
import 'package:flutter/material.dart';

main() => runApp(App0302());

class App0302 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
            child: Text(
              "Hola mundo cruel",
              textScaler: TextScaler.linear(2.5),
              style: TextStyle(color: Colors.red),
            )
        ),
      ),
    );
  }
}
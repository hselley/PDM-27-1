// App0309.dart
import 'package:flutter/material.dart';

main() => runApp(App0309());

class App0309 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi primer imágen"),
        ),
        body: Center(
          child: Image.asset("assets/LogoAndroid.png"),
        ),
      ),
    );
  }
}
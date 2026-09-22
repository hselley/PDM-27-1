// App0406.dart
import 'package:flutter/material.dart';

final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
final List<int> colorCodes = <int>[600, 500, 100, 50, 25, 10, 5];

main() => runApp(App0406());

class App0406 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView builder demo"),),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                color: Colors.blue[colorCodes[index]],
                child: Center(
                  child: Text('Entry ${entries[index]}'),
                ),
              );
            }
        ),
      ),
    );
  }
}
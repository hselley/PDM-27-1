import 'package:flutter/material.dart';

void main() => runApp(App0303());

class App0303 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My second Scaffold"),
          elevation: 100,
        ),
        body: Center(
          child: Text("Hello cruel world!", textScaler: TextScaler.linear(3.5),),
        ),
        drawer: Drawer(
          child: Center(
              child: Text("I'm a drawer", textScaler: TextScaler.linear(2.5),)
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: const Icon(Icons.people),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Icon(Icons.plus_one),
              //SizedBox(width: 30,),
              Text("Hello"),
              //SizedBox(width: 30,),
              Icon(Icons.mic)
            ],
          ),
        ),
      ),
    );
  }
}

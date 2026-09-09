// App0405.dart

import 'package:flutter/material.dart';

void main() => runApp(App0405());

class App0405 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Scaffold"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              funcion("Hola mundo"),
              SizedBox(height: 40.0,),
              Text("5! = ${factorial(5)}"),
            ],
          ),
        ),
      ),
    );
  }
  // Funciones auxiliares
  Widget funcion(String cadena) {
    return Text(cadena, textScaler: TextScaler.linear(3),);
  }

  String factorial(int n) {
    double f=1;
    for(int i=1; i<=n; i++) {
      f *= i;
    }
    return f.toString();
  }
}
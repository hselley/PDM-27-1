// App0402.dart
import 'package:flutter/material.dart';

main() => runApp(App0402());

class App0402 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(child: Text(otraFuncion("Hola mundo")),),
      ),
    );
  }

  // Función propia
  String funcion(String s) {
    return "** $s **";
  }
  // Segunda version
  otraFuncion(s) => "** $s **";

}
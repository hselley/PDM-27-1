// App08Main.dart
// Aplicación reseña de películas

import 'package:flutter/material.dart';
import 'App0805.dart';

void main() => runApp(App08Main());

class App08Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieTitlePage(),
    );
  }
}

class MovieTitlePage extends StatefulWidget {
  @override
  MovieTitlePageState createState() => MovieTitlePageState();
}

class MovieTitlePageState extends State<MovieTitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Title"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: buildTitlePageCore(),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final overview = 'La vida de Craig Schwartz está llegando'
                    'al final de un ciclo. Craig es un marionetista '
                    'callejero con un gran talento, pero él tiene la '
                    'impresión de que su vida carece de sentido. Nueva '
                    'York ha cambiado mucho y la gente no le presta mucha '
                    'atención. Lleva diez años casado con Lotte, que trabaja '
                    'en una tienda de animales y está obsesionada con su trabajo.'
                    'Él consigue encontrar trabajo en la planta 7.5 del edificio '
                    'Mertin-Flemmer de Manhattan, donde encuentra una pequeña '
                    'puerta que le permite el acceso a un pasillo secreto que le '
                    'aspira y que le permite acceder al cerebro de John Malkovich.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: buildDetailPageCore(context),
        )
      )
    );
  }
}
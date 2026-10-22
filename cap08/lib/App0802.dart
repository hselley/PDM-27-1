// App0802.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

// Navegación -> mediante rutas
extension MoreMovieTitlePage on MovieTitlePageState {
  gotoDetailPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
  }

  Widget buildTitlePageCore() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("¿Quieres ser Jonh Malkovich?", textScaler: TextScaler.linear(1.5),),
        SizedBox(height: 18,),
        FilledButton.icon(
          onPressed: gotoDetailPage,
          label: Text("Details"),
          icon: Icon(Icons.local_movies),
        )
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(overview),
        SizedBox(height: 25.0,),
        Image.asset('assets/malkovich.webp', height: 400,),
      ],
    );
  }
}
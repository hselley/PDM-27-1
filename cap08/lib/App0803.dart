// App0803.dart

import 'package:flutter/material.dart';
import 'App08Main.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static final bool _isFavorite = true;

  gotoDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
        settings: RouteSettings(arguments: _isFavorite)
      )
    );
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("¿Quieres ser John Malkovich?", textScaler: TextScaler.linear(1.5),),
        SizedBox(height: 30,),
        ElevatedButton.icon(
          onPressed: gotoDetailPage,
          label: Text("Details"),
          icon: Icon(Icons.local_movies))
      ],
    );
  }
}

extension MoreDetailPage on DetailPage {
  Widget buildDetailPageCore(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(overview, textScaler: TextScaler.linear(1.5),),
        SizedBox(height: 30,),
        Visibility(
          visible: ModalRoute.of(context)?.settings.arguments as bool,
          child: Icon(Icons.favorite, size: 150, color: Colors.red,),
        )
      ],
    );
  }
}
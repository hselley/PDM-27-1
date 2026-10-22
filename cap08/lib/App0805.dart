import 'package:flutter/material.dart';
import 'App08Main.dart';

extension MoreMovieTitlePage on MovieTitlePageState {
  static bool _isFavorite = false;

  gotoDetailPage() async {
    _isFavorite = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(),
          settings: RouteSettings(arguments: _isFavorite)
      ),
    ) ?? _isFavorite;

    setState(() {});
  }

  Widget buildTitlePageCore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("¿Quieres ser Jonh Malkovich?", textScaler: TextScaler.linear(1.5),),
            Visibility(
              visible: _isFavorite ?? false,
              child: Icon(Icons.favorite, color: Colors.red, size: 30,)
            ),
          ],
        ),
        SizedBox(height: 16,),
        ElevatedButton.icon(
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
    final _argument = ModalRoute.of(context)?.settings.arguments ?? false;
    final _isFavoriteArgument = _argument as bool;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(overview),
        SizedBox(height: 16,),
        Image.asset('assets/malkovich.webp', height: 300,),
        SizedBox(height: 16,),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, !_isFavoriteArgument);
          },
          child: Text(_isFavoriteArgument ? 'Unfavorite this' : 'Make it favorite'),
        )
      ],
    );
  }
}
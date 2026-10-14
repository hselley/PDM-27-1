// App0706.dart

import 'package:flutter/material.dart';

void main() => runApp(App0706());

class App0706 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(),);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Relationship {
  Friend,
  OneDate,
  Ongoing,
  Commited,
  Marriage
}

Map<Relationship, String> show = {
  Relationship.Friend: "Friend",
  Relationship.OneDate: "One Date",
  Relationship.Ongoing: "Ongoing relationship",
  Relationship.Commited: "Commited relationship",
  Relationship.Marriage: "Marriage",
};

List<DropdownMenuItem<Relationship>> _relationshipList = [
  DropdownMenuItem(
      value: Relationship.Friend,
      child: Text(show[Relationship.Friend] as String)
  ),
  DropdownMenuItem(
      value: Relationship.OneDate,
      child: Text(show[Relationship.OneDate] as String)
  ),
  DropdownMenuItem(
      value: Relationship.Ongoing,
      child: Text(show[Relationship.Ongoing] as String)
  ),
  DropdownMenuItem(
      value: Relationship.Commited,
      child: Text(show[Relationship.Commited] as String)
  ),
  DropdownMenuItem(
      value: Relationship.Marriage,
      child: Text(show[Relationship.Marriage] as String)
  ),
];

class _MyHomePageState extends State<MyHomePage> {
  Relationship? _relationshipDropdownValue;

  /// State
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Are you compatible with Hilda?"),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            _buildRelationshipDropdown(),
            _buildResultsImage()
          ],
        ),
      ),
    );
  }






}
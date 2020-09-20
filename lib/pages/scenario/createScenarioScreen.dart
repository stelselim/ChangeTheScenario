import 'package:flutter/material.dart';

/// This is the screen that scenariouses created by users
class ScenarioAddPage extends StatefulWidget {
  ScenarioAddPage({Key key}) : super(key: key);

  @override
  _ScenarioAddPageState createState() => _ScenarioAddPageState();
}

class _ScenarioAddPageState extends State<ScenarioAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scenario Add"),
      ),
    );
  }
}

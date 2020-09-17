import 'package:changescenario/components/appBarText.dart';
import 'package:flutter/material.dart';

class ScenarioPage extends StatelessWidget {
  const ScenarioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          appBarText(
            height: height,
            title: "Change Scenarios",
            italic: FontStyle.italic,
            textColor: Colors.blue.shade700,
          ),
        ],
      ),
    );
  }
}

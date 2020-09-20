import 'package:changescenario/components/appBarText.dart';
import 'package:flutter/material.dart';

class ScenarioPage extends StatefulWidget {
  const ScenarioPage({Key key}) : super(key: key);

  @override
  _ScenarioPageState createState() => _ScenarioPageState();
}

class _ScenarioPageState extends State<ScenarioPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Should Listen Scroll Controller
    // scrollController.
  }

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
            textColor: Colors.blue.shade700,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              controller: scrollController,
              itemBuilder: (context, index) {
                /// Scenario Post Cards
                return Container(
                  height: 240,
                  margin: EdgeInsets.all(15),
                  child: Card(
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Title"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Title"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Title"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

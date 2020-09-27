import 'package:changescenario/components/scenario/postCard.dart';
import 'package:changescenario/pages/scenario/scenario.dart';
import 'package:flutter/material.dart';

class ProfilePostTab extends StatelessWidget {
  const ProfilePostTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10),
      children: [
        ScenarioPostCard(scenario: scenario, userUid: "null"),
        ScenarioPostCard(scenario: scenario, userUid: "null"),
        ScenarioPostCard(scenario: scenario, userUid: "null"),
        ScenarioPostCard(scenario: scenario, userUid: "null"),
        ScenarioPostCard(scenario: scenario, userUid: "null"),
      ],
    );
  }
}

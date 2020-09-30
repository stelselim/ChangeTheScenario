import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/components/scenario/postCard.dart';
import 'package:changescenario/pages/scenario/scenario.dart';
import 'package:flutter/material.dart';

List<Scenario> scenarious = [
  scenario,
  scenario,
  scenario,
  scenario,
  scenario,
  scenario,
  scenario,
];

class ProfilePostTab extends StatelessWidget {
  const ProfilePostTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scenarious.length,
      padding: EdgeInsets.only(top: 10),
      itemBuilder: (context, index) {
        return ScenarioPostCard(
          scenario: scenarious.elementAt(index),
          userUid: "",
        );
      },
    );
  }
}

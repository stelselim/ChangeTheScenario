import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future createScenario(
  BuildContext context,
  Scenario scenario,
) async {
  await FirebaseFirestore.instance
      .collection(scenariosColletion)
      .add(scenario.toMap());
}

Future updateScenario(
  BuildContext context,
  Scenario updatedScenario,
  String docId,
) async {
  await FirebaseFirestore.instance
      .collection(scenariosColletion)
      .doc(docId)
      .update(updatedScenario.toMap());
}

Future deleteScenario(
  String docId,
) async {
  await FirebaseFirestore.instance
      .collection(scenariosColletion)
      .doc(docId)
      .delete();
}

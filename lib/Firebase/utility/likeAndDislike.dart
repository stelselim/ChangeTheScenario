import 'package:changescenario/classes/Scenario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future likePost(
  Scenario scenario,
  DocumentReference documentReference,
  String userUid,
) async {
  // Get Latest Doc Then Update
  final doc = await documentReference.get();
  final scenarioLatest = Scenario.fromMap(doc.data());
  scenarioLatest.likedUserUIDs.add(userUid);

  await documentReference.update(
    scenarioLatest.toMap(),
  );
}

Future unlikePost(
  Scenario scenario,
  DocumentReference documentReference,
  String userUid,
) async {
  // Get Latest Doc Then Update
  final doc = await documentReference.get();
  final scenarioLatest = Scenario.fromMap(doc.data());
  scenarioLatest.likedUserUIDs.remove(userUid);

  await documentReference.update(
    scenarioLatest.toMap(),
  );
}

Future dislikePost(
  Scenario scenario,
  DocumentReference documentReference,
  String userUid,
) async {
  // Get Latest Doc Then Update
  final doc = await documentReference.get();
  final scenarioLatest = Scenario.fromMap(doc.data());
  scenarioLatest.dislikedUserUIDs.add(userUid);

  await documentReference.update(
    scenarioLatest.toMap(),
  );
}

Future undislikePost(
  Scenario scenario,
  DocumentReference documentReference,
  String userUid,
) async {
  // Get Latest Doc Then Update
  final doc = await documentReference.get();
  final scenarioLatest = Scenario.fromMap(doc.data());
  scenarioLatest.dislikedUserUIDs.remove(userUid);

  await documentReference.update(
    scenarioLatest.toMap(),
  );
}

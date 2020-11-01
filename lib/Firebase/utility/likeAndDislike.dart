import 'package:changescenario/classes/Scenario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future likePost(
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

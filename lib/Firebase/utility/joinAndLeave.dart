import 'package:changescenario/classes/Event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future joinEvent(
  DocumentReference documentReference,
  Watcher newWatcher,
) async {
  final doc = await documentReference.get();
  var toAddEvent = FilmEvent.fromMap(doc.data());
  toAddEvent.toWatchPeople.add(newWatcher);
  await documentReference.update(toAddEvent.toMap());
}

Future leaveEvent(
  DocumentReference documentReference,
  String watcherUid,
) async {
  final doc = await documentReference.get();
  var toAddEvent = FilmEvent.fromMap(doc.data());
  int toDelete;
  toAddEvent.toWatchPeople.forEach((element) {
    if (element.userUid == watcherUid) {
      toDelete = toAddEvent.toWatchPeople.indexOf(element);
    }
  });
  toAddEvent.toWatchPeople.removeAt(toDelete);
  if (toDelete != null) {
    await documentReference.update(toAddEvent.toMap());
  }
}

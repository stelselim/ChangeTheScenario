import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/classes/Event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future createEvent(
  BuildContext context,
  FilmEvent event,
) async {
  await FirebaseFirestore.instance
      .collection(eventsCollection)
      .add(event.toMap());
}

Future updateEvent(
  BuildContext context,
  FilmEvent event,
  String docId,
) async {
  await FirebaseFirestore.instance
      .collection(eventsCollection)
      .doc(docId)
      .update(event.toMap());
}

Future deleteEvent(
  String docId,
) async {
  await FirebaseFirestore.instance
      .collection(eventsCollection)
      .doc(docId)
      .delete();
}

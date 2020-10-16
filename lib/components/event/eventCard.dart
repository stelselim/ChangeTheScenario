import 'package:changescenario/classes/Event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
    @required this.setStateParent,
    @required this.filmEvent,
    @required this.documentReference,
    @required this.userUid,
  }) : super(key: key);

  final Function setStateParent;

  String formatDate(DateTime date) => new DateFormat("d MMM yyyy").format(date);

  final FilmEvent filmEvent;
  final DocumentReference documentReference;
  final String userUid; // Current user uid for Like

  static final titleTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static final usernameTextStyle = TextStyle(
    color: Colors.blue.shade700,
    // decoration: TextDecoration.underline,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static final iconcolor = Colors.blue.shade100;
  static final dateTextStyle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );
  static final filmTextStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static final scriptTextStyle = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  static final commentTextStyle = TextStyle(
    color: Colors.deepPurple.shade900,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static final likeDislikeTextStyle = TextStyle(
    color: Colors.deepPurple.shade900,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

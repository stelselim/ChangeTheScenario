import 'package:changescenario/classes/Follower.dart';
import 'package:flutter/material.dart';

Widget followerListTile({@required Follower follower}) {
  return ListTile(
    leading: CircleAvatar(
      child: Text(
        follower.nickname.substring(0, 2),
      ),
    ),
    title: Text(follower.nickname),
    onTap: () {
      final uid = follower.uid;
    }, // Go To Profile Page
  );
}

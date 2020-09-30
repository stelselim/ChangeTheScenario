import 'package:changescenario/classes/Follower.dart';
import 'package:changescenario/components/profile/followerListTile.dart';
import 'package:flutter/material.dart';

List<Follower> following = [
  Follower(uid: "", nickname: "stelselim"),
  Follower(uid: "", nickname: "ibolas"),
  Follower(uid: "", nickname: "ozzgeolcek"),
  Follower(uid: "", nickname: "newVegasLat"),
  Follower(uid: "", nickname: "dededesas"),
];

class FollowingTab extends StatelessWidget {
  const FollowingTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: following.length,
      padding: EdgeInsets.only(top: 10),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: followerListTile(
            follower: following.elementAt(index),
          ),
        );
      },
    );
  }
}

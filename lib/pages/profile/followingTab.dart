import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Follower.dart';
import 'package:changescenario/components/profile/followerListTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowingTab extends StatelessWidget {
  const FollowingTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final following =
        Provider.of<UserState>(context, listen: false).user.following;

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

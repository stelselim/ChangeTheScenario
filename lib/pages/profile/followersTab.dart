import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/components/profile/followerListTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FollowersTab extends StatelessWidget {
  const FollowersTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final follower =
        Provider.of<UserState>(context, listen: false).user.followers;

    return ListView.builder(
      itemCount: follower.length,
      padding: EdgeInsets.only(top: 10),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: followerListTile(
            follower: follower.elementAt(index),
          ),
        );
      },
    );
  }
}

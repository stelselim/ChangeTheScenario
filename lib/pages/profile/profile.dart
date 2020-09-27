import 'package:changescenario/components/profile/topBackground.dart';
import 'package:changescenario/pages/profile/followersTab.dart';
import 'package:changescenario/pages/profile/followingTab.dart';
import 'package:changescenario/pages/profile/postTab.dart';
import 'package:flutter/material.dart';

final nickname = "Stelselim";
final myBio = "My bio is not enough to get know me well";

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileInfoBackground(),
        DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              /// Circle Avatar & Nickname-Bio
              /// Expanded 10
              Expanded(
                flex: 10,
                child: Container(
                  // color: Colors.red,
                  child: Row(
                    children: [
                      // Circle Avatar
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: CircleAvatar(
                            child: Text(
                              "${nickname.substring(0, 2).toUpperCase()}",
                              textScaleFactor: 2.5,
                            ),
                            minRadius: 30,
                            maxRadius: 40,
                          ),
                        ),
                      ),
                      // Nickname
                      Expanded(
                        flex: 5,
                        child: ListTile(
                          title: Text(
                            "$nickname",
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey.shade900.withOpacity(0.99),
                            ),
                          ),
                          subtitle: Text(
                            "$myBio",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Expanded 5
              Expanded(
                flex: 5,
                child: Container(
                  child: TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.white,
                      ),
                      insets: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                    ),
                    unselectedLabelColor: Colors.blueGrey,
                    tabs: [
                      Tab(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '22',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' Posts'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '33',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' Following'),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '33',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' Followers'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Rest Of Page
              Expanded(
                flex: 30,
                child: TabBarView(
                  children: [
                    ProfilePostTab(),
                    FollowingTab(),
                    FollowersTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

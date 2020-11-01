import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/components/profile/topBackground.dart';
import 'package:changescenario/pages/profile/eventTab.dart';
import 'package:changescenario/pages/profile/postTab.dart';
import 'package:changescenario/pages/profile/profileBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherProfilePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool editable;
  const OtherProfilePage({
    Key key,
    @required this.scaffoldKey,
    @required this.nickname,
    @required this.otherUserUid,
    @required this.editable,
    @required this.bio,
  }) : super(key: key);

  final String nickname;
  final String bio;
  final String otherUserUid;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileInfoBackground(),
        DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              /// Circle Avatar & Nickname-Bio & Edit Button
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
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.blueGrey.shade900.withOpacity(0.95),
                            ),
                          ),
                          subtitle: Text(
                            "$bio",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      /// Show Profile Edit Bottom Sheet
                      editable
                          ? GestureDetector(
                              onTap: () => showProfileBottomSheet(context),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),

              /// Expanded 5
              /// Post & Follower/Following
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
                                text: 'Your Posts',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: Consumer<UserState>(
                          builder: (context, state, _) => RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Your Events',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// Following & Followers
/* 
                        Tab(
                        child: Consumer<UserState>(
                          builder: (context, state, _) => RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: state.user.following.length.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ' Following'),
                              ],
                            ),
                          ),
                        ),
                      ), 
                      Tab(
                        child: Consumer<UserState>(
                          builder: (context, state, _) => RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: state.user.followers.length.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: ' Followers'),
                              ],
                            ),
                          ),
                        ),
                      ), */
                    ],
                  ),
                ),
              ),

              /// Rest Of Page
              Expanded(
                flex: 30,
                child: TabBarView(
                  children: [
                    ProfilePostTab(userUid: otherUserUid),
                    ProfileEventTab(userUid: otherUserUid),
                    // FollowingTab(), Will Be Added Later
                    // FollowersTab(), Will Be Added Later
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/Firebase/utility/blockUser.dart';
import 'package:changescenario/Firebase/utility/likeAndDislike.dart';
import 'package:changescenario/Provider/UserState.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/pages/profile/otherUserProfile.dart';
import 'package:changescenario/styles/color/colors.dart';
import 'package:changescenario/utility/bookmarkFunctions.dart';
import 'package:changescenario/utility/shareScenario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScenarioReadPage extends StatelessWidget {
  const ScenarioReadPage({
    Key key,
    this.scenario,
    this.documentReference,
    this.userUid,
    this.isFavoritedInitial,
  }) : super(key: key);

  String formatDate(DateTime date) => new DateFormat("d MMM yyyy").format(date);

  final Scenario scenario;
  final DocumentReference documentReference;
  final String userUid; // Current user uid for Like
  final bool isFavoritedInitial;

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
    color: Colors.blueGrey.shade800,
    fontWeight: FontWeight.w700,
    fontSize: 18,
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
  // void setState(){

  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    /// Liked Post
    bool likedPost = scenario.likedUserUIDs.contains(userUid);
    bool dislikedPost = scenario.dislikedUserUIDs.contains(userUid);

    /// For Checking owner of this card, if true return settings; else returns report
    final bool isWriter = scenario.writerUID == userUid ? true : false;

    bool favoritedThisPost =
        isFavoritedInitial; // This bool can be changed from inside of widget

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainSecondaryColor,
        title: Text(
          scenario.title,
          textScaleFactor: 0.9,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              // Title
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Text(
                          "${scenario.title}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child:

                            /// Report Button if not post yours
                            /// Else Delete Button
                            userUid != scenario.writerUID
                                ? DropdownButton(
                                    isExpanded: true,
                                    onChanged: (val) {},
                                    underline: Container(),
                                    icon: Icon(Icons.more_vert),
                                    items: [
                                      DropdownMenuItem(
                                        value: "Report",
                                        child: Text(
                                          "Report",
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () async {
                                          try {
                                            Fluttertoast.showToast(
                                                msg: "Reported This Post");
                                            await FirebaseFirestore.instance
                                                .collection(reportsCollection)
                                                .add(scenario.toMap());
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                      ),
                                      DropdownMenuItem(
                                        value: "Block",
                                        child: Text(
                                          "Block",
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () async {
                                          try {
                                            Fluttertoast.showToast(
                                                msg: "You Blocked This User");
                                            var currentUser =
                                                Provider.of<UserState>(context,
                                                        listen: false)
                                                    .user;
                                            await blockUser(
                                              context: context,
                                              currentUser: currentUser,
                                              toBlockUid: scenario.writerUID,
                                            );
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                      ),
                                    ],
                                  )
                                : DropdownButton(
                                    isExpanded: true,
                                    onChanged: (val) {},
                                    underline: Container(),
                                    icon: Icon(Icons.more_vert),
                                    items: [
                                      DropdownMenuItem(
                                        value: "Delete",
                                        child: Text(
                                          "Delete",
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: () async {
                                          try {
                                            await Future.delayed(
                                              Duration(milliseconds: 500),
                                            );
                                            await showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    child: Container(
                                                      height: 120,
                                                      width: 500,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          ListTile(
                                                            trailing: Icon(
                                                                Icons.delete),
                                                            title: Text(
                                                                "This post is going to be deleted, are you sure?"),
                                                          ),
                                                          ButtonBar(
                                                            children: [
                                                              FlatButton(
                                                                  child: Text(
                                                                      "Cancel"),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  }),
                                                              RaisedButton(
                                                                child: Text(
                                                                    "Delete"),
                                                                onPressed:
                                                                    () async {
                                                                  try {
                                                                    await documentReference
                                                                        .delete();

                                                                    Navigator.pop(
                                                                        context);
                                                                    Fluttertoast
                                                                        .showToast(
                                                                            msg:
                                                                                "Post Deleted, Refresh Page!");
                                                                  } catch (e) {
                                                                    print(e);
                                                                  }
                                                                },
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      /// Show Profile
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: Column(
                              children: [
                                Center(),
                                Expanded(
                                  child: OtherProfilePage(
                                    bio: scenario.userBio,
                                    nickname: scenario.scriptChanger,
                                    otherUserUid: scenario.writerUID,
                                    editable: false,
                                    scaffoldKey: null,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          child: Text(
                            "${scenario.scriptChanger.substring(0, 2).toUpperCase()}",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${scenario.scriptChanger}",
                          style: usernameTextStyle,
                        ),
                        Text(
                          " posted on ${formatDate(scenario.postTime.toDate().toLocal())}",
                          style: dateTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              // Film Name
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${scenario.film}",
                    style: filmTextStyle,
                  ),
                ),
              ),

              // New Script
              Expanded(
                flex: 15,
                child: SingleChildScrollView(
                  child: Align(
                    child: Text(
                      "${scenario.script} ${scenario.script}${scenario.script}${scenario.script}${scenario.script}${scenario.script}${scenario.script}${scenario.script}${scenario.script}${scenario.script} ${scenario.script}${scenario.script}${scenario.script}${scenario.script} ${scenario.script}${scenario.script}${scenario.script}",
                      style: scriptTextStyle,
                    ),
                  ),
                ),
              ),

              // Interaction Bar
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Comments Bar
                    Row(
                      children: [
                        // Favorite Button
                        IconButton(
                          icon: Icon(
                            favoritedThisPost
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: Colors.indigo.shade600,
                          ),
                          onPressed: () async {
                            try {
                              if (!favoritedThisPost) {
                                await addToScenarioToBookMark(
                                    documentReference.id);
                                Fluttertoast.showToast(
                                    msg: "Added To Bookmarks");
                                setState(() {
                                  // Widget bool for checking this post is favorited or not
                                  favoritedThisPost =
                                      true; // set this bookmark true
                                });
                              } else {
                                await deleteFromScenarioToBookMark(
                                    documentReference.id);
                                Fluttertoast.showToast(
                                    msg: "Deleted from Bookmarks");
                                setState(() {
                                  favoritedThisPost =
                                      false; // set this bookmark false
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                        // Comment Button
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.comment,
                        //     color: Colors.red.shade500,
                        //   ),
                        //   onPressed: () {},
                        // ),
                        // Share Button
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.green.shade600,
                          ),
                          onPressed: () async {
                            try {
                              await shareScenario(scenario);
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ],
                    ),

                    /// Like - Dislike Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: FaIcon(
                                Icons.thumb_down,
                                color: dislikedPost
                                    ? Colors.blue.shade600
                                    : Colors.blue.shade100,
                              ),
                              onPressed: () async {
                                try {
                                  if (dislikedPost) {
                                    await undislikePost(
                                      scenario,
                                      documentReference,
                                      userUid,
                                    );
                                    dislikedPost = false;
                                    setState(() {});
                                  } else {
                                    await dislikePost(
                                      scenario,
                                      documentReference,
                                      userUid,
                                    );
                                    dislikedPost = true;
                                    setState(() {});
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                            ),
                            Text(
                              "${scenario.dislikedUserUIDs.length}",
                              style: likeDislikeTextStyle,
                            ),
                          ],
                        ),

                        /// Like
                        Row(
                          children: [
                            IconButton(
                              icon: FaIcon(
                                Icons.thumb_up,
                                color: likedPost
                                    ? Colors.blue.shade600
                                    : Colors.blue.shade100,
                              ),
                              onPressed: () async {
                                try {
                                  if (likedPost) {
                                    await unlikePost(
                                      scenario,
                                      documentReference,
                                      userUid,
                                    );
                                    likedPost = false;
                                    setState(() {});
                                  } else {
                                    await likePost(
                                      scenario,
                                      documentReference,
                                      userUid,
                                    );
                                    likedPost = true;
                                    setState(() {});
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                            ),
                            Text(
                              "${scenario.likedUserUIDs.length}",
                              style: likeDislikeTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

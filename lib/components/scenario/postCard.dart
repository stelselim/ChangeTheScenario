import 'package:changescenario/Firebase/constants/collectionAndDocs.dart';
import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/classes/ScenarioComment.dart';
import 'package:changescenario/constant/cardSizes.dart';
import 'package:changescenario/pages/profile/profile.dart';
import 'package:changescenario/pages/scenario/scenario.dart';
import 'package:changescenario/utility/bookmarkFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScenarioPostCard extends StatelessWidget {
  const ScenarioPostCard({
    Key key,
    @required this.setStateParent,
    @required this.scenario,
    @required this.documentReference,
    @required this.userUid,
    @required this.isFavoritedInitial,
  }) : super(key: key);

  final Function setStateParent;

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
    /// Liked Post
    final bool likedPost = scenario.likedUserUIDs.contains(userUid);
    final bool dislikedPost = scenario.dislikedUserUIDs.contains(userUid);

    /// For Checking owner of this card, if true return settings; else returns report
    final bool isWriter = scenario.writerUID == userUid ? true : false;

    bool favoritedThisPost =
        isFavoritedInitial; // This bool can be changed from inside of widget

    return Container(
      height: scenarioPostCardSize(context),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
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
                                    child: ProfilePage(
                                      editable: false,
                                      scaffoldKey: null,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
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
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${scenario.film}",
                    style: filmTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Align(
                  child: Text(
                    "${scenario.script}",
                    style: scriptTextStyle,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Comments Bar
                    Row(
                      children: [
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
                                setStateParent(() {
                                  // Widget bool for checking this post is favorited or not
                                  favoritedThisPost =
                                      true; // set this bookmark true
                                });
                              } else {
                                await deleteFromScenarioToBookMark(
                                    documentReference.id);
                                Fluttertoast.showToast(
                                    msg: "Deleted from Bookmarks");
                                setStateParent(() {
                                  favoritedThisPost =
                                      false; // set this bookmark false
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.comment,
                            color: Colors.red.shade500,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.green.shade600,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    /// Like - Dislike Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /// Dislike
                        Row(
                          children: [
                            IconButton(
                              icon: FaIcon(
                                Icons.thumb_down,
                                color: dislikedPost
                                    ? Colors.blue.shade600
                                    : Colors.blue.shade100,
                              ),
                              onPressed: () {},
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
                                if (likedPost) {}
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

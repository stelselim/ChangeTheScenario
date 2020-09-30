import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/classes/ScenarioComment.dart';
import 'package:changescenario/constant/cardSizes.dart';
import 'package:changescenario/pages/scenario/scenario.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScenarioPostCard extends StatelessWidget {
  const ScenarioPostCard({
    Key key,
    @required this.scenario,
    @required this.userUid,
  }) : super(key: key);

  String formatDate(DateTime date) => new DateFormat("d MMM yyyy").format(date);

  final Scenario scenario;
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
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: GestureDetector(
                            child: Icon(Icons.more_vert),
                            onTap: () {
                              /// Owner
                              if (isWriter) {
                                print("owner");
                              } else {
                                print("not owner");
                              }
                              Fluttertoast.showToast(msg: "Report or Settings");
                            },
                          ),
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
                      print("Go to Profile");
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
                          " posted on ${formatDate(scenario.postTime.toDate())}",
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
                            Icons.bookmark,
                            color: Colors.blue.shade200,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.comment,
                            color: Colors.blue.shade200,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.blue.shade200,
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
                              onPressed: () {},
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

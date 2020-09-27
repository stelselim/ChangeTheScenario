import 'package:changescenario/classes/Scenario.dart';
import 'package:changescenario/classes/ScenarioComment.dart';
import 'package:changescenario/components/appBarWithText.dart';
import 'package:changescenario/components/scenario/postCard.dart';
import 'package:changescenario/utility/setStatusBarColor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Dummy Data => Scenarios
///
final String title = "Spiderman should not end like that!";
final String film = "The Amazing Spiderman 2";
final String scriptChanger = "Stelselim";
final DateTime postTime = DateTime(2020, 10, 2, 5, 17, 30);
// final Duration postTime =
//     DateTime(2020, 10, 2, 5, 17, 30).difference(DateTime.now());
final int like = 22;
final int dislike = 14;
final String script =
    "Spider-Man embarks on a mission to protect his loved ones when OsCorp, owned by his childhood friend Harry Osborn, unleashes a slew of genetically-modified villains against him. Osborn, unleashes a slew of genetically-modified villains against him. Osborn, unleashes a slew of genetically-modified villains against him.";
final String writeDocID = "";
final List<ScenarioComment> comments = []; // Create ScenarioComment Class
final List<String> likedUserUIDs = [""];
final List<String> dislikedUserUIDs = [];

final Scenario scenario = Scenario(
  title: title,
  film: film,
  scriptChanger: scriptChanger,
  postTime: postTime,
  like: like,
  dislike: dislike,
  script: script,
  writerUID: writeDocID,
  docid: "",
  likedUserUIDs: likedUserUIDs,
  dislikedUserUIDs: dislikedUserUIDs,
  comments: comments,
);

class ScenarioPage extends StatefulWidget {
  const ScenarioPage({Key key}) : super(key: key);

  @override
  _ScenarioPageState createState() => _ScenarioPageState();
}

class _ScenarioPageState extends State<ScenarioPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Should Listen Scroll Controller
    // scrollController.
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColorLight();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 500));
        print("Refreshing");
        setState(() {});
      },
      child: Column(
        children: [
          appBarWithText(
            height: height,
            title: "Change Scenarios",
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 5),
              physics: ClampingScrollPhysics(),
              controller: scrollController,
              itemBuilder: (context, index) {
                /// Scenario Post Cards
                return ScenarioPostCard(
                  scenario: scenario,
                  userUid: "",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
